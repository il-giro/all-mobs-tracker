/**
 * mobIcons.js
 *
 * Configurazione centralizzata delle icone mostrate nelle MobCard.
 * Contiene anche le mappe di dati legate alle icone (VillagerBiomes, VillagerJobs)
 * che in precedenza erano in mobConfig.js.
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
 *     Riceve il mob e restituisce un array di icone da mostrare, oppure null se
 *     non applicabile a quel mob.
 *
 *   IconData: {
 *     src:            string     — path dell'immagine
 *     alt:            string     — testo alternativo
 *     position:       Position   — dove posizionare l'icona sulla card
 *     size?:          'sm'|'md'  — dimensione (default 'sm' = w-5 h-5)
 *     label?:         string     — etichetta testuale nel tooltip (opzionale)
 *     labelRole?:     string     — ruolo dell'etichetta, es. 'biome', 'job' (opzionale)
 *     fallbackHide?:  boolean    — nascondi icona se l'immagine non esiste (default false)
 *     alwaysVisible?: boolean    — mostra anche quando il mob è tracciato/catturato (default false)
 *   }
 * }
 *
 * Position: 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right' | 'bottom-center'
 *
 * ─────────────────────────────────────────────────────────────────────────────
 * COME AGGIUNGERE UNA NUOVA ICONA
 * ─────────────────────────────────────────────────────────────────────────────
 * 1. Se necessario, aggiungi i dati di supporto (mappe, costanti) in questo file
 * 2. Aggiungi un oggetto a MOB_ICON_RESOLVERS con un id univoco
 * 3. Implementa resolve(mob) che ritorna un array di IconData o null
 * 4. Le icone vengono renderizzate automaticamente in MobCard — nessuna modifica necessaria
 *
 * Esempio minimo:
 *
 *   {
 *     id: 'my-icon',
 *     resolve(mob) {
 *       if (!mob.name.includes('Spider')) return null;
 *       return [{ src: '/icons/web.png', alt: 'web', position: 'top-right' }];
 *     }
 *   }
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

// Mappa biomi: num1 → { label, icon }
// Il nome dell'icona deve corrispondere al file in /icons/biomes/
export const VillagerBiomes = {
  1: { label: 'Plains',  icon: '/icons/biomes/Plains.png'       },
  2: { label: 'Desert',  icon: '/icons/biomes/Desert.png'       },
  3: { label: 'Jungle',  icon: '/icons/biomes/Jungle.png'       },
  4: { label: 'Savanna', icon: '/icons/biomes/Savanna.png'      },
  5: { label: 'Snow',    icon: '/icons/biomes/SnowyPlains.png'  },
  6: { label: 'Swamp',   icon: '/icons/biomes/Swamp.png'        },
  7: { label: 'Taiga',   icon: '/icons/biomes/Taiga.png'        },
};

// Mappa job: num2 → { label, icon }
// Il nome dell'icona deve corrispondere al file in /icons/job site/
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
      // Se c'è un suffix badge, il job va in alto a destra per non sovrapporsi
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
  // Funziona per qualsiasi mob il cui path immagine contenga "Holding-<ItemName>"
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

  // -- Sheared -- Per pecore tosate (e altri mob che condividono la stessa icona con/senza tosatura)
  {
    id: 'sheared',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('sheared')) return null;
      return [{
        src:          '/icons/items/shears.png',
        alt:          'Sheared',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Sheared',
        labelRole:    'status',
        fallbackHide: true,
      }];
    }
  },

  // -- Poppy -- Per copper golem (poppy in testa)

  {
    id: 'poppy',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('poppy') || !mob.image?.toLowerCase().includes('coppergolem')) return null;
      return [{
        src:          '/icons/items/poppy.png',
        alt:          'Poppy',
        position:     POSITIONS.BOTTOM_RIGHT,
        label:        'Poppy',
        labelRole:    'status',
        fallbackHide: true,
      }];
    }
  },

  // -- Saddle -- Per mob che possono essere sellati (cavalli, ma anche maiali e strider)
  {
    id: 'saddle',
    resolve(mob) {
      if (!mob.image?.toLowerCase().includes('saddle')) return null;
      return [{
        src:          '/icons/items/saddle.png',
        alt:          'Saddle',
        position:     POSITIONS.BOTTOM_RIGHT,
        size:         'md',
        label:        'Saddle',
        labelRole:    'status',
        fallbackHide: true,
      }];
    }
  },

  // -- Chested -- Per mob che possono avere una chest
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
    }
  },

  // -- Banner -- Per illager che tengono uno stendardo (illager banner)
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
    }
  },

  // -- Screaming -- Per capra che urla (screaming goat)
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
        }
    },

  // ─────────────────────────────────────────────────────────────────────────
  // Aggiungi nuovi resolver qui sotto
  // ─────────────────────────────────────────────────────────────────────────

  // Esempio: icona colore per i gatti
  // {
  //   id: 'cat-color',
  //   resolve(mob) {
  //     if (mob.folder !== 'cat') return null;
  //     const CAT_COLORS = { 1: 'tabby', 2: 'black', 3: 'red', ... };
  //     const colorName = CAT_COLORS[mob.num1] ?? null;
  //     if (!colorName) return null;
  //     return [{
  //       src:          `/icons/cat-colors/${colorName}.png`,
  //       alt:          colorName,
  //       position:     POSITIONS.BOTTOM_LEFT,
  //       label:        colorName,
  //       labelRole:    'color',
  //       fallbackHide: true,
  //     }];
  //   },
  // },

];

// ─────────────────────────────────────────────────────────────────────────────
// FUNZIONI PUBBLICHE
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Risolve tutte le icone per un mob, raggruppandole per posizione.
 * Se due icone vogliono la stessa posizione, vince la prima (ordine dei resolver).
 *
 * @param {object} mob
 * @returns {Map<string, IconData>}  posizione → IconData
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
 * Usato in MobCard per gestire il posizionamento del suffix badge.
 *
 * @param {object} mob
 * @returns {boolean}
 */
export function hasVillagerIcons(mob) {
  if (!mob.complexId) return false;
  const config = ComplexConfig.find(c => c.id === mob.complexId);
  return !!config?.useVillagerIcons;
}