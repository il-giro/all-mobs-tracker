# AllMobs Admin Dashboard - Guida alla Configurazione

## 📋 Panoramica

Questa dashboard amministrativa ti permette di gestire completamente il database Cloudflare D1 del progetto AllMobs, con la possibilità di visualizzare, creare, modificare ed eliminare record in tutte le cinque tabelle principali:

- **MOBS**: Creature di Minecraft
- **VARIANTS**: Varianti dei mob
- **CATEGORIES**: Categorie di classificazione
- **MOB_CATEGORIES**: Relazioni tra mob e categorie
- **VARIANT_CATEGORIES**: Relazioni tra varianti e categorie

## 🏗️ Architettura

### Frontend
- **Framework**: React 18 + Vite
- **Styling**: Tailwind CSS
- **Entry Point Admin**: `/admin.html` → `/src/admin/main.jsx`
- **Entry Point Pubblico**: `/index.html` → `/src/main.jsx` (preservato)

### Backend
- **Worker**: Cloudflare Workers
- **Database**: Cloudflare D1 (binding `DB`)
- **API Admin**: `/api/admin/*`
- **API Pubblica**: `/api/db-test` (preservata)

### Struttura File
```
all-mobs-tracker/
├── admin.html                 # Entry point dashboard admin
├── index.html                 # Entry point sito pubblico (preservato)
├── worker/
│   └── index.js              # Cloudflare Worker con API admin
├── src/
│   ├── admin/                # Dashboard amministrativa
│   │   ├── AdminApp.jsx      # App principale admin
│   │   ├── main.jsx          # Entry point React admin
│   │   ├── components/       # Componenti riutilizzabili
│   │   │   ├── Header.jsx
│   │   │   ├── Sidebar.jsx
│   │   │   ├── RecordModal.jsx
│   │   │   └── DeleteConfirmModal.jsx
│   │   └── pages/            # Pagine della dashboard
│   │       ├── Dashboard.jsx
│   │       ├── TableExplorer.jsx
│   │       └── Settings.jsx
│   └── ...                   # File pubblici (preservati)
└── wrangler.jsonc            # Configurazione Cloudflare
```

## 🚀 Come Funziona

### 1. API Amministrative

Il Worker espone i seguenti endpoint protetti:

#### GET `/api/admin/tables`
Restituisce l'elenco delle tabelle gestibili.

**Risposta**:
```json
{
  "success": true,
  "tables": ["MOBS", "VARIANTS", "CATEGORIES", "MOB_CATEGORIES", "VARIANT_CATEGORIES"]
}
```

#### GET `/api/admin/schema/:table`
Restituisce lo schema di una tabella specifica.

**Esempio**: `/api/admin/schema/MOBS`

**Risposta**:
```json
{
  "success": true,
  "table": "MOBS",
  "columns": [
    { "cid": 0, "name": "id", "type": "INTEGER", "notnull": 1, "pk": 1 },
    { "cid": 1, "name": "name", "type": "TEXT", "notnull": 1, "pk": 0 },
    ...
  ]
}
```

#### GET `/api/admin/data/:table`
Restituisce i dati di una tabella con paginazione, ricerca e ordinamento.

**Parametri query**:
- `page`: Numero pagina (default: 1)
- `limit`: Record per pagina (max: 100, default: 50)
- `search`: Termine di ricerca
- `orderBy`: Colonna per ordinamento
- `orderDir`: Direzione ordinamento (`asc` o `desc`)

**Esempio**: `/api/admin/data/MOBS?page=1&limit=50&search=zombie&orderBy=name&orderDir=asc`

#### POST `/api/admin/data/:table`
Crea un nuovo record.

**Body**:
```json
{
  "name": "Nuovo Mob",
  "description": "Descrizione del mob",
  ...
}
```

#### PUT `/api/admin/data/:table/:id`
Aggiorna un record esistente.

#### DELETE `/api/admin/data/:table/:id`
Elimina un record.

#### GET `/api/admin/stats`
Restituisce le statistiche per la dashboard.

**Risposta**:
```json
{
  "success": true,
  "stats": {
    "mobs": 120,
    "variants": 450,
    "categories": 15,
    "mobCategories": 250,
    "variantCategories": 680
  }
}
```

### 2. Sicurezza SQL

Tutte le query utilizzano:
- ✅ **Whitelist di tabelle**: Solo le 5 tabelle autorizzate sono accessibili
- ✅ **Parametri SQL**: Tutti i valori sono passati tramite binding parametrizzati
- ✅ **Validazione**: I nomi di tabelle e colonne sono validati prima dell'uso
- ✅ **Limiti**: Paginazione con limite massimo di 100 record per pagina

### 3. Interfaccia Dashboard

#### Dashboard Principale (`/admin`)
- Statistiche in tempo reale dal database
- Card con metriche principali
- Collegamenti rapidi alle tabelle

#### Esploratore Tabelle
- Visualizzazione dati in formato tabellare
- Paginazione lato server
- Ricerca testuale su tutte le colonne TEXT
- Ordinamento cliccando sulle intestazioni
- Creazione nuovi record tramite modal
- Modifica record esistenti
- Eliminazione con conferma

#### Gestione Record
- Form dinamici basati sullo schema reale della tabella
- Validazione campi obbligatori
- Anteprima immagini per campi URL
- Indicazione chiavi primarie
- Gestione valori NULL

## 🔐 Configurazione Cloudflare Access (OBBLIGATORIO)

La dashboard **DEVE** essere protetta con Cloudflare Access prima di essere utilizzata in produzione.

### Passaggi per Configurare l'Accesso

1. **Vai alla Dashboard Cloudflare**
   - Accedi a https://dash.cloudflare.com
   - Seleziona il tuo account
   - Vai su **Zero Trust** dal menu laterale

2. **Crea una Nuova Application**
   - Access → Applications → Add an application
   - Seleziona **Self-hosted**

3. **Configura l'Application**
   - **Name**: AllMobs Admin Dashboard
   - **Session Duration**: 24 hours (o preferito)
   - **Application Domain**:
     - Subdomain: `allmobs`
     - Domain: `riccardogir07.workers.dev`
     - Path: `/admin`

4. **Aggiungi una Policy**
   - **Policy Name**: Admin Only
   - **Action**: Allow
   - **Include**:
     - Selector: Emails
     - Value: `tuo-email@esempio.com`
   - (O usa altre regole di autenticazione come Google Workspace, GitHub, ecc.)

5. **Proteggi Anche le API**
   - Crea una seconda application per:
     - Path: `/api/admin/*`
   - Usa la stessa policy

6. **Salva e Testa**
   - Salva la configurazione
   - Visita `https://allmobs.riccardogir07.workers.dev/admin`
   - Dovresti vedere la schermata di login di Cloudflare Access

### Verifica della Configurazione

Una volta configurato Cloudflare Access:
- ✅ `/admin` richiede autenticazione
- ✅ `/api/admin/*` richiede autenticazione
- ✅ `/` (sito pubblico) rimane accessibile a tutti
- ✅ `/api/db-test` rimane accessibile (puoi proteggerlo se preferisci)

## 📦 Deploy

### Build del Progetto

```bash
cd all-mobs-tracker/all-mobs-tracker
npm run build
```

Questo comando genera:
- `dist/index.html` - Sito pubblico
- `dist/admin.html` - Dashboard admin
- `dist/assets/*` - Asset condivisi

### Deploy su Cloudflare

Il deploy avviene automaticamente tramite GitHub Actions quando fai push sul repository.

#### Deploy Manuale (se necessario)

```bash
# Assicurati di essere nella directory del progetto
cd all-mobs-tracker/all-mobs-tracker

# Build
npm run build

# Deploy con Wrangler
npx wrangler deploy
```

### Verifica del Deploy

1. Controlla che il sito pubblico funzioni:
   ```
   https://allmobs.riccardogir07.workers.dev/
   ```

2. Verifica l'API di test:
   ```
   https://allmobs.riccardogir07.workers.dev/api/db-test
   ```

3. Accedi alla dashboard admin (dopo aver configurato Access):
   ```
   https://allmobs.riccardogir07.workers.dev/admin
   ```

## 🧪 Sviluppo Locale

### Avvio del Server di Sviluppo

```bash
# Nella directory del progetto
cd all-mobs-tracker/all-mobs-tracker

# Installa dipendenze (se necessario)
npm install

# Avvia Vite per il frontend
npm run dev
```

Il frontend sarà disponibile su `http://localhost:5173`

### Test del Worker Localmente

```bash
# In un'altra finestra del terminale
npx wrangler dev
```

Questo avvia il Worker localmente con hot-reload.

### Accesso alla Dashboard in Dev

- Dashboard Admin: `http://localhost:5173/admin.html`
- Sito Pubblico: `http://localhost:5173/`

**Nota**: In sviluppo locale, Cloudflare Access non è attivo. Assicurati di configurarlo prima del deploy in produzione.

## 📊 Struttura Database D1

### Tabelle Gestite

#### MOBS
Contiene i mob principali di Minecraft.

**Colonne attese** (verifica con `/api/admin/schema/MOBS`):
- `id` (INTEGER, PK)
- `name` (TEXT)
- Altri campi dipendenti dallo schema effettivo

#### VARIANTS
Contiene le varianti dei mob (baby, colori, ecc.).

#### CATEGORIES
Categorie per organizzare i mob (Passive, Hostile, ecc.).

#### MOB_CATEGORIES
Tabella di relazione molti-a-molti tra MOBS e CATEGORIES.

#### VARIANT_CATEGORIES
Tabella di relazione molti-a-molti tra VARIANTS e CATEGORIES.

## 🔧 Troubleshooting

### La dashboard non carica

1. Verifica che il build sia stato completato:
   ```bash
   ls -la dist/
   # Dovresti vedere admin.html
   ```

2. Controlla i log del Worker:
   ```bash
   npx wrangler tail
   ```

3. Verifica la configurazione in `wrangler.jsonc`:
   ```jsonc
   "assets": {
     "directory": "./dist",
     "binding": "ASSETS"
   }
   ```

### Errore "Tabella non autorizzata"

La tabella che stai cercando di accedere non è nella whitelist `ALLOWED_TABLES` nel Worker.

### Errore di connessione al database

1. Verifica che il binding D1 sia configurato in `wrangler.jsonc`:
   ```jsonc
   "d1_databases": [
     {
       "binding": "DB",
       "database_name": "allmobs",
       "database_id": "219b2bf5-24d2-453d-a6a9-d2f47badf957"
     }
   ]
   ```

2. Verifica che il database esista nella dashboard Cloudflare:
   - Workers & Pages → D1
   - Controlla che `allmobs` sia presente

### Cloudflare Access non funziona

1. Verifica che l'application sia creata correttamente
2. Controlla che il path sia esattamente `/admin` (senza trailing slash)
3. Prova in modalità incognito per eliminare cache
4. Verifica i log in Cloudflare Zero Trust → Logs → Access

## 📝 Limitazioni e Note

### Limitazioni Attuali

1. **Autenticazione Base**: Al momento si affida completamente a Cloudflare Access. Non c'è un sistema di ruoli interno.

2. **Nessuna Validazione Avanzata**: I vincoli del database (foreign keys, unique, check) sono gestiti dal database stesso, non dall'applicazione.

3. **Upload File**: Non supportato. Le immagini devono essere caricate esternamente e inserite tramite URL.

4. **Audit Log**: Non implementato. Le modifiche al database non sono tracciate.

### Best Practices

- ✅ Fai sempre un backup del database prima di operazioni massive
- ✅ Testa le modifiche in un ambiente di staging se possibile
- ✅ Usa Cloudflare Access con email specifiche, non policy troppo permissive
- ✅ Controlla regolarmente i log di accesso in Cloudflare Zero Trust

## 🎯 Prossimi Passi Suggeriti

1. **Configurare Cloudflare Access** (priorità massima)
2. Popolare il database D1 con i dati iniziali
3. Testare tutte le operazioni CRUD su ogni tabella
4. Configurare backup automatici del database D1
5. Aggiungere un sistema di audit log per tracciare le modifiche

## 🆘 Supporto

Per problemi o domande:

1. Controlla i log del Worker: `npx wrangler tail`
2. Controlla la console del browser per errori JavaScript
3. Verifica lo stato di Cloudflare: https://www.cloudflarestatus.com/
4. Consulta la documentazione Cloudflare D1: https://developers.cloudflare.com/d1/

---

**Versione**: 1.0.0  
**Data**: 2026-10-12  
**Autore**: Creato con Claude Code
