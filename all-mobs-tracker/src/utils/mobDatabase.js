import { useState, useEffect, useRef } from 'react';
import initialSnapshot from '../data/dbSnapshot.json';
import { parseFileName } from './mobParser';
import { SpecialFolderMap } from '../config/mobConfig';

/**
 * Normalizza un record mob/variante dal database in un oggetto compatibile con l'interfaccia UI.
 */
export function transformDbRecord(record, isVariant, categoryMap = {}) {
  const imgPath = record.img || '';
  const parts = imgPath.split('/');
  const dataIdx = parts.indexOf('data');
  const fileName = parts[parts.length - 1] || '';
  const afterData = dataIdx >= 0 ? parts.slice(dataIdx + 1, -1) : [];

  let folder = 'root';
  let specialSuffixId = null;

  if (afterData.length === 0) {
    folder = 'root';
  } else if (afterData[0].toLowerCase() === 'special' && afterData[1]) {
    specialSuffixId = SpecialFolderMap[afterData[1].toLowerCase()] ?? null;
    folder = `special:${afterData[1]}`;
  } else {
    folder = afterData[0];
  }

  // fileName univoco coerente con localStorage (es. "data/Allay.gif" o "data/cat/1.1Cat.gif")
  const uniqueKey = imgPath.replace(/^\//, '');

  const parsed = parseFileName(fileName, imgPath);

  const categoryIds = Array.isArray(record.category_ids) ? record.category_ids : [];
  const categories = categoryIds.map(cid => categoryMap[cid]).filter(Boolean);

  return {
    ...parsed,
    id: record.id,
    dbId: record.id,
    mobId: isVariant ? record.mob_id : record.id,
    name: record.name,
    image: imgPath,
    img: imgPath,
    link: record.link === '.' ? '' : record.link,
    description: record.description === '.' ? '' : record.description,
    fileName: uniqueKey,
    displayFileName: fileName,
    folder,
    specialSuffixId: specialSuffixId || parsed.specialSuffixId || null,
    isBase: !isVariant,
    isVariant: !!isVariant,
    categoryIds,
    categories,
  };
}

/**
 * Costruisce l'intero set di dati a partire dai record grezzi del database.
 */
export function buildTrackerDataset(categoriesRaw, mobsRaw, variantsRaw) {
  const categoryMap = {};
  const categories = (categoriesRaw || []).map(cat => {
    const slug = cat.slug || cat.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
    const obj = {
      ...cat,
      slug,
      dbId: cat.id,
      label: cat.name,
      special: !!cat.special,
    };
    categoryMap[cat.id] = obj;
    categoryMap[slug] = obj;
    categoryMap[cat.name] = obj;
    return obj;
  });

  const baseMobs = (mobsRaw || []).map(m => transformDbRecord(m, false, categoryMap));
  const variants = (variantsRaw || []).map(v => transformDbRecord(v, true, categoryMap));

  // Insieme di tutti i mob (89 base + 929 varianti = 1018)
  const allMobs = [...baseMobs, ...variants].sort((a, b) => a.name.localeCompare(b.name));

  return {
    categories,
    categoryMap,
    baseMobs,
    variants,
    allMobs
  };
}

export const DB_CACHE_KEY = 'mobTracker_d1_cache';
export const DB_CACHE_TTL = 1000 * 60 * 60 * 24; // 24 ore di validità cache

/**
 * Legge in modo sicuro la cache da localStorage.
 */
function getStoredCache() {
  if (typeof window === 'undefined') return null;
  try {
    const raw = localStorage.getItem(DB_CACHE_KEY);
    if (!raw) return null;
    const parsed = JSON.parse(raw);
    if (parsed && parsed.data && parsed.timestamp) {
      return parsed;
    }
  } catch (err) {
    console.warn('Errore lettura cache D1:', err);
  }
  return null;
}

/**
 * Invalida esplicitamente la cache salvata in localStorage.
 */
export function invalidateDbCache() {
  if (typeof window !== 'undefined') {
    try {
      localStorage.removeItem(DB_CACHE_KEY);
    } catch (e) {}
  }
}

// Inizializzazione sincrona: usa la cache salvata se presente, altrimenti lo snapshot bundled
const initialStored = getStoredCache();
const initialData = initialStored
  ? buildTrackerDataset(initialStored.data.categories, initialStored.data.mobs, initialStored.data.variants)
  : buildTrackerDataset(initialSnapshot.categories, initialSnapshot.mobs, initialSnapshot.variants);

let cachedData = initialData;

/**
 * Carica i dati aggiornati del tracker dal database tramite API Worker.
 * Se force = false e la cache locale è recente (< 24h), ritorna immediatamente la cache senza effettuare chiamate di rete.
 */
export async function fetchTrackerData(force = false) {
  const stored = getStoredCache();
  const now = Date.now();

  // Se abbiamo già dati in cache freschi e non è forzato il refresh, non consuma richieste di lettura
  if (!force && stored && (now - stored.timestamp < DB_CACHE_TTL)) {
    return cachedData;
  }

  try {
    const url = force ? `/api/tracker-data?bust=${now}` : '/api/tracker-data';
    const res = await fetch(url);
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const data = await res.json();
    if (data.success && data.categories && data.mobs && data.variants) {
      cachedData = buildTrackerDataset(data.categories, data.mobs, data.variants);
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(DB_CACHE_KEY, JSON.stringify({
            timestamp: now,
            data: {
              categories: data.categories,
              mobs: data.mobs,
              variants: data.variants
            }
          }));
        } catch (e) {
          console.warn('Impossibile salvare in localStorage:', e);
        }
      }
      return cachedData;
    }
  } catch (err) {
    console.warn('Caricamento live da /api/tracker-data non riuscito, uso cache/snapshot locale:', err);
  }
  return cachedData;
}

/**
 * Hook React per accedere a tutti i dati del tracker sincronizzati con il database D1.
 */
export function useTrackerData() {
  const [data, setData] = useState(cachedData);
  const [loading, setLoading] = useState(false);
  const isMounted = useRef(true);

  useEffect(() => {
    isMounted.current = true;
    let isCancelled = false;

    const stored = getStoredCache();
    const isCacheFresh = stored && (Date.now() - stored.timestamp < DB_CACHE_TTL);

    // Se la cache è fresca, non effettua chiamate né imposta loading
    if (isCacheFresh) {
      return;
    }

    async function load() {
      // Se non abbiamo ancora mob nel cachedData, mostra brevemente il caricamento
      if (!cachedData?.allMobs?.length) {
        setLoading(true);
      }
      const updated = await fetchTrackerData();
      if (!isCancelled && isMounted.current) {
        setData(updated);
        setLoading(false);
      }
    }

    load();

    return () => {
      isCancelled = true;
      isMounted.current = false;
    };
  }, []);

  return {
    ...data,
    loading,
    refresh: async (force = true) => {
      setLoading(true);
      const updated = await fetchTrackerData(force);
      if (isMounted.current) {
        setData(updated);
        setLoading(false);
      }
    }
  };
}

export default useTrackerData;
