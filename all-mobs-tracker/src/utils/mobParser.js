import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

export const parseFileName = (fileName, path) => {
  const nameWithoutExt = fileName.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
  let cleanName = nameWithoutExt;
  let activeSuffixes = [];
  let suffixBadges = [];

  // Estrazione dinamica suffissi multipli (es. _BAP)
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

  let data = {
    activeSuffixes,
    suffixBadges,
    complexId: null,
    complexBadge: null,
    num1: null, num2: null, num3: null,
    name: '',
    type: 'base'
  };

  // Parsing mob complessi
  if (path) {
    for (const config of ComplexConfig) {
      if (path.includes(config.pathIncludes)) {
        const match = cleanName.match(config.regex);
        if (match) {
          data.complexId = config.id;
          data.type = config.type;
          data.complexBadge = { label: config.id, color: config.badgeColor };
          Object.assign(data, config.extractNums(match));

          if (config.useFileName) {
            const rawName = cleanName
              .replace(/^\d+\.\d+(\.\d+)?/, '')
              .replace(/-/g, ' ')
              .replace(/([A-Z])/g, ' $1')
              .trim();
            data.name = rawName;
          } else {
            data.name = config.formatName(match);
          }

          return data;
        }
      }
    }
  }

  // Parsing varianti standard (1.1Nome, 1.1.1Nome, ecc)
  const match3 = cleanName.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
  if (match3) {
    data.type = 'color_variant';
    data.num1 = parseInt(match3[1]); data.num2 = parseInt(match3[2]); data.num3 = parseInt(match3[3]);
    data.name = match3[4];
  } else {
    const match2 = cleanName.match(/^(\d+)\.(\d+)(.+)$/);
    if (match2) {
      data.type = 'complex_variant';
      data.num1 = parseInt(match2[1]); data.num2 = parseInt(match2[2]);
      data.name = match2[3];
    } else {
      const match1 = cleanName.match(/^(\d+)(.+)$/);
      if (match1) {
        data.type = 'main_variant';
        data.num1 = parseInt(match1[1]);
        data.name = match1[2];
      } else {
        data.name = cleanName;
      }
    }
  }

  data.name = data.name.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim();
  return data;
};