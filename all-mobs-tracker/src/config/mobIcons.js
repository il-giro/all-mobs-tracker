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
  1: { label: 'Plains',  icon: '/icons/biomes/Plains.png'       },
  2: { label: 'Desert',  icon: '/icons/biomes/Desert.png'       },
  3: { label: 'Jungle',  icon: '/icons/biomes/Jungle.png'       },
  4: { label: 'Savanna', icon: '/icons/biomes/Savanna.png'      },
  5: { label: 'Snow',    icon: '/icons/biomes/SnowyPlains.png'  },
  6: { label: 'Swamp',   icon: '/icons/biomes/Swamp.png'        },
  7: { label: 'Taiga',   icon: '/icons/biomes/Taiga.png'        },
};

export const VillagerJobs = {
  1:  { label: 'Unemployed',    icon: null },
  2:  { label: 'Nitwit',        icon: null },
  3:  { label: 'Armorer',       icon: '/icons/job site/blast-furnace.png'     },
  4:  { label: 'Butcher',       icon: '/icons/job site/smoker.png'            },
  5:  { label: 'Cartographer',  icon: '/icons/job site/cartography-table.png' },
  6:  { label: 'Cleric',        icon: '/icons/job site/brewing-stand.png'     },
  7:  { label: 'Farmer',        icon: '/icons/job site/composter.png'         },
  8:  { label: 'Fisherman',     icon: '/icons/job site/barrel.png'            },
  9:  { label: 'Fletcher',      icon: '/icons/job site/fletching-table.png'   },
  10: { label: 'Leatherworker', icon: '/icons/job site/cauldron.png'          },
  11: { label: 'Librarian',     icon: '/icons/job site/lectern.png'           },
  12: { label: 'Mason',         icon: '/icons/job site/stonecutter.png'       },
  13: { label: 'Shepherd',      icon: '/icons/job site/loom.png'              },
  14: { label: 'Toolsmith',     icon: '/icons/job site/smithing-table.png'    },
  15: { label: 'Weaponsmith',   icon: '/icons/job site/grindstone.png'        },
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
        src:       biomeData.icon,
        alt:       biomeData.label,
        position:  POSITIONS.BOTTOM_RIGHT,
        label:     biomeData.label,
        labelRole: 'biome',
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
      if (!jobData?.icon) return null;
      const hasSuffix = mob.activeSuffixes.length > 0;
      return [{
        src:       jobData.icon,
        alt:       jobData.label,
        position:  hasSuffix ? POSITIONS.TOP_RIGHT : POSITIONS.BOTTOM_LEFT,
        label:     jobData.label,
        labelRole: 'job',
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

{
  id: 'color',
  resolve(mob) {
    const folder = mob.folder?.toLowerCase();
const colorMap = { 2: 'black', 3: 'blue', 4: 'brown', 5: 'cyan', 6: 'gray', 7: 'green', 8: 'light-blue', 9: 'lime', 10: 'magenta', 11: 'orange', 12: 'pink', 13: 'purple', 14: 'red', 15: 'light-gray', 16: 'white', 17: 'yellow' };
    // ── Sheep ────────────────────────────────────────────────────────────────
    if (folder === 'sheep') {
      const sheepColors = { 1: 'white', 2: 'light-gray', 3: 'gray', 4: 'black', 5: 'brown', 6: 'red', 7: 'orange', 8: 'yellow', 9: 'lime', 10: 'green', 11: 'cyan', 12: 'light-blue', 13: 'blue', 14: 'purple', 15: 'magenta', 16: 'pink' };
      const colorName = sheepColors[mob.num3];
      if (!colorName) return null;
      return [{ src: `/icons/items/${colorName}-wool.png`, alt: colorName, position: POSITIONS.BOTTOM_RIGHT, size: 'md', label: colorName.replace(/-/g, ' '), labelRole: 'color', fallbackHide: true }];
    }

    // ── Llama ────────────────────────────────────────────────────────────────
    if (folder === 'llama') {
      if (!mob.num3 || mob.num3 === 1) return null;
      const colorName = colorMap[mob.num3];
      if (!colorName) return null;
      return [{ src: `/icons/items/${colorName}-wool.png`, alt: colorName, position: POSITIONS.BOTTOM_RIGHT, size: 'md', label: colorName.replace(/-/g, ' '), labelRole: 'carpet', fallbackHide: true }];
    }

    // ── Wolf ─────────────────────────────────────────────────────────────────
    if (folder === 'wolf') {
      if (mob.num2 === 1 || !mob.num3 || mob.num3 === 1) return null;
      const colorName = colorMap[mob.num3];
      if (!colorName) return null;
      return [{ src: `/icons/items/${colorName}-wool.png`, alt: colorName, position: POSITIONS.BOTTOM_RIGHT, size: 'md', label: colorName.replace(/-/g, ' '), labelRole: mob.num2 === 3 ? 'armor' : 'collar', fallbackHide: true }];
    }

    return null;
  },
},

  // ── Sheared ─────────────────────────────────────────────────────────────────
  // categoryId: 'shearable' → icona nel tooltip cliccabile → /category/shearable
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

  // ── Saddle ──────────────────────────────────────────────────────────────────
  {
    id: 'saddle',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('saddle')) return null;
      return [{
        src:          '/icons/items/saddle.png',
        alt:          'Saddle',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Saddled',
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },

  // ── Chested ─────────────────────────────────────────────────────────────────
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
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },

  // ── Banner ──────────────────────────────────────────────────────────────────
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
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },

  // ── Screaming Goat ──────────────────────────────────────────────────────────
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
        labelRole:    'status',
        fallbackHide: true,
      }];
    },
  },

  // ─────────────────────────────────────────────────────────────────────────
  // Aggiungi nuovi resolver qui sotto
  // Per collegare a una categoria: categoryId: '<id>'
  // ─────────────────────────────────────────────────────────────────────────

];

// ─────────────────────────────────────────────────────────────────────────────
// FUNZIONI PUBBLICHE
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Risolve tutte le icone per un mob, raggruppandole per posizione.
 * Se due icone vogliono la stessa posizione, vince la prima (ordine dei resolver).
 */
export function resolveIcons(mob) {
  const result = new Map();
  for (const resolver of MOB_ICON_RESOLVERS) {
    const icons = resolver.resolve(mob);
    if (!icons) continue;
    for (const icon of icons) {
      if (!result.has(icon.position)) {
        result.set(icon.position, { ...icon, resolverId: resolver.id });
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
  const categoryIds = new Set();
  for (const resolver of MOB_ICON_RESOLVERS) {
    const icons = resolver.resolve(mob);
    if (!icons) continue;
    for (const icon of icons) {
      if (icon.categoryId) categoryIds.add(icon.categoryId);
    }
  }
  return categories.filter(cat => categoryIds.has(cat.id));
}