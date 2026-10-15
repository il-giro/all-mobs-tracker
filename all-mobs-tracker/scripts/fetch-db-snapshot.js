import { execSync } from 'child_process';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, '..');

function queryD1(command) {
  const output = execSync(`npx wrangler d1 execute allmobs --remote --command "${command.replace(/"/g, '\\"')}" --json`, {
    cwd: ROOT,
    maxBuffer: 50 * 1024 * 1024,
    encoding: 'utf-8'
  });
  const jsonStart = output.indexOf('[');
  const jsonEnd = output.lastIndexOf(']');
  if (jsonStart === -1 || jsonEnd === -1) {
    throw new Error('Could not find JSON array in wrangler output: ' + output);
  }
  const jsonStr = output.slice(jsonStart, jsonEnd + 1);
  const parsed = JSON.parse(jsonStr);
  return parsed[0]?.results || [];
}

console.log('Fetching database data from Cloudflare D1...');

const categoriesRaw = queryD1('SELECT id, name, icon, color, link, description, priority, variant FROM CATEGORIES ORDER BY priority ASC, id ASC;');
console.log(`- Categories: ${categoriesRaw.length}`);

const mobsRaw = queryD1('SELECT m.id, m.name, m.img, m.link, m.description, GROUP_CONCAT(mc.category_id) as category_ids FROM MOBS m LEFT JOIN MOB_CATEGORIES mc ON m.id = mc.mob_id GROUP BY m.id ORDER BY m.id ASC;');
console.log(`- Mobs: ${mobsRaw.length}`);

const variantsRaw = queryD1('SELECT v.id, v.name, v.img, v.link, v.description, v.mob_id, GROUP_CONCAT(vc.category_id) as category_ids FROM VARIANTS v LEFT JOIN VARIANT_CATEGORIES vc ON v.id = vc.variant_id GROUP BY v.id ORDER BY v.id ASC;');
console.log(`- Variants: ${variantsRaw.length}`);

const categories = categoriesRaw.map(c => ({
  ...c,
  slug: c.name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '')
}));

const mobs = mobsRaw.map(m => ({
  ...m,
  category_ids: m.category_ids ? m.category_ids.split(',').map(Number) : []
}));

const variants = variantsRaw.map(v => ({
  ...v,
  category_ids: v.category_ids ? v.category_ids.split(',').map(Number) : []
}));

const snapshot = {
  timestamp: new Date().toISOString(),
  categories,
  mobs,
  variants
};

const outputDir = path.join(ROOT, 'src', 'data');
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
}

const outputPath = path.join(outputDir, 'dbSnapshot.json');
fs.writeFileSync(outputPath, JSON.stringify(snapshot, null, 2), 'utf-8');
console.log(`Snapshot saved to ${outputPath}`);
