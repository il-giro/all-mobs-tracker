/**
 * mobIcons.js
 *
 * Configurazione centralizzata delle icone mostrate nelle MobCard.
 * Contiene anche le mappe di dati legate alle icone (VillagerBiomes, VillagerJobs).
 *
 * Ogni "resolver" descrive UN tipo di icona da mostrare sulla card.
 * Per aggiungerne una nuova basta aggiungere un oggetto alla lista MOB_ICON_RESOLVERS.
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * Struttura di un resolver:
 * {
 *   id: string            — identificatore univoco (usato come key React)
 *
 *   resolve(mob) → IconData[] | null
 *
 *   IconData: {
 *     src:            string     — path dell'immagine
 *     alt:            string     — testo alternativo
 *     position:       Position   — dove posizionare l'icona sulla card
 *     size?:          'sm'|'md'  — dimensione (default 'sm' = w-5 h-5)
 *     label?:         string     — etichetta testuale nel tooltip
 *     labelRole?:     string     — ruolo dell'etichetta, es. 'biome', 'job'
 *     categoryId?:    string     — se presente, l'icona nel tooltip diventa
 *                                  un link alla pagina /category/:categoryId
 *     fallbackHide?:  boolean    — nascondi icona se l'immagine non esiste
 *     alwaysVisible?: boolean    — mostra anche quando il mob è tracciato/catturato
 *     tooltipOnly?:   boolean    — non mostrare sulla card, solo nel tooltip
 *   }
 * }
 *
 * Position: 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right' | 'bottom-center'
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * COME COLLEGARE UN'ICONA A UNA CATEGORIA
 * ─────────────────────────────────────────────────────────────────────────────
 * 1. Aggiungi la categoria in mobCategories.js
 * 2. Aggiungi categoryId: '<id-categoria>' all'IconData del resolver
 * 3. L'icona nel tooltip diventa automaticamente cliccabile → /category/<id>
 * 4. La pagina categoria mostrerà automaticamente tutti i mob con quell'icona
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * CONFLITTI DI POSIZIONE
 * ─────────────────────────────────────────────────────────────────────────────
 * Se due resolver vogliono la stessa posizione sulla card:
 * - La seconda icona viene spostata in bottom-center (se libero)
 * - In ogni caso entrambe le icone compaiono sempre nel tooltip
 */

import { ComplexConfig } from './mobConfig';

// ─── Posizioni disponibili ────────────────────────────────────────────────────
export const POSITIONS = {
  TOP_LEFT:      'top-left',
  TOP_RIGHT:     'top-right',
  BOTTOM_LEFT:   'bottom-left',
  BOTTOM_RIGHT:  'bottom-right',
  BOTTOM_CENTER: 'bottom-center',
};

// ─── Classi Tailwind per ogni posizione ──────────────────────────────────────
export const POSITION_CLASSES = {
  'top-left':      'absolute top-1 left-1 z-20',
  'top-right':     'absolute top-1 right-1 z-20',
  'bottom-left':   'absolute bottom-1 left-1 z-20',
  'bottom-right':  'absolute bottom-1 right-1 z-20',
  'bottom-center': 'absolute bottom-1 left-1/2 -translate-x-1/2 z-20',
};

// ─── Classi dimensione ────────────────────────────────────────────────────────
export const SIZE_CLASSES = {
  sm: 'w-5 h-5',
  md: 'w-7 h-7',
};

// ─────────────────────────────────────────────────────────────────────────────
// DATI VILLAGER
// Spostati qui da mobConfig.js perché appartengono al sistema icone.
// Usati anche da MobTracker per il sorting per bioma/job — importa da qui.
// ─────────────────────────────────────────────────────────────────────────────

export const VillagerBiomes = {
  1: { label: 'Plains',  icon: '/icons/biomes/Plains.png',      categoryId: 'biome-plains'  },
  2: { label: 'Desert',  icon: '/icons/biomes/Desert.png',      categoryId: 'biome-desert'  },
  3: { label: 'Jungle',  icon: '/icons/biomes/Jungle.png',      categoryId: 'biome-jungle'  },
  4: { label: 'Savanna', icon: '/icons/biomes/Savanna.png',     categoryId: 'biome-savanna' },
  5: { label: 'Snow',    icon: '/icons/biomes/SnowyPlains.png', categoryId: 'biome-snow'    },
  6: { label: 'Swamp',   icon: '/icons/biomes/Swamp.png',       categoryId: 'biome-swamp'   },
  7: { label: 'Taiga',   icon: '/icons/biomes/Taiga.png',       categoryId: 'biome-taiga'   },
};

export const VillagerJobs = {
  1:  { label: 'Unemployed',    icon: null,                                   categoryId: 'profession-unemployed'    },
  2:  { label: 'Nitwit',        icon: null,                                   categoryId: 'profession-nitwit'        },
  3:  { label: 'Armorer',       icon: '/icons/job site/blast-furnace.png',     categoryId: 'profession-armorer'       },
  4:  { label: 'Butcher',       icon: '/icons/job site/smoker.png',            categoryId: 'profession-butcher'       },
  5:  { label: 'Cartographer',  icon: '/icons/job site/cartography-table.png', categoryId: 'profession-cartographer' },
  6:  { label: 'Cleric',        icon: '/icons/job site/brewing-stand.png',     categoryId: 'profession-cleric'        },
  7:  { label: 'Farmer',        icon: '/icons/job site/composter.png',         categoryId: 'profession-farmer'        },
  8:  { label: 'Fisherman',     icon: '/icons/job site/barrel.png',            categoryId: 'profession-fisherman'     },
  9:  { label: 'Fletcher',      icon: '/icons/job site/fletching-table.png',   categoryId: 'profession-fletcher'      },
  10: { label: 'Leatherworker', icon: '/icons/job site/cauldron.png',          categoryId: 'profession-leatherworker' },
  11: { label: 'Librarian',     icon: '/icons/job site/lectern.png',           categoryId: 'profession-librarian'     },
  12: { label: 'Mason',         icon: '/icons/job site/stonecutter.png',       categoryId: 'profession-mason'         },
  13: { label: 'Shepherd',      icon: '/icons/job site/loom.png',              categoryId: 'profession-shepherd'      },
  14: { label: 'Toolsmith',     icon: '/icons/job site/smithing-table.png',    categoryId: 'profession-toolsmith'     },
  15: { label: 'Weaponsmith',   icon: '/icons/job site/grindstone.png',        categoryId: 'profession-weaponsmith'   },
};

// ─────────────────────────────────────────────────────────────────────────────
// RESOLVERS
// ─────────────────────────────────────────────────────────────────────────────

export const MOB_ICON_RESOLVERS = [

  // ── Bioma villager / zombie villager ────────────────────────────────────────
  {
    id: 'villager-biome',
    resolve(mob) {
      if (!mob.complexId) return null;
      const config = ComplexConfig.find(c => c.id === mob.complexId);
      if (!config?.useVillagerIcons) return null;
      const biomeData = VillagerBiomes[mob.num1] ?? null;
      if (!biomeData?.icon) return null;
      return [{
        src:        biomeData.icon,
        alt:        biomeData.label,
        position:   POSITIONS.BOTTOM_RIGHT,
        label:      biomeData.label,
        labelRole:  'biome',
        categoryId: biomeData.categoryId,
      }];
    },
  },

  // ── Job villager / zombie villager ──────────────────────────────────────────
  {
    id: 'villager-job',
    resolve(mob) {
      if (!mob.complexId) return null;
      const config = ComplexConfig.find(c => c.id === mob.complexId);
      if (!config?.useVillagerIcons) return null;
      const jobData = VillagerJobs[mob.num2] ?? null;
      if (!jobData) return null;
      if (!jobData.icon) {
        return [{
          src:         '/icons/mobs/VillagerFace.png',
          alt:         jobData.label,
          position:    POSITIONS.BOTTOM_LEFT,
          label:       jobData.label,
          labelRole:   'job',
          categoryId:  jobData.categoryId,
          tooltipOnly: true,
        }];
      }
      const hasSuffix = mob.activeSuffixes?.length > 0;
      return [{
        src:        jobData.icon,
        alt:        jobData.label,
        position:   hasSuffix ? POSITIONS.TOP_RIGHT : POSITIONS.BOTTOM_LEFT,
        label:      jobData.label,
        labelRole:  'job',
        categoryId: jobData.categoryId,
      }];
    },
  },

  // ── Item tenuto in mano (Enderman, ecc.) ────────────────────────────────────
  {
    id: 'holding-item',
    resolve(mob) {
      const match = mob.image?.match(/[Hh]olding-([A-Za-z]+(?:-[A-Za-z]+)*)/);
      if (!match) return null;
      const itemName = match[1].toLowerCase();
      return [{
        src:          `/icons/items/${itemName}.png`,
        alt:          itemName,
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        itemName.replace(/-/g, ' '),
        labelRole:    'holds',
        fallbackHide: true,
      }];
    },
  },

  // ── Colore (Sheep, Llama, Wolf) ──────────────────────────────────────────────
  {
    id: 'color',
    resolve(mob) {
      const folder = mob.folder?.toLowerCase();
      const colorMap = { 2: 'black', 3: 'blue', 4: 'brown', 5: 'cyan', 6: 'gray', 7: 'green', 8: 'light-blue', 9: 'lime', 10: 'magenta', 11: 'orange', 12: 'pink', 13: 'purple', 14: 'red', 15: 'light-gray', 16: 'white', 17: 'yellow' };
      const toColorCatId = (cName) => `color-${cName.replace(/-/g, '')}`;

      // ── Sheep ──────────────────────────────────────────────────────────────
      if (folder === 'sheep') {
        const sheepColors = { 1: 'white', 2: 'light-gray', 3: 'gray', 4: 'black', 5: 'brown', 6: 'red', 7: 'orange', 8: 'yellow', 9: 'lime', 10: 'green', 11: 'cyan', 12: 'light-blue', 13: 'blue', 14: 'purple', 15: 'magenta', 16: 'pink' };
        const colorName = sheepColors[mob.num3];
        if (!colorName) return null;
        return [{
          src:          `/icons/items/${colorName}-wool.png`,
          alt:          colorName,
          position:     POSITIONS.BOTTOM_RIGHT,
          size:         'md',
          label:        colorName.replace(/-/g, ' '),
          labelRole:    'color',
          categoryId:   toColorCatId(colorName),
          fallbackHide: true,
        }];
      }

      // ── Llama ──────────────────────────────────────────────────────────────
      if (folder === 'llama') {
        if (!mob.num3 || mob.num3 === 1) return null;
        const colorName = colorMap[mob.num3];
        if (!colorName) return null;
        return [{
          src:          `/icons/items/${colorName}-wool.png`,
          alt:          colorName,
          position:     POSITIONS.BOTTOM_RIGHT,
          size:         'md',
          label:        colorName.replace(/-/g, ' '),
          labelRole:    'carpet',
          categoryId:   toColorCatId(colorName),
          fallbackHide: true,
        }];
      }

      // ── Wolf ───────────────────────────────────────────────────────────────
      if (folder === 'wolf') {
        if (mob.num2 === 1 || !mob.num3 || mob.num3 === 1) return null;
        const colorName = colorMap[mob.num3];
        if (!colorName) return null;
        return [{
          src:          `/icons/items/${colorName}-wool.png`,
          alt:          colorName,
          position:     POSITIONS.BOTTOM_RIGHT,
          size:         'md',
          label:        colorName.replace(/-/g, ' '),
          labelRole:    mob.num2 === 3 ? 'armor' : 'collar',
          categoryId:   toColorCatId(colorName),
          fallbackHide: true,
        }];
      }

      return null;
    },
  },

  // ── Sheared ──────────────────────────────────────────────────────────────────
  {
    id: 'sheared',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('sheared')) return null;
      return [{
        src:          '/icons/items/shears.png',
        alt:          'Sheared',
        position:     POSITIONS.BOTTOM_LEFT,
        size:         'md',
        label:        'Shearable',
        labelRole:    'category',
        categoryId:   'shearable',
        fallbackHide: true,
      }];
    },
  },

  // ── Poppy (Copper Golem) ─────────────────────────────────────────────────────
  {
    id: 'poppy',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('poppy') || !mob.image?.toLowerCase().includes('coppergolem')) return null;
      return [{
        src:          '/icons/items/poppy.png',
        alt:          'Poppy',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Poppy',
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },

  // ── Saddle ───────────────────────────────────────────────────────────────────
  {
    id: 'saddle',
    resolve(mob) {
      if (!mob.name?.toLowerCase().includes('saddle')) return null;
      return [{
        src:          '/icons/items/saddle.png',
        alt:          'Saddle',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Saddled',
        labelRole:    'category',
        categoryId:   'saddled',
        fallbackHide: true,
      }];
    },
  },

  // ── Chested ──────────────────────────────────────────────────────────────────
  {
    id: 'chested',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('chest')) return null;
      return [{
        src:          '/icons/items/chest.png',
        alt:          'Chested',
        position:     POSITIONS.BOTTOM_LEFT,
        size:         'md',
        label:        'Chested',
        labelRole:    'category',
        categoryId:   'chested',
        fallbackHide: true,
      }];
    },
  },

  // ── Banner ───────────────────────────────────────────────────────────────────
  {
    id: 'banner',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('banner')) return null;
      return [{
        src:          '/icons/items/ominous-banner.png',
        alt:          'Banner',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Banner',
        labelRole:    'category',
        categoryId:   'banner',
        fallbackHide: true,
      }];
    },
  },

  // ── Screaming Goat ───────────────────────────────────────────────────────────
  {
    id: 'screaming',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('screaming') || !mob.image?.toLowerCase().includes('goat')) return null;
      return [{
        src:          '/icons/items/screaming.png',
        alt:          'Screaming',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Screaming',
        labelRole:    'category',
        categoryId:   'screaming',
        fallbackHide: true,
      }];
    },
  },

  // ── Name Tag (Toast, Johnny, jeb_) ───────────────────────────────────────────
  {
    id: 'name-tag',
    resolve(mob) {
      const specialNames = ['Toast', 'Johnny', 'jeb_'];
      if (!specialNames.some(name => mob.image?.includes(name))) return null;
      return [{
        src:          '/icons/items/name-tag.png',
        alt:          'Name Tag',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Name Tag',
        labelRole:    'category',
        categoryId:   'name-tag',
        fallbackHide: true,
      }];
    },
  },

  // ── Lightning (Charged Creeper, Brown Mooshroom) ─────────────────────────────
  {
    id: 'lightning',
    resolve(mob) {
      const specialNames = ['Skeleton Horse man', 'Mooshroom  Brown', 'Creeper  Charged'];
        if (!specialNames.some(name => mob.name === name)) return null;
      return [{
        src:          '/icons/items/lightning.png',
        alt:          'Lightning',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Lightning',
        labelRole:    'category',
        categoryId:   'lightning',
        fallbackHide: true,
      }];
    },
  },

  // ── Damaged Iron Golem ───────────────────────────────────────────────────────
  {
    id: 'damaged-iron-golem',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('iron golem')) return null;
    return [{
        src:          mob.image.toLowerCase().includes('high') ? '/icons/letters/h.png' : (mob.image.toLowerCase().includes('medium') ? '/icons/letters/m.png' : (mob.image.toLowerCase().includes('low') ? '/icons/letters/l.png' : '/icons/letters/n.png')) ,
        alt:          'Damaged',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Damaged',
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },



  // ─────────────────────────────────────────────────────────────────────────────
  // Aggiungi nuovi resolver qui sotto
  // Per collegare a una categoria: categoryId: '<id>'
  // ─────────────────────────────────────────────────────────────────────────────

];

// ─────────────────────────────────────────────────────────────────────────────
// FUNZIONI PUBBLICHE
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Risolve tutte le icone per un mob, raggruppandole per posizione.
 *
 * Logica conflitti:
 * - Se una posizione è già occupata, si tenta di spostare la nuova icona in
 *   BOTTOM_CENTER (se libero).
 * - In ogni caso, tutte le icone con label vengono sempre incluse come
 *   tooltipOnly, così compaiono nel tooltip anche se non visibili sulla card.
 * - Le icone tooltipOnly hanno una chiave con prefisso "tooltip_" per non
 *   collidere con quelle visibili.
 */
export function resolveIcons(mob) {
  const result = new Map();
  for (const resolver of MOB_ICON_RESOLVERS) {
    const icons = resolver.resolve(mob);
    if (!icons) continue;
    for (const icon of icons) {
      const baseEntry = { ...icon, resolverId: resolver.id };
      if (!result.has(icon.position)) {
        // Posizione libera: aggiungi normalmente
        result.set(icon.position, baseEntry);
      } else {
        // Conflitto: prova bottom-center come posizione di ripiego
        const fallback = POSITIONS.BOTTOM_CENTER;
        if (!result.has(fallback)) {
          result.set(fallback, { ...baseEntry, position: fallback });
        } else {
          // Anche bottom-center occupato: aggiungi solo come tooltipOnly
          result.set(`tooltip_${resolver.id}`, { ...baseEntry, tooltipOnly: true });
        }
      }
    }
  }

  return result;
}

/**
 * Controlla se un mob usa icone villager (bioma/job).
 */
export function hasVillagerIcons(mob) {
  if (!mob.complexId) return false;
  const config = ComplexConfig.find(c => c.id === mob.complexId);
  return !!config?.useVillagerIcons;
}

/**
 * Restituisce le categorie a cui appartiene un mob, basandosi sui resolver.
 * Un mob appartiene a una categoria se almeno un resolver con categoryId
 * restituisce un'icona per quel mob.
 *
 * Usato in CategoryPage per filtrare dinamicamente i mob.
 *
 * @param {object} mob        — oggetto mob completo
 * @param {Array}  categories — array da MobCategories (mobCategories.js)
 * @returns {Array}           — categorie a cui appartiene il mob
 */
export function getMobCategories(mob, categories) {
  if (!mob) return [];
  const targetCategories = categories || [];
  const categoryIds = new Set();

  // Categorie dal database se presenti
  if (Array.isArray(mob.categories) && mob.categories.length > 0) {
    for (const c of mob.categories) {
      if (c.id) categoryIds.add(c.id);
      if (c.dbId) {
        const found = targetCategories.find(tc => tc.dbId === c.dbId);
        if (found) categoryIds.add(found.id);
      }
    }
  }

  if (Array.isArray(mob.categoryIds) && mob.categoryIds.length > 0) {
    for (const id of mob.categoryIds) {
      const found = targetCategories.find(tc => tc.dbId === id || tc.id === id);
      if (found) categoryIds.add(found.id);
    }
  }

  // Categorie derivate dai resolver icona
  for (const resolver of MOB_ICON_RESOLVERS) {
    const icons = resolver.resolve(mob);
    if (!icons) continue;
    for (const icon of icons) {
      if (icon.categoryId) categoryIds.add(icon.categoryId);
    }
  }

  return targetCategories.filter(cat => categoryIds.has(cat.id));
}