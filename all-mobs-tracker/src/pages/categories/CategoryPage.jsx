import React, { useState, useEffect, useMemo } from 'react';
import { useParams, Link } from 'react-router-dom';
import { CategoryMap } from '../../config/mobCategories';
import { parseFileName } from '../../utils/mobParser';
import { SuffixConfig, SpecialFolderMap } from '../../config/mobConfig';
import { getMobCategories } from '../../config/mobIcons';
import { MobCategories } from '../../config/mobCategories';
import Footer from '../../components/Footer';

// ─── Hook: tracciamento mob (sync localStorage) ───────────────────────────────
const useTrackedMobs = () => {
  const [tracked,  setTracked]  = useState(() => JSON.parse(localStorage.getItem('mobTracker_saves')    || '{}'));
  const [captured, setCaptured] = useState(() => JSON.parse(localStorage.getItem('mobTracker_captured') || '{}'));
  const captureMode = localStorage.getItem('mobTracker_captureMode') === 'true';

  const toggle = (fileName) => {
    if (captureMode) {
      const wasTracked  = !!tracked[fileName];
      const wasCaptured = !!captured[fileName];
      if (!wasTracked && !wasCaptured) {
        setTracked(prev  => { const n = { ...prev, [fileName]: true }; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
      } else if (wasTracked && !wasCaptured) {
        setCaptured(prev => { const n = { ...prev, [fileName]: true }; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      } else {
        setTracked(prev  => { const n = { ...prev };  delete n[fileName]; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(prev => { const n = { ...prev };  delete n[fileName]; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      }
    } else {
      const wasCaptured = !!captured[fileName];
      if (wasCaptured) {
        setTracked(prev  => { const n = { ...prev };  delete n[fileName]; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(prev => { const n = { ...prev };  delete n[fileName]; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      } else {
        setTracked(prev  => { const n = { ...prev, [fileName]: true }; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(prev => { const n = { ...prev, [fileName]: true }; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      }
    }
  };

  return [tracked, captured, captureMode, toggle];
};

// ─── Hook: carica tutti i mob e filtra per categoria tramite resolveIcons ──────
const useCategoryMobs = (categoryId) => {
  const [mobs, setMobs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!categoryId) return;
    setLoading(true);

    const modules  = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
    const allPaths = Object.keys(modules);

    const all = allPaths.map(path => {
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
        image:           path.replace('/public', ''),
        fileName:        uniqueKey,
        displayFileName: fileName,
        folder,
        specialSuffixId,
      };
    });

    // Filtra i mob che appartengono a questa categoria tramite getMobCategories
    const filtered = all.filter(mob => {
      const cats = getMobCategories(mob, MobCategories);
      return cats.some(c => c.id === categoryId);
    });

    filtered.sort((a, b) => a.name.localeCompare(b.name));
    setMobs(filtered);
    setLoading(false);
  }, [categoryId]);

  return { mobs, loading };
};

// ─── Icona categoria ──────────────────────────────────────────────────────────
const CategoryIcon = ({ icon, label, className = '' }) => {
  const [imgFailed, setImgFailed] = useState(false);
  const looksLikePath = icon && (icon.includes('/') || icon.includes('.'));
  if (looksLikePath && !imgFailed) {
    return (
      <img src={icon} alt={label} onError={() => setImgFailed(true)} draggable={false}
        className={`object-contain pixelated ${className}`} />
    );
  }
  return <span className={className}>{icon}</span>;
};

// ─── Mini card interattiva ────────────────────────────────────────────────────
const MobMiniCard = ({ mob, isTracked, isCaptured, captureMode, onToggle }) => {
  const borderClass = isCaptured
    ? 'border-green-600 hover:border-green-400'
    : isTracked
      ? 'border-yellow-500 hover:border-yellow-400'
      : 'border-stone-700 hover:border-stone-400 hover:-translate-y-0.5';

  const imgClass = isCaptured ? 'opacity-40' : isTracked ? 'opacity-60' : '';

  const suffixDisplay = mob.activeSuffixes?.length > 0
    ? (() => {
        const labels = [...new Set(mob.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))];
        return labels.length > 0 ? `(${labels.join(', ')})` : '';
      })()
    : '';

  return (
    <div onClick={() => onToggle(mob.fileName)}
      className={`group cursor-pointer border-4 bg-stone-800 transition-all select-none ${borderClass}`}
    >
      <div className="aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden">
        <img src={mob.image} alt={mob.name} draggable={false}
          className={`max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform ${imgClass}`} />
        {isCaptured && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-green-500 text-5xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
          </div>
        )}
        {!isCaptured && isTracked && captureMode && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-yellow-400 text-5xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span>
          </div>
        )}
      </div>
      <div className={`p-1 text-center border-t-4
        ${isCaptured ? 'bg-green-900 border-green-700'
        : isTracked  ? 'bg-yellow-900 border-yellow-700'
        : 'bg-stone-800 border-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
        </p>
      </div>
    </div>
  );
};

// ─── Pagina categoria ─────────────────────────────────────────────────────────
const CategoryPage = ({ categoryId: propId } = {}) => {
  const { id: paramId } = useParams();
  const id = propId ?? paramId;
  const category                                 = CategoryMap[id];
  const { mobs, loading }                        = useCategoryMobs(id);
  const [tracked, captured, captureMode, toggle] = useTrackedMobs();

  if (!category) {
    return (
      <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col items-center justify-center gap-4">
        <p className="text-stone-500 uppercase text-xl">Category not found</p>
        <Link to="/" className="text-stone-400 hover:text-white text-sm uppercase transition-colors">
          ← Back to Mob Tracker
        </Link>
      </div>
    );
  }

  const capturedCount = mobs.filter(m => !!captured[m.fileName]).length;
  const trackedCount  = mobs.filter(m => !!tracked[m.fileName]).length;
  const total         = mobs.length;
  const pct           = total > 0 ? Math.round((capturedCount / total) * 100) : 0;

  const col = category.color ?? 'amber';
  const colorMap = {
    amber:  { border: 'border-amber-800',  text: 'text-amber-400',  bg: 'bg-amber-900/20',  pill: 'bg-amber-900 text-amber-300 border-amber-800',   bar: 'bg-amber-400'  },
    blue:   { border: 'border-blue-800',   text: 'text-blue-400',   bg: 'bg-blue-900/20',   pill: 'bg-blue-900 text-blue-300 border-blue-800',      bar: 'bg-blue-400'   },
    green:  { border: 'border-green-800',  text: 'text-green-400',  bg: 'bg-green-900/20',  pill: 'bg-green-900 text-green-300 border-green-800',    bar: 'bg-green-400'  },
    red:    { border: 'border-red-800',    text: 'text-red-400',    bg: 'bg-red-900/20',    pill: 'bg-red-900 text-red-300 border-red-800',          bar: 'bg-red-400'    },
    purple: { border: 'border-purple-800', text: 'text-purple-400', bg: 'bg-purple-900/20', pill: 'bg-purple-900 text-purple-300 border-purple-800',  bar: 'bg-purple-400' },
    cyan:   { border: 'border-cyan-800',   text: 'text-cyan-400',   bg: 'bg-cyan-900/20',   pill: 'bg-cyan-900 text-cyan-300 border-cyan-800',       bar: 'bg-cyan-400'   },
  };
  const c = colorMap[col] ?? colorMap.amber;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">

      <header className={`bg-stone-900 border-b-4 ${c.border} px-6 py-6 shadow-xl`}>
        <div className="max-w-5xl mx-auto">
          <Link to="/" className="text-stone-500 text-xs uppercase hover:text-stone-300 transition-colors mb-5 inline-flex items-center gap-1">
            ← Mob Tracker
          </Link>
          <div className="flex items-end gap-5 mt-2">
            <div className="w-16 h-16 shrink-0 flex items-center justify-center bg-[#181818] border-4 border-stone-700">
              <CategoryIcon icon={category.icon} label={category.label} className={`w-10 h-10 leading-none select-none ${c.text}`} />
            </div>
            <div className="flex-1 min-w-0">
              <h1 className={`text-4xl uppercase ${c.text} leading-none`}>{category.label}</h1>
              <div className="flex items-center gap-3 mt-2 flex-wrap">
                {loading ? (
                  <span className="text-[10px] uppercase px-2 py-0.5 border-2 bg-stone-800 text-stone-500 border-stone-700">Loading…</span>
                ) : (
                  <>
                    <span className={`text-[10px] uppercase px-2 py-0.5 border-2 ${c.pill}`}>
                      {capturedCount} / {total} caught
                    </span>
                    {captureMode && trackedCount > capturedCount && (
                      <span className="text-[10px] uppercase px-2 py-0.5 border-2 bg-yellow-900 text-yellow-300 border-yellow-800">
                        {trackedCount - capturedCount} spotted
                      </span>
                    )}
                    <span className={`text-[10px] uppercase px-2 py-0.5 border-2 ${pct === 100 ? 'bg-green-900 text-green-300 border-green-800' : 'bg-stone-800 text-stone-400 border-stone-700'}`}>
                      {pct}%
                    </span>
                  </>
                )}
              </div>
              <div className="mt-3 h-2 bg-stone-800 border border-stone-700 w-full max-w-sm">
                <div className={`h-full transition-all duration-500 ${pct === 100 ? 'bg-green-400' : c.bar}`} style={{ width: `${pct}%` }} />
              </div>
            </div>
          </div>
        </div>
      </header>

      <main className="flex-1 max-w-5xl mx-auto w-full px-6 py-8 space-y-8">

        {category.description && (
          <section className={`${c.bg} border-2 ${c.border} p-5`}>
            <p className={`text-[10px] uppercase tracking-widest ${c.text} mb-3 opacity-60`}>Description</p>
            <p className="text-stone-300 text-sm leading-relaxed">{category.description}</p>
          </section>
        )}

        <section>
          <p className="text-[10px] uppercase text-stone-500 tracking-widest border-b-2 border-stone-800 pb-3 mb-5">
            {loading ? 'Loading mobs…' : `${total} mob${total !== 1 ? 's' : ''} in this category`}
          </p>
          {loading ? (
            <div className="flex items-center justify-center py-24">
              <span className="text-stone-600 uppercase text-sm">Loading…</span>
            </div>
          ) : total === 0 ? (
            <p className="text-stone-600 uppercase text-sm">No mobs found for this category.</p>
          ) : (
            <div className="grid grid-cols-3 sm:grid-cols-5 md:grid-cols-7 lg:grid-cols-9 xl:grid-cols-11 gap-2">
              {mobs.map(mob => (
                <MobMiniCard
                  key={mob.fileName}
                  mob={mob}
                  isTracked={!!tracked[mob.fileName]}
                  isCaptured={!!captured[mob.fileName]}
                  captureMode={captureMode}
                  onToggle={toggle}
                />
              ))}
            </div>
          )}
        </section>
      </main>

      <Footer />
    </div>
  );
};

export default CategoryPage;