/**
 * AllMobs image import preview.
 *
 * Scans public/data using the same naming conventions used by the React app.
 * This script does not write to the database.
 */

import fs from 'fs';
import path from 'path';

import {
  __dirname,
  buildCategories,
  buildImportPlan,
  buildRelationsPlan,
  countSqlStatements,
  missingPublicAssets,
  scanImages,
} from './import-utils.js';

const REPORT_FILE = path.join(__dirname, 'import-report.json');
const SQL_FILE = path.join(__dirname, 'import-data.sql');

function buildSqlComparison(plan, categories, relationsPlan) {
  if (!fs.existsSync(SQL_FILE)) {
    return {
      file: 'scripts/import-data.sql',
      exists: false,
      note: 'File non presente: impossibile confrontare il report con SQL già generato.',
    };
  }

  const sql = fs.readFileSync(SQL_FILE, 'utf-8');
  const counts = countSqlStatements(sql);

  return {
    file: 'scripts/import-data.sql',
    exists: true,
    currentSqlCounts: counts,
    previewCounts: {
      categories: categories.length,
      mobs: plan.mobs.length,
      variants: plan.variants.length,
      mobCategoryRelations: relationsPlan.mobCategories.length,
      variantCategoryRelations: relationsPlan.variantCategories.length,
    },
    differences: {
      categories: categories.length - counts.categories,
      mobs: plan.mobs.length - counts.mobs,
      variants: plan.variants.length - counts.variants,
      mobCategoryRelations: relationsPlan.mobCategories.length - counts.mobCategoryRelations,
      variantCategoryRelations: relationsPlan.variantCategories.length - counts.variantCategoryRelations,
    },
    flags: {
      usesInsertOrReplace: counts.insertOrReplace,
      usesInsertOrIgnore: counts.insertOrIgnore,
    },
  };
}

function buildReport() {
  const images = scanImages();
  const plan = buildImportPlan(images);
  const categoryPlan = buildCategories();
  const relationsPlan = buildRelationsPlan(images, plan, categoryPlan);
  const categoryAssetPaths = categoryPlan.categories.map(category => category.icon);

  const report = {
    timestamp: plan.generatedAt,
    note: 'Anteprima locale: nessuna scrittura su D1 remoto è stata eseguita.',
    summary: {
      totalImages: images.length,
      mobsCount: plan.mobs.length,
      variantsCount: plan.variants.length,
      categoriesCount: categoryPlan.categories.length,
      staticCategoriesCount: categoryPlan.staticCategories.length,
      dynamicCategoriesCount: categoryPlan.dynamicCategories.length,
      relationRowsPlanned: relationsPlan.mobCategories.length + relationsPlan.variantCategories.length,
      mobCategoriesPlanned: relationsPlan.mobCategories.length,
      variantCategoriesPlanned: relationsPlan.variantCategories.length,
      folders: [...new Set(images.map(image => image.folder))].length,
      syntheticMobs: plan.syntheticMobs.length,
      variantDuplicateGroups: plan.variantDuplicates.length,
      physicalDuplicateGroups: plan.physicalDuplicateGroups.length,
    },
    sources: {
      categories: 'src/config/mobCategories.js',
      namingRules: ['src/config/mobConfig.js', 'src/utils/mobParser.js'],
      images: 'public/data/**/*.{png,jpg,jpeg,gif,webp}',
    },
    categories: categoryPlan.categories,
    mobs: plan.mobs,
    variants: plan.variants,
    anomalies: {
      missingImageFiles: images.filter(image => !fs.existsSync(image.fullPath)).map(image => image.relativePath),
      missingCategoryIconFiles: [...new Set(missingPublicAssets(categoryAssetPaths))].sort(),
      duplicateCategories: categoryPlan.duplicateCategories,
      duplicateVariantGroups: plan.variantDuplicates,
      duplicatePhysicalNameGroups: plan.physicalDuplicateGroups,
      syntheticMobs: plan.syntheticMobs,
      variantsWithoutBaseMobAfterPlanning: plan.missingBaseNamesAfterSynthesis,
    },
    existingDataCheck: {
      status: 'not-run',
      reason: 'Wrangler non era autenticato durante il controllo precedente. Questo script locale non interroga D1 remoto e non può sapere quali record esistono già.',
      recommendedReadOnlyCommands: [
        'npx wrangler d1 execute allmobs --remote --command="SELECT name, img FROM MOBS ORDER BY name;"',
        'npx wrangler d1 execute allmobs --remote --command="SELECT v.name, v.img, m.name AS mob_name FROM VARIANTS v LEFT JOIN MOBS m ON m.id = v.mob_id ORDER BY m.name, v.name;"',
        'npx wrangler d1 execute allmobs --remote --command="SELECT name, variant, icon FROM CATEGORIES ORDER BY priority, name;"',
      ],
      conflictsWithExistingData: [],
    },
    sqlComparison: buildSqlComparison(plan, categoryPlan.categories, relationsPlan),
  };

  return report;
}

function printSummary(report) {
  console.log('\n📊 Anteprima import AllMobs');
  console.log('='.repeat(72));
  console.log(`Immagini fisiche analizzate:       ${report.summary.totalImages}`);
  console.log(`Mob pianificati:                  ${report.summary.mobsCount}`);
  console.log(`Varianti pianificate:             ${report.summary.variantsCount}`);
  console.log(`Categorie pianificate:            ${report.summary.categoriesCount}`);
  console.log(`Relazioni pianificate:            ${report.summary.relationRowsPlanned}`);
  console.log(`Mob sintetici per basi mancanti:  ${report.summary.syntheticMobs}`);
  console.log(`Gruppi varianti duplicate:        ${report.summary.variantDuplicateGroups}`);
  console.log(`Icone categoria mancanti:         ${report.anomalies.missingCategoryIconFiles.length}`);
  console.log(`File immagini mancanti:           ${report.anomalies.missingImageFiles.length}`);

  if (report.sqlComparison.exists) {
    console.log('\nConfronto con scripts/import-data.sql:');
    console.log(`  categorie: ${report.sqlComparison.currentSqlCounts.categories} SQL attuale vs ${report.sqlComparison.previewCounts.categories} anteprima`);
    console.log(`  mob:       ${report.sqlComparison.currentSqlCounts.mobs} SQL attuale vs ${report.sqlComparison.previewCounts.mobs} anteprima`);
    console.log(`  varianti:  ${report.sqlComparison.currentSqlCounts.variants} SQL attuale vs ${report.sqlComparison.previewCounts.variants} anteprima`);
    console.log(`  usa INSERT OR IGNORE: ${report.sqlComparison.flags.usesInsertOrIgnore ? 'sì' : 'no'}`);
  }

  console.log(`\n💾 Report scritto in: ${REPORT_FILE}`);
  console.log('⚠️  Nessuna scrittura remota eseguita.');
}

const report = buildReport();
fs.writeFileSync(REPORT_FILE, JSON.stringify(report, null, 2));
printSummary(report);
