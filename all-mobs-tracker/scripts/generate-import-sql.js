/**
 * AllMobs D1 import SQL generator.
 *
 * Generates idempotent SQL from the local image/config preview.
 * This script only writes scripts/import-data.sql and scripts/import-report.json;
 * it never executes SQL against local or remote D1.
 */

import fs from 'fs';
import path from 'path';

import {
  __dirname,
  buildCategories,
  buildImportPlan,
  countSqlStatements,
  escapeSql,
  missingPublicAssets,
  scanImages,
} from './import-utils.js';

const REPORT_FILE = path.join(__dirname, 'import-report.json');
const SQL_OUTPUT_FILE = path.join(__dirname, 'import-data.sql');

function buildCategoryInsert(category) {
  return [
    'INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)',
    `SELECT ${escapeSql(category.name)}, ${escapeSql(category.icon)}, ${escapeSql(category.color)}, ${escapeSql(category.link)}, ${escapeSql(category.description)}, ${Number(category.priority)}, ${escapeSql(category.variant)}`,
    'WHERE NOT EXISTS (',
    '  SELECT 1 FROM CATEGORIES',
    `  WHERE name = ${escapeSql(category.name)}`,
    category.variant == null ? '    AND variant IS NULL' : `    AND variant = ${escapeSql(category.variant)}`,
    ');',
  ].join('\n');
}

function buildMobInsert(mob) {
  return [
    'INSERT INTO MOBS (name, img, link, description)',
    `SELECT ${escapeSql(mob.name)}, ${escapeSql(mob.img)}, '.', '.'`,
    'WHERE NOT EXISTS (',
    '  SELECT 1 FROM MOBS',
    `  WHERE name = ${escapeSql(mob.name)}`,
    ');',
  ].join('\n');
}

function buildVariantInsert(variant) {
  return [
    'INSERT INTO VARIANTS (name, img, link, description, mob_id)',
    `SELECT ${escapeSql(variant.name)}, ${escapeSql(variant.img)}, '.', '.', m.id`,
    'FROM MOBS m',
    `WHERE m.name = ${escapeSql(variant.baseName)}`,
    '  AND NOT EXISTS (',
    '    SELECT 1 FROM VARIANTS v',
    '    WHERE v.name = ' + escapeSql(variant.name),
    '      AND v.mob_id = m.id',
    '  )',
    'LIMIT 1;',
  ].join('\n');
}

function section(title, statements) {
  return [
    '-- ============================================================',
    `-- ${title}`,
    '-- ============================================================',
    '',
    ...statements,
    '',
  ].join('\n');
}

function buildSql(plan, categoryPlan) {
  const lines = [
    '-- ============================================================',
    '-- AllMobs Database Import Script',
    `-- Generato: ${plan.generatedAt}`,
    '-- Origine: public/data + configurazioni reali in src/config',
    '-- Sicurezza: nessuna relazione MOB_CATEGORIES/VARIANT_CATEGORIES viene inserita',
    '-- Idempotenza: WHERE NOT EXISTS su chiavi logiche, senza richiedere UNIQUE remoti',
    `-- Mob pianificati: ${plan.mobs.length}`,
    `-- Varianti pianificate: ${plan.variants.length}`,
    `-- Categorie pianificate: ${categoryPlan.categories.length}`,
    '-- ============================================================',
    '',
    'BEGIN TRANSACTION;',
    '',
    section('CATEGORIE DA src/config/mobCategories.js + dinamiche', categoryPlan.categories.map(buildCategoryInsert)),
    section('MOB BASE', plan.mobs.map(buildMobInsert)),
    section('VARIANTI', plan.variants.map(buildVariantInsert)),
    'COMMIT;',
    '',
    '-- ============================================================',
    '-- Fine importazione',
    '-- ============================================================',
    '',
  ];

  return lines.join('\n');
}

function buildReport(plan, categoryPlan, previousSqlCounts, newSql) {
  const newSqlCounts = countSqlStatements(newSql);
  const categoryAssetPaths = categoryPlan.categories.map(category => category.icon);

  return {
    timestamp: plan.generatedAt,
    note: 'Report generato localmente. Nessuna scrittura su D1 remoto eseguita.',
    summary: {
      totalImages: plan.images.length,
      mobsCount: plan.mobs.length,
      variantsCount: plan.variants.length,
      categoriesCount: categoryPlan.categories.length,
      staticCategoriesCount: categoryPlan.staticCategories.length,
      dynamicCategoriesCount: categoryPlan.dynamicCategories.length,
      relationRowsPlanned: 0,
      syntheticMobs: plan.syntheticMobs.length,
      variantDuplicateGroups: plan.variantDuplicates.length,
      physicalDuplicateGroups: plan.physicalDuplicateGroups.length,
    },
    sources: {
      categories: 'src/config/mobCategories.js',
      namingRules: ['src/config/mobConfig.js', 'src/utils/mobParser.js'],
      images: 'public/data/**/*.{png,jpg,jpeg,gif,webp}',
    },
    generatedSqlCounts: newSqlCounts,
    previousSqlComparison: previousSqlCounts
      ? {
          previous: previousSqlCounts,
          current: newSqlCounts,
          differences: {
            categories: newSqlCounts.categories - previousSqlCounts.categories,
            mobs: newSqlCounts.mobs - previousSqlCounts.mobs,
            variants: newSqlCounts.variants - previousSqlCounts.variants,
            mobCategoryRelations: newSqlCounts.mobCategoryRelations - previousSqlCounts.mobCategoryRelations,
            variantCategoryRelations: newSqlCounts.variantCategoryRelations - previousSqlCounts.variantCategoryRelations,
          },
        }
      : null,
    categories: categoryPlan.categories,
    mobs: plan.mobs,
    variants: plan.variants,
    anomalies: {
      missingImageFiles: plan.images.filter(image => !fs.existsSync(image.fullPath)).map(image => image.relativePath),
      missingCategoryIconFiles: [...new Set(missingPublicAssets(categoryAssetPaths))].sort(),
      duplicateCategories: categoryPlan.duplicateCategories,
      duplicateVariantGroups: plan.variantDuplicates,
      duplicatePhysicalNameGroups: plan.physicalDuplicateGroups,
      syntheticMobs: plan.syntheticMobs,
      variantsWithoutBaseMobAfterPlanning: plan.missingBaseNamesAfterSynthesis,
    },
    existingDataCheck: {
      status: 'not-run',
      reason: 'Questo generatore non interroga il database remoto. I conflitti con dati esistenti richiedono Wrangler autenticato e query read-only.',
      conflictsWithExistingData: [],
    },
  };
}

function main() {
  const previousSqlCounts = fs.existsSync(SQL_OUTPUT_FILE)
    ? countSqlStatements(fs.readFileSync(SQL_OUTPUT_FILE, 'utf-8'))
    : null;

  const images = scanImages();
  const plan = buildImportPlan(images);
  const categoryPlan = buildCategories();
  const sql = buildSql(plan, categoryPlan);
  const report = buildReport(plan, categoryPlan, previousSqlCounts, sql);

  fs.writeFileSync(SQL_OUTPUT_FILE, sql);
  fs.writeFileSync(REPORT_FILE, JSON.stringify(report, null, 2));

  console.log('\n🔨 SQL di importazione generato');
  console.log('='.repeat(72));
  console.log(`File SQL:    ${SQL_OUTPUT_FILE}`);
  console.log(`Report:      ${REPORT_FILE}`);
  console.log(`Categorie:   ${report.summary.categoriesCount}`);
  console.log(`Mob:         ${report.summary.mobsCount}`);
  console.log(`Varianti:    ${report.summary.variantsCount}`);
  console.log(`Relazioni:   ${report.summary.relationRowsPlanned}`);
  console.log(`Mob sintetici per basi mancanti: ${report.summary.syntheticMobs}`);

  if (report.previousSqlComparison) {
    console.log('\nDifferenze rispetto al vecchio scripts/import-data.sql:');
    console.log(`  categorie: ${report.previousSqlComparison.previous.categories} → ${report.previousSqlComparison.current.categories}`);
    console.log(`  mob:       ${report.previousSqlComparison.previous.mobs} → ${report.previousSqlComparison.current.mobs}`);
    console.log(`  varianti:  ${report.previousSqlComparison.previous.variants} → ${report.previousSqlComparison.current.variants}`);
  }

  console.log('\n⚠️  Nessuna scrittura remota eseguita. Rivedere report e SQL prima di usare wrangler d1 execute.');
}

main();
