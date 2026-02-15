import { useState, useEffect } from 'react';
import Settings from './Settings';

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]);
  const [displayedMobs, setDisplayedMobs] = useState([]);
  const [trackedMobs, setTrackedMobs] = useState({});
  const [variantMode, setVariantMode] = useState('main');
  const [showSettings, setShowSettings] = useState(false);
  const [searchQuery, setSearchQuery] = useState('');

  const parseFileName = (fileName) => {
    const nameWithoutExt = fileName.replace(/\.(png|jpg|jpeg|gif|webp)$/i, '');
    const match3 = nameWithoutExt.match(/^(\d+)\.(\d+)\.(\d+)(.+)$/);
    if (match3) return { type: 'color_variant', num1: parseInt(match3[1]), num2: parseInt(match3[2]), num3: parseInt(match3[3]), name: match3[4].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim() };
    const match2 = nameWithoutExt.match(/^(\d+)\.(\d+)(.+)$/);
    if (match2) return { type: 'complex_variant', num1: parseInt(match2[1]), num2: parseInt(match2[2]), name: match2[3].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim() };
    const match1 = nameWithoutExt.match(/^(\d+)(.+)$/);
    if (match1) return { type: 'main_variant', num1: parseInt(match1[1]), name: match1[2].replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim() };
    return { type: 'base', name: nameWithoutExt.replace(/-/g, ' ').replace(/([A-Z])/g, ' $1').trim() };
  };

  useEffect(() => {
    const loadMobs = async () => {
      const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
      const mobsData = Object.keys(modules).map(path => {
        const fileName = path.split('/').pop();
        return { ...parseFileName(fileName), image: path.replace('/public', ''), fileName };
      });

      mobsData.sort((a, b) => {
        const typeOrder = { base: 0, main_variant: 1, complex_variant: 2, color_variant: 3 };
        if (typeOrder[a.type] !== typeOrder[b.type]) return typeOrder[a.type] - typeOrder[b.type];
        return (a.num1 || 0) - (b.num1 || 0) || (a.num2 || 0) - (b.num2 || 0) || (a.num3 || 0) - (b.num3 || 0) || a.name.localeCompare(b.name);
      });

      setAllMobs(mobsData);
      setTrackedMobs(JSON.parse(localStorage.getItem('allMobsTracker') || '{}'));
      setVariantMode(localStorage.getItem('allMobsTrackerMode') || 'main');
    };
    loadMobs();
  }, []);

  useEffect(() => {
    let filtered = allMobs;

    // Logica Varianti
    if (variantMode === 'none') {
      filtered = allMobs.filter(m => m.type === 'base' || (m.num1 === 1 && (m.num2 === 1 || !m.num2) && (m.num3 === 1 || !m.num3)));
    } else if (variantMode === 'main') {
      // Mostra base, main_variant, e i primi (.1) di ogni sottogruppo complex e color
      filtered = allMobs.filter(m => 
        m.type === 'base' || 
        m.type === 'main_variant' || 
        (m.type === 'complex_variant' && m.num2 === 1) || 
        (m.type === 'color_variant' && m.num3 === 1)
      );
    } else if (variantMode === 'complex') {
      filtered = allMobs.filter(m => m.type !== 'color_variant' || m.num3 === 1);
    }

    // Filtro Ricerca
    if (searchQuery) {
      filtered = filtered.filter(m => m.name.toLowerCase().includes(searchQuery.toLowerCase()));
    }

    setDisplayedMobs(filtered);
  }, [allMobs, variantMode, searchQuery]);

  useEffect(() => { localStorage.setItem('allMobsTracker', JSON.stringify(trackedMobs)); }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('allMobsTrackerMode', variantMode); }, [variantMode]);

  const toggleMob = (id) => setTrackedMobs(prev => ({ ...prev, [id]: !prev[id] }));
  const trackedCount = Object.values(trackedMobs).filter(Boolean).length;

  if (showSettings) return <Settings allMobs={allMobs} displayedMobs={displayedMobs} trackedCount={trackedCount} variantMode={variantMode} setVariantMode={setVariantMode} resetAll={() => { if(confirm('Reset?')) setTrackedMobs({}); }} onClose={() => setShowSettings(false)} />;

  return (
    <div className="min-h-screen bg-stone-900 text-stone-100 p-4 md:p-8">
      <div className="max-w-7xl mx-auto">
        <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-700 shadow-xl">
          <h1 className="text-3xl font-bold text-center text-green-400 mb-6 uppercase tracking-widest">All Mobs Tracker</h1>
          
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4 items-center">
            <div className="text-xl font-mono">
              Progress: <span className="text-green-400">{trackedCount}</span>/{displayedMobs.length}
            </div>
            
            <div className="relative">
              <input
                type="text"
                placeholder="Cerca mob..."
                value={searchQuery}
                onChange={(e) => setSearchQuery(e.target.value)}
                className="w-full bg-stone-900 border-2 border-stone-700 rounded px-4 py-2 focus:border-green-500 outline-none transition-all"
              />
              {searchQuery && (
                <button onClick={() => setSearchQuery('')} className="absolute right-3 top-2 text-stone-500 hover:text-white">✕</button>
              )}
            </div>

            <div className="flex justify-end">
              <button onClick={() => setShowSettings(true)} className="bg-stone-700 hover:bg-stone-600 px-6 py-2 rounded font-bold transition-all border-b-4 border-stone-900 active:border-b-0 active:translate-y-1">
                Impostazioni
              </button>
            </div>
          </div>

          <div className="mt-6 bg-stone-950 rounded-full h-4 overflow-hidden border-2 border-stone-700">
            <div className="bg-green-500 h-full transition-all duration-700 ease-out" style={{ width: `${(trackedCount / displayedMobs.length) * 100}%` }} />
          </div>
        </header>

        <div className="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 xl:grid-cols-8 gap-3">
          {displayedMobs.map((mob) => (
            <div
              key={mob.fileName}
              onClick={() => toggleMob(mob.fileName)}
              className={`group relative bg-stone-800 border-2 rounded-sm transition-all cursor-pointer ${
                trackedMobs[mob.fileName] ? 'border-green-600 opacity-40' : 'border-stone-700 hover:border-stone-500'
              }`}
            >
              <div className="aspect-square p-3 flex items-center justify-center bg-stone-850">
                <img src={mob.image} alt={mob.name} className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform" />
                {trackedMobs[mob.fileName] && <div className="absolute inset-0 flex items-center justify-center text-green-500 text-5xl font-black">L</div>}
              </div>
              <div className="p-1 bg-stone-900 text-center border-t border-stone-700">
                <p className="text-[10px] sm:text-xs truncate font-mono text-stone-300 uppercase">{mob.name}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default MobTracker;