import { useState, useEffect } from 'react';

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]); // Tutti i mob caricati
  const [displayedMobs, setDisplayedMobs] = useState([]); // Mob filtrati
  const [trackedMobs, setTrackedMobs] = useState({});
  const [variantMode, setVariantMode] = useState('all'); // 'none', 'main', 'complex', 'all'
  const [showSettings, setShowSettings] = useState(false);

  // Funzione per parsare il nome del file
  const parseFileName = (fileName) => {
    const nameWithoutExt = fileName.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
    
    // Pattern con 3 numeri: 1.1.1Cat-Tuxedo-Red
    const match3 = nameWithoutExt.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
    if (match3) {
      return {
        type: 'color_variant',
        num1: parseInt(match3[1]),
        num2: parseInt(match3[2]),
        num3: parseInt(match3[3]),
        name: match3[4].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim(),
        groupKey: `${match3[1]}.${match3[2]}`
      };
    }
    
    // Pattern con 2 numeri: 1.1ChickenJockey-Zombie
    const match2 = nameWithoutExt.match(/^(\d+)\.(\d+)(.+)$/);
    if (match2) {
      return {
        type: 'complex_variant',
        num1: parseInt(match2[1]),
        num2: parseInt(match2[2]),
        name: match2[3].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim(),
        groupKey: `${match2[1]}`
      };
    }
    
    // Pattern con 1 numero: 1CopperGolem-Normal
    const match1 = nameWithoutExt.match(/^(\d+)(.+)$/);
    if (match1) {
      return {
        type: 'main_variant',
        num1: parseInt(match1[1]),
        name: match1[2].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim(),
        groupKey: 'main'
      };
    }
    
    // Nessun numero: PiglinBrute
    return {
      type: 'base',
      name: nameWithoutExt.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim(),
      groupKey: 'base'
    };
  };

  // Carica le immagini dalla cartella data
  useEffect(() => {
    const loadMobs = async () => {
      try {
        const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
        const mobsData = [];

        Object.keys(modules).forEach((path) => {
          const fileName = path.split('/').pop();
          const parsed = parseFileName(fileName);
          
          mobsData.push({
            ...parsed,
            image: path.replace('/public', ''),
            fileName: fileName
          });
        });

        // Ordina i mob
        mobsData.sort((a, b) => {
          // Prima ordina per tipo (base -> main -> complex -> color)
          const typeOrder = { base: 0, main_variant: 1, complex_variant: 2, color_variant: 3 };
          if (typeOrder[a.type] !== typeOrder[b.type]) {
            return typeOrder[a.type] - typeOrder[b.type];
          }
          
          // Poi per numeri
          if (a.num1 !== b.num1) return (a.num1 || 0) - (b.num1 || 0);
          if (a.num2 !== b.num2) return (a.num2 || 0) - (b.num2 || 0);
          if (a.num3 !== b.num3) return (a.num3 || 0) - (b.num3 || 0);
          
          // Infine per nome
          return a.name.localeCompare(b.name);
        });

        setAllMobs(mobsData);

        // Carica lo stato salvato dal localStorage
        const savedTracked = localStorage.getItem('allMobsTracker');
        if (savedTracked) {
          setTrackedMobs(JSON.parse(savedTracked));
        }

        const savedMode = localStorage.getItem('allMobsTrackerMode');
        if (savedMode) {
          setVariantMode(savedMode);
        }
      } catch (error) {
        console.error('Errore nel caricamento dei mob:', error);
      }
    };

    loadMobs();
  }, []);

// Filtra i mob in base alla modalità varianti
useEffect(() => {
  if (allMobs.length === 0) {
    setDisplayedMobs([]);
    return;
  }

  let filtered = [];

  if (variantMode === 'none') {
    // Nessuna variante: mob base + solo quelli con num1=1 (primo di ogni gruppo basato sul nome base)
    const seen = {
      main: false,
      complex: new Set(),
      color: new Set()
    };
    
    allMobs.forEach(mob => {
      if (mob.type === 'base') {
        filtered.push(mob);
      } else if (mob.type === 'main_variant' && mob.num1 === 1) {
        if (!seen.main) {
          filtered.push(mob);
          seen.main = true;
        }
      } else if (mob.type === 'complex_variant' && mob.num1 === 1 && mob.num2 === 1) {
        // Usa il nome base (prima parola) come chiave per raggruppare
        const baseName = mob.name.split(' ')[0];
        if (!seen.complex.has(baseName)) {
          filtered.push(mob);
          seen.complex.add(baseName);
        }
      } else if (mob.type === 'color_variant' && mob.num1 === 1 && mob.num2 === 1 && mob.num3 === 1) {
        // Usa il nome base (prima parola) come chiave per raggruppare
        const baseName = mob.name.split(' ')[0];
        if (!seen.color.has(baseName)) {
          filtered.push(mob);
          seen.color.add(baseName);
        }
      }
    });
  } else if (variantMode === 'main') {
    // Varianti principali: mob base + tutte main + primo di ogni gruppo complex (con num2=1) + primo di ogni gruppo color
    const seenGroups = {
      complex: new Set(),
      color: new Set()
    };
    
    allMobs.forEach(mob => {
      if (mob.type === 'base' || mob.type === 'main_variant') {
        filtered.push(mob);
      } else if (mob.type === 'complex_variant' && mob.num2 === 1) {
        // Mostra solo quelli con num2=1 (primo di ogni gruppo num1)
        const baseName = mob.name.split(' ')[0];
        const groupKey = `${mob.num1}-${baseName}`;
        if (!seenGroups.complex.has(groupKey)) {
          filtered.push(mob);
          seenGroups.complex.add(groupKey);
        }
      } else if (mob.type === 'color_variant' && mob.num3 === 1) {
        // Mostra solo quelli con num3=1 (primo di ogni gruppo num1.num2)
        const baseName = mob.name.split(' ')[0];
        const groupKey = `${mob.num1}.${mob.num2}-${baseName}`;
        if (!seenGroups.color.has(groupKey)) {
          filtered.push(mob);
          seenGroups.color.add(groupKey);
        }
      }
    });
  } else if (variantMode === 'complex') {
    // Varianti complesse: mob base + tutte main + tutte complex + primo di ogni gruppo color
    const seenGroups = {
      color: new Set()
    };
    
    allMobs.forEach(mob => {
      if (mob.type === 'base' || mob.type === 'main_variant' || mob.type === 'complex_variant') {
        filtered.push(mob);
      } else if (mob.type === 'color_variant' && mob.num3 === 1) {
        // Mostra solo quelli con num3=1 (primo di ogni gruppo num1.num2)
        const baseName = mob.name.split(' ')[0];
        const groupKey = `${mob.num1}.${mob.num2}-${baseName}`;
        if (!seenGroups.color.has(groupKey)) {
          filtered.push(mob);
          seenGroups.color.add(groupKey);
        }
      }
    });
  } else {
    // Tutte le varianti
    filtered = [...allMobs];
  }

  setDisplayedMobs(filtered);
}, [allMobs, variantMode]);


  // Salva lo stato nel localStorage quando cambia
  useEffect(() => {
    localStorage.setItem('allMobsTracker', JSON.stringify(trackedMobs));
  }, [trackedMobs]);

  useEffect(() => {
    localStorage.setItem('allMobsTrackerMode', variantMode);
  }, [variantMode]);

  const toggleMob = (mobFileName) => {
    setTrackedMobs(prev => ({
      ...prev,
      [mobFileName]: !prev[mobFileName]
    }));
  };

  const resetAll = () => {
    if (window.confirm('Vuoi resettare tutti i mob tracciati?')) {
      setTrackedMobs({});
    }
  };

  const getVariantBadge = (mob) => {
    if (mob.type === 'base') return null;
    
    const badges = {
      'main_variant': { text: 'Variante', color: 'bg-blue-600' },
      'complex_variant': { text: 'Complessa', color: 'bg-purple-600' },
      'color_variant': { text: 'Colore', color: 'bg-pink-600' }
    };
    
    const badge = badges[mob.type];
    if (!badge) return null;
    
    return (
      <span className={`${badge.color} text-white text-xs px-2 py-0.5 rounded-full`}>
        {badge.text}
      </span>
    );
  };

  const trackedCount = Object.values(trackedMobs).filter(Boolean).length;
  const totalCount = displayedMobs.length;

  // Modale Impostazioni
  if (showSettings) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-green-900 via-green-800 to-emerald-900 p-4 md:p-8">
        <div className="max-w-2xl mx-auto">
          <div className="bg-stone-800 rounded-lg shadow-2xl p-6 border-4 border-stone-700">
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-3xl font-bold text-green-400">⚙️ Impostazioni</h2>
              <button
                onClick={() => setShowSettings(false)}
                className="bg-stone-700 hover:bg-stone-600 text-white px-4 py-2 rounded-lg font-semibold transition-colors"
              >
                ✕ Chiudi
              </button>
            </div>

            <div className="space-y-6">
              {/* Modalità Varianti */}
              <div>
                <label className="block text-white text-lg font-semibold mb-3">
                  Modalità Visualizzazione Varianti
                </label>
                <select
                  value={variantMode}
                  onChange={(e) => setVariantMode(e.target.value)}
                  className="w-full bg-stone-900 text-white border-2 border-stone-700 rounded-lg px-4 py-3 text-base focus:border-green-500 focus:outline-none"
                >
                  <option value="none">🔹 Nessuna Variante</option>
                  <option value="main">🔸 Varianti Principali</option>
                  <option value="complex">🔶 Varianti Complesse</option>
                  <option value="all">⭐ Tutte le Varianti</option>
                </select>
                
                <div className="mt-4 bg-stone-900 rounded-lg p-4 text-gray-300 text-sm space-y-2">
                  <p className="font-semibold text-green-400">Spiegazione:</p>
                  <ul className="space-y-2 ml-4">
                    <li>
                      <strong className="text-white">🔹 Nessuna Variante:</strong> Mob base + primo di ogni gruppo di varianti
                    </li>
                    <li>
                      <strong className="text-white">🔸 Varianti Principali:</strong> Mob base + tutte le varianti con 1 numero + primo di ogni gruppo con 2 e 3 numeri
                    </li>
                    <li>
                      <strong className="text-white">🔶 Varianti Complesse:</strong> Mob base + varianti con 1 e 2 numeri + primo di ogni gruppo con 3 numeri
                    </li>
                    <li>
                      <strong className="text-white">⭐ Tutte le Varianti:</strong> Tutti i mob incluse tutte le varianti di colore
                    </li>
                  </ul>
                </div>
              </div>

              {/* Statistiche */}
              <div className="bg-stone-900 rounded-lg p-4 border-2 border-stone-700">
                <h3 className="text-white font-semibold mb-2">📊 Statistiche</h3>
                <div className="text-gray-300 text-sm space-y-1">
                  <p>Totale mob caricati: <span className="text-green-400 font-bold">{allMobs.length}</span></p>
                  <p>Mob visualizzati: <span className="text-green-400 font-bold">{displayedMobs.length}</span></p>
                  <p>Mob tracciati: <span className="text-green-400 font-bold">{trackedCount}</span></p>
                  <div className="mt-2 pt-2 border-t border-stone-700">
                    <p>Mob base: <span className="text-blue-400">{allMobs.filter(m => m.type === 'base').length}</span></p>
                    <p>Varianti principali: <span className="text-blue-400">{allMobs.filter(m => m.type === 'main_variant').length}</span></p>
                    <p>Varianti complesse: <span className="text-purple-400">{allMobs.filter(m => m.type === 'complex_variant').length}</span></p>
                    <p>Varianti colore: <span className="text-pink-400">{allMobs.filter(m => m.type === 'color_variant').length}</span></p>
                  </div>
                </div>
              </div>

              {/* Reset */}
              <div className="pt-4 border-t border-stone-700">
                <button
                  onClick={resetAll}
                  className="w-full bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors shadow-lg"
                >
                  🔄 Reset Tutti i Progressi
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Pagina Principale
  return (
    <div className="min-h-screen bg-gradient-to-br from-green-900 via-green-800 to-emerald-900 p-4 md:p-8">
      <div className="max-w-7xl mx-auto">
        {/* Header */}
        <div className="bg-stone-800 rounded-lg shadow-2xl p-6 mb-6 border-4 border-stone-700">
          <h1 className="text-4xl md:text-5xl font-bold text-center text-green-400 mb-4">
            🎮 All Mobs Tracker
          </h1>
          <div className="flex justify-between items-center flex-wrap gap-4">
            <div className="text-white text-xl">
              <span className="text-green-400 font-bold">{trackedCount}</span> / {totalCount} Mob Trovati
            </div>
            <div className="flex gap-2">
              <button
                onClick={() => setShowSettings(true)}
                className="bg-stone-700 hover:bg-stone-600 text-white px-6 py-2 rounded-lg font-semibold transition-colors shadow-lg"
              >
                ⚙️ Impostazioni
              </button>
              <button
                onClick={resetAll}
                className="bg-red-600 hover:bg-red-700 text-white px-6 py-2 rounded-lg font-semibold transition-colors shadow-lg"
              >
                🔄 Reset
              </button>
            </div>
          </div>
          <div className="mt-4 bg-stone-900 rounded-full h-4 overflow-hidden">
            <div
              className="bg-green-500 h-full transition-all duration-300"
              style={{ width: `${totalCount > 0 ? (trackedCount / totalCount) * 100 : 0}%` }}
            />
          </div>
          
          {/* Info modalità corrente */}
          <div className="mt-3 text-center text-gray-300 text-sm">
            {variantMode === 'none' && '🔹 Modalità: Nessuna Variante'}
            {variantMode === 'main' && '🔸 Modalità: Varianti Principali'}
            {variantMode === 'complex' && '🔶 Modalità: Varianti Complesse'}
            {variantMode === 'all' && '⭐ Modalità: Tutte le Varianti'}
          </div>
        </div>

        {/* Griglia dei Mob */}
        {displayedMobs.length === 0 ? (
          <div className="bg-stone-800 rounded-lg shadow-xl p-12 text-center border-4 border-stone-700">
            <p className="text-white text-xl mb-4">
              📁 Nessun mob trovato nella cartella <code className="bg-stone-900 px-2 py-1 rounded">public/data</code>
            </p>
            <p className="text-gray-400 mb-4">
              Aggiungi immagini nella cartella data seguendo questi pattern:
            </p>
            <ul className="text-gray-400 text-left max-w-2xl mx-auto space-y-2">
              <li>• <code className="bg-stone-900 px-2 py-1 rounded">PiglinBrute.png</code> - Mob base (nessun numero)</li>
              <li>• <code className="bg-stone-900 px-2 py-1 rounded">1CopperGolem-Normal.png</code> - Variante principale (1 numero)</li>
              <li>• <code className="bg-stone-900 px-2 py-1 rounded">1.1ChickenJockey-Zombie.png</code> - Variante complessa (2 numeri)</li>
              <li>• <code className="bg-stone-900 px-2 py-1 rounded">1.1.1Cat-Tuxedo-Red.png</code> - Variante con colore (3 numeri)</li>
            </ul>
          </div>
        ) : (
          <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-5 xl:grid-cols-6 gap-4">
            {displayedMobs.map((mob) => {
              const isTracked = trackedMobs[mob.fileName];

              return (
                <div
                  key={mob.fileName}
                  className={`relative bg-stone-800 rounded-lg shadow-xl overflow-hidden border-4 transition-all duration-200 cursor-pointer transform hover:scale-105 ${
                    isTracked
                      ? 'border-green-500 opacity-50'
                      : 'border-stone-700 hover:border-stone-500'
                  }`}
                  onClick={() => toggleMob(mob.fileName)}
                >
                  {/* Immagine */}
                  <div className="aspect-square bg-stone-900 flex items-center justify-center p-4 relative">
                    {mob.image ? (
                      <img
                        src={mob.image}
                        alt={mob.name}
                        className="max-w-full max-h-full object-contain pixelated"
                      />
                    ) : (
                      <div className="text-gray-500 text-4xl">❓</div>
                    )}
                    
                    {/* Checkmark */}
                    {isTracked && (
                      <div className="absolute inset-0 flex items-center justify-center bg-black bg-opacity-50">
                        <div className="text-6xl">✓</div>
                      </div>
                    )}
                  </div>

                  {/* Nome e badge */}
                  <div className="p-3 bg-stone-900">
                    <p className="text-white text-sm font-semibold text-center mb-1">
                      {mob.name}
                    </p>
                    <div className="flex justify-center">
                      {getVariantBadge(mob)}
                    </div>
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {/* Footer */}
        <div className="mt-8 text-center text-gray-400 text-sm">
          <p>Clicca su un mob per segnarlo come trovato</p>
          <p className="mt-1">I progressi vengono salvati automaticamente</p>
        </div>
      </div>
    </div>
  );
};

export default MobTracker;