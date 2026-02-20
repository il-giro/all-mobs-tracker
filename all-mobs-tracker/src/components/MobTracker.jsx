import { useState, useEffect, useMemo, useRef } from 'react';
import Settings from './Settings';
import MobCard from './MobCard';
import Stats from './Stats';
import { parseFileName } from '../utils/mobParser';
import { SuffixConfig, ComplexConfig, SpecialFolderMap } from '../config/mobConfig';

const MobTracker = () => {
  const [allMobs, setAllMobs] = useState([]);
  const [trackedMobs, setTrackedMobs] = useState(() => JSON.parse(localStorage.getItem('mobTracker_saves') || '{}'));
  const [variantMode, setVariantMode] = useState(() => localStorage.getItem('mobTracker_mode') || 'main');
  const [searchQuery, setSearchQuery] = useState('');
  const [showSettings, setShowSettings] = useState(false);
  const [showStats, setShowStats] = useState(false);
  const [selectedFolder, setSelectedFolder] = useState('all');
  const searchRef = useRef(null);

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
      const data = Object.keys(modules).map(path => {
        const parts = path.split('/');
        const dataIdx = parts.indexOf('data');
        const fileName = parts[parts.length - 1];
        const afterData = parts.slice(dataIdx + 1, -1); // segmenti tra 'data' e il file

        let folder = 'root';
        let specialSuffixId = null; // es. 'C', 'A', 'B', 'P'

        if (afterData.length === 0) {
          folder = 'root';
        } else if (afterData[0].toLowerCase() === 'special' && afterData[1]) {
          // Cerca il nome della sottocartella nella mappa esplicita (case-insensitive)
          const subName = afterData[1].toLowerCase();
          specialSuffixId = SpecialFolderMap[subName] ?? null;
          folder = `special:${afterData[1]}`; // es. "special:baby animal"
        } else {
          folder = afterData[0];
        }

        return {
          ...parseFileName(fileName, path),
          image: path.replace('/public', ''),
          fileName,
          folder,
          specialSuffixId, // id diretto nel SuffixConfig, es. 'C'
        };
      }).sort((a, b) => a.name.localeCompare(b.name));
      setAllMobs(data);
    };
    load();
  }, []);

  // Keyboard shortcuts
  useEffect(() => {
    const handleKey = (e) => {
      if (e.key === 'Escape') {
        if (showSettings) { setShowSettings(false); return; }
        if (showStats) { setShowStats(false); return; }
        if (searchQuery) { setSearchQuery(''); return; }
        if (selectedFolder !== 'all') { setSelectedFolder('all'); return; }
      }
      if (
        e.key === ' ' &&
        document.activeElement.tagName !== 'INPUT' &&
        document.activeElement.tagName !== 'SELECT' &&
        document.activeElement.tagName !== 'TEXTAREA'
      ) {
        e.preventDefault();
        searchRef.current?.focus();
      }
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [showSettings, showStats, searchQuery, selectedFolder]);

  useEffect(() => { localStorage.setItem('mobTracker_saves', JSON.stringify(trackedMobs)); }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('mobTracker_filters', JSON.stringify(filters)); }, [filters]);
  useEffect(() => { localStorage.setItem('mobTracker_mode', variantMode); }, [variantMode]);

  // Se il filtro selezionato è una special che viene disattivata, torna a 'all'
  useEffect(() => {
    if (selectedFolder.startsWith('special:')) {
      const mob = allMobs.find(m => m.folder === selectedFolder);
      if (mob?.specialSuffixId && !filters[mob.specialSuffixId]) {
        setSelectedFolder('all');
      }
    }
  }, [filters, selectedFolder, allMobs]);

  // Pulsanti special: uno per sottocartella, visibile solo se filters[suffixId] è ON
  const specialBtns = useMemo(() => {
    const map = new Map();
    allMobs.forEach(m => {
      if (m.specialSuffixId && !map.has(m.folder)) {
        const config = SuffixConfig[m.specialSuffixId];
        map.set(m.folder, {
          folderKey: m.folder,
          suffixId: m.specialSuffixId,
          label: config?.label ?? m.specialSuffixId,
        });
      }
    });
    // Mostra solo se il toggle nelle Settings è ON
    return Array.from(map.values()).filter(b => filters[b.suffixId]);
  }, [allMobs, filters]);

  // Pulsanti cartelle normali (esclude root e special)
  const normalFolderBtns = useMemo(() => {
    const set = new Set();
    allMobs.forEach(m => {
      if (m.folder !== 'root' && !m.folder.startsWith('special:')) set.add(m.folder);
    });
    return Array.from(set).sort();
  }, [allMobs]);

  const displayedMobs = useMemo(() => {
    return allMobs.filter(mob => {
      // Ricerca testo
      if (searchQuery && !mob.name.toLowerCase().includes(searchQuery.toLowerCase())) return false;

      // Filtro cartella selezionata
      if (selectedFolder !== 'all' && mob.folder !== selectedFolder) return false;

      // Mob in cartella special: visibile solo se il suo suffisso è ON nelle Settings
      if (mob.specialSuffixId && !filters[mob.specialSuffixId]) return false;

      // Suffissi normali (activeSuffixes dal parser, es. _B _P sui file root)
      for (const suffix of mob.activeSuffixes) {
        if (!filters[suffix]) return false;
      }

      // ComplexConfig
      if (mob.complexId && !filters[mob.complexId]) {
        const config = ComplexConfig.find(c => c.id === mob.complexId);
        if (!config.isBaseCondition(mob.num1, mob.num2, mob.num3) || mob.activeSuffixes.length > 0) return false;
      }

      // Varianti
      if (variantMode === 'none') {
        if (mob.num1 > 1 || (mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
      } else if (variantMode === 'main') {
        if ((mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
      }

      return true;
    });
  }, [allMobs, filters, variantMode, searchQuery, selectedFolder]);

  const trackedCount = useMemo(() => displayedMobs.filter(m => trackedMobs[m.fileName]).length, [displayedMobs, trackedMobs]);
  const toggleMob = (id) => setTrackedMobs(p => ({ ...p, [id]: !p[id] }));

  const hasFilters = specialBtns.length > 0 || normalFolderBtns.length > 0;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 p-4 md:p-6">
      {showSettings && (
        <Settings
          variantMode={variantMode} setVariantMode={setVariantMode}
          filters={filters} toggleFilter={(id) => setFilters(p => ({ ...p, [id]: !p[id] }))}
          resetAll={() => confirm('Sei sicuro di voler resettare tutti i progressi?') && setTrackedMobs({})}
          onClose={() => setShowSettings(false)}
        />
      )}
      {showStats && (
        <Stats allMobs={allMobs} trackedMobs={trackedMobs} onClose={() => setShowStats(false)} />
      )}

      <div className="max-w-[1600px] mx-auto">
        <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
          <div className="flex flex-col lg:flex-row justify-between items-center gap-6 mb-6">
            <h1 className="text-4xl md:text-5xl lg:text-6xl text-green-400 drop-shadow-md uppercase whitespace-nowrap">Mob Tracker</h1>

            <div className="flex flex-col sm:flex-row gap-4 w-full lg:w-3/4 justify-end">
              <div className="relative flex-grow max-w-2xl">
                <input
                  ref={searchRef}
                  type="text"
                  placeholder="Search… (premi Spazio)"
                  value={searchQuery}
                  onChange={e => setSearchQuery(e.target.value)}
                  className="w-full bg-black border-4 border-stone-700 py-2 pl-3 pr-10 text-xl outline-none focus:border-green-500 transition-colors"
                />
                {searchQuery && (
                  <button
                    onClick={() => setSearchQuery('')}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-stone-400 hover:text-white font-bold text-xl pb-1"
                  >X</button>
                )}
              </div>
              <div className="flex gap-4 shrink-0">
                <button onClick={() => setShowStats(true)} className="bg-blue-800 hover:bg-blue-700 px-6 py-2 border-b-4 border-black uppercase font-bold transition-transform active:translate-y-1 active:border-b-0">Stats</button>
                <button onClick={() => setShowSettings(true)} className="bg-stone-700 hover:bg-stone-600 px-6 py-2 border-b-4 border-black uppercase font-bold transition-transform active:translate-y-1 active:border-b-0">Settings</button>
              </div>
            </div>
          </div>

          {/* Filtri */}
          {hasFilters && (
            <div className="mb-4 flex flex-wrap gap-2 items-center">

              {/* Tutti */}
              <button
                onClick={() => setSelectedFolder('all')}
                className={`px-3 py-1 text-sm font-bold uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0 ${selectedFolder === 'all' ? 'bg-green-700 border-green-900 text-white' : 'bg-stone-700 border-stone-900 text-stone-300 hover:bg-stone-600'}`}
              >
                Tutti
              </button>

              {/* Special — colore viola, prima */}
              {specialBtns.length > 0 && (
                <>
                  <span className="text-stone-600 font-bold select-none">|</span>
                  {specialBtns.map(b => (
                    <button
                      key={b.folderKey}
                      onClick={() => setSelectedFolder(b.folderKey)}
                      className={`px-3 py-1 text-sm font-bold uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0 ${selectedFolder === b.folderKey ? 'bg-purple-600 border-purple-900 text-white' : 'bg-purple-900 border-purple-950 text-purple-300 hover:bg-purple-800'}`}
                    >
                      ✦ {b.label}
                    </button>
                  ))}
                </>
              )}

              {/* Cartelle normali — colore verde */}
              {normalFolderBtns.length > 0 && (
                <>
                  <span className="text-stone-600 font-bold select-none">|</span>
                  {normalFolderBtns.map(f => (
                    <button
                      key={f}
                      onClick={() => setSelectedFolder(f)}
                      className={`px-3 py-1 text-sm font-bold uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0 ${selectedFolder === f ? 'bg-green-700 border-green-900 text-white' : 'bg-stone-700 border-stone-900 text-stone-300 hover:bg-stone-600'}`}
                    >
                      {f}
                    </button>
                  ))}
                </>
              )}
            </div>
          )}

          <div className="bg-black/50 p-4 border-4 border-stone-700 relative overflow-hidden">
            <div className="flex justify-between mb-2 text-xl font-bold uppercase">
              <span>Progress</span>
              <span>{trackedCount} / {displayedMobs.length} ({displayedMobs.length > 0 ? Math.round((trackedCount / displayedMobs.length) * 100) : 0}%)</span>
            </div>
            <div className="h-6 bg-stone-900 border-2 border-stone-700 p-1">
              <div className="h-full bg-green-500 transition-all duration-500" style={{ width: `${displayedMobs.length > 0 ? (trackedCount / displayedMobs.length) * 100 : 0}%` }} />
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