# All Mobs Tracker 🎮

Un'applicazione React per tracciare tutti i mob di Minecraft con supporto per varianti multiple.

## 📸 Screenshot
_Aggiungi qui uno screenshot dell'app_

## 🚀 Quick Start

### 1. Clona il repository
```bash
git clone https://github.com/tuo-username/all-mobs-tracker.git
cd all-mobs-tracker
```

### 2. Installa le dipendenze
```bash
npm install
```

### 3. Aggiungi le immagini dei mob
Metti le immagini dei mob nella cartella `public/data/`

**Esempi:**
```
public/data/
├── 1Creeper.png                    (mob singolo)
├── 2Zombie.png                     (mob singolo)
├── 3.1CopperGolemNormal.png       (mob con varianti)
├── 3.2CopperGolemExposed.png      (variante 2)
└── 3.3CopperGolemWeathered.png    (variante 3)
```

### 4. Avvia l'app
```bash
npm run dev
```

Apri [http://localhost:5173](http://localhost:5173) nel browser.

## 📋 Formato Nomi File

Il sistema riconosce automaticamente il tipo di mob in base al nome del file:

### 1️⃣ Mob Base (Nessun Numero)
- **Formato:** `NomeMob.png`
- **Esempi:**
  - `PiglinBrute.png`
  - `EnderDragon.png`
  - `IronGolem.png`
- **Quando usare:** Per mob unici senza varianti

### 2️⃣ Varianti Principali (1 Numero)
- **Formato:** `NumeroNomeMob-Variante.png`
- **Esempi:**
  - `1CopperGolem-Normal.png`
  - `2CopperGolem-Exposed.png`
  - `1Axolotl-Lucy.png`
  - `2Axolotl-Wild.png`
- **Quando usare:** Per varianti principali dello stesso mob (diversi stati, forme base)

### 3️⃣ Varianti Complesse (2 Numeri)
- **Formato:** `Numero.NumeroNomeMob-Variante.png`
- **Esempi:**
  - `1.1ChickenJockey-Zombie.png`
  - `1.2ChickenJockey-ZombifiedPiglin.png`
  - `2.1SpiderJockey-Spider.png`
  - `2.2SpiderJockey-CaveSpider.png`
- **Quando usare:** Per varianti più complesse o combinazioni di mob

### 4️⃣ Varianti con Colori (3 Numeri)
- **Formato:** `Numero.Numero.NumeroNomeMob-Tipo-Colore.png`
- **Esempi:**
  - `1.1.1Cat-Tuxedo-Red.png`
  - `1.1.2Cat-Tuxedo-Blue.png`
  - `1.3.4Cat-Tabby-Pink.png`
  - `2.1.1Sheep-Normal-White.png`
  - `2.1.2Sheep-Normal-Black.png`
- **Quando usare:** Per varianti di colore dello stesso tipo di mob

**Note importanti:**
- Usa il trattino `-` per separare le parole nel nome
- Il sistema converte automaticamente `CamelCase` in "Camel Case"
- I numeri determinano l'ordine di visualizzazione

## ✨ Funzionalità

- ✅ **Griglia Responsive** - Si adatta perfettamente a desktop, tablet e mobile
- 🎯 **Click per Tracciare** - Clicca su un mob per segnarlo come trovato
- 🔄 **4 Tipi di Varianti** - Sistema intelligente per gestire varianti semplici, complesse e con colori
- 💾 **Salvataggio Automatico** - I progressi vengono salvati nel browser (localStorage)
- 📊 **Barra di Progresso** - Visualizza quanti mob hai trovato
- ⚙️ **Pagina Impostazioni** - Scegli quante varianti visualizzare
- 🎨 **Tema Minecraft** - Design ispirato al gioco con colori verde/pietra
- 🔍 **Immagini Pixelate** - Rendering pixelato per mantenere lo stile Minecraft
- 🏷️ **Badge Varianti** - Indicatori colorati per distinguere i tipi di varianti
- 📈 **Statistiche Dettagliate** - Vedi quanti mob di ogni tipo hai

## 🎛️ Modalità Visualizzazione

L'app offre 3 modalità per gestire le varianti:

### 🔹 Nessuna Variante
Mostra solo:
- Mob base (senza numero)
- Prima variante di ogni gruppo

**Ideale per:** Avere una visione semplice senza duplicati

### 🔸 Varianti Principali
Mostra:
- Mob base
- Tutte le varianti con 1 numero (varianti principali)
- Tutte le varianti con 2 numeri (varianti complesse)
- ❌ Esclude le varianti con colori (3 numeri)

**Ideale per:** Tracciare tutte le versioni principali senza le varianti di colore

### 🔶 Tutte le Varianti
Mostra tutto, incluse tutte le varianti di colore

**Ideale per:** Completisti che vogliono tracciare ogni singola variante

## 🎮 Come Si Usa

1. **Traccia un mob:** Clicca sulla carta del mob (apparirà un ✓)
2. **Apri impostazioni:** Clicca sul pulsante "⚙️ Impostazioni"
3. **Scegli modalità:** Seleziona quante varianti vuoi visualizzare
4. **Visualizza progresso:** La barra in alto mostra quanti mob hai trovato
5. **Vedi statistiche:** Nella pagina impostazioni puoi vedere statistiche dettagliate
6. **Reset:** Usa il pulsante "🔄 Reset" per ricominciare

### Badge Varianti
- **🔵 Variante** - Variante principale (1 numero)
- **🟣 Complessa** - Variante complessa (2 numeri)
- **🔴 Colore** - Variante con colore (3 numeri)

## 🛠️ Tecnologie

- **React 18** - Libreria UI
- **Vite** - Build tool velocissimo
- **Tailwind CSS** - Styling utility-first
- **Local Storage** - Salvataggio progressi

## 📦 Build per Produzione

```bash
npm run build
```

I file ottimizzati saranno nella cartella `dist/`.

## 📁 Struttura del Progetto

```
all-mobs-tracker/
├── public/
│   └── data/              ← Immagini dei mob qui!
│       ├── 1Creeper.png
│       ├── 2.1CopperGolemNormal.png
│       └── ...
├── src/
│   ├── MobTracker.jsx     ← Componente principale
│   ├── App.jsx
│   ├── main.jsx
│   └── index.css
├── index.html
├── package.json
├── vite.config.js
├── tailwind.config.js
└── postcss.config.js
```

## 🤝 Contribuire

Le pull request sono benvenute! Per modifiche importanti, apri prima un'issue per discutere cosa vorresti cambiare.

## 📝 Licenza

MIT

## 🎯 Roadmap

- [ ] Filtri per tipo di mob (Hostile, Passive, Neutral)
- [ ] Ricerca mob
- [ ] Esportazione/importazione progressi
- [ ] Modalità scura/chiara
- [ ] Statistiche dettagliate

---

Creato con ❤️ per i fan di Minecraft
