# AllMobs Import - Quick Reference

## 🚀 Comandi Rapidi

### Importazione Database

```bash
# Da directory root del progetto
cd all-mobs-tracker

# Importa tutti i dati nel database D1
npx wrangler d1 execute allmobs --file=scripts/import-data.sql
```

### Verifica Import

```bash
# Conta mob
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM MOBS"

# Conta varianti  
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM VARIANTS"

# Conta categorie
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM CATEGORIES"

# Top 10 mob con più varianti
npx wrangler d1 execute allmobs --command="SELECT m.name, COUNT(v.id) as variants FROM MOBS m LEFT JOIN VARIANTS v ON v.mob_id = m.id GROUP BY m.name ORDER BY variants DESC LIMIT 10"
```

### Build e Deploy

```bash
# Build frontend
npm run build

# Deploy
npx wrangler deploy

# Oppure push su GitHub (deploy automatico)
git add .
git commit -m "Add database import and image support

- Import 359 mobs, 659 variants, 45 categories
- Add image display in admin dashboard
- Add colored borders for categories table

Co-Authored-By: Claude Code <noreply@anthropic.com>"
git push origin main
```

## 📊 Statistiche Import

- **1018** immagini analizzate
- **359** mob base
- **659** varianti
- **45** categorie totali
  - 7 esistenti
  - 16 colori
  - 7 biomi
  - 15 professioni

## 🔗 Link Utili

- Dashboard Admin: https://allmobs.riccardogir07.workers.dev/admin
- Sito Pubblico: https://allmobs.riccardogir07.workers.dev/
- Cloudflare Dashboard: https://dash.cloudflare.com

## 📁 File Importanti

- `scripts/import-data.sql` - Script SQL (2949 righe)
- `scripts/import-report.json` - Report analisi
- `IMPORT_GUIDE.md` - Guida completa
