// Configurazione dei Suffissi (es: _B, _A, _P)
// Puoi aggiungere qualsiasi lettera qui e apparirà ovunque nel programma
export const SuffixConfig = {
    'A': { id: 'A', label: 'BABY-BREED', color: 'bg-purple-600', defaultShow: false },
    'B': { id: 'B', label: 'BABY-MONSTER', color: 'bg-pink-600', defaultShow: true },
    'C': { id: 'C', label: 'BABY-ANIMAL', color: 'bg-red-600', defaultShow: false },
    'P': { id: 'P', label: 'PUMPKIN', color: 'bg-orange-600', defaultShow: false },
  // Aggiungi qui: 'S': { id: 'S', label: 'SPECIAL', color: 'bg-yellow-600', defaultShow: true },
};

// Configurazione dei Mob con logica complessa (es: Villagers, Horses)
export const ComplexConfig = [
  {
    id: 'villager',
    label: 'Varianti Villager',
    pathIncludes: '/villagers/',
    regex: /^(\d+)\.(\d+)$/,
    type: 'complex_variant',
    badgeColor: 'bg-amber-600',
    defaultShow: false,
    // Se il filtro è spento, mostriamo comunque la versione 1.1 base
    isBaseCondition: (n1, n2) => n1 === 1 && n2 === 1,
    formatName: (match) => {
      const n1 = parseInt(match[1]), n2 = parseInt(match[2]);
      const biomes = { 1: 'Plains', 2: 'Desert', 3: 'Jungle', 4: 'Savanna', 5: 'Snow', 6: 'Swamp', 7: 'Taiga' };
      const jobs = { 1: 'Unemployed', 2: 'Nitwit', 3: 'Armorer', 4: 'Butcher', 5: 'Cartographer', 6: 'Cleric', 7: 'Farmer', 8: 'Fisherman', 9: 'Fletcher', 10: 'Leatherworker', 11: 'Librarian', 12: 'Mason', 13: 'Shepherd', 14: 'Toolsmith', 15: 'Weaponsmith' };
      return `Villager ${biomes[n1] || n1} ${jobs[n2] || n2}`;
    },
    extractNums: (match) => ({ num1: parseInt(match[1]), num2: parseInt(match[2]) })
  },
  {
    id: 'horse',
    label: 'Varianti Cavalli',
    pathIncludes: '/horses/',
    regex: /^(\d+)\.(\d+)\.(\d+)$/,
    type: 'color_variant',
    badgeColor: 'bg-blue-600',
    defaultShow: false,
    isBaseCondition: (n1, n2, n3) => n1 === 1 && n2 === 1 && n3 === 1,
    formatName: (match) => {
      const n1 = parseInt(match[1]), n2 = parseInt(match[2]), n3 = parseInt(match[3]);
      const colors = { 1: 'White', 2: 'Creamy', 3: 'Chestnut', 4: 'Brown', 5: 'Black', 6: 'Gray', 7: 'Dark Brown' };
      const markings = { 1: 'None', 2: 'White', 3: 'Whitefield', 4: 'Whitedots', 5: 'Blackdots' };
      const equip = { 1: '', 2: 'Saddle', 3: 'Leather Armor', 4: 'Iron Armor', 5: 'Gold Armor', 6: 'Diamond Armor', 7: 'Netherite Armor', 8: 'Saddle + Leather', 9: 'Saddle + Iron', 10: 'Saddle + Gold', 11: 'Saddle + Diamond', 12: 'Saddle + Netherite' };
      return `Horse ${colors[n1] || ''} ${markings[n2] || ''} ${equip[n3] || ''}`.replace(/\s+/g, ' ').trim();
    },
    extractNums: (match) => ({ num1: parseInt(match[1]), num2: parseInt(match[2]), num3: parseInt(match[3]) })
  },
    {
    id: 'enderman',
    label: 'Varianti Enderman',
    pathIncludes: '/endermans/',
    regex: /^(\d+)(.+)$/,
    type: 'complex_variant',
    badgeColor: 'bg-purple-600',
    defaultShow: false,
    isBaseCondition: (n1) => n1 === 1,
    formatName: (match) => {
        const n1 = parseInt(match[1]);
        const block = { 1: '', 2: 'Sand', 3: 'Cactus', 4: 'Tnt', 5: 'Grass'};
        return `Enderman ${block[n1] || ""}`;
    },
    extractNums: (match) => ({ num1: parseInt(match[1])})
    },
    {
    id: 'llama',
    label: 'Varianti Llama',
    pathIncludes: '/llamas/',
    regex: /^(\d+)\.(\d+)\.(\d+)/,
    type: 'color_variant',
    badgeColor: 'bg-yellow-600',
    defaultShow: false,
    isBaseCondition: (n1, n2, n3) => n1 === 1 && n2 === 1 && n3 === 1,
    formatName: (match) => {
        const n1 = parseInt(match[1]), n2 = parseInt(match[2]), n3 = parseInt(match[3]);
        const type = { 1: 'Brown', 2: 'Creamy', 3: 'Gray', 4: 'White'};
        const equip = { 1: '', 2: 'Chest'};
        const carpetColor = { 1: '', 2: 'Black', 3: 'Blue', 4: 'Brown', 5: 'Cyan', 6: 'Gray', 7: 'Green', 8: 'Light Blue', 9: 'Lime', 10: 'Magenta', 11: 'Orange', 12: 'Pink', 13: 'Purple', 14: 'Red', 15: 'Silver', 16: 'White', 17: 'Yellow' };
        return `Llama ${type[n1] || ''} ${carpetColor[n3] || ''}`.replace(/\s+/g, ' ').trim() + (n2 === 2 ? ' with Chest' : '');
    },
    extractNums: (match) => ({ num1: parseInt(match[1]), num2: parseInt(match[2]), num3: parseInt(match[3]) })
    },
];