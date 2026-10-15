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

// Inizializzazione sincrona immediata dallo snapshot locale del database
const initialData = buildTrackerDataset(
  initialSnapshot.categories,
  initialSnapshot.mobs,
  initialSnapshot.variants
);

let cachedData = initialData;

/**
 * Carica i dati aggiornati del tracker dal database tramite API Worker.
 */
export async function fetchTrackerData() {
  try {
    const res = await fetch('/api/tracker-data');
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const data = await res.json();
    if (data.success && data.categories && data.mobs && data.variants) {
      cachedData = buildTrackerDataset(data.categories, data.mobs, data.variants);
      return cachedData;
    }
  } catch (err) {
    console.warn('Caricamento live da /api/tracker-data non riuscito, uso snapshot D1:', err);
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

    async function load() {
      setLoading(true);
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
    refresh: async () => {
      setLoading(true);
      const updated = await fetchTrackerData();
      if (isMounted.current) {
        setData(updated);
        setLoading(false);
      }
    }
  };
}

export default useTrackerData;
