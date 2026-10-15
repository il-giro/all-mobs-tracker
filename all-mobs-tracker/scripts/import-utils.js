/**
 * Shared helpers for the AllMobs D1 import preview/generator.
 *
 * These helpers intentionally import the real app configuration instead of
 * re-declaring mob/category rules by hand.
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

import { SuffixConfig, SpecialFolderMap, ComplexConfig } from '../src/config/mobConfig.js';
import { MobCategories } from '../src/config/mobCategories.js';

export const __filename = fileURLToPath(import.meta.url);
export const __dirname = path.dirname(__filename);
export const PROJECT_ROOT = path.resolve(__dirname, '..');
export const PUBLIC_DATA_DIR = path.join(PROJECT_ROOT, 'public/data');
export const PUBLIC_DIR = path.join(PROJECT_ROOT, 'public');

export const IMAGE_EXTENSIONS = new Set(['.png', '.jpg', '.jpeg', '.gif', '.webp']);

const COLOR_HEX = {
  white: '#ffffff',
  red: '#ef4444',
  amber: '#f59e0b',
  blue: '#3b82f6',
  green: '#10b981',
  purple: '#a855f7',
  cyan: '#06b6d4',
  gray: '#6b7280',
};

const WOOL_COLOR_HEX = {
  White: '#ffffff',
  LightGray: '#9ca3af',
  Gray: '#6b7280',
  Black: '#111827',
  Brown: '#92400e',
  Red: '#dc2626',
  Orange: '#ea580c',
  Yellow: '#fbbf24',
  Lime: '#84cc16',
  Green: '#16a34a',
  Cyan: '#06b6d4',
  LightBlue: '#38bdf8',
  Blue: '#3b82f6',
  Purple: '#a855f7',
  Magenta: '#d946ef',
  Pink: '#ec4899',
};

export function escapeSql(value) {
  if (value === null || value === undefined) return 'NULL';
  return `'${String(value).replace(/'/g, "''")}'`;
}

export function pascalCase(value) {
  return String(value)
    .split(/[^A-Za-z0-9]+/)
    .filter(Boolean)
    .map(part => part.charAt(0).toUpperCase() + part.slice(1))
    .join('');
}

export function stripImageExtension(filename) {
  return filename.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
}

export function stripNumericPrefix(name) {
  return name.replace(/^\d+(?:\.\d+)*/, '');
}

export function splitTechnicalSuffix(nameWithoutExt) {
  const match = nameWithoutExt.match(/_([A-Z]+)$/);
  if (!match) {
    return { cleanName: nameWithoutExt, suffixLetters: [], knownSuffixLetters: [] };
  }

  const suffixLetters = match[1].split('');
  const knownSuffixLetters = suffixLetters.filter(letter => SuffixConfig[letter]);

  return {
    cleanName: nameWithoutExt.replace(/_([A-Z]+)$/, ''),
    suffixLetters,
    knownSuffixLetters,
  };
}

export function normalizedNameFromFilename(filename) {
  const withoutExt = stripImageExtension(filename);
  const { cleanName, suffixLetters, knownSuffixLetters } = splitTechnicalSuffix(withoutExt);
  return {
    normalizedName: stripNumericPrefix(cleanName),
    suffixLetters,
    knownSuffixLetters,
  };
}

export function extractNumericCode(filename) {
  const withoutExt = stripImageExtension(filename);
  const cleanName = splitTechnicalSuffix(withoutExt).cleanName;
  const match = cleanName.match(/^(\d+(?:\.\d+)*)/);
  return match ? match[1] : null;
}

function appParseFileName(fileName, importPath) {
  const nameWithoutExt = stripImageExtension(fileName);
  let cleanName = nameWithoutExt;
  const activeSuffixes = [];
  const suffixBadges = [];

  const suffixMatch = nameWithoutExt.match(/_([A-Z]+)$/);
  if (suffixMatch) {
    cleanName = nameWithoutExt.replace(/_([A-Z]+)$/, '');
    suffixMatch[1].split('').forEach(letter => {
      if (SuffixConfig[letter]) {
        activeSuffixes.push(letter);
        suffixBadges.push(SuffixConfig[letter]);
      }
    });
  }

  const data = {
    activeSuffixes,
    suffixBadges,
    complexId: null,
    complexBadge: null,
    num1: null,
    num2: null,
    num3: null,
    name: '',
    type: 'base',
  };

  if (importPath) {
    for (const config of ComplexConfig) {
      if (importPath.includes(config.pathIncludes)) {
        const match = cleanName.match(config.regex);
        if (match) {
          data.complexId = config.id;
          data.type = config.type;
          data.complexBadge = { label: config.id, color: config.badgeColor };
          Object.assign(data, config.extractNums(match));

          if (config.useFileName) {
            data.name = cleanName
              .replace(/^\d+(\.\d+)*/, '')
              .replace(/-/g, ' ')
              .replace(/([A-Z])/g, ' $1')
              .trim();
          } else {
            data.name = config.formatName(match);
          }

          return data;
        }
      }
    }
  }

  const match3 = cleanName.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
  if (match3) {
    data.type = 'color_variant';
    data.num1 = parseInt(match3[1], 10);
    data.num2 = parseInt(match3[2], 10);
    data.num3 = parseInt(match3[3], 10);
    data.name = match3[4];
  } else {
    const match2 = cleanName.match(/^(\d+)\.(\d+)(.+)$/);
    if (match2) {
      data.type = 'complex_variant';
      data.num1 = parseInt(match2[1], 10);
      data.num2 = parseInt(match2[2], 10);
      data.name = match2[3];
    } else {
      const match1 = cleanName.match(/^(\d+)(.+)$/);
      if (match1) {
        data.type = 'main_variant';
        data.num1 = parseInt(match1[1], 10);
        data.name = match1[2];
      } else {
        data.name = cleanName;
      }
    }
  }

  data.name = data.name.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim();
  return data;
}

export function scanImages(dir = PUBLIC_DATA_DIR, baseDir = PUBLIC_DATA_DIR) {
  const results = [];
  const items = fs.readdirSync(dir, { withFileTypes: true });

  for (const item of items) {
    const fullPath = path.join(dir, item.name);
    if (item.isDirectory()) {
      results.push(...scanImages(fullPath, baseDir));
      continue;
    }

    if (!item.isFile()) continue;
    const extension = path.extname(item.name).toLowerCase();
    if (!IMAGE_EXTENSIONS.has(extension)) continue;

    const relativePath = path.relative(baseDir, fullPath).replace(/\\/g, '/');
    const webPath = `/data/${relativePath}`;
    const importPath = `/public/data/${relativePath}`;
    const afterData = relativePath.split('/').slice(0, -1);
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

    const normalized = normalizedNameFromFilename(item.name);
    const numericCode = extractNumericCode(item.name);
    const parsed = appParseFileName(item.name, importPath);

    results.push({
      filename: item.name,
      fullPath,
      relativePath,
      webPath,
      importPath,
      folder,
      specialSuffixId,
      extension,
      numericCode,
      numericDepth: numericCode ? numericCode.split('.').length : 0,
      normalizedName: normalized.normalizedName,
      suffixLetters: normalized.suffixLetters,
      knownSuffixLetters: normalized.knownSuffixLetters,
      hasTechnicalSuffix: normalized.knownSuffixLetters.length > 0,
      parsed,
    });
  }

  return results.sort((a, b) => a.relativePath.localeCompare(b.relativePath));
}

function sortByBasePreference(a, b, baseName) {
  const score = (image) => {
    let value = 0;
    const config = image.parsed.complexId
      ? ComplexConfig.find(c => c.id === image.parsed.complexId)
      : null;

    if (image.normalizedName === baseName && !image.hasTechnicalSuffix) value -= 1000;
    if (image.normalizedName === baseName) value -= 700;
    if (config?.isBaseCondition?.(image.parsed.num1, image.parsed.num2, image.parsed.num3)) value -= 500;
    if (!image.hasTechnicalSuffix) value -= 100;
    if (image.numericDepth === 0) value -= 50;
    value += image.numericCode ? image.numericCode.split('.').reduce((sum, part, index) => sum + Number(part || 0) * (10 ** (3 - index)), 0) : 0;
    value += image.relativePath.length / 10000;
    return value;
  };

  return score(a) - score(b) || a.relativePath.localeCompare(b.relativePath);
}

const SUFFIX_LABELS = {
  'A': 'Baby',
  'B': 'Baby Monster',
  'C': 'Baby Animal',
  'P': 'Pumpkin',
  'J': 'Jockey',
  'U': 'Unobtainable',
  'F': 'Untrapable',
  'T': 'Texture Error'
};

export function resolveVariantName(image, baseName) {
  let name = image.parsed?.name?.trim();
  if (!name) {
    name = image.normalizedName || baseName;
  }

  if (image.folder === 'special:pumpkin') {
    const isJack = image.filename.startsWith('1.3');
    const isCarved = image.filename.startsWith('1.2');
    const pumpkinType = isJack ? "Jack o'Lantern" : (isCarved ? "Carved Pumpkin" : "Pumpkin");
    if (!name.toLowerCase().includes('pumpkin')) {
      name += ` (${pumpkinType})`;
    }
  }

  if (image.parsed?.activeSuffixes?.length) {
    const suffixTags = image.parsed.activeSuffixes
      .map(s => SUFFIX_LABELS[s] || s)
      .filter(tag => !name.toLowerCase().includes(tag.toLowerCase()));
    if (suffixTags.length > 0) {
      name += ` (${suffixTags.join(', ')})`;
    }
  }

  return name;
}

export function inferBaseName(image) {
  if (image.folder === 'root') return image.normalizedName;

  if (image.folder.startsWith('special:')) {
    const raw = image.normalizedName.split('-')[0] || image.normalizedName;
    if (raw === 'SpiderJockey') return 'Spider';
    return raw;
  }

  return pascalCase(image.folder);
}

export function buildImportPlan(images = scanImages()) {
  const allImages = images.map(image => ({ ...image, baseName: inferBaseName(image) }));
  const normalImages = allImages.filter(image => !image.folder.startsWith('special:'));

  const folderGroups = new Map();
  for (const image of normalImages) {
    const key = image.folder === 'root' ? `root:${image.normalizedName}` : `folder:${image.folder}`;
    if (!folderGroups.has(key)) folderGroups.set(key, []);
    folderGroups.get(key).push(image);
  }

  const mobs = [];
  const mobByName = new Map();
  for (const group of folderGroups.values()) {
    const baseName = group[0].baseName;
    const representative = [...group].sort((a, b) => sortByBasePreference(a, b, baseName))[0];
    const mob = {
      name: baseName,
      img: representative.webPath,
      sourceImage: representative.relativePath,
      folder: representative.folder,
      synthetic: false,
    };
    if (!mobByName.has(mob.name)) {
      mobByName.set(mob.name, mob);
      mobs.push(mob);
    }
  }

  const variantCandidates = [];
  for (const image of allImages) {
    const baseName = image.baseName;
    const isPlainBase = image.folder !== 'root' && image.normalizedName === baseName && !image.hasTechnicalSuffix && image.numericDepth === 0;
    if (image.folder === 'root' || isPlainBase) continue;

    const variantName = resolveVariantName(image, baseName);
    variantCandidates.push({
      name: variantName,
      img: image.webPath,
      baseName,
      sourceImage: image.relativePath,
      folder: image.folder,
      numericCode: image.numericCode,
      parsedType: image.parsed?.type,
      complexId: image.parsed?.complexId,
      suffixLetters: image.suffixLetters,
      hasTechnicalSuffix: image.hasTechnicalSuffix,
    });
  }

  const variantByKey = new Map();
  const variantDuplicates = new Map();
  for (const variant of variantCandidates) {
    const key = `${variant.baseName}\u0000${variant.name}`;
    if (!variantDuplicates.has(key)) variantDuplicates.set(key, []);
    variantDuplicates.get(key).push(variant);

    const prev = variantByKey.get(key);
    if (!prev || (prev.hasTechnicalSuffix && !variant.hasTechnicalSuffix)) {
      variantByKey.set(key, variant);
    }
  }

  const variants = [...variantByKey.values()].sort((a, b) => {
    const baseCmp = a.baseName.localeCompare(b.baseName);
    if (baseCmp) return baseCmp;
    return a.name.localeCompare(b.name);
  });

  const missingBaseNames = [...new Set(variants.map(v => v.baseName).filter(name => !mobByName.has(name)))].sort();
  const syntheticMobs = [];
  for (const baseName of missingBaseNames) {
    const firstVariant = variants.find(v => v.baseName === baseName);
    const mob = {
      name: baseName,
      img: firstVariant?.img ?? '.',
      sourceImage: firstVariant?.sourceImage ?? null,
      folder: firstVariant?.folder ?? 'unknown',
      synthetic: true,
    };
    mobByName.set(baseName, mob);
    mobs.push(mob);
    syntheticMobs.push(mob);
  }

  const physicalDuplicateGroups = Object.entries(
    allImages.reduce((acc, image) => {
      const key = `${image.baseName}\u0000${resolveVariantName(image, image.baseName)}`;
      acc[key] ??= [];
      acc[key].push(image.relativePath);
      return acc;
    }, {})
  )
    .filter(([, files]) => files.length > 1)
    .map(([key, files]) => {
      const [baseName, name] = key.split('\u0000');
      return { baseName, name, files };
    });

  return {
    generatedAt: new Date().toISOString(),
    images: allImages,
    mobs: mobs.sort((a, b) => a.name.localeCompare(b.name)),
    variants,
    syntheticMobs,
    variantDuplicates: [...variantDuplicates.entries()]
      .filter(([, list]) => list.length > 1)
      .map(([key, list]) => {
        const [baseName, name] = key.split('\u0000');
        return { baseName, name, chosen: variantByKey.get(key).sourceImage, files: list.map(v => v.sourceImage) };
      }),
    physicalDuplicateGroups,
    missingBaseNamesAfterSynthesis: variants.map(v => v.baseName).filter(name => !mobByName.has(name)),
  };
}

export function buildCategories() {
  const staticCategories = MobCategories.map((category, index) => ({
    name: category.label,
    icon: category.icon,
    color: COLOR_HEX[category.color] ?? category.color ?? '#6b7280',
    link: category.link ?? '.',
    description: typeof category.description === 'string' ? category.description : String(category.description ?? '.'),
    priority: index + 1,
    variant: null,
    source: `mobCategories:${category.id}`,
  }));

  const dynamicCategories = [];
  let priority = 100;

  for (const [variant, color] of Object.entries(WOOL_COLOR_HEX)) {
    const iconName = variant.replace(/([a-z])([A-Z])/g, '$1-$2').toLowerCase();
    dynamicCategories.push({
      name: `Color - ${variant}`,
      icon: `/icons/items/${iconName}-wool.png`,
      color,
      link: '.',
      description: `Mob with ${variant} color variant.`,
      priority: priority++,
      variant,
      source: 'dynamic:color',
    });
  }

  const villagerBiomes = [
    { label: 'Plains', icon: '/icons/biomes/Plains.png' },
    { label: 'Desert', icon: '/icons/biomes/Desert.png' },
    { label: 'Jungle', icon: '/icons/biomes/Jungle.png' },
    { label: 'Savanna', icon: '/icons/biomes/Savanna.png' },
    { label: 'Snow', icon: '/icons/biomes/SnowyPlains.png' },
    { label: 'Swamp', icon: '/icons/biomes/Swamp.png' },
    { label: 'Taiga', icon: '/icons/biomes/Taiga.png' },
  ];

  for (const biome of villagerBiomes) {
    dynamicCategories.push({
      name: `Biome - ${biome.label}`,
      icon: biome.icon,
      color: '#10b981',
      link: '.',
      description: `Mob from ${biome.label} biome.`,
      priority: priority++,
      variant: biome.label,
      source: 'dynamic:biome',
    });
  }

  const villagerJobs = [
    { label: 'Unemployed', icon: '/icons/mobs/VillagerFace.png' },
    { label: 'Nitwit', icon: '/icons/mobs/VillagerFace.png' },
    { label: 'Armorer', icon: '/icons/job site/blast-furnace.png' },
    { label: 'Butcher', icon: '/icons/job site/smoker.png' },
    { label: 'Cartographer', icon: '/icons/job site/cartography-table.png' },
    { label: 'Cleric', icon: '/icons/job site/brewing-stand.png' },
    { label: 'Farmer', icon: '/icons/job site/composter.png' },
    { label: 'Fisherman', icon: '/icons/job site/barrel.png' },
    { label: 'Fletcher', icon: '/icons/job site/fletching-table.png' },
    { label: 'Leatherworker', icon: '/icons/job site/cauldron.png' },
    { label: 'Librarian', icon: '/icons/job site/lectern.png' },
    { label: 'Mason', icon: '/icons/job site/stonecutter.png' },
    { label: 'Shepherd', icon: '/icons/job site/loom.png' },
    { label: 'Toolsmith', icon: '/icons/job site/smithing-table.png' },
    { label: 'Weaponsmith', icon: '/icons/job site/grindstone.png' },
  ];

  for (const job of villagerJobs) {
    dynamicCategories.push({
      name: `Profession - ${job.label}`,
      icon: job.icon,
      color: '#f59e0b',
      link: '.',
      description: `Villager with ${job.label} profession.`,
      priority: priority++,
      variant: job.label,
      source: 'dynamic:profession',
    });
  }

  const suffixCategories = [
    { label: 'Baby Breed', suffixId: 'A', icon: '/icons/items/name-tag.png', color: '#9333ea', desc: 'Baby variant obtained through breeding.' },
    { label: 'Baby Monster', suffixId: 'B', icon: '/icons/items/name-tag.png', color: '#db2777', desc: 'Baby variant of monster mobs.' },
    { label: 'Baby Animal', suffixId: 'C', icon: '/icons/items/name-tag.png', color: '#16a34a', desc: 'Baby variant of animal mobs.' },
    { label: 'Pumpkin', suffixId: 'P', icon: '/icons/items/carved-pumpkin.png', color: '#ea580c', desc: 'Mob wearing a pumpkin or jack o lantern.' },
    { label: 'Jockey', suffixId: 'J', icon: '/icons/items/saddle.png', color: '#ca8a04', desc: 'Jockey mob combination.' },
    { label: 'Unobtainable', suffixId: 'U', icon: '/icons/items/name-tag.png', color: '#dc2626', desc: 'Unobtainable mob variant in normal survival.' },
    { label: 'Untrapable', suffixId: 'F', icon: '/icons/items/chest.png', color: '#4b5563', desc: 'Mob that cannot be trapped in typical mob traps.' },
    { label: 'Texture Error', suffixId: 'T', icon: '/icons/items/shears.png', color: '#2563eb', desc: 'Mob variant with texture discrepancies.' },
  ];

  for (const item of suffixCategories) {
    dynamicCategories.push({
      name: `Special - ${item.label}`,
      icon: item.icon,
      color: item.color,
      link: '.',
      description: item.desc,
      priority: priority++,
      variant: item.suffixId,
      source: `dynamic:special:${item.suffixId}`,
    });
  }

  const categories = [...staticCategories, ...dynamicCategories];
  const seen = new Set();
  const duplicateCategories = [];
  for (const category of categories) {
    const key = `${category.name}\u0000${category.variant ?? ''}`;
    if (seen.has(key)) duplicateCategories.push(category);
    seen.add(key);
  }

  return { categories, staticCategories, dynamicCategories, duplicateCategories };
}

export function buildRelationsPlan(images, plan, categoryPlan) {
  const SUFFIX_MAP = {
    'A': 'Special - Baby Breed',
    'B': 'Special - Baby Monster',
    'C': 'Special - Baby Animal',
    'P': 'Special - Pumpkin',
    'J': 'Special - Jockey',
    'U': 'Special - Unobtainable',
    'F': 'Special - Untrapable',
    'T': 'Special - Texture Error',
  };

  const STATIC_MOB_MAP = {
    'Saddled': ['Horse', 'Donkey', 'Mule', 'Pig', 'Strider', 'Camel', 'SkeletonHorse', 'ZombieHorse'],
    'Shearable': ['Sheep', 'Mooshroom', 'SnowGolem', 'Bogged'],
    'Chested': ['Donkey', 'Mule', 'Llama', 'TraderLlama'],
    'Name Tag': ['Sheep', 'Rabbit', 'Vindicator'],
    'Banner': ['Pillager', 'Vindicator', 'Evoker'],
    'Lightning': ['Creeper', 'Mooshroom', 'SkeletonHorse'],
    'Screaming': ['Goat'],
  };

  const mobRelationsMap = new Map();
  const variantRelationsMap = new Map();

  for (const img of images) {
    const baseName = inferBaseName(img);
    const vName = resolveVariantName(img, baseName);

    // 1. Suffissi speciali
    const suffixes = new Set(img.suffixLetters || []);
    if (img.parsed?.activeSuffixes) img.parsed.activeSuffixes.forEach(s => suffixes.add(s));
    if (img.folder === 'special:pumpkin') suffixes.add('P');
    if (img.folder === 'special:baby breed') suffixes.add('A');
    if (img.folder === 'special:baby monster') suffixes.add('B');
    if (img.folder === 'special:baby animal') suffixes.add('C');
    if (img.folder.includes('jockey') || vName.includes('(Jockey)')) suffixes.add('J');

    for (const s of suffixes) {
      const catName = SUFFIX_MAP[s];
      if (catName) {
        mobRelationsMap.set(`${baseName}\u0000${catName}`, { mobName: baseName, categoryName: catName });
        if (img.folder !== 'root') {
          variantRelationsMap.set(`${baseName}\u0000${vName}\u0000${catName}`, { mobName: baseName, variantName: vName, categoryName: catName });
        }
      }
    }

    // 2. Colori — solo mob su cui si può usare un colorante:
    //    Sheep (lana), Wolf/Cat (collare), Llama/TraderLlama (tappeto), HappyGhast (sellino)
    const DYEABLE_MOBS = new Set(['Sheep', 'Wolf', 'Cat', 'Llama', 'TraderLlama', 'HappyGhast']);
    if (DYEABLE_MOBS.has(baseName)) {
      const colors = ['White', 'LightGray', 'Gray', 'Black', 'Brown', 'Red', 'Orange', 'Yellow', 'Lime', 'Green', 'Cyan', 'LightBlue', 'Blue', 'Purple', 'Magenta', 'Pink'];
      for (const col of colors) {
        const reg = new RegExp(`\\b${col}\\b`, 'i');
        if (reg.test(vName) || reg.test(img.filename)) {
          const catName = `Color - ${col}`;
          mobRelationsMap.set(`${baseName}\u0000${catName}`, { mobName: baseName, categoryName: catName });
          if (img.folder !== 'root') {
            variantRelationsMap.set(`${baseName}\u0000${vName}\u0000${catName}`, { mobName: baseName, variantName: vName, categoryName: catName });
          }
        }
      }
    }

    // 3. Biomi
    const biomes = ['Plains', 'Desert', 'Jungle', 'Savanna', 'Snow', 'Swamp', 'Taiga'];
    for (const b of biomes) {
      if ((baseName === 'Villager' || baseName === 'ZombieVillager') && (vName.includes(b) || img.filename.includes(b))) {
        const catName = `Biome - ${b}`;
        mobRelationsMap.set(`${baseName}\u0000${catName}`, { mobName: baseName, categoryName: catName });
        if (img.folder !== 'root') {
          variantRelationsMap.set(`${baseName}\u0000${vName}\u0000${catName}`, { mobName: baseName, variantName: vName, categoryName: catName });
        }
      }
    }

    // 4. Professioni
    const jobs = ['Unemployed', 'Nitwit', 'Armorer', 'Butcher', 'Cartographer', 'Cleric', 'Farmer', 'Fisherman', 'Fletcher', 'Leatherworker', 'Librarian', 'Mason', 'Shepherd', 'Toolsmith', 'Weaponsmith'];
    for (const j of jobs) {
      if ((baseName === 'Villager' || baseName === 'ZombieVillager') && (vName.includes(j) || img.filename.includes(j))) {
        const catName = `Profession - ${j}`;
        mobRelationsMap.set(`${baseName}\u0000${catName}`, { mobName: baseName, categoryName: catName });
        if (img.folder !== 'root') {
          variantRelationsMap.set(`${baseName}\u0000${vName}\u0000${catName}`, { mobName: baseName, variantName: vName, categoryName: catName });
        }
      }
    }

    // 5. Categorie statiche
    if (vName.toLowerCase().includes('saddle') || img.filename.toLowerCase().includes('saddle')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Saddled`, { mobName: baseName, variantName: vName, categoryName: 'Saddled' });
      }
    }
    if (vName.toLowerCase().includes('sheared') || img.filename.toLowerCase().includes('sheared')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Shearable`, { mobName: baseName, variantName: vName, categoryName: 'Shearable' });
      }
    }
    if (vName.toLowerCase().includes('chest') || img.filename.toLowerCase().includes('chest')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Chested`, { mobName: baseName, variantName: vName, categoryName: 'Chested' });
      }
    }
    if (['Toast', 'Johnny', 'jeb_'].some(n => vName.includes(n) || img.filename.includes(n))) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Name Tag`, { mobName: baseName, variantName: vName, categoryName: 'Name Tag' });
      }
    }
    if (vName.toLowerCase().includes('banner') || img.filename.toLowerCase().includes('banner')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Banner`, { mobName: baseName, variantName: vName, categoryName: 'Banner' });
      }
    }
    if (vName.toLowerCase().includes('lightning') || vName.toLowerCase().includes('charged') || img.filename.toLowerCase().includes('charged')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Lightning`, { mobName: baseName, variantName: vName, categoryName: 'Lightning' });
      }
    }
    if (vName.toLowerCase().includes('screaming') || img.filename.toLowerCase().includes('screaming')) {
      if (img.folder !== 'root') {
        variantRelationsMap.set(`${baseName}\u0000${vName}\u0000Screaming`, { mobName: baseName, variantName: vName, categoryName: 'Screaming' });
      }
    }
  }

  for (const [catName, mobList] of Object.entries(STATIC_MOB_MAP)) {
    for (const mName of mobList) {
      if (plan.mobs.some(m => m.name === mName)) {
        mobRelationsMap.set(`${mName}\u0000${catName}`, { mobName: mName, categoryName: catName });
      }
    }
  }

  const mobCategories = [...mobRelationsMap.values()].sort((a, b) => a.mobName.localeCompare(b.mobName) || a.categoryName.localeCompare(b.categoryName));
  const variantCategories = [...variantRelationsMap.values()].sort((a, b) => a.mobName.localeCompare(b.mobName) || a.variantName.localeCompare(b.variantName) || a.categoryName.localeCompare(b.categoryName));

  return { mobCategories, variantCategories };
}

export function missingPublicAssets(paths) {
  return paths
    .filter(Boolean)
    .filter(assetPath => assetPath !== '.')
    .filter(assetPath => assetPath.startsWith('/'))
    .filter(assetPath => !fs.existsSync(path.join(PUBLIC_DIR, assetPath.slice(1))));
}

export function countSqlStatements(sql) {
  return {
    categories: (sql.match(/INSERT\s+(?:OR\s+IGNORE\s+)?INTO\s+CATEGORIES/gi) ?? []).length,
    mobs: (sql.match(/INSERT\s+(?:OR\s+IGNORE\s+)?INTO\s+MOBS/gi) ?? []).length,
    variants: (sql.match(/INSERT\s+(?:OR\s+IGNORE\s+)?INTO\s+VARIANTS/gi) ?? []).length,
    mobCategoryRelations: (sql.match(/INSERT\s+(?:OR\s+IGNORE\s+)?INTO\s+MOB_CATEGORIES/gi) ?? []).length,
    variantCategoryRelations: (sql.match(/INSERT\s+(?:OR\s+IGNORE\s+)?INTO\s+VARIANT_CATEGORIES/gi) ?? []).length,
    insertOrReplace: /INSERT\s+OR\s+REPLACE/i.test(sql),
    insertOrIgnore: /INSERT\s+OR\s+IGNORE/i.test(sql),
  };
}
