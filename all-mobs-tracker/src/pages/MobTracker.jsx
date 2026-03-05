import { useState, useEffect, useMemo, useRef } from 'react';
import Settings from '../components/Settings';
import MobCard from '../components/MobCard';
import TropicalFishCard from '../components/TropicalFishCard';
import { FISH_TYPES, COLOR_NAMES } from '../utils/FishRenderer';
import { OFFICIAL_NAMES } from '../components/TropicalFishCard';
import Stats from '../components/Stats';
import { parseFileName } from '../utils/mobParser';
import { SuffixConfig, ComplexConfig, SpecialFolderMap, VillagerBiomes, VillagerJobs } from '../config/mobConfig';
import Footer from '../components/Footer';

const ALL_FISH = (() => {
  const fish = [];
  for (let typeIndex = 0; typeIndex < FISH_TYPES.length; typeIndex++)
    for (let bodyColor = 0; bodyColor < 16; bodyColor++)
      for (let patternColor = 0; patternColor < 16; patternColor++)
        fish.push({ id: `fish_${typeIndex}_${bodyColor}_${patternColor}`, typeIndex, bodyColor, patternColor });
  return fish;
})();

const NAMED_FISH = ALL_FISH.filter(f => OFFICIAL_NAMES.has(`${f.typeIndex}_${f.bodyColor}_${f.patternColor}`));

const SORT_OPTIONS = [
  { value: 'alpha-asc',  label: '↑ A→Z' },
  { value: 'alpha-desc', label: '↓ Z→A' },
  { value: 'untracked',  label: '◯ Da catturare' },
  { value: 'tracked',    label: '✔ Catturati' },
  { value: 'biome',      label: '🌿 Per bioma' },
  { value: 'job',        label: '⚒ Per blocco/job' },
];

const FISH_FOLDER = '__fish__';

export const FOLDER_FILTER_PREFIX = 'folder:';

const folderLabel = (folder) => {
  if (folder === 'root') return 'Generali';
  if (folder === FISH_FOLDER) return 'Tropical Fish';
  if (folder.startsWith('special:')) return folder.replace('special:', '');
  return folder.charAt(0).toUpperCase() + folder.slice(1);
};

// Card-cartella
const FolderCard = ({ folderKey, mobs, trackedMobs, isOpen, onToggle }) => {
  const trackedCount = mobs.filter(m => trackedMobs[m.fileName]).length;
  const total = mobs.length;
  const pct = total > 0 ? Math.round((trackedCount / total) * 100) : 0;
  const firstMob = mobs[0];
  const isSpecial = folderKey.startsWith('special:');
  const label = folderLabel(folderKey);

  return (
    <div
      onClick={onToggle}
      className={`group cursor-pointer border-4 transition-all select-none
        ${isOpen
          ? isSpecial ? 'border-purple-400 bg-purple-950/80' : 'border-blue-400 bg-blue-950/80'
          : isSpecial ? 'border-purple-700 bg-stone-800 hover:border-purple-400' : 'border-blue-700 bg-stone-800 hover:border-blue-400'
        }`}
    >
      <div className="aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden">
        {firstMob && (
          <img src={firstMob.image} alt={label} draggable={false}
            className="max-w-full max-h-full object-contain pixelated opacity-60 group-hover:opacity-80 transition-opacity select-none" />
        )}
        <div className="absolute inset-0 flex flex-col items-center justify-center bg-black/40">
          <span className={`text-2xl leading-none ${isSpecial ? 'text-purple-300' : 'text-blue-300'}`}>
            {isOpen ? '▼' : '▶'}
          </span>
        </div>
        <div className={`absolute top-1 right-1 text-[9px] px-1.5 py-0.5 border-2 border-stone-900 leading-none
          ${pct === 100 ? 'bg-green-700 text-green-200' : isSpecial ? 'bg-purple-900 text-purple-200' : 'bg-blue-900 text-blue-200'}`}>
          {trackedCount}/{total}
        </div>
      </div>
      <div className={`p-1 border-t-4 ${isOpen
        ? isSpecial ? 'bg-purple-900 border-purple-600' : 'bg-blue-900 border-blue-600'
        : isSpecial ? 'bg-purple-950 border-purple-800' : 'bg-blue-950 border-blue-800'
      }`}>
        <p className={`text-[10px] leading-tight uppercase truncate px-1 text-center ${isSpecial ? 'text-purple-200' : 'text-blue-200'}`}>
          {label}
        </p>
        <div className="mt-1 h-1 bg-stone-900 mx-1">
          <div className={`h-full transition-all duration-500 ${pct === 100 ? 'bg-green-400' : isSpecial ? 'bg-purple-500' : 'bg-blue-500'}`}
            style={{ width: `${pct}%` }} />
        </div>
      </div>
    </div>
  );
};

const MobTracker = () => {
  const [allMobs, setAllMobs]               = useState([]);
  const [trackedMobs, setTrackedMobs]       = useState(() => JSON.parse(localStorage.getItem('mobTracker_saves') || '{}'));
  const [variantMode, setVariantMode]       = useState(() => localStorage.getItem('mobTracker_mode') || 'main');
  const [showAllFish, setShowAllFish]       = useState(() => localStorage.getItem('mobTracker_showAllFish') === 'true');
  const [searchQuery, setSearchQuery]       = useState('');
  const [showSettings, setShowSettings]     = useState(false);
  const [showStats, setShowStats]           = useState(false);
  const [selectedFolder, setSelectedFolder] = useState('all');
  const [showFish, setShowFish]             = useState(false);
  const [sortBy, setSortBy]                 = useState(() => localStorage.getItem('mobTracker_sort') || 'alpha-asc');
  const [sortOpen, setSortOpen]             = useState(false);
  const [groupByFolder, setGroupByFolder]   = useState(() => localStorage.getItem('mobTracker_groupByFolder') === 'true');
  const [openFolders, setOpenFolders]       = useState(() => {
    try { return new Set(JSON.parse(localStorage.getItem('mobTracker_openFolders') || '[]')); }
    catch { return new Set(); }
  });

  const searchRef = useRef(null);
  const sortRef   = useRef(null);

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
        const parts     = path.split('/');
        const dataIdx   = parts.indexOf('data');
        const fileName  = parts[parts.length - 1];
        const afterData = parts.slice(dataIdx + 1, -1);
        let folder = 'root';
        let specialSuffixId = null;
        if (afterData.length === 0) {
          folder = 'root';
        } else if (afterData[0].toLowerCase() === 'special' && afterData[1]) {
          specialSuffixId = SpecialFolderMap[afterData[1].toLowerCase()] ?? null;
          folder = `special:${afterData[1]}`;
        } else {
          folder = afterData[0];
        }
        const uniqueKey = path.replace('/public/', '');
        return {
          ...parseFileName(fileName, path),
          image: path.replace('/public', ''),
          fileName: uniqueKey,
          displayFileName: fileName,
          folder,
          specialSuffixId,
        };
      }).sort((a, b) => a.name.localeCompare(b.name));
      setAllMobs(data);
    };
    load();
  }, []);

  useEffect(() => {
    if (allMobs.length === 0) return;
    setFilters(prev => {
      const next = { ...prev };
      allMobs.forEach(m => {
        if (m.folder !== 'root' && !m.folder.startsWith('special:')) {
          const key = `${FOLDER_FILTER_PREFIX}${m.folder}`;
          if (next[key] === undefined) next[key] = true;
        }
      });
      return next;
    });
  }, [allMobs]);

  useEffect(() => {
    if (selectedFolder === FISH_FOLDER) setShowFish(true);
  }, [selectedFolder]);

  useEffect(() => {
    if (!sortOpen) return;
    const handler = (e) => { if (sortRef.current && !sortRef.current.contains(e.target)) setSortOpen(false); };
    window.addEventListener('mousedown', handler);
    return () => window.removeEventListener('mousedown', handler);
  }, [sortOpen]);

  useEffect(() => {
    const handleKey = (e) => {
      if (e.key === 'Escape') {
        if (sortOpen)                        { setSortOpen(false);     return; }
        if (showSettings)                    { setShowSettings(false); return; }
        if (showStats)                       { setShowStats(false);    return; }
        if (searchQuery)                     { setSearchQuery('');     return; }
        if (selectedFolder !== 'all')        { setSelectedFolder('all'); return; }
      }
      if (e.key === ' ' && !['INPUT','SELECT','TEXTAREA'].includes(document.activeElement.tagName)) {
        e.preventDefault();
        searchRef.current?.focus();
      }
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [showSettings, showStats, searchQuery, selectedFolder, sortOpen]);

  useEffect(() => { localStorage.setItem('mobTracker_saves',         JSON.stringify(trackedMobs));       }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('mobTracker_filters',       JSON.stringify(filters));           }, [filters]);
  useEffect(() => { localStorage.setItem('mobTracker_mode',          variantMode);                      }, [variantMode]);
  useEffect(() => { localStorage.setItem('mobTracker_showAllFish',   String(showAllFish));               }, [showAllFish]);
  useEffect(() => { localStorage.setItem('mobTracker_sort',          sortBy);                           }, [sortBy]);
  useEffect(() => { localStorage.setItem('mobTracker_groupByFolder', String(groupByFolder));            }, [groupByFolder]);
  useEffect(() => { localStorage.setItem('mobTracker_openFolders',   JSON.stringify([...openFolders])); }, [openFolders]);

  useEffect(() => {
    if (selectedFolder === 'all' || selectedFolder === FISH_FOLDER) return;
    if (selectedFolder.startsWith('special:')) {
      const mob = allMobs.find(m => m.folder === selectedFolder);
      if (mob?.specialSuffixId && !filters[mob.specialSuffixId]) setSelectedFolder('all');
    } else {
      if (filters[`${FOLDER_FILTER_PREFIX}${selectedFolder}`] === false) setSelectedFolder('all');
    }
  }, [filters, selectedFolder, allMobs]);

  const folderList = useMemo(() => {
    const set = new Set();
    allMobs.forEach(m => {
      if (m.folder !== 'root' && !m.folder.startsWith('special:')) set.add(m.folder);
    });
    return Array.from(set).sort().map(f => ({
      id: `${FOLDER_FILTER_PREFIX}${f}`,
      label: f.charAt(0).toUpperCase() + f.slice(1),
    }));
  }, [allMobs]);

  const specialBtns = useMemo(() => {
    const map = new Map();
    allMobs.forEach(m => {
      if (m.specialSuffixId && !map.has(m.folder)) {
        const config = SuffixConfig[m.specialSuffixId];
        map.set(m.folder, { folderKey: m.folder, suffixId: m.specialSuffixId, label: config?.label ?? m.specialSuffixId });
      }
    });
    return Array.from(map.values()).filter(b => filters[b.suffixId]);
  }, [allMobs, filters]);

  const normalFolderBtns = useMemo(() => {
    const set = new Set();
    allMobs.forEach(m => { if (m.folder !== 'root' && !m.folder.startsWith('special:')) set.add(m.folder); });
    return Array.from(set).sort().filter(f => filters[`${FOLDER_FILTER_PREFIX}${f}`] !== false);
  }, [allMobs, filters]);

  // Tutti i bottoni normali + fish, ordinati alfabeticamente insieme
  const allFolderBtns = useMemo(() => {
    const btns = normalFolderBtns.map(f => ({ key: f, label: f.charAt(0).toUpperCase() + f.slice(1), type: 'normal' }));
    btns.push({ key: FISH_FOLDER, label: 'Tropical Fish', type: 'fish' });
    return btns.sort((a, b) => a.label.localeCompare(b.label));
  }, [normalFolderBtns]);

  const selectedSpecialSuffixId = useMemo(() => {
    if (!selectedFolder.startsWith('special:')) return null;
    return specialBtns.find(b => b.folderKey === selectedFolder)?.suffixId ?? null;
  }, [selectedFolder, specialBtns]);

  const getMobSearchString = (mob) => {
    const shortLabels = [...new Set(mob.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))];
    return [mob.name, ...shortLabels].join(' ').toLowerCase();
  };

  const sortMobs = (mobs, sortKey, tracked) => {
    const arr = [...mobs];
    switch (sortKey) {
      case 'alpha-asc':  return arr.sort((a, b) => a.name.localeCompare(b.name));
      case 'alpha-desc': return arr.sort((a, b) => b.name.localeCompare(a.name));
      case 'untracked':
        return arr.sort((a, b) => {
          const d = (tracked[a.fileName] ? 1 : 0) - (tracked[b.fileName] ? 1 : 0);
          return d !== 0 ? d : a.name.localeCompare(b.name);
        });
      case 'tracked':
        return arr.sort((a, b) => {
          const d = (tracked[b.fileName] ? 1 : 0) - (tracked[a.fileName] ? 1 : 0);
          return d !== 0 ? d : a.name.localeCompare(b.name);
        });
      case 'biome': {
        const getLabel = (mob) => {
          const config = ComplexConfig.find(c => c.id === mob.complexId);
          return config?.useVillagerIcons && mob.num1 != null ? (VillagerBiomes?.[mob.num1]?.label ?? '') : '';
        };
        return arr.sort((a, b) => {
          const ba = getLabel(a), bb = getLabel(b);
          if (ba !== bb) { if (!ba) return 1; if (!bb) return -1; return ba.localeCompare(bb); }
          return a.name.localeCompare(b.name);
        });
      }
      case 'job': {
        const getLabel = (mob) => {
          const config = ComplexConfig.find(c => c.id === mob.complexId);
          return config?.useVillagerIcons && mob.num2 != null ? (VillagerJobs?.[mob.num2]?.label ?? '') : '';
        };
        return arr.sort((a, b) => {
          const ja = getLabel(a), jb = getLabel(b);
          if (ja !== jb) { if (!ja) return 1; if (!jb) return -1; return ja.localeCompare(jb); }
          return a.name.localeCompare(b.name);
        });
      }
      default: return arr;
    }
  };

  const isFishOnly = selectedFolder === FISH_FOLDER;

  const displayedMobs = useMemo(() => {
    if (isFishOnly) return [];
    const filtered = allMobs.filter(mob => {
      if (searchQuery) {
        const words = searchQuery.toLowerCase().trim().split(/\s+/);
        if (!words.every(w => getMobSearchString(mob).includes(w))) return false;
      }
      if (selectedFolder !== 'all') {
        if (selectedSpecialSuffixId) {
          // FIX: la condizione era "!mob.folder === selectedFolder" che è sempre false
          // Ora: mostra solo i mob che appartengono alla cartella speciale selezionata
          // oppure che hanno il suffisso speciale attivo
          if (mob.folder !== selectedFolder && !mob.activeSuffixes.includes(selectedSpecialSuffixId) && mob.specialSuffixId !== selectedSpecialSuffixId) return false;
        } else {
          if (mob.folder !== selectedFolder) return false;
        }
      }
      if (mob.specialSuffixId && !filters[mob.specialSuffixId]) return false;
      for (const suffix of mob.activeSuffixes) { if (!filters[suffix]) return false; }
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
    return sortMobs(filtered, sortBy, trackedMobs);
  }, [allMobs, filters, variantMode, searchQuery, selectedFolder, selectedSpecialSuffixId, sortBy, trackedMobs, isFishOnly]);

  const disabledFolders = useMemo(() => {
    const set = new Set();
    Object.entries(filters).forEach(([key, val]) => {
      if (key.startsWith(FOLDER_FILTER_PREFIX) && val === false)
        set.add(key.slice(FOLDER_FILTER_PREFIX.length));
    });
    return set;
  }, [filters]);

  const groupedMobs = useMemo(() => {
    if (!groupByFolder) return null;
    const map = new Map();
    displayedMobs.forEach(mob => {
      const effectiveFolder = (!mob.folder.startsWith('special:') && disabledFolders.has(mob.folder))
        ? 'root' : mob.folder;
      if (!map.has(effectiveFolder)) map.set(effectiveFolder, []);
      map.get(effectiveFolder).push(mob);
    });
    return Array.from(map.entries()).sort(([a], [b]) => {
      if (a === 'root') return -1;
      if (b === 'root') return 1;
      const aSpec = a.startsWith('special:');
      const bSpec = b.startsWith('special:');
      if (aSpec && !bSpec) return 1;
      if (!aSpec && bSpec) return -1;
      return a.localeCompare(b);
    });
  }, [displayedMobs, groupByFolder, disabledFolders]);

  const gridItems = useMemo(() => {
    if (!groupByFolder || !groupedMobs) return null;
    const items = [];
    for (const [folderKey, mobs] of groupedMobs) {
      items.push({ type: 'folder', folderKey, mobs });
      if (openFolders.has(folderKey)) {
        for (const mob of mobs) items.push({ type: 'mob', mob });
      }
    }
    return items;
  }, [groupedMobs, openFolders]);

  const toggleFolder = (folderKey) => {
    setOpenFolders(prev => {
      const next = new Set(prev);
      if (next.has(folderKey)) next.delete(folderKey);
      else next.add(folderKey);
      return next;
    });
  };

  const fishPool = useMemo(() => {
    if (variantMode === 'none') return [ALL_FISH.find(f => `${f.typeIndex}_${f.bodyColor}_${f.patternColor}` === '0_1_0') ?? ALL_FISH[0]];
    if (variantMode === 'main') return NAMED_FISH;
    return showAllFish ? ALL_FISH : NAMED_FISH;
  }, [variantMode, showAllFish]);

  const displayedFish = useMemo(() => {
    if (!showFish || fishPool.length === 0) return [];
    if (!searchQuery) return fishPool;
    const words = searchQuery.toLowerCase().trim().split(/\s+/);
    return fishPool.filter(f => {
      const key = `${f.typeIndex}_${f.bodyColor}_${f.patternColor}`;
      const officialName = OFFICIAL_NAMES.get(key) || '';
      const str = `${FISH_TYPES[f.typeIndex].name} ${COLOR_NAMES[f.bodyColor]} ${COLOR_NAMES[f.patternColor]} tropical ${officialName}`.toLowerCase();
      return words.every(w => str.includes(w));
    });
  }, [showFish, fishPool, searchQuery]);

  const fishTrackedCount = useMemo(() => fishPool.filter(f => trackedMobs[f.id]).length, [fishPool, trackedMobs]);
  const mobTrackedCount  = useMemo(() => displayedMobs.filter(m => trackedMobs[m.fileName]).length, [displayedMobs, trackedMobs]);

  const totalTracked   = isFishOnly ? fishTrackedCount : selectedFolder === 'all' ? mobTrackedCount + fishTrackedCount : mobTrackedCount;
  const totalDisplayed = isFishOnly ? fishPool.length  : selectedFolder === 'all' ? displayedMobs.length + fishPool.length : displayedMobs.length;

  const toggleMob = (id) => setTrackedMobs(p => ({ ...p, [id]: !p[id] }));
  const currentSortLabel = SORT_OPTIONS.find(o => o.value === sortBy)?.label ?? '↑ A→Z';
  const showFishSection = selectedFolder === 'all' || isFishOnly;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">
      {showSettings && (
        <Settings
          variantMode={variantMode} setVariantMode={setVariantMode}
          filters={filters} toggleFilter={(id) => setFilters(p => ({ ...p, [id]: !p[id] }))} setFilters={setFilters}
          showAllFish={showAllFish} setShowAllFish={setShowAllFish}
          folderList={folderList}
          resetAll={() => confirm('Sei sicuro di voler resettare tutti i progressi?') && setTrackedMobs({})}
          onClose={() => setShowSettings(false)}
        />
      )}
      {showStats && <Stats allMobs={allMobs} trackedMobs={trackedMobs} onClose={() => setShowStats(false)} />}

      <div className="flex-1 p-4 md:p-6">
        <div className="max-w-[1600px] mx-auto">
          <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
            <div className="flex flex-col lg:flex-row justify-between items-center gap-6 mb-6">
              <h1 className="text-4xl md:text-5xl lg:text-6xl text-green-400 drop-shadow-md uppercase whitespace-nowrap">Mob Tracker</h1>

              <div className="flex flex-col sm:flex-row gap-3 w-full lg:w-3/4 justify-end items-stretch">
                <button
                  onClick={() => setGroupByFolder(v => !v)}
                  title={groupByFolder ? 'Disattiva raggruppamento cartelle' : 'Raggruppa per cartella'}
                  className={`shrink-0 flex items-center justify-center gap-2 px-3 py-2 border-4 text-sm uppercase transition-colors
                    ${groupByFolder
                      ? 'bg-blue-800 border-blue-500 text-blue-200 hover:bg-blue-700'
                      : 'bg-stone-900 border-stone-700 text-stone-500 hover:border-stone-500 hover:text-stone-300'
                    }`}
                >
                  <span className="text-base leading-none">▤</span>
                  <span className="hidden sm:inline text-xs">Cartelle</span>
                </button>

                <div ref={sortRef} className="relative shrink-0">
                  <button
                    onClick={() => setSortOpen(v => !v)}
                    className="w-full h-full bg-black border-4 border-stone-700 px-4 py-2 text-sm uppercase text-stone-300 hover:border-stone-500 hover:text-white transition-colors flex items-center gap-2 whitespace-nowrap"
                  >
                    <span className="text-stone-500 text-xs uppercase">Ordina</span>
                    <span>{currentSortLabel}</span>
                    <span className="text-stone-500 text-xs ml-1">{sortOpen ? '▲' : '▼'}</span>
                  </button>
                  {sortOpen && (
                    <div className="absolute top-full left-0 mt-1 bg-stone-900 border-4 border-stone-600 z-50 min-w-full shadow-2xl">
                      {SORT_OPTIONS.map(opt => (
                        <button key={opt.value}
                          onClick={() => { setSortBy(opt.value); setSortOpen(false); }}
                          className={`w-full text-left px-4 py-2 text-sm uppercase whitespace-nowrap transition-colors
                            ${sortBy === opt.value ? 'bg-green-800 text-green-200' : 'text-stone-300 hover:bg-stone-700 hover:text-white'}`}
                        >{opt.label}</button>
                      ))}
                    </div>
                  )}
                </div>

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
                    <button onClick={() => setSearchQuery('')} className="absolute right-3 top-1/2 -translate-y-1/2 text-stone-400 hover:text-white text-xl pb-1">X</button>
                  )}
                </div>

                <div className="flex gap-3 shrink-0">
                  <button onClick={() => setShowStats(true)}    className="bg-blue-800 hover:bg-blue-700 px-6 py-2 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0">Stats</button>
                  <button onClick={() => setShowSettings(true)} className="bg-stone-700 hover:bg-stone-600 px-6 py-2 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0">Settings</button>
                </div>
              </div>
            </div>

            {/* Barra filtri */}
            <div className="mb-4 flex flex-wrap gap-2 items-center">
              {/* Tutti */}
              <button onClick={() => setSelectedFolder('all')}
                className={`px-3 py-1 text-sm uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0
                  ${selectedFolder === 'all' ? 'bg-green-700 border-green-900 text-white' : 'bg-stone-700 border-stone-900 text-stone-300 hover:bg-stone-600'}`}
              >Tutti</button>

              {/* Cartelle speciali (baby, jockey ecc.) */}
              {specialBtns.length > 0 && (
                <><span className="text-stone-600 select-none">|</span>
                {specialBtns.map(b => (
                  <button key={b.folderKey} onClick={() => setSelectedFolder(b.folderKey)}
                    className={`px-3 py-1 text-sm uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0
                      ${selectedFolder === b.folderKey ? 'bg-purple-600 border-purple-900 text-white' : 'bg-purple-900 border-purple-950 text-purple-300 hover:bg-purple-800'}`}
                  >✦ {b.label}</button>
                ))}</>
              )}

              {/* Cartelle normali + fish in ordine alfabetico */}
              {allFolderBtns.length > 0 && (
                <><span className="text-stone-600 select-none">|</span>
                {allFolderBtns.map(btn =>
                  btn.type === 'fish'
                    ? (
                      <button key={btn.key} onClick={() => setSelectedFolder(FISH_FOLDER)}
                        className={`px-3 py-1 text-sm uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0
                          ${selectedFolder === FISH_FOLDER ? 'bg-cyan-700 border-cyan-900 text-white' : 'bg-cyan-900 border-cyan-950 text-cyan-300 hover:bg-cyan-800'}`}
                      >🐠 {btn.label}</button>
                    )
                    : (
                      <button key={btn.key} onClick={() => setSelectedFolder(btn.key)}
                        className={`px-3 py-1 text-sm uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0
                          ${selectedFolder === btn.key ? 'bg-green-700 border-green-900 text-white' : 'bg-stone-700 border-stone-900 text-stone-300 hover:bg-stone-600'}`}
                      >{btn.label}</button>
                    )
                )}
                </>
              )}
            </div>

            <div className="bg-black/50 p-4 border-4 border-stone-700">
              <div className="flex justify-between mb-2 text-xl uppercase">
                <span>Progress</span>
                <span>{totalTracked} / {totalDisplayed} ({totalDisplayed > 0 ? Math.round((totalTracked / totalDisplayed) * 100) : 0}%)</span>
              </div>
              <div className="h-6 bg-stone-900 border-2 border-stone-700 p-1">
                <div className="h-full bg-green-500 transition-all duration-500" style={{ width: `${totalDisplayed > 0 ? (totalTracked / totalDisplayed) * 100 : 0}%` }} />
              </div>
            </div>
          </header>

          {/* Griglia mob */}
          {!isFishOnly && (
            <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 xl:grid-cols-10 gap-3 mb-6">
              {!groupByFolder
                ? displayedMobs.map(mob => (
                    <MobCard key={mob.fileName} mob={mob} isTracked={trackedMobs[mob.fileName]} onToggle={() => toggleMob(mob.fileName)} />
                  ))
                : gridItems.map((item, i) =>
                    item.type === 'folder'
                      ? <FolderCard key={`folder_${item.folderKey}`} folderKey={item.folderKey} mobs={item.mobs}
                          trackedMobs={trackedMobs} isOpen={openFolders.has(item.folderKey)} onToggle={() => toggleFolder(item.folderKey)} />
                      : <MobCard key={item.mob.fileName} mob={item.mob} isTracked={trackedMobs[item.mob.fileName]} onToggle={() => toggleMob(item.mob.fileName)} />
                  )
              }
            </div>
          )}

          {/* Sezione Tropical Fish */}
          {showFishSection && (
            <div className="bg-stone-800 border-4 border-cyan-900 rounded-lg mb-6">
              <button onClick={() => setShowFish(v => !v)}
                className="w-full flex justify-between items-center px-6 py-4 hover:bg-stone-700 transition-colors"
              >
                <div className="flex items-center gap-3">
                  <span className="text-2xl text-cyan-400 uppercase">🐠 Tropical Fish</span>
                  <span className="bg-cyan-900 text-cyan-300 text-sm px-2 py-0.5 border-2 border-cyan-800">
                    {fishTrackedCount} / {fishPool.length}
                  </span>
                  <span className="text-stone-500 text-sm uppercase">
                    {variantMode === 'none' ? '(1 base)' : variantMode === 'main' ? '(22 named)' : showAllFish ? '(3072 tutte)' : '(22 named)'}
                  </span>
                </div>
                <span className="text-stone-400 text-xl">{showFish ? '▲' : '▼'}</span>
              </button>
              {showFish && (
                <div className="p-4 border-t-4 border-cyan-900">
                  <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 xl:grid-cols-12 gap-2" style={{ position: 'relative', zIndex: 1 }}>
                    {displayedFish.map(fish => (
                      <TropicalFishCard key={fish.id} fish={fish} isTracked={trackedMobs[fish.id]} onToggle={() => toggleMob(fish.id)} />
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}

        </div>
      </div>

      <Footer />
    </div>
  );
};

export default MobTracker;