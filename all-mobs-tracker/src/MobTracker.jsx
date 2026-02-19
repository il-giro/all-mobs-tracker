import { useState, useEffect } from 'react';
import Settings from './Settings';

const btnClass = "bg-stone-700 hover:bg-stone-600 text-stone-100 px-4 py-2 text-xl border-b-4 border-stone-900 active:border-b-0 active:translate-y-1 transition-all uppercase tracking-wide";

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]);
  const [displayedMobs, setDisplayedMobs] = useState([]);
  const [trackedMobs, setTrackedMobs] = useState({});
  const [variantMode, setVariantMode] = useState('main');
  const [showSettings, setShowSettings] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  const [showRealBaby, setShowRealBaby] = useState(true);
  const [showBreedBaby, setShowBreedBaby] = useState(false);
  const [showVillagers, setShowVillagers] = useState(false);

  const parseFileName = (fileName, path) => {
    let nameWithoutExt = fileName.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
    const isRealBaby = nameWithoutExt.endsWith('_B');
    const isBreedBaby = nameWithoutExt.endsWith('_A');
    const cleanName = nameWithoutExt.replace(/_(B|A)$/, '');

    let data = {
      isRealBaby,
      isBreedBaby,
      isVillager: false,
      num1: null,
      num2: null,
      num3: null,
      name: '',
      type: 'base'
    };

    if (path && path.includes('/villagers/')) {
      const matchVillager = cleanName.match(/^(\d+)\.(\d+)$/);
      if (matchVillager) {
        data.isVillager = true;
        data.type = 'complex_variant'; 
        data.num1 = parseInt(matchVillager[1]);
        data.num2 = parseInt(matchVillager[2]);

        const biomes = { 1: 'Plains', 2: 'Desert', 3: 'Jungle', 4: 'Savanna', 5: 'Snow', 6: 'Swamp', 7: 'Taiga' };
        const professions = { 1: 'Unemployed', 2: 'Nitwit', 3: 'Armorer', 4: 'Butcher', 5: 'Cartographer', 6: 'Cleric', 7: 'Farmer', 8: 'Fisherman', 9: 'Fletcher', 10: 'Leatherworker', 11: 'Librarian', 12: 'Mason', 13: 'Shepherd', 14: 'Toolsmith', 15: 'Weaponsmith' };

        const biomeName = biomes[data.num1] || `Biome ${data.num1}`;
        const profName = professions[data.num2] || `Job ${data.num2}`;
        data.name = `Villager ${biomeName} ${profName}`;
        if (isRealBaby) data.name += " (Baby)";
        if (isBreedBaby) data.name += " (Breed)";
        return data;
      }
    }

    const match3 = cleanName.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
    if (match3) {
      data.type = 'color_variant';
      data.num1 = parseInt(match3[1]); data.num2 = parseInt(match3[2]); data.num3 = parseInt(match3[3]);
      data.name = match3[4];
    } else {
      const match2 = cleanName.match(/^(\d+)\.(\d+)(.+)$/);
      if (match2) {
        data.type = 'complex_variant';
        data.num1 = parseInt(match2[1]); data.num2 = parseInt(match2[2]);
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

    data.name = data.name.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim();
    if (isRealBaby) data.name += " (Baby)";
    if (isBreedBaby) data.name += " (Breed)";
    return data;
  };

  useEffect(() => {
    const loadMobs = async () => {
      const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
      const mobsData = Object.keys(modules).map(path => ({
        ...parseFileName(path.split('/').pop(), path),
        image: path.replace('/public', ''),
        fileName: path.split('/').pop()
      }));

      mobsData.sort((a, b) => a.name.localeCompare(b.name) || (a.num1 - b.num1));
      
      setAllMobs(mobsData);
      setTrackedMobs(JSON.parse(localStorage.getItem('allMobsTracker') || '{}'));
      setVariantMode(localStorage.getItem('allMobsTrackerMode') || 'main');
      setShowRealBaby(JSON.parse(localStorage.getItem('allMobsShowReal') ?? 'true'));
      setShowBreedBaby(JSON.parse(localStorage.getItem('allMobsShowBreed') ?? 'false'));
      setShowVillagers(JSON.parse(localStorage.getItem('allMobsShowVillagers') ?? 'false'));
    };
    loadMobs();
  }, []);

  useEffect(() => {
    let filtered = allMobs;

    // FILTRO VILLAGER (Nasconde tutto tranne il 1.1 se il tasto è OFF)
    if (!showVillagers) {
      filtered = filtered.filter(m => 
        !m.isVillager || (m.num1 === 1 && m.num2 === 1 && !m.isRealBaby && !m.isBreedBaby)
      );
    }

    // FILTRI BABY
    if (!showRealBaby) filtered = filtered.filter(m => !m.isRealBaby);
    if (!showBreedBaby) filtered = filtered.filter(m => !m.isBreedBaby);

    // LOGICA VARIANTI
    if (variantMode === 'none') {
      filtered = filtered.filter(m => m.type === 'base' || (m.num1 === 1 && (!m.num2 || m.num2 === 1) && (!m.num3 || m.num3 === 1)));
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

    if (searchQuery) {
      filtered = filtered.filter(m => m.name.toLowerCase().includes(searchQuery.toLowerCase()));
    }

    setDisplayedMobs(filtered);
  }, [allMobs, variantMode, searchQuery, showRealBaby, showBreedBaby, showVillagers]);

  useEffect(() => { localStorage.setItem('allMobsTracker', JSON.stringify(trackedMobs)); }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('allMobsTrackerMode', variantMode); }, [variantMode]);
  useEffect(() => { localStorage.setItem('allMobsShowReal', JSON.stringify(showRealBaby)); }, [showRealBaby]);
  useEffect(() => { localStorage.setItem('allMobsShowBreed', JSON.stringify(showBreedBaby)); }, [showBreedBaby]);
  useEffect(() => { localStorage.setItem('allMobsShowVillagers', JSON.stringify(showVillagers)); }, [showVillagers]);

  const toggleMob = (id) => setTrackedMobs(prev => ({ ...prev, [id]: !prev[id] }));
  const resetAll = () => { if(confirm('Reset progressi?')) setTrackedMobs({}); setShowSettings(false); };
  const trackedCount = Object.values(trackedMobs).filter(Boolean).length;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 p-4 md:p-6">
      {showSettings && (
        <Settings 
          variantMode={variantMode} setVariantMode={setVariantMode} 
          showRealBaby={showRealBaby} setShowRealBaby={setShowRealBaby}
          showBreedBaby={showBreedBaby} setShowBreedBaby={setShowBreedBaby}
          showVillagers={showVillagers} setShowVillagers={setShowVillagers}
          resetAll={resetAll} onClose={() => setShowSettings(false)} 
        />
      )}

      <div className="max-w-[1600px] mx-auto">
        <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
          <div className="flex flex-col md:flex-row justify-between items-center gap-6 mb-6">
            <h1 className="text-5xl md:text-6xl text-green-400 drop-shadow-[0_2px_2px_rgba(0,0,0,0.8)] tracking-wide uppercase">
              All Mobs Tracker
            </h1>
            <div className="flex gap-4 w-full md:w-auto items-center">
              <input
                type="text"
                placeholder="Cerca mob..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full md:w-64 bg-[#0a0a0a] border-4 border-stone-700 text-2xl px-3 py-1 text-white outline-none h-[48px]"
              />
              <button onClick={() => setShowSettings(true)} className={btnClass}>Settings</button>
            </div>
          </div>

          <div className="bg-[#1a1a1a] p-4 rounded border-4 border-stone-700 grid grid-cols-2 md:grid-cols-6 gap-4 text-center">
            <div className="col-span-2 md:col-span-1 border-stone-700 md:border-r-2">
               <span className="text-stone-400 text-xl uppercase">Visti</span>
               <div className="text-4xl font-bold">{trackedCount} <span className="text-stone-600 text-2xl">/ {displayedMobs.length}</span></div>
            </div>
            <div className="flex flex-col"><span className="text-blue-400 text-xl">BASE</span><span className="text-3xl">{allMobs.filter(m => m.type === 'base' && !m.isRealBaby && !m.isBreedBaby).length}</span></div>
            <div className="flex flex-col"><span className="text-yellow-400 text-xl">VARIANTI</span><span className="text-3xl">{allMobs.filter(m => m.type === 'main_variant').length}</span></div>
            <div className="flex flex-col"><span className="text-purple-400 text-xl">COMPLESSE</span><span className="text-3xl">{allMobs.filter(m => m.type === 'complex_variant').length}</span></div>
            <div className="flex flex-col"><span className="text-red-400 text-xl">COLORI</span><span className="text-3xl">{allMobs.filter(m => m.type === 'color_variant').length}</span></div>
            <div className="flex flex-col"><span className="text-pink-400 text-xl">BABY</span><span className="text-3xl">{allMobs.filter(m => m.isRealBaby || m.isBreedBaby).length}</span></div>
          </div>

          <div className="mt-6 bg-[#0a0a0a] h-8 border-4 border-stone-700 relative overflow-hidden">
            <div className="bg-gradient-to-r from-green-700 to-green-500 h-full transition-all duration-500" style={{ width: `${displayedMobs.length > 0 ? (trackedCount / displayedMobs.length) * 100 : 0}%` }} />
            <div className="absolute inset-0 flex items-center justify-center text-xl font-bold drop-shadow-[0_2px_2px_rgba(0,0,0,1)]">
              {displayedMobs.length > 0 ? Math.round((trackedCount / displayedMobs.length) * 100) : 0}% COMPLETATO
            </div>
          </div>
        </header>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-5 lg:grid-cols-7 xl:grid-cols-9 gap-3">
          {displayedMobs.map((mob) => {
            const isTracked = trackedMobs[mob.fileName];
            return (
              <div
                key={mob.fileName}
                onClick={() => toggleMob(mob.fileName)}
                className={`group relative bg-stone-800 border-4 transition-all cursor-pointer overflow-hidden ${isTracked ? 'border-green-600' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1'}`}
              >
                <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative ${isTracked ? 'opacity-40' : ''}`}>
                  <img src={mob.image} alt={mob.name} className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform" />
                  {!isTracked && (mob.isRealBaby || mob.isBreedBaby) && <div className="absolute top-1 right-1 bg-pink-600 text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md">BABY</div>}
                  {isTracked && <div className="absolute inset-0 flex items-center justify-center z-10"><span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span></div>}
                </div>
                <div className={`p-1 text-center border-t-4 ${isTracked ? 'bg-green-900 border-green-700' : 'bg-stone-800 border-stone-700'}`}>
                  <p className="text-[12px] leading-tight text-stone-200 uppercase truncate px-1" title={mob.name}>{mob.name}</p>
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