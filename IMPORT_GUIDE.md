# AllMobs - Guida Importazione Database

## 📋 Riepilogo Analisi

### Statistiche Progetto
- **Totale immagini analizzate**: 1018
- **Mob base identificati**: 359
- **Varianti identificate**: 659
- **Cartelle analizzate**: 64
- **Nomi duplicati**: 117 (normali, rappresentano varianti con suffissi diversi)

### Categorie Create
- **7 categorie esistenti** (da mobCategories.js):
  - Saddled, Shearable, Chested, Name Tag, Banner, Lightning, Screaming
  
- **38 categorie dinamiche**:
  - **16 colori**: White, LightGray, Gray, Black, Brown, Red, Orange, Yellow, Lime, Green, Cyan, LightBlue, Blue, Purple, Magenta, Pink
  - **7 biomi**: Plains, Desert, Jungle, Savanna, Snow, Swamp, Taiga
  - **15 professioni**: Unemployed, Nitwit, Armorer, Butcher, Cartographer, Cleric, Farmer, Fisherman, Fletcher, Leatherworker, Librarian, Mason, Shepherd, Toolsmith, Weaponsmith

---

## 🚀 Procedura di Importazione

### Fase 1: Analisi Completata ✅

Gli script hanno analizzato tutte le immagini e generato:
- `import-report.json` - Report dettagliato dell'analisi
- `import-data.sql` - Script SQL pronto per l'importazione (2949 righe)

### Fase 2: Importazione nel Database D1

#### Opzione A: Via Wrangler CLI (Raccomandato)

```bash
cd all-mobs-tracker

# Importa tutti i dati
npx wrangler d1 execute allmobs --file=scripts/import-data.sql

# Verifica importazione
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM MOBS"
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM VARIANTS"
npx wrangler d1 execute allmobs --command="SELECT COUNT(*) FROM CATEGORIES"
```

#### Opzione B: Via Dashboard Cloudflare

1. Vai su https://dash.cloudflare.com
2. Workers & Pages → D1
3. Seleziona database "allmobs"
4. Console → Carica `scripts/import-data.sql`
5. Esegui

---

## 📂 Struttura Dati Importati

### Tabella MOBS

Contiene i **mob base** identificati dalla nomenclatura:

```sql
INSERT INTO MOBS (name, img, link, description)
VALUES ('Sheep', '/data/sheep/1.1.1Sheep-White.png', '.', '.');
```

**Campi**:
- `name`: Nome normalizzato (es: "Sheep", "Cat", "Villager")
- `img`: Percorso web immagine originale
- `link`: "." (placeholder)
- `description`: "." (placeholder)

### Tabella VARIANTS

Contiene le **varianti** collegate ai mob base:

```sql
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Green', '/data/sheep/1.1.10Sheep-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;
```

**Campi**:
- `name`: Nome normalizzato variante (es: "Sheep-Green", "Cat-Tabby")
- `img`: Percorso web immagine originale
- `mob_id`: ID del mob base (collegamento tramite subquery)

### Tabella CATEGORIES

Contiene categorie esistenti e dinamiche:

```sql
-- Categoria esistente
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Shearable', '/icons/items/shears.png', '#f59e0b', '...', '...', 2, NULL);

-- Categoria colore
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Green', '/icons/items/wool.png', '#16a34a', '.', '...', 109, 'Green');

-- Categoria bioma
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Plains', '/icons/biomes/plains.png', '#10b981', '.', '...', 116, 'Plains');
```

**Campi**:
- `name`: Nome categoria
- `icon`: Percorso icona
- `color`: Colore esadecimale (usato per bordo sinistro nella dashboard)
- `link`: URL wiki o "."
- `description`: Descrizione
- `priority`: Ordinamento
- `variant`: Valore specifico per categorie dinamiche (colore, bioma, professione)

---

## 🎨 Modifiche Dashboard

### Visualizzazione Immagini

La dashboard ora mostra le immagini reali nelle colonne `img` e `icon`:

```jsx
// Nelle tabelle MOBS, VARIANTS
if (columnName === 'img' && value) {
  return <img src={value} className="w-12 h-12" />;
}

// Nella tabella CATEGORIES
if (columnName === 'icon' && value) {
  return <img src={value} className="w-12 h-12" />;
}
```

### Bordi Colorati CATEGORIES

Solo le righe della tabella CATEGORIES hanno il bordo sinistro colorato:

```jsx
if (table === 'CATEGORIES' && row.color) {
  style = { borderLeft: `4px solid ${row.color}` };
}
```

**Esempio visivo**:
```
┌──────────────────────────────────┐
│ 🔴 | Saddled | [icon] | #ef4444
│ 🟠 | Shearable | [icon] | #f59e0b  
│ 🔵 | Chested | [icon] | #3b82f6
└──────────────────────────────────┘
```

---

## 🔍 Logica di Classificazione

### Mob Base vs Varianti

La classificazione si basa su:

1. **Codice numerico**:
   - `1.1` o `1` = Mob base
   - `1.1.10` (3+ segmenti) = Variante

2. **Nome del file**:
   - Senza descrittori = Mob base (es: `Sheep.png`)
   - Con descrittori = Variante (es: `Sheep-Green.png`)

3. **Struttura cartelle**:
   - Root `/data/` = Mob semplici
   - Sottocartelle `/data/sheep/` = Mob complessi con varianti

### Normalizzazione Nomi

```javascript
// Esempio: "1.1.10Sheep-Green_A.png"

// 1. Rimuovi estensione
"1.1.10Sheep-Green_A"

// 2. Rimuovi codice numerico
"Sheep-Green_A"

// 3. Rimuovi suffissi tecnici (_A, _B, _P, ecc.)
"Sheep-Green"

// Risultato finale salvato in campo `name`
```

### Percorsi Immagini

I percorsi web sono relativi alla root del sito:

```
File fisico:  /public/data/sheep/1.1.10Sheep-Green_A.png
Percorso web: /data/sheep/1.1.10Sheep-Green_A.png
```

**Nomi file originali preservati** - nessuna rinominazione o spostamento.

---

## ⚠️ Gestione Duplicati

### Nomi Duplicati Identificati

**117 nomi duplicati** trovati, principalmente:

1. **Varianti con suffissi diversi**:
   ```
   1.1.1Sheep-White.png    → "Sheep-White"
   1.1.1Sheep-White_A.png  → "Sheep-White" (baby)
   ```

2. **Versioni pumpkin/jockey**:
   ```
   Skeleton.png       → "Skeleton"
   1.2Skeleton_P.png  → "Skeleton" (pumpkin)
   1.3Skeleton_P.png  → "Skeleton" (pumpkin variant)
   ```

### Strategia di Import

Lo script SQL usa `INSERT OR IGNORE` per evitare duplicati nella chiave primaria, ma permette nomi duplicati perché rappresentano record legittimamente diversi (stesso mob, immagine diversa per baby/pumpkin/ecc.).

---

## 📊 Relazioni Mob-Varianti

Le varianti sono collegate ai mob base tramite il nome:

```sql
-- Variante "Sheep-Green" cerca il mob "Sheep"
INSERT INTO VARIANTS (name, img, mob_id)
SELECT 'Sheep-Green', '/data/...', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;
```

### Esempi di Relazioni

| Mob Base | Codice | Varianti Collegate |
|----------|--------|-------------------|
| Sheep | 1.1 | 17 colori × 2 (normale + sheared) = 34 varianti |
| Cat | 1.2 | 11 pattern × 2 (tamed/untamed) × 2 (baby) = 44 varianti |
| Villager | Multiple | 7 biomi × 15 professioni = 105 varianti |

---

## ✅ Verifica Post-Importazione

### Query di Controllo

```sql
-- Conta mob
SELECT COUNT(*) as total_mobs FROM MOBS;
-- Atteso: ~359

-- Conta varianti
SELECT COUNT(*) as total_variants FROM VARIANTS;
-- Atteso: ~659

-- Conta categorie
SELECT COUNT(*) as total_categories FROM CATEGORIES;
-- Atteso: 45 (7 esistenti + 38 dinamiche)

-- Verifica relazioni mob-varianti
SELECT m.name, COUNT(v.id) as variant_count
FROM MOBS m
LEFT JOIN VARIANTS v ON v.mob_id = m.id
GROUP BY m.name
ORDER BY variant_count DESC
LIMIT 10;

-- Verifica immagini
SELECT name, img FROM MOBS WHERE img IS NULL OR img = '';
-- Dovrebbe essere vuoto

-- Verifica categorie con colore
SELECT name, color FROM CATEGORIES WHERE color IS NOT NULL;
-- Dovrebbe mostrare tutte le categorie con colore
```

### Test nella Dashboard

1. **Vai su**: https://allmobs.riccardogir07.workers.dev/admin
2. **Login** con Cloudflare Access
3. **Seleziona tabella MOBS**:
   - ✅ Verifica che le immagini si caricano
   - ✅ Conta record (dovrebbe essere ~359)
   
4. **Seleziona tabella VARIANTS**:
   - ✅ Verifica che le immagini si caricano
   - ✅ Conta record (dovrebbe essere ~659)
   
5. **Seleziona tabella CATEGORIES**:
   - ✅ Verifica bordi colorati a sinistra
   - ✅ Verifica icone visibili
   - ✅ Conta record (dovrebbe essere 45)

---

## 🔧 Troubleshooting

### Immagini Non Si Caricano

**Problema**: Le immagini mostrano errore 404

**Soluzione**:
1. Verifica che `dist/` contenga la cartella `data/`:
   ```bash
   ls -la dist/data/
   ```

2. Verifica configurazione assets in `wrangler.jsonc`:
   ```json
   "assets": {
     "directory": "./dist"
   }
   ```

3. Ricompila:
   ```bash
   npm run build
   ```

### Varianti Senza mob_id

**Problema**: Alcune varianti hanno `mob_id = NULL`

**Causa**: Il mob base non è stato trovato con il nome estratto

**Soluzione**:
```sql
-- Trova varianti orfane
SELECT * FROM VARIANTS WHERE mob_id IS NULL;

-- Verifica mob base disponibili
SELECT name FROM MOBS WHERE name LIKE 'NomeBase%';

-- Correggi manualmente se necessario
UPDATE VARIANTS 
SET mob_id = (SELECT id FROM MOBS WHERE name = 'NomeCorretto' LIMIT 1)
WHERE name LIKE 'NomeCorretto-%';
```

### Categorie Senza Colore

**Problema**: Bordi colorati non visibili

**Verifica**:
```sql
SELECT name, color FROM CATEGORIES WHERE color IS NULL;
```

**Correggi**:
```sql
UPDATE CATEGORIES SET color = '#6b7280' WHERE color IS NULL;
```

---

## 📝 Prossimi Passi

### Associazioni Categorie (Fase Futura)

Le tabelle `MOB_CATEGORIES` e `VARIANT_CATEGORIES` sono pronte ma vuote. In futuro:

1. Associare mob alle categorie esistenti (Saddled, Shearable, ecc.)
2. Associare varianti ai colori (`variant` field)
3. Associare villager ai biomi e professioni

### Esempio Associazione Futura

```sql
-- Associa tutte le varianti verdi al colore Green
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v, CATEGORIES c
WHERE v.name LIKE '%Green%'
AND c.name = 'Color - Green';
```

---

## 📚 File Generati

```
scripts/
├── analyze-images.js          # Script analisi immagini
├── generate-import-sql.js     # Generatore SQL
├── import-report.json         # Report dettagliato (2.5 MB)
└── import-data.sql            # Script SQL import (2949 righe)
```

---

## ✅ Checklist Completamento

- [x] Analisi 1018 immagini
- [x] Classificazione mob base (359)
- [x] Classificazione varianti (659)
- [x] Generazione categorie esistenti (7)
- [x] Generazione categorie dinamiche (38)
- [x] Creazione script SQL completo
- [x] Aggiornamento dashboard (immagini + colori)
- [ ] **Importazione database D1** ← PROSSIMO PASSO
- [ ] Verifica post-importazione
- [ ] Test dashboard completo

---

**Pronto per l'importazione!** Esegui lo script SQL quando sei pronto.
