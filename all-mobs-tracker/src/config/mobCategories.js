/**
 * mobCategories.js
 *
 * Definisce le categorie di mob (es. Shearable, Rideable, …).
 * I mob che appartengono a una categoria NON sono listati qui manualmente:
 * vengono trovati dinamicamente tramite i resolver in mobIcons.js.
 * Per collegare un'icona a una categoria, aggiungere categoryId al resolver.
 *
 * Struttura di una categoria:
 * {
 *   id:          string   — id univoco, usato nell'URL (/category/:id)
 *   label:       string   — nome mostrato nella UI
 *   icon:        string   — path immagine (/icons/…) o emoji fallback
 *   color:       string   — tema colore (amber | blue | green | red | purple | cyan)
 *   description: string   — testo descrittivo mostrato nella pagina categoria
 * }
 */

export const MobCategories = [
  {
    id:    'shearable',
    label: 'Shearable',
    icon:  '/icons/items/shears.png',
    color: 'amber',
    description:
      'These mobs can be sheared using Shears. ' +
      'Shearing them drops wool, mushrooms, or other materials, and in some cases ' +
      'permanently changes their appearance until they respawn or regrow.',
  },

  // Aggiungi nuove categorie qui sotto:
  // {
  //   id:          'rideable',
  //   label:       'Rideable',
  //   icon:        '/icons/items/saddle.png',
  //   color:       'blue',
  //   description: 'These mobs can be ridden by the player.',
  // },
];

export const CategoryMap = Object.fromEntries(
  MobCategories.map(c => [c.id, c])
);