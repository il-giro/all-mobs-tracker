export const MobCategories = [
  {
    id:    'shearable',
    label: 'Shearable',
    icon:  '✂',
    color: 'amber',
    description:
      'These mobs can be sheared using Shears. ' +
      'Shearing them drops wool, mushrooms, or other materials, and in some cases ' +
      "permanently changes their appearance until they respawn or regrow.",
    mobs: [
      'Snow Golem  Sheared',
      'Bogged  Sheared',
      { name: 'Sheep White (Sheared)',             file: 'data/sheep/1.2.1Sheep-White-Sheared.png' },
      { name: 'Sheep Light Gray (Sheared)',         file: 'data/sheep/1.2.2Sheep-LightGray-Sheared.png' },
      { name: 'Sheep Gray (Sheared)',               file: 'data/sheep/1.2.3Sheep-Gray-Sheared.png' },
      { name: 'Sheep Black (Sheared)',              file: 'data/sheep/1.2.4Sheep-Black-Sheared.png' },
      { name: 'Sheep Brown (Sheared)',              file: 'data/sheep/1.2.5Sheep-Brown-Sheared.png' },
      { name: 'Sheep Red (Sheared)',                file: 'data/sheep/1.2.6Sheep-Red-Sheared.png' },
      { name: 'Sheep Orange (Sheared)',             file: 'data/sheep/1.2.7Sheep-Orange-Sheared.png' },
      { name: 'Sheep Yellow (Sheared)',             file: 'data/sheep/1.2.8Sheep-Yellow-Sheared.png' },
      { name: 'Sheep Lime (Sheared)',               file: 'data/sheep/1.2.9Sheep-Lime-Sheared.png' },
      { name: 'Sheep Green (Sheared)',              file: 'data/sheep/1.2.10Sheep-Green-Sheared.png' },
      { name: 'Sheep Cyan (Sheared)',               file: 'data/sheep/1.2.11Sheep-Cyan-Sheared.png' },
      { name: 'Sheep Light Blue (Sheared)',         file: 'data/sheep/1.2.12Sheep-LightBlue-Sheared.png' },
      { name: 'Sheep Blue (Sheared)',               file: 'data/sheep/1.2.13Sheep-Blue-Sheared.png' },
      { name: 'Sheep Purple (Sheared)',             file: 'data/sheep/1.2.14Sheep-Purple-Sheared.png' },
      { name: 'Sheep Magenta (Sheared)',            file: 'data/sheep/1.2.15Sheep-Magenta-Sheared.png' },
      { name: 'Sheep Pink (Sheared)',               file: 'data/sheep/1.2.16Sheep-Pink-Sheared.png' },
      { name: 'Sheep _jeb (Sheared)', file: 'data/sheep/1.2.17Sheep-_Jeb-Sheared_T.webp' },
    ],
  },
];

export const CategoryMap = Object.fromEntries(
  MobCategories.map(c => [c.id, c])
);

const mobEntryName = (entry) => typeof entry === 'object' ? entry.name : entry;

// Normalizza: minuscolo, rimuove parentesi, underscore → spazio, spazi multipli → singolo
const norm = (s) => s.toLowerCase().replace(/[()]/g, '').replace(/[_]+/g, ' ').replace(/\s+/g, ' ').trim();

export const getCategoriesForMob = (mobName, suffixLabels = []) => {
  const base = norm(mobName);
  const variants = new Set([base]);
  suffixLabels.forEach(s => {
    const sn = norm(s);
    if (sn) variants.add(`${base} ${sn}`);
  });
  if (suffixLabels.length > 1) {
    variants.add(`${base} ${suffixLabels.map(norm).filter(Boolean).join(' ')}`);
  }

  return MobCategories.filter(c =>
    c.mobs.some(entry => variants.has(norm(mobEntryName(entry))))
  );
};