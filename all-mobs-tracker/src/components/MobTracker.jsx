import { useState, useEffect, useMemo } from 'react';
import Settings from './Settings';
import MobCard from './MobCard';
import Stats from './Stats';
import { parseFileName } from '../utils/mobParser';
import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]);
  const [trackedMobs, setTrackedMobs] = useState(() => JSON.parse(localStorage.getItem('mobTracker_saves') || '{}'));
  const [variantMode, setVariantMode] = useState(() => localStorage.getItem('mobTracker_mode') || 'main');
  const [searchQuery, setSearchQuery] = useState('');
  const [showSettings, setShowSettings] = useState(false);
  const [showStats, setShowStats] = useState(false);

  const [filters, setFilters] = useState(() => {
    const saved = JSON.parse(localStorage.getItem('mobTracker_filters'));
    if (saved) return saved;
    const defaults = {};
    ComplexConfig.forEach(c => defaults[c.id] = c.defaultShow);
    Object.values(SuffixConfig).forEach(s => defaults[s.id] = s.defaultShow);
    return defaults;
  });

  useEffect(() => {
    const load = async () => {
      const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
      const data = Object.keys(modules).map(path => ({
        ...parseFileName(path.split('/').pop(), path),
        image: path.replace('/public', ''),
        fileName: path.split('/').pop()
      })).sort((a, b) => a.name.localeCompare(b.name));
      setAllMobs(data);
    };
    load();
  }, []);

  useEffect(() => { localStorage.setItem('mobTracker_saves', JSON.stringify(trackedMobs)); }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('mobTracker_filters', JSON.stringify(filters)); }, [filters]);
  useEffect(() => { localStorage.setItem('mobTracker_mode', variantMode); }, [variantMode]);

  const displayedMobs = useMemo(() => {
    return allMobs.filter(mob => {
      if (searchQuery && !mob.name.toLowerCase().includes(searchQuery.toLowerCase())) return false;

      for (const suffix of mob.activeSuffixes) {
        if (!filters[suffix]) return false;
      }

      if (mob.complexId && !filters[mob.complexId]) {
        const config = ComplexConfig.find(c => c.id === mob.complexId);
        if (!config.isBaseCondition(mob.num1, mob.num2, mob.num3) || mob.activeSuffixes.length > 0) return false;
      }

      if (variantMode === 'none') {
        if (mob.num1 > 1 || (mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
      } else if (variantMode === 'main') {
        if ((mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
      }

      return true;
    });
  }, [allMobs, filters, variantMode, searchQuery]);

  const trackedCount = useMemo(() => displayedMobs.filter(m => trackedMobs[m.fileName]).length, [displayedMobs, trackedMobs]);
  const toggleMob = (id) => setTrackedMobs(p => ({ ...p, [id]: !p[id] }));

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 p-4 md:p-6">
      {showSettings && (
        <Settings 
          variantMode={variantMode} setVariantMode={setVariantMode}
          filters={filters} toggleFilter={(id) => setFilters(p => ({...p, [id]: !p[id]}))}
          resetAll={() => confirm('Sei sicuro di voler resettare tutti i progressi?') && setTrackedMobs({})} 
          onClose={() => setShowSettings(false)}
        />
      )}
      
      {showStats && (
        <Stats 
          allMobs={allMobs} 
          trackedMobs={trackedMobs} 
          onClose={() => setShowStats(false)} 
        />
      )}

      <div className="max-w-[1600px] mx-auto">
        <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
          <div className="flex flex-col lg:flex-row justify-between items-center gap-6 mb-6">
            <h1 className="text-4xl md:text-5xl lg:text-6xl text-green-400 drop-shadow-md uppercase whitespace-nowrap">Mob Tracker</h1>
            
            {/* Barra superiore allungata con input e bottoni */}
            <div className="flex flex-col sm:flex-row gap-4 w-full lg:w-3/4 justify-end">
              <div className="relative flex-grow max-w-2xl">
                <input 
                  type="text" 
                  placeholder="Search..." 
                  value={searchQuery} 
                  onChange={e => setSearchQuery(e.target.value)} 
                  className="w-full bg-black border-4 border-stone-700 py-2 pl-3 pr-10 text-xl outline-none focus:border-green-500 transition-colors" 
                />
                {searchQuery && (
                  <button 
                    onClick={() => setSearchQuery('')} 
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-stone-400 hover:text-white font-bold text-xl pb-1"
                  >
                    X
                  </button>
                )}
              </div>
              <div className="flex gap-4 shrink-0">
                <button onClick={() => setShowStats(true)} className="bg-blue-800 hover:bg-blue-700 px-6 py-2 border-b-4 border-black uppercase font-bold transition-transform active:translate-y-1 active:border-b-0">Stats</button>
                <button onClick={() => setShowSettings(true)} className="bg-stone-700 hover:bg-stone-600 px-6 py-2 border-b-4 border-black uppercase font-bold transition-transform active:translate-y-1 active:border-b-0">Settings</button>
              </div>
            </div>
          </div>

          <div className="bg-black/50 p-4 border-4 border-stone-700 relative overflow-hidden">
            <div className="flex justify-between mb-2 text-xl font-bold uppercase">
              <span>Progress</span>
              <span>{trackedCount} / {displayedMobs.length} ({displayedMobs.length > 0 ? Math.round((trackedCount/displayedMobs.length)*100) : 0}%)</span>
            </div>
            <div className="h-6 bg-stone-900 border-2 border-stone-700 p-1">
              <div className="h-full bg-green-500 transition-all duration-500" style={{ width: `${displayedMobs.length > 0 ? (trackedCount/displayedMobs.length)*100 : 0}%` }} />
            </div>
          </div>
        </header>

        <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 xl:grid-cols-10 gap-3">
          {displayedMobs.map(mob => (
            <MobCard key={mob.fileName} mob={mob} isTracked={trackedMobs[mob.fileName]} onToggle={() => toggleMob(mob.fileName)} />
          ))}
        </div>
      </div>
    </div>
  );
};

export default MobTracker;