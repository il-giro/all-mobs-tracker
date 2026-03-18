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
 * id:          string   — id univoco, usato nell'URL (/category/:id)
 * label:       string   — nome mostrato nella UI
 * icon:        string   — path immagine (/icons/…) o emoji fallback
 * color:       string   — tema colore (amber | blue | green | red | purple | cyan)
 * description: node     — testo o elemento JSX mostrato nella pagina categoria
 * link:        string   — (Opzionale) URL per il bottone esterno "Minecraft Wiki"
 * }
 */

export const MobCategories = [
  {
    id:    'saddled',
    label: 'Saddled',
    icon:  '/icons/items/saddle.png',
    color: 'red',
    link:  'https://minecraft.wiki/w/Saddle', 
    description:  ' These mobs can be saddled using a Saddle. Saddling them allows the player to ride the mob. ',
  },
  {
    id:    'shearable',
    label: 'Shearable',
    icon:  '/icons/items/shears.png',
    color: 'amber',
    link:  'https://minecraft.wiki/w/Shearing',
    description: ('These mobs can be sheared using Shears. Shearing them drops wool, mushrooms, or other materials, and in some cases',
    'permanently changes their appearance until they respawn or regrow.'),
  },
  {
    id:    'chested',
    label: 'Chested',
    icon:  '/icons/items/chest.png',
    color: 'blue',
    link:  'https://minecraft.wiki/w/Chest#Donkey,_mule,_or_llama_pack',
    description: 'These mobs can have a chest placed on them. A chest can be added to a donkey, a mule, or a llama by pressing use on the animal.',
  },
  {
    id:    'name-tag',
    label: 'Name Tag',
    icon:  '/icons/items/name-tag.png',
    color: 'green',
    link:  'https://minecraft.wiki/w/Name_Tag#Easter_eggs',
    description: 'These mobs obtain a special variant when given a specific name.',
  },
  {
    id:    'banner',
    label: 'Banner',
    icon:  '/icons/items/ominous-banner.png',
    color: 'purple',
    link:  'https://minecraft.wiki/w/Raid_captain',
    description: 'These mobs can have banners placed on them. You cannot give a banner to a mob.',
  },
  {
    id:    'lightning',
    label: 'Lightning',
    icon:  '/icons/items/lightning.png',
    color: 'cyan',
    link:  'https://minecraft.wiki/w/Thunderstorm#Effects_on_mobs',
    description: 'These mobs can be struck by lightning, which may cause them to transform into a different mob or gain special properties. I did not include all the mobs that can be struck by lightning, but only those that have a unique transformation or effect when struck. (For example, Pigs become zombified piglins, but they don\'t have a unique icon for that, so I didn\'t include them in this category.)',
  },
  {
    id:    'screaming',
    label: 'Screaming',
    icon:  '/icons/items/screaming.png',
    color: 'white',
    link:  'https://minecraft.wiki/w/Goat#Spawning',
    description: 'When a goat is spawned naturally, and also through breeding normal goats, it has a 2% chance of being a screaming goat. They look identical to all other goats, but they make screaming sounds and ram more often.',
  },
];

export const CategoryMap = Object.fromEntries(
  MobCategories.map(c => [c.id, c])
);