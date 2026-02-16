import { useState, useEffect } from 'react';
import Settings from './Settings';

// Stile per il bottone generico riutilizzabile (Effetto 3D Minecraft)
const btnClass = "bg-stone-700 hover:bg-stone-600 text-stone-100 px-4 py-2 text-xl border-b-4 border-stone-900 active:border-b-0 active:translate-y-1 transition-all uppercase tracking-wide";

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]);
  const [displayedMobs, setDisplayedMobs] = useState([]);
  const [trackedMobs, setTrackedMobs] = useState({});
  const [variantMode, setVariantMode] = useState('main');
  const [showSettings, setShowSettings] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  // Nuovi stati per le varianti Baby
  const [showRealBaby, setShowRealBaby] = useState(true);
  const [showBreedBaby, setShowBreedBaby] = useState(false);

  // Parser dei nomi file avanzato
  const parseFileName = (fileName) => {
    let nameWithoutExt = fileName.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
    
    // Identifica i tag Baby
    const isRealBaby = nameWithoutExt.endsWith('#');
    const isBreedBaby = nameWithoutExt.endsWith('@');
    
    // Pulisce il nome dai simboli per il parsing dei numeri
    const cleanName = nameWithoutExt.replace(/[#@]$/, '');

    let data = {
      isRealBaby,
      isBreedBaby,
      num1: null,
      num2: null,
      num3: null,
      name: '',
      type: 'base'
    };

    // Pattern 3 numeri (Color Variant): 1.1.1Cat
    const match3 = cleanName.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
    if (match3) {
      data.type = 'color_variant';
      data.num1 = parseInt(match3[1]);
      data.num2 = parseInt(match3[2]);
      data.num3 = parseInt(match3[3]);
      data.name = match3[4];
    } else {
      const match2 = cleanName.match(/^(\d+)\.(\d+)(.+)$/);
      if (match2) {
        data.type = 'complex_variant';
        data.num1 = parseInt(match2[1]);
        data.num2 = parseInt(match2[2]);
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

    // Formattazione estetica
    data.name = data.name.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim();
    
    // Aggiunge suffissi visivi in base al tipo di baby
    if (isBreedBaby) data.name += " Baby";

    return data;
  };

  useEffect(() => {
    const loadMobs = async () => {
      const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
      const mobsData = Object.keys(modules).map(path => {
        const fileName = path.split('/').pop();
        return { 
          ...parseFileName(fileName), 
          image: path.replace('/public', ''), 
          fileName 
        };
      });

      // Ordinamento: Alfabetico -> Gerarchico -> Baby
      mobsData.sort((a, b) => {
        const nameA = a.name.replace(/\(.*\)/, '').trim();
        const nameB = b.name.replace(/\(.*\)/, '').trim();
        const nameCompare = nameA.localeCompare(nameB);
        if (nameCompare !== 0) return nameCompare;
        
        return (a.num1 || 0) - (b.num1 || 0) || 
               (a.num2 || 0) - (b.num2 || 0) || 
               (a.num3 || 0) - (b.num3 || 0) ||
               (a.isRealBaby ? 1 : 0) ||
               (a.isBreedBaby ? 2 : 0);
      });

      setAllMobs(mobsData);
      
      setTrackedMobs(JSON.parse(localStorage.getItem('allMobsTracker') || '{}'));
      setVariantMode(localStorage.getItem('allMobsTrackerMode') || 'main');
      setShowRealBaby(JSON.parse(localStorage.getItem('allMobsShowReal') ?? 'true'));
      setShowBreedBaby(JSON.parse(localStorage.getItem('allMobsShowBreed') ?? 'false'));
    };
    loadMobs();
  }, []);

  // LOGICA DI FILTRO (Integrazione Baby + Tua Logica Varianti)
  useEffect(() => {
    let filtered = allMobs;

    // 1. Filtro Esclusione Baby
    filtered = filtered.filter(m => {
      if (m.isRealBaby && !showRealBaby) return false;
      if (m.isBreedBaby && !showBreedBaby) return false;
      return true;
    });

    // 2. Tua Logica Varianti (Mantenuta)
    if (variantMode === 'none') {
      filtered = filtered.filter(m => m.type === 'base' || (m.num1 === 1 && (m.num2 === 1 || !m.num2) && (m.num3 === 1 || !m.num3)));
    } else if (variantMode === 'main') {
      filtered = filtered.filter(m => 
        m.type === 'base' || 
        m.type === 'main_variant' || 
        (m.type === 'complex_variant' && m.num2 === 1) || 
        (m.type === 'color_variant' && m.num3 === 1)
      );
    } else if (variantMode === 'complex') {
      filtered = filtered.filter(m => m.type !== 'color_variant' || m.num3 === 1);
    }

    // 3. Filtro Ricerca
    if (searchQuery) {
      filtered = filtered.filter(m => m.name.toLowerCase().includes(searchQuery.toLowerCase()));
    }

    setDisplayedMobs(filtered);
  }, [allMobs, variantMode, searchQuery, showRealBaby, showBreedBaby]);

  useEffect(() => { localStorage.setItem('allMobsTracker', JSON.stringify(trackedMobs)); }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('allMobsTrackerMode', variantMode); }, [variantMode]);
  useEffect(() => { localStorage.setItem('allMobsShowReal', JSON.stringify(showRealBaby)); }, [showRealBaby]);
  useEffect(() => { localStorage.setItem('allMobsShowBreed', JSON.stringify(showBreedBaby)); }, [showBreedBaby]);

  const toggleMob = (id) => setTrackedMobs(prev => ({ ...prev, [id]: !prev[id] }));
  const resetAll = () => { if(confirm('Reset totale progressi?')) setTrackedMobs({}); setShowSettings(false); };
  
  const trackedCount = Object.values(trackedMobs).filter(Boolean).length;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 p-4 md:p-6">
      {showSettings && (
        <Settings 
          variantMode={variantMode} 
          setVariantMode={setVariantMode} 
          showRealBaby={showRealBaby}
          setShowRealBaby={setShowRealBaby}
          showBreedBaby={showBreedBaby}
          setShowBreedBaby={setShowBreedBaby}
          resetAll={resetAll} 
          onClose={() => setShowSettings(false)} 
        />
      )}

      <div className="max-w-[1600px] mx-auto">
        <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6 mb-6">
            <h1 className="text-5xl md:text-6xl text-green-400 drop-shadow-[0_2px_2px_rgba(0,0,0,0.8)] tracking-wide uppercase">
              All Mobs Tracker
            </h1>
            
            <div className="flex gap-4 w-full md:w-auto items-center">
              <div className="relative flex-grow md:flex-grow-0">
                <input
                  type="text"
                  placeholder="Cerca mob..."
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  className="w-full md:w-64 bg-[#0a0a0a] border-4 border-stone-700 text-2xl px-3 py-1 text-white placeholder-stone-600 focus:border-green-500 outline-none h-[48px]"
                />
                {searchQuery && (
                  <button onClick={() => setSearchQuery('')} className="absolute right-3 top-2 text-2xl text-stone-500 hover:text-white">X</button>
                )}
              </div>

              <button onClick={() => setShowSettings(true)} className={btnClass}>
                Settings
              </button>
            </div>
          </div>

          {/* DASHBOARD STATS */}
          <div className="bg-[#1a1a1a] p-4 rounded border-4 border-stone-700 grid grid-cols-2 md:grid-cols-6 gap-4 text-center shadow-inner">
            <div className="col-span-2 md:col-span-1 flex flex-col justify-center border-b-2 md:border-b-0 md:border-r-2 border-stone-700 pb-2 md:pb-0">
               <span className="text-stone-400 text-xl uppercase">Visti</span>
               <span className="text-4xl text-white">
                 {trackedCount} <span className="text-stone-600 text-2xl">/ {displayedMobs.length}</span>
               </span>
            </div>
            
            <div className="flex flex-col">
              <span className="text-blue-400 text-xl uppercase">Base</span>
              <span className="text-3xl">{allMobs.filter(m => m.type === 'base' && !m.isRealBaby && !m.isBreedBaby).length}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-yellow-400 text-xl uppercase">Varianti</span>
              <span className="text-3xl">{allMobs.filter(m => m.type === 'main_variant').length}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-purple-400 text-xl uppercase">Complesse</span>
              <span className="text-3xl">{allMobs.filter(m => m.type === 'complex_variant').length}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-red-400 text-xl uppercase">Colorate</span>
              <span className="text-3xl">{allMobs.filter(m => m.type === 'color_variant').length}</span>
            </div>
            <div className="flex flex-col">
              <span className="text-pink-400 text-xl uppercase">Baby</span>
              <span className="text-3xl">{allMobs.filter(m => m.isRealBaby || m.isBreedBaby).length}</span>
            </div>
          </div>

          {/* PROGRESS BAR */}
          <div className="mt-6 bg-[#0a0a0a] h-8 border-4 border-stone-700 relative overflow-hidden">
            <div 
              className="bg-gradient-to-r from-green-700 to-green-500 h-full transition-all duration-500 ease-out" 
              style={{ width: `${displayedMobs.length > 0 ? (trackedCount / displayedMobs.length) * 100 : 0}%` }} 
            />
            <div className="absolute inset-0 flex items-center justify-center text-xl text-white drop-shadow-[0_2px_2px_rgba(0,0,0,1)] tracking-widest">
              {displayedMobs.length > 0 ? Math.round((trackedCount / displayedMobs.length) * 100) : 0}% COMPLETATO
            </div>
          </div>
        </header>

        {/* GRID */}
        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 lg:grid-cols-7 xl:grid-cols-9 gap-3">
          {displayedMobs.map((mob) => {
            const isTracked = trackedMobs[mob.fileName];
            return (
              <div
                key={mob.fileName}
                onClick={() => toggleMob(mob.fileName)}
                className={`group relative bg-stone-800 border-4 transition-all cursor-pointer overflow-hidden
                  ${isTracked ? 'border-green-600' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1'}
                `}
              >
                <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative ${isTracked ? 'opacity-40' : ''}`}>
                  <img 
                    src={mob.image} 
                    alt={mob.name} 
                    className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform duration-200" 
                  />
                  
                  {/* Badge per i Baby */}
                  {(mob.isRealBaby || mob.isBreedBaby) && !isTracked && (
                    <div className="absolute top-1 right-1 bg-pink-600 text-[10px] px-2 pb-1 pt-1 border-2 border-stone-900 leading-none">
                      BABY
                    </div>
                  )}

                  {/* Badge per i Colorati */}
                  {mob.type === 'color_variant' && !isTracked && (
                    <div className="absolute top-1 right-1 bg-red-600 text-[10px] px-2 pb-1 pt-1 border-2 border-stone-900 leading-none">
                      COLOR
                    </div>
                  )}
                </div>

                {isTracked && (
                  <div className="absolute inset-0 flex items-center justify-center z-10 pointer-events-none">
                    <span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
                  </div>
                )}

                <div className={`p-1 text-center border-t-4 ${isTracked ? 'bg-green-900 border-green-700' : 'bg-stone-800 border-stone-700'}`}>
                  <p className="text-[12px] leading-tight text-stone-200 uppercase truncate">
                    {mob.name}
                  </p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
};

export default MobTracker;