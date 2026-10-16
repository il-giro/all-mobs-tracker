// Configurazione dei Suffissi (es: _B, _A, _P)
export const SuffixConfig = {
    'A': { id: 'A', label: 'BABY-BREED',    shortLabel: 'baby',          color: 'bg-purple-600', defaultShow: false },
    'B': { id: 'B', label: 'BABY-MONSTER',  shortLabel: 'baby',          color: 'bg-pink-600',   defaultShow: true  },
    'C': { id: 'C', label: 'BABY-ANIMAL',   shortLabel: 'baby',          color: 'bg-green-600',  defaultShow: false },
    'P': { id: 'P', label: 'PUMPKIN',       shortLabel: 'pumpkin',       color: 'bg-orange-600', defaultShow: false },
    'J': { id: 'J', label: 'JOCKEY',        shortLabel: 'jockey',        color: 'bg-yellow-600', defaultShow: true  },
    'U': { id: 'U', label: 'UNOBTAINABLE',  shortLabel: '',              color: 'bg-red-600',    defaultShow: false },
    'F': { id: 'F', label: 'UNTRAPABLE',    shortLabel: '',              color: 'bg-gray-600',   defaultShow: true  },
    'T': { id: 'T', label: 'TEXTURE',       shortLabel: 'wrong texture', color: 'bg-blue-600',   defaultShow: true  },
};

export const SuffixPriority = ['T', 'F', 'U', 'P', 'J', 'B', 'C', 'A'];

export const SpecialFolderMap = {
  'baby breed':    'A',
  'baby monster':  'B',
  'baby animal':   'C',
  'pumpkin':       'P',
  'jockey':        'J',
  'unobtainable':  'U',
  'untrapable':    'F',
};

// NOTA: ComplexConfig gestisce le varianti complesse con icone speciali (Villager e Zombie Villager).
// I nomi, le categorie e le icone di tutte le altre varianti (es. llama, wolf, horse, sheep)
// sono ora interamente gestite dal database.
export const ComplexConfig = [
  {
    id: 'zombie villager',
    label: 'Varianti Zombie Villager',
    pathIncludes: '/zombie villager/',
    regex: /^(\d+)\.(\d+)$/,
    type: 'complex_variant',
    badgeColor: 'bg-green-600',
    defaultShow: false,
    isBaseCondition: (n1, n2) => n1 === 1 && n2 === 1,
    useVillagerIcons: true,
    extractNums: (match) => ({ num1: parseInt(match[1]), num2: parseInt(match[2]) })
  },
  {
    id: 'villager',
    label: 'Varianti Villager',
    pathIncludes: '/villager/',
    regex: /^(\d+)\.(\d+)$/,
    type: 'complex_variant',
    badgeColor: 'bg-amber-600',
    defaultShow: false,
    isBaseCondition: (n1, n2) => n1 === 1 && n2 === 1,
    useVillagerIcons: true,
    extractNums: (match) => ({ num1: parseInt(match[1]), num2: parseInt(match[2]) })
  }
];