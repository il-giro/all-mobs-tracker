import { useState, useEffect, useMemo, useRef } from 'react';
import { useNavigate } from 'react-router-dom';
import Settings from '../components/Settings';
import MobCard from '../components/MobCard';
import TropicalFishCard from '../components/TropicalFishCard';
import { FISH_TYPES, COLOR_NAMES } from '../utils/FishRenderer';
import { OFFICIAL_NAMES } from '../components/TropicalFishCard';
import Stats from '../components/Stats';
import { parseFileName } from '../utils/mobParser';
import { SuffixConfig, ComplexConfig, SpecialFolderMap } from '../config/mobConfig';
import { VillagerBiomes, VillagerJobs } from '../config/mobIcons';
import { MobCategories } from '../config/mobCategories';
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

// Mappa inversa SpecialFolderMap: suffixId → folderKey
// es: 'A' → 'special:baby breed'
const SUFFIX_TO_FOLDER = Object.fromEntries(
  Object.entries(SpecialFolderMap).map(([folderName, suffixId]) => [suffixId, `special:${folderName}`])
);

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
  const [capturedMobs, setCapturedMobs]     = useState(() => JSON.parse(localStorage.getItem('mobTracker_captured') || '{}'));
  const [captureMode, setCaptureMode]       = useState(() => localStorage.getItem('mobTracker_captureMode') === 'true');
  const [selectionMode, setSelectionMode]   = useState(() => localStorage.getItem('mobTracker_selectionMode') === 'true');
  const [confirmAdd, setConfirmAdd]         = useState(() => localStorage.getItem('mobTracker_confirmAdd') === 'true');
  const [confirmRemove, setConfirmRemove]   = useState(() => localStorage.getItem('mobTracker_confirmRemove') === 'true');
  const [selectedMobs, setSelectedMobs]     = useState(new Set());
  const [pendingAction, setPendingAction]   = useState(null);
  const undoStack = useRef([]);
  const redoStack = useRef([]);
  const applyDragRef    = useRef(null);
  const capturedMobsRef = useRef(capturedMobs);
  const trackedMobsRef  = useRef(trackedMobs);
  const captureModeRef  = useRef(captureMode);

  useEffect(() => { capturedMobsRef.current = capturedMobs; }, [capturedMobs]);
  useEffect(() => { trackedMobsRef.current  = trackedMobs;  }, [trackedMobs]);
  useEffect(() => { captureModeRef.current  = captureMode;  }, [captureMode]);

  const [variantMode, setVariantMode]       = useState(() => localStorage.getItem('mobTracker_mode') || 'main');
  const [showAllFish, setShowAllFish]       = useState(() => localStorage.getItem('mobTracker_showAllFish') === 'true');
  const [searchQuery, setSearchQuery]       = useState('');
  const [showSettings, setShowSettings]     = useState(false);
  const navigate = useNavigate();
  const [showStats, setShowStats]           = useState(false);
  const [showCategories, setShowCategories] = useState(false);
  const [selectedFolder, setSelectedFolder] = useState('all');
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
    defaults[`${FOLDER_FILTER_PREFIX}${FISH_FOLDER}`] = true;
    defaults[`variants:${FISH_FOLDER}`] = true;
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
          const folderKey   = `${FOLDER_FILTER_PREFIX}${m.folder}`;
          const variantsKey = `variants:${m.folder}`;
          if (next[folderKey]   === undefined) next[folderKey]   = true;
          if (next[variantsKey] === undefined) next[variantsKey] = true;
        }
      });
      return next;
    });
  }, [allMobs]);

  useEffect(() => {
    if (!sortOpen) return;
    const handler = (e) => { if (sortRef.current && !sortRef.current.contains(e.target)) setSortOpen(false); };
    window.addEventListener('mousedown', handler);
    return () => window.removeEventListener('mousedown', handler);
  }, [sortOpen]);

  const commitAction = (fn) => {
    undoStack.current.push({ trackedMobs: { ...trackedMobs }, capturedMobs: { ...capturedMobs } });
    if (undoStack.current.length > 50) undoStack.current.shift();
    redoStack.current = [];
    fn();
  };

  const undo = () => {
    if (undoStack.current.length === 0) return;
    redoStack.current.push({ trackedMobs: { ...trackedMobs }, capturedMobs: { ...capturedMobs } });
    const prev = undoStack.current.pop();
    setTrackedMobs(prev.trackedMobs);
    setCapturedMobs(prev.capturedMobs);
  };

  const redo = () => {
    if (redoStack.current.length === 0) return;
    undoStack.current.push({ trackedMobs: { ...trackedMobs }, capturedMobs: { ...capturedMobs } });
    const next = redoStack.current.pop();
    setTrackedMobs(next.trackedMobs);
    setCapturedMobs(next.capturedMobs);
  };

  useEffect(() => {
    const handleKey = (e) => {
      const tag = document.activeElement.tagName;
      if (e.key === 'Escape') {
        if (sortOpen)                        { setSortOpen(false);     return; }
        if (showSettings)                    { setShowSettings(false); return; }
        if (showStats)                       { setShowStats(false);    return; }
        if (showCategories)                  { setShowCategories(false); return; }
        if (pendingAction)                   { setPendingAction(null); return; }
        if (searchQuery)                     { setSearchQuery('');     return; }
        if (selectedFolder !== 'all')        { setSelectedFolder('all'); return; }
      }
      if (e.key === 'z' && (e.ctrlKey || e.metaKey) && !e.shiftKey && !['INPUT','SELECT','TEXTAREA'].includes(tag)) {
        e.preventDefault(); undo(); return;
      }
      if ((e.key === 'y' && (e.ctrlKey || e.metaKey) || e.key === 'z' && (e.ctrlKey || e.metaKey) && e.shiftKey) && !['INPUT','SELECT','TEXTAREA'].includes(tag)) {
        e.preventDefault(); redo(); return;
      }
      if (e.key === ' ' && !['INPUT','SELECT','TEXTAREA'].includes(tag)) {
        e.preventDefault();
        searchRef.current?.focus();
      }
    };
    window.addEventListener('keydown', handleKey);
    return () => window.removeEventListener('keydown', handleKey);
  }, [showSettings, showStats, showCategories, searchQuery, selectedFolder, sortOpen, pendingAction, trackedMobs, capturedMobs]);

  useEffect(() => { localStorage.setItem('mobTracker_saves',         JSON.stringify(trackedMobs));       }, [trackedMobs]);
  useEffect(() => { localStorage.setItem('mobTracker_captured',      JSON.stringify(capturedMobs));      }, [capturedMobs]);
  useEffect(() => { localStorage.setItem('mobTracker_captureMode',   String(captureMode));               }, [captureMode]);
  useEffect(() => { localStorage.setItem('mobTracker_selectionMode', String(selectionMode));             }, [selectionMode]);
  useEffect(() => { localStorage.setItem('mobTracker_confirmAdd',    String(confirmAdd));                }, [confirmAdd]);
  useEffect(() => { localStorage.setItem('mobTracker_confirmRemove', String(confirmRemove));             }, [confirmRemove]);
  useEffect(() => { localStorage.setItem('mobTracker_filters',       JSON.stringify(filters));           }, [filters]);
  useEffect(() => { localStorage.setItem('mobTracker_mode',          variantMode);                      }, [variantMode]);
  useEffect(() => { localStorage.setItem('mobTracker_showAllFish',   String(showAllFish));               }, [showAllFish]);
  useEffect(() => { localStorage.setItem('mobTracker_sort',          sortBy);                           }, [sortBy]);
  useEffect(() => { localStorage.setItem('mobTracker_groupByFolder', String(groupByFolder));            }, [groupByFolder]);
  useEffect(() => { localStorage.setItem('mobTracker_openFolders',   JSON.stringify([...openFolders])); }, [openFolders]);

  useEffect(() => {
    if (selectedFolder === 'all' || selectedFolder === FISH_FOLDER) return;
    if (selectedFolder.startsWith('special:')) {
      // Ricava il suffixId dalla cartella selezionata usando SpecialFolderMap
      const folderName = selectedFolder.replace('special:', '').toLowerCase();
      const suffixId = SpecialFolderMap[folderName];
      if (suffixId && !filters[suffixId]) setSelectedFolder('all');
    } else {
      if (filters[`${FOLDER_FILTER_PREFIX}${selectedFolder}`] === false) setSelectedFolder('all');
    }
  }, [filters, selectedFolder, allMobs]);

  const folderList = useMemo(() => {
    const set = new Set();
    allMobs.forEach(m => {
      if (m.folder !== 'root' && !m.folder.startsWith('special:')) set.add(m.folder);
    });
    return Array.from(set).sort().map(f => {
      const linked = ComplexConfig.find(c => c.pathIncludes?.includes(`/${f}/`));
      return {
        id:             `${FOLDER_FILTER_PREFIX}${f}`,
        variantsId:     `variants:${f}`,
        label:          f.charAt(0).toUpperCase() + f.slice(1),
        linkedComplexId: linked?.id ?? null,
      };
    });
  }, [allMobs]);

  // ─── FIX PRINCIPALE ───────────────────────────────────────────────────────────
  // specialBtns è costruito a partire da SpecialFolderMap (fonte di verità),
  // così le cartelle speciali appaiono anche se sono vuote (nessun mob caricato),
  // purché il loro toggle sia attivo nei filtri.
  const specialBtns = useMemo(() => {
    // Mappa folderKey → dati del bottone
    const map = new Map();

    // Prima aggiungi tutte le entry da SpecialFolderMap, indipendentemente da allMobs
    Object.entries(SpecialFolderMap).forEach(([folderName, suffixId]) => {
      const config = SuffixConfig[suffixId];
      if (!config) return;
      const folderKey = `special:${folderName}`;
      map.set(folderKey, {
        folderKey,
        suffixId,
        label: config.label ?? suffixId,
      });
    });

    // Poi aggiusta con i dati reali di allMobs (per avere il folderKey esatto
    // con la capitalizzazione reale della cartella su disco, es: "Baby Breed")
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

    // Mostra solo le cartelle il cui toggle è attivo
    return Array.from(map.values()).filter(b => filters[b.suffixId]);
  }, [allMobs, filters]);
  // ─────────────────────────────────────────────────────────────────────────────

  const normalFolderBtns = useMemo(() => {
    const set = new Set();
    allMobs.forEach(m => { if (m.folder !== 'root' && !m.folder.startsWith('special:')) set.add(m.folder); });
    return Array.from(set).sort().filter(f => filters[`${FOLDER_FILTER_PREFIX}${f}`] !== false);
  }, [allMobs, filters]);

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
          if (mob.folder !== selectedFolder && !mob.activeSuffixes.includes(selectedSpecialSuffixId) && mob.specialSuffixId !== selectedSpecialSuffixId) return false;
        } else {
          if (mob.folder !== selectedFolder) return false;
        }
      }
      if (mob.specialSuffixId && !filters[mob.specialSuffixId]) return false;
      for (const suffix of mob.activeSuffixes) { if (!filters[suffix]) return false; }

      // Se la cartella è speciale, controlla il toggle varianti:special:<suffixId>
      if (mob.folder.startsWith('special:') && mob.specialSuffixId) {
        const specialVarActive = filters[`variants:special:${mob.specialSuffixId}`] !== false;
        if (!specialVarActive) {
          // varianti speciali off → mostra solo il mob base (num1 = 1 o assente, nessun activeSuffix aggiuntivo)
          if ((mob.num1 && mob.num1 > 1) || (mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
        }
      }

      if (mob.folder !== 'root' && !mob.folder.startsWith('special:')) {
        const variantsActive = filters[`variants:${mob.folder}`] !== false;
        if (!variantsActive) {
          if ((mob.num1 && mob.num1 > 1) || (mob.num2 && mob.num2 > 1) || (mob.num3 && mob.num3 > 1)) return false;
          return mob.activeSuffixes.length === 0;
        }
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
    return sortMobs(filtered, sortBy, trackedMobs);
  }, [allMobs, filters, variantMode, searchQuery, selectedFolder, selectedSpecialSuffixId, sortBy, trackedMobs, isFishOnly]);

  const groupedMobs = useMemo(() => {
    if (!groupByFolder) return null;
    const map = new Map();
    displayedMobs.forEach(mob => {
      if (!map.has(mob.folder)) map.set(mob.folder, []);
      map.get(mob.folder).push(mob);
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
  }, [displayedMobs, groupByFolder]);

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

  const fishVisible   = filters[`${FOLDER_FILTER_PREFIX}${FISH_FOLDER}`] !== false;
  const fishVariants  = filters[`variants:${FISH_FOLDER}`] !== false;

  const fishPool = useMemo(() => {
    if (!fishVariants || variantMode === 'none') return [ALL_FISH.find(f => `${f.typeIndex}_${f.bodyColor}_${f.patternColor}` === '0_1_0') ?? ALL_FISH[0]];
    if (variantMode === 'main') return NAMED_FISH;
    return showAllFish ? ALL_FISH : NAMED_FISH;
  }, [variantMode, showAllFish, fishVariants]);

  const showFishSection = selectedFolder === 'all' || isFishOnly;

  const displayedFish = useMemo(() => {
    if (!showFishSection || fishPool.length === 0) return [];
    if (!searchQuery) return fishPool;
    const words = searchQuery.toLowerCase().trim().split(/\s+/);
    return fishPool.filter(f => {
      const key = `${f.typeIndex}_${f.bodyColor}_${f.patternColor}`;
      const officialName = OFFICIAL_NAMES.get(key) || '';
      const str = `${FISH_TYPES[f.typeIndex].name} ${COLOR_NAMES[f.bodyColor]} ${COLOR_NAMES[f.patternColor]} tropical ${officialName}`.toLowerCase();
      return words.every(w => str.includes(w));
    });
  }, [showFishSection, fishPool, searchQuery]);

  const fishTrackedCount   = useMemo(() => displayedFish.filter(f => trackedMobs[f.id]).length,   [displayedFish, trackedMobs]);
  const fishCapturedCount  = useMemo(() => displayedFish.filter(f => capturedMobs[f.id]).length,  [displayedFish, capturedMobs]);
  const mobTrackedCount    = useMemo(() => displayedMobs.filter(m => trackedMobs[m.fileName]).length,  [displayedMobs, trackedMobs]);
  const mobCapturedCount   = useMemo(() => displayedMobs.filter(m => capturedMobs[m.fileName]).length, [displayedMobs, capturedMobs]);

  const totalTracked   = isFishOnly ? fishTrackedCount  : selectedFolder === 'all' ? mobTrackedCount  + fishTrackedCount  : mobTrackedCount;
  const totalCaptured  = isFishOnly ? fishCapturedCount : selectedFolder === 'all' ? mobCapturedCount + fishCapturedCount : mobCapturedCount;
  const totalDisplayed = isFishOnly ? displayedFish.length : selectedFolder === 'all' ? displayedMobs.length + displayedFish.length : displayedMobs.length;

  const getMobName = (id) => {
    const mob = allMobs.find(m => m.fileName === id);
    if (mob) return mob.name;
    return id;
  };

  const isAddAction = (id) => {
    if (captureMode) {
      const wasTracked  = !!trackedMobs[id];
      const wasCaptured = !!capturedMobs[id];
      return !wasTracked && !wasCaptured;
    }
    return !capturedMobs[id];
  };

  const executeToggle = (id) => {
    commitAction(() => {
      if (captureMode) {
        const wasTracked  = !!trackedMobs[id];
        const wasCaptured = !!capturedMobs[id];
        if (!wasTracked && !wasCaptured) {
          setTrackedMobs(p => ({ ...p, [id]: true }));
          setCapturedMobs(p => { const n = { ...p }; delete n[id]; return n; });
        } else if (wasTracked && !wasCaptured) {
          setCapturedMobs(p => ({ ...p, [id]: true }));
        } else {
          setTrackedMobs(p => { const n = { ...p }; delete n[id]; return n; });
          setCapturedMobs(p => { const n = { ...p }; delete n[id]; return n; });
        }
      } else {
        if (!!capturedMobs[id]) {
          setTrackedMobs(p => { const n = { ...p }; delete n[id]; return n; });
          setCapturedMobs(p => { const n = { ...p }; delete n[id]; return n; });
        } else {
          setTrackedMobs(p => ({ ...p, [id]: true }));
          setCapturedMobs(p => ({ ...p, [id]: true }));
        }
      }
    });
  };

  const toggleMob = (id) => {
    const adding   = isAddAction(id);
    const removing = !adding && (captureMode ? !!capturedMobs[id] : !!capturedMobs[id]);
    if (adding && confirmAdd) {
      setPendingAction({ type: 'add', label: getMobName(id), execute: () => executeToggle(id) });
      return;
    }
    if (removing && confirmRemove) {
      setPendingAction({ type: 'remove', label: getMobName(id), execute: () => executeToggle(id) });
      return;
    }
    executeToggle(id);
  };

  const executeApplyDrag = (ids) => {
    commitAction(() => {
      if (captureMode) {
        const allTracked  = [...ids].every(id => !!trackedMobs[id]);
        const allCaptured = [...ids].every(id => !!capturedMobs[id]);
        if (allCaptured) {
          setTrackedMobs(p => { const n = { ...p }; ids.forEach(id => delete n[id]); return n; });
          setCapturedMobs(p => { const n = { ...p }; ids.forEach(id => delete n[id]); return n; });
        } else if (allTracked) {
          setCapturedMobs(p => { const n = { ...p }; ids.forEach(id => { n[id] = true; }); return n; });
        } else {
          setTrackedMobs(p => { const n = { ...p }; ids.forEach(id => { if (!n[id]) n[id] = true; }); return n; });
        }
      } else {
        const allCaptured = [...ids].every(id => !!capturedMobs[id]);
        if (allCaptured) {
          setTrackedMobs(p => { const n = { ...p }; ids.forEach(id => delete n[id]); return n; });
          setCapturedMobs(p => { const n = { ...p }; ids.forEach(id => delete n[id]); return n; });
        } else {
          setTrackedMobs(p => { const n = { ...p }; ids.forEach(id => { n[id] = true; }); return n; });
          setCapturedMobs(p => { const n = { ...p }; ids.forEach(id => { n[id] = true; }); return n; });
        }
      }
    });
  };

  const applyDragSelection = (ids) => {
    if (ids.size === 0) return;
    const allCaptured = [...ids].every(id => !!capturedMobs[id]);
    const isRemoving  = allCaptured;
    if (isRemoving && confirmRemove) {
      setPendingAction({ type: 'remove', label: `${ids.size} mob`, execute: () => executeApplyDrag(ids) });
      return;
    }
    if (!isRemoving && confirmAdd) {
      setPendingAction({ type: 'add', label: `${ids.size} mob`, execute: () => executeApplyDrag(ids) });
      return;
    }
    executeApplyDrag(ids);
  };
  applyDragRef.current = applyDragSelection;

  const gridRef           = useRef(null);
  const selBoxRef         = useRef(null);
  const isDragging        = useRef(false);
  const dragStart         = useRef(null);
  const dragStartedOnCard = useRef(false);
  const selRectRef        = useRef(null);
  const selectedMobsRef   = useRef(new Set());
  const DRAG_THRESHOLD    = 6;
  const [selRect, setSelRect] = useState(null);

  const getCardEls = () => Array.from(document.querySelectorAll('[data-mob-id]'));

  const handleGridMouseDown = (e) => {
    if (!selectionMode || e.button !== 0) return;
    if (showSettings || showStats) return;
    const onCard = !!e.target.closest('[data-mob-id]');
    dragStartedOnCard.current = onCard;
    isDragging.current = true;
    dragStart.current  = { x: e.pageX, y: e.pageY };
    selectedMobsRef.current = new Set();
    if (!onCard) e.preventDefault();
  };

  useEffect(() => {
    if (!selectionMode) {
      setSelectedMobs(new Set());
      if (selBoxRef.current) selBoxRef.current.style.display = 'none';
      return;
    }

    const onMouseMove = (e) => {
      if (!isDragging.current || !dragStart.current) return;
      const px = e.pageX, py = e.pageY;
      const dx = Math.abs(px - dragStart.current.x);
      const dy = Math.abs(py - dragStart.current.y);
      if (dx < DRAG_THRESHOLD && dy < DRAG_THRESHOLD) return;

      dragStartedOnCard.current = false;

      const x = Math.min(px, dragStart.current.x);
      const y = Math.min(py, dragStart.current.y);
      const w = Math.abs(px - dragStart.current.x);
      const h = Math.abs(py - dragStart.current.y);

      selRectRef.current = { x, y, w, h };

      if (selBoxRef.current) {
        selBoxRef.current.style.display = 'block';
        selBoxRef.current.style.left    = `${x}px`;
        selBoxRef.current.style.top     = `${y}px`;
        selBoxRef.current.style.width   = `${w}px`;
        selBoxRef.current.style.height  = `${h}px`;
      }

      const scrollX = window.scrollX, scrollY = window.scrollY;
      const sel = new Set();
      getCardEls().forEach(el => {
        const r = el.getBoundingClientRect();
        const ex = r.left + scrollX, ey = r.top + scrollY;
        const ew = r.width,          eh = r.height;
        if (ex < x + w && ex + ew > x && ey < y + h && ey + eh > y) {
          sel.add(el.dataset.mobId);
          el.dataset.selected = 'true';
        } else {
          delete el.dataset.selected;
        }
      });
      selectedMobsRef.current = sel;
    };

    const onMouseUp = () => {
      if (!isDragging.current) return;
      const wasRealDrag = !!selRectRef.current;
      isDragging.current        = false;
      dragStart.current         = null;
      dragStartedOnCard.current = false;
      selRectRef.current        = null;

      if (selBoxRef.current) selBoxRef.current.style.display = 'none';
      getCardEls().forEach(el => delete el.dataset.selected);

      if (wasRealDrag && selectedMobsRef.current.size > 0) {
        const ids = new Set(selectedMobsRef.current);
        selectedMobsRef.current = new Set();
        applyDragRef.current(ids);
      } else {
        selectedMobsRef.current = new Set();
      }
      setSelectedMobs(new Set());
    };

    const onKeyDown = (e) => {
      if (e.key === 'Escape' && isDragging.current) {
        isDragging.current        = false;
        dragStart.current         = null;
        dragStartedOnCard.current = false;
        selRectRef.current        = null;
        if (selBoxRef.current) selBoxRef.current.style.display = 'none';
        getCardEls().forEach(el => delete el.dataset.selected);
        selectedMobsRef.current = new Set();
        setSelectedMobs(new Set());
      }
    };

    window.addEventListener('mousemove', onMouseMove, { passive: true });
    window.addEventListener('mouseup',   onMouseUp);
    window.addEventListener('keydown',   onKeyDown);
    return () => {
      window.removeEventListener('mousemove', onMouseMove);
      window.removeEventListener('mouseup',   onMouseUp);
      window.removeEventListener('keydown',   onKeyDown);
    };
  }, [selectionMode]);

  const currentSortLabel = SORT_OPTIONS.find(o => o.value === sortBy)?.label ?? '↑ A→Z';

  return (
    <div
      className="min-h-screen bg-[#111] text-stone-100 flex flex-col"
      onMouseDown={handleGridMouseDown}
      style={{ cursor: selectionMode ? 'crosshair' : undefined, position: 'relative' }}
    >
      <style>{`
        [data-mob-id][data-selected="true"] { border-color: #86efac !important; box-shadow: 0 0 0 2px #86efac; }
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-track { background: #0c0c0c; }
        ::-webkit-scrollbar-thumb { background: #44403c; }
        ::-webkit-scrollbar-thumb:hover { background: #78716c; }
      `}</style>

      {/* Dialog conferma */}
      {pendingAction && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/70 backdrop-blur-sm">
          <div className="bg-stone-900 border-4 border-stone-600 shadow-2xl p-8 max-w-sm w-full mx-4">
            <p className="text-xl uppercase text-stone-200 mb-2">
              {pendingAction.type === 'add' ? '➕ Conferma aggiunta' : '🗑 Conferma rimozione'}
            </p>
            <p className="text-stone-400 text-sm uppercase mb-6">
              {pendingAction.type === 'add'
                ? `Aggiungere ${pendingAction.label}?`
                : `Rimuovere ${pendingAction.label}?`}
            </p>
            <div className="flex gap-3">
              <button
                onClick={() => { pendingAction.execute(); setPendingAction(null); }}
                className={`flex-1 py-3 border-b-4 border-black uppercase text-sm transition-transform active:translate-y-1 active:border-b-0
                  ${pendingAction.type === 'add' ? 'bg-green-700 hover:bg-green-600' : 'bg-red-800 hover:bg-red-700'}`}
              >Conferma</button>
              <button
                onClick={() => setPendingAction(null)}
                className="flex-1 py-3 bg-stone-700 hover:bg-stone-600 border-b-4 border-black uppercase text-sm transition-transform active:translate-y-1 active:border-b-0"
              >Annulla</button>
            </div>
          </div>
        </div>
      )}

      {showSettings && (
        <Settings
          variantMode={variantMode} setVariantMode={setVariantMode}
          filters={filters} toggleFilter={(id) => setFilters(p => ({ ...p, [id]: !p[id] }))} setFilters={setFilters}
          showAllFish={showAllFish} setShowAllFish={setShowAllFish}
          folderList={folderList}
          resetAll={() => { if (confirm('Sei sicuro di voler resettare tutti i progressi?')) { setTrackedMobs({}); setCapturedMobs({}); } }}
          onClose={() => setShowSettings(false)}
          captureMode={captureMode} setCaptureMode={setCaptureMode}
          selectionMode={selectionMode} setSelectionMode={setSelectionMode}
          confirmAdd={confirmAdd} setConfirmAdd={setConfirmAdd}
          confirmRemove={confirmRemove} setConfirmRemove={setConfirmRemove}
        />
      )}
      {showStats && <Stats allMobs={allMobs} trackedMobs={trackedMobs} onClose={() => setShowStats(false)} />}

      {/* Modal categorie */}
      {showCategories && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4"
          onClick={() => setShowCategories(false)}
        >
          <div
            className="bg-stone-900 border-4 border-amber-800 shadow-2xl w-full max-w-2xl flex flex-col"
            style={{ maxHeight: '80vh' }}
            onClick={e => e.stopPropagation()}
          >
            {/* Header modal */}
            <div className="flex items-center justify-between px-6 py-4 border-b-4 border-amber-900 shrink-0">
              <span className="text-2xl uppercase text-amber-400 tracking-widest">Categories</span>
              <button
                onClick={() => setShowCategories(false)}
                className="bg-stone-700 hover:bg-stone-600 text-white px-4 py-1.5 text-xs border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0"
              >Close</button>
            </div>

            {/* Lista scrollabile */}
            <div className="overflow-y-auto flex-1 p-4 space-y-2"
              style={{ scrollbarWidth: 'thin', scrollbarColor: '#44403c #0c0c0c' }}
            >
              {MobCategories.map(cat => {
                const colorMap = {
                  amber:  { border: 'border-amber-800',  hover: 'hover:border-amber-500',  text: 'text-amber-400',  bar: 'bg-amber-500'  },
                  blue:   { border: 'border-blue-800',   hover: 'hover:border-blue-500',   text: 'text-blue-400',   bar: 'bg-blue-500'   },
                  green:  { border: 'border-green-800',  hover: 'hover:border-green-500',  text: 'text-green-400',  bar: 'bg-green-500'  },
                  red:    { border: 'border-red-800',    hover: 'hover:border-red-500',    text: 'text-red-400',    bar: 'bg-red-500'    },
                  purple: { border: 'border-purple-800', hover: 'hover:border-purple-500', text: 'text-purple-400', bar: 'bg-purple-500' },
                  cyan:   { border: 'border-cyan-800',   hover: 'hover:border-cyan-500',   text: 'text-cyan-400',   bar: 'bg-cyan-500'   },
                };
                const c = colorMap[cat.color] ?? colorMap.amber;
                return (
                  <button
                    key={cat.id}
                    onClick={() => { setShowCategories(false); navigate(`/categories/${cat.id}`); }}
                    className={`flex items-center gap-4 w-full p-4 border-2 ${c.border} ${c.hover} bg-stone-800 hover:bg-stone-700 transition-all group text-left`}
                  >
                    {/* Icona */}
                    <div className="w-10 h-10 shrink-0 flex items-center justify-center bg-[#181818] border-2 border-stone-700">
                      {cat.icon?.includes('/') || cat.icon?.includes('.')
                        ? <img src={cat.icon} alt={cat.label} className="w-7 h-7 object-contain pixelated" draggable={false} />
                        : <span className={`text-2xl ${c.text}`}>{cat.icon}</span>
                      }
                    </div>
                    {/* Testo */}
                    <div className="flex-1 min-w-0">
                      <p className={`text-sm uppercase ${c.text}`}>{cat.label}</p>
                      {cat.description && (
                        <p className="text-xs text-stone-500 leading-relaxed mt-1 line-clamp-2">{cat.description}</p>
                      )}
                    </div>
                    {/* Freccia */}
                    <span className="text-stone-600 group-hover:text-stone-300 transition-colors shrink-0 text-lg">→</span>
                  </button>
                );
              })}
            </div>
          </div>
        </div>
      )}

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
                  <button onClick={() => setShowCategories(v => !v)} className={`px-6 py-2 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 ${showCategories ? 'bg-amber-700 hover:bg-amber-600' : 'bg-stone-700 hover:bg-stone-600'}`}>Categories</button>
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

              {/* Cartelle speciali — mostrate anche se vuote, purché il toggle sia attivo */}
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
                {allFolderBtns.filter(btn => btn.type !== 'fish' || fishVisible).map(btn =>
                  btn.type === 'fish'
                    ? (
                      <button key={btn.key} onClick={() => setSelectedFolder(FISH_FOLDER)}
                        className={`px-3 py-1 text-sm uppercase border-b-4 transition-all active:translate-y-1 active:border-b-0
                          ${selectedFolder === FISH_FOLDER ? 'bg-green-700 border-green-900 text-white' : 'bg-stone-700 border-stone-900 text-stone-300 hover:bg-stone-600'}`}
                      >{btn.label}</button>
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
                <span>
                  {captureMode
                    ? <>{totalCaptured}<span className="text-green-500">✔</span> {totalTracked - totalCaptured > 0 && <><span className="text-yellow-400">{totalTracked - totalCaptured}👁</span> </>}/ {totalDisplayed} ({totalDisplayed > 0 ? Math.round((totalCaptured / totalDisplayed) * 100) : 0}%)</>
                    : <>{totalCaptured} / {totalDisplayed} ({totalDisplayed > 0 ? Math.round((totalCaptured / totalDisplayed) * 100) : 0}%)</>
                  }
                </span>
              </div>
              <div className="h-6 bg-stone-900 border-2 border-stone-700 p-1 overflow-hidden">
                {captureMode ? (
                  <div className="h-full flex">
                    <div className="h-full bg-green-500 transition-all duration-500"
                      style={{ width: `${totalDisplayed > 0 ? (totalCaptured / totalDisplayed) * 100 : 0}%` }} />
                    <div className="h-full bg-yellow-500 transition-all duration-500"
                      style={{ width: `${totalDisplayed > 0 ? ((totalTracked - totalCaptured) / totalDisplayed) * 100 : 0}%` }} />
                  </div>
                ) : (
                  <div className="h-full bg-green-500 transition-all duration-500"
                    style={{ width: `${totalDisplayed > 0 ? (totalCaptured / totalDisplayed) * 100 : 0}%` }} />
                )}
              </div>
            </div>
          </header>

          {/* Griglia mob */}
          {!isFishOnly && (
            <div
              ref={gridRef}
              className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 xl:grid-cols-10 gap-3 mb-6"
              style={{ userSelect: selectionMode ? 'none' : undefined }}
            >
              {!groupByFolder
                ? displayedMobs.map(mob => (
                    <MobCard key={mob.fileName} mob={mob}
                      isTracked={trackedMobs[mob.fileName]}
                      isCaptured={!!capturedMobs[mob.fileName]}
                      captureMode={captureMode}
                      selectionMode={selectionMode}
                      onToggle={() => toggleMob(mob.fileName)}
                      data-mob-id={mob.fileName}
                    />
                  ))
                : gridItems.map((item, i) =>
                    item.type === 'folder'
                      ? <FolderCard key={`folder_${item.folderKey}`} folderKey={item.folderKey} mobs={item.mobs}
                          trackedMobs={trackedMobs} isOpen={openFolders.has(item.folderKey)} onToggle={() => toggleFolder(item.folderKey)} />
                      : <MobCard key={item.mob.fileName} mob={item.mob}
                          isTracked={trackedMobs[item.mob.fileName]}
                          isCaptured={!!capturedMobs[item.mob.fileName]}
                          captureMode={captureMode}
                          selectionMode={selectionMode}
                          onToggle={() => toggleMob(item.mob.fileName)}
                          data-mob-id={item.mob.fileName}
                        />
                  )
              }

              {/* Messaggio cartella speciale vuota */}
              {!groupByFolder && displayedMobs.length === 0 && selectedFolder.startsWith('special:') && (
                <div className="col-span-full flex flex-col items-center justify-center py-16 text-stone-500">
                  <span className="text-5xl mb-4">📂</span>
                  <p className="text-lg uppercase">
                    No mobs in <span className="text-purple-400">{selectedFolder.replace('special:', '')}</span> yet
                  </p>
                  <p className="text-sm mt-2">Add images to the <code className="text-stone-400">special/{selectedFolder.replace('special:', '')}</code> folder</p>
                </div>
              )}
            </div>
          )}

          {/* Rettangolo selezione */}
          <div
            ref={selBoxRef}
            className="pointer-events-none z-50 border-2 border-green-400 bg-green-400/10"
            style={{ display: 'none', position: 'absolute' }}
          />

          {/* Messaggio nessun risultato globale */}
          {searchQuery && displayedMobs.length === 0 && displayedFish.length === 0 && (
            <div className="flex flex-col items-center justify-center py-24 text-stone-500">
              <span className="text-6xl mb-4">🔍</span>
              <p className="text-xl uppercase">No results for "<span className="text-stone-300">{searchQuery}</span>"</p>
              <p className="text-sm mt-2">Try a different search term</p>
            </div>
          )}

          {/* Sezione Tropical Fish — nascosta se la ricerca non produce risultati */}
          {showFishSection && (!searchQuery || displayedFish.length > 0) && (
            <div className="bg-stone-800 border-4 border-cyan-900 rounded-lg mb-6">
              <div className="w-full flex justify-between items-center px-6 py-4 border-b-4 border-cyan-900">
                <div className="flex items-center gap-3">
                  <span className="text-2xl text-cyan-400 uppercase">🐠 Tropical Fish</span>
                  <span className="bg-cyan-900 text-cyan-300 text-sm px-2 py-0.5 border-2 border-cyan-800">
                    {fishTrackedCount} / {fishPool.length}
                  </span>
                  <span className="text-stone-500 text-sm uppercase">
                    {variantMode === 'none' ? '(1 base)' : variantMode === 'main' ? '(22 named)' : showAllFish ? '(3072 tutte)' : '(22 named)'}
                  </span>
                </div>
              </div>
              <div className="p-4">
                <div className="grid grid-cols-2 sm:grid-cols-4 md:grid-cols-6 lg:grid-cols-8 xl:grid-cols-12 gap-2" style={{ position: 'relative', zIndex: 1 }}>
                  {displayedFish.map(fish => (
                    <div key={fish.id} data-mob-id={fish.id}>
                      <TropicalFishCard fish={fish} isTracked={trackedMobs[fish.id]} onToggle={() => toggleMob(fish.id)} />
                    </div>
                  ))}
                </div>
              </div>
            </div>
          )}

        </div>
      </div>

      <Footer />
    </div>
  );
};

export default MobTracker;