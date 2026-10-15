import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..');

const snapPath = path.join(ROOT, 'src', 'data', 'dbSnapshot.json');
const snap = JSON.parse(fs.readFileSync(snapPath, 'utf-8'));

const HEX_TO_COLOR = {
  '#ef4444': 'red',
  '#f59e0b': 'amber',
  '#3b82f6': 'blue',
  '#10b981': 'green',
  '#a855f7': 'purple',
  '#06b6d4': 'cyan',
  '#ffffff': 'white',
  '#9ca3af': 'gray',
  '#6b7280': 'gray',
  '#111827': 'gray',
  '#92400e': 'amber',
  '#dc2626': 'red',
  '#ea580c': 'orange',
  '#fbbf24': 'amber',
  '#84cc16': 'green',
  '#16a34a': 'green',
  '#38bdf8': 'blue',
  '#d946ef': 'purple',
  '#ec4899': 'pink',
  '#9333ea': 'purple',
  '#db2777': 'pink',
  '#ca8a04': 'amber',
  '#4b5563': 'gray',
  '#2563eb': 'blue',
};

const categories = snap.categories.map(c => {
  const colorName = HEX_TO_COLOR[c.color?.toLowerCase()] || 'amber';
  return {
    id: c.slug,
    dbId: c.id,
    label: c.name,
    name: c.name,
    icon: c.icon,
    color: colorName,
    colorHex: c.color,
    link: c.link === '.' ? '' : c.link,
    description: c.description === '.' ? '' : c.description,
    priority: c.priority,
    variant: c.variant
  };
});

const content = `/**
 * mobCategories.js
 *
 * Categorie di mob sincronizzate con il database Cloudflare D1 (tabella CATEGORIES).
 * Contiene tutte le 53 categorie del database (statiche, colori, biomi, professioni e speciali).
 */

export const MobCategories = ${JSON.stringify(categories, null, 2)};

export const CategoryMap = (() => {
  const map = {};
  for (const cat of MobCategories) {
    map[cat.id] = cat;
    map[cat.dbId] = cat;
    map[String(cat.dbId)] = cat;
    map[cat.name] = cat;
    map[cat.name.toLowerCase()] = cat;
  }
  return map;
})();

export function getCategoryById(idOrSlug) {
  if (idOrSlug == null) return null;
  return CategoryMap[idOrSlug] || CategoryMap[String(idOrSlug).toLowerCase()] || null;
}
`;

const dest = path.join(ROOT, 'src', 'config', 'mobCategories.js');
fs.writeFileSync(dest, content, 'utf-8');
console.log('Successfully updated', dest);
