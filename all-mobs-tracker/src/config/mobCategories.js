// ============================================================
//  MOB CATEGORIES
//  Ogni categoria ha:
//    id          – chiave univoca usata nei link e nelle card
//    label       – nome visualizzato
//    icon        – simbolo mostrato sulla card e in header
//    color       – stringa colore per gli accent (es. 'amber')
//    description – testo mostrato nella pagina categoria
//    mobs        – array di mob.name esatti
// ============================================================

export const MobCategories = [
  {
    id:    'shearable',
    label: 'Shearable',
    icon:  '✂',
    color: 'amber',
    mobs: [
      'Snow Golem Sheared',
      'Bogged Sheared',
      'Sheep Blue (Sheared)',
    ],
  },

  // Aggiungi nuove categorie qui seguendo lo stesso schema:
  // {
  //   id:    'breedable',
  //   label: 'Breedable',
  //   icon:  '♥',
  //   color: 'pink',
  //   description: 'Mob che possono essere allevati usando specifici oggetti.',
  //   mobs: [],
  // },
];

// Lookup rapido per id
export const CategoryMap = Object.fromEntries(
  MobCategories.map(c => [c.id, c])
);

// Dato un mob.name, restituisce le categorie a cui appartiene
// Normalizza gli spazi multipli per robustezza
export const getCategoriesForMob = (mobName) => {
  const normalized = mobName.trim().replace(/\s+/g, ' ').toLowerCase();
  return MobCategories.filter(c =>
    c.mobs.some(m => m.trim().replace(/\s+/g, ' ').toLowerCase() === normalized)
  );
};