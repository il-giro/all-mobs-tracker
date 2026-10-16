import React, { useState, useEffect } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import { CategoryMap, MobCategories, getCategoryById } from '../../config/mobCategories';
import { parseFileName } from '../../utils/mobParser';
import { SuffixConfig, SuffixPriority, SpecialFolderMap } from '../../config/mobConfig';
import { getMobCategories, resolveIcons, hasVillagerIcons, POSITION_CLASSES, SIZE_CLASSES } from '../../config/mobIcons';
import { mobNameToSlug } from '../../utils/mobParser';
import Footer from '../../components/Footer';
import FormattedDescription from '../../components/FormattedDescription';
import useTrackerData from '../../utils/mobDatabase';

// ─── Icona categoria ──────────────────────────────────────────────────────────
const CatIcon = ({ icon, label, className = '' }) => {
  const [failed, setFailed] = useState(false);
  const isPath = icon && (icon.includes('/') || icon.includes('.'));
  if (isPath && !failed)
    return <img src={icon} alt={label} onError={() => setFailed(true)} draggable={false} className={`object-contain pixelated ${className}`} />;
  return <span className={className}>{icon}</span>;
};

// ─── Icona sulla card ─────────────────────────────────────────────────────────
const MobIcon = ({ icon }) => {
  const [visible, setVisible] = useState(true);
  if (!visible) return null;
  return (
    <div className={`${POSITION_CLASSES[icon.position]} border border-stone-900 bg-stone-950/70`}>
      <img src={icon.src} alt={icon.alt} draggable={false}
        onError={icon.fallbackHide ? () => setVisible(false) : undefined}
        className={`${SIZE_CLASSES[icon.size ?? 'sm']} object-contain pixelated`} />
    </div>
  );
};

// ─── Card mob con badge e icone ───────────────────────────────────────────────
const MobCard = ({ mob, isTracked, isCaptured, captureMode, onToggle, onImageClick }) => {
  const borderClass = isCaptured ? 'border-green-600' : isTracked ? 'border-yellow-500' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-0.5';
  const imgClass    = isCaptured ? 'opacity-40' : isTracked ? 'opacity-60' : '';
  const isVillager  = hasVillagerIcons(mob);
  const iconMap     = resolveIcons(mob);
  const topSuffixId = SuffixPriority.find(id => mob.activeSuffixes?.includes(id));
  const topSuffix   = topSuffixId ? SuffixConfig[topSuffixId] : null;
  const suffixDisplay = mob.activeSuffixes?.length > 0
    ? (() => { const l = [...new Set(mob.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))]; return l.length ? `(${l.join(', ')})` : ''; })()
    : '';

  return (
    <div
      onClick={() => onToggle(mob.fileName)}
      onContextMenu={(e) => { e.preventDefault(); e.stopPropagation(); onImageClick(mob); }}
      className={`group border-4 bg-stone-800 transition-all select-none cursor-pointer ${borderClass}`}>
      {/* Immagine → apre popup */}
      <div onClick={(e) => { e.stopPropagation(); onImageClick(mob); }} className="aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden cursor-pointer">
        <img src={mob.image} alt={mob.name} loading="lazy" decoding="async" draggable={false}
          className={`max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform ${imgClass}`} />

        {!isTracked && !isCaptured && (
          <>
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none`}>{mob.complexBadge.label}</div>
              </div>
            )}
            {topSuffix && (
              <div className={isVillager ? 'absolute bottom-1 left-1/2 -translate-x-1/2 z-20' : 'absolute top-1 right-1 z-20'}>
                <div className={`${topSuffix.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none whitespace-nowrap`}>{topSuffix.label}</div>
              </div>
            )}
            {[...iconMap.values()].filter(i => !i.tooltipOnly).map(icon => <MobIcon key={icon.resolverId} icon={icon} />)}
          </>
        )}
        {[...iconMap.values()].filter(i => i.alwaysVisible).map(icon => <MobIcon key={`av_${icon.resolverId}`} icon={icon} />)}
        {isCaptured  && <div className="absolute inset-0 flex items-center justify-center z-10"><span className="text-green-500 text-4xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span></div>}
        {!isCaptured && isTracked && <div className="absolute inset-0 flex items-center justify-center z-10"><span className="text-yellow-400 text-4xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span></div>}
      </div>

      {/* Nome → toggle */}
      <div onClick={(e) => { e.stopPropagation(); onToggle(mob.fileName); }}
        className={`p-1 text-center border-t-4 cursor-pointer transition-colors
          ${isCaptured ? 'bg-green-900 border-green-700 hover:bg-green-800'
          : isTracked  ? 'bg-yellow-900 border-yellow-700 hover:bg-yellow-800'
          : 'bg-stone-800 border-stone-700 hover:bg-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
        </p>
      </div>
    </div>
  );
};

// ─── Hook tracciamento ────────────────────────────────────────────────────────
const useTrackedMobs = () => {
  const [tracked,  setTracked]  = useState(() => JSON.parse(localStorage.getItem('mobTracker_saves')    || '{}'));
  const [captured, setCaptured] = useState(() => JSON.parse(localStorage.getItem('mobTracker_captured') || '{}'));
  const captureMode = localStorage.getItem('mobTracker_captureMode') === 'true';

  const toggle = (fileName) => {
    if (captureMode) {
      const wasTracked = !!tracked[fileName], wasCaptured = !!captured[fileName];
      if (!wasTracked && !wasCaptured) {
        setTracked(p  => { const n = { ...p, [fileName]: true }; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
      } else if (wasTracked && !wasCaptured) {
        setCaptured(p => { const n = { ...p, [fileName]: true }; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      } else {
        setTracked(p  => { const n = { ...p }; delete n[fileName]; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(p => { const n = { ...p }; delete n[fileName]; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      }
    } else {
      const wasCaptured = !!captured[fileName];
      if (wasCaptured) {
        setTracked(p  => { const n = { ...p }; delete n[fileName]; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(p => { const n = { ...p }; delete n[fileName]; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      } else {
        setTracked(p  => { const n = { ...p, [fileName]: true }; localStorage.setItem('mobTracker_saves',    JSON.stringify(n)); return n; });
        setCaptured(p => { const n = { ...p, [fileName]: true }; localStorage.setItem('mobTracker_captured', JSON.stringify(n)); return n; });
      }
    }
  };
  return [tracked, captured, captureMode, toggle];
};

// ─── Pagina categoria ─────────────────────────────────────────────────────────
const CategoryPage = ({ categoryId: propId } = {}) => {
  const { id: paramId }  = useParams();
  const id               = propId ?? paramId;
  const navigate         = useNavigate();
  const { allMobs, categoryMap, loading } = useTrackerData();
  const category         = getCategoryById(id) || categoryMap?.[id] || CategoryMap[id];
  const [tracked, captured, captureMode, toggle] = useTrackedMobs();
  const [selectedMob, setSelectedMob] = useState(null);
  const [cardSize, setCardSize]       = useState(120);

  // Se la categoria è contrassegnata come special, reindirizza alla pagina speciale (/:slug)
  useEffect(() => {
    if (category?.special) {
      navigate(`/${category.slug || category.id}`, { replace: true });
    }
  }, [category, navigate]);

  const mobs = React.useMemo(() => {
    if (!category || !allMobs.length) return [];
    return allMobs.filter(mob => {
      if (mob.categoryIds && mob.categoryIds.includes(category.dbId)) return true;
      if (mob.categories && mob.categories.some(c => c.id === id || c.dbId === category.dbId)) return true;
      return getMobCategories(mob, MobCategories).some(c => c.id === id);
    }).sort((a, b) => a.name.localeCompare(b.name));
  }, [category, allMobs, id]);

  if (!category) {
    return (
      <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col items-center justify-center gap-4">
        <p className="text-stone-500 uppercase text-xl">Category not found</p>
        <Link to="/" className="text-stone-400 hover:text-white text-sm uppercase">← Back to Mob Tracker</Link>
      </div>
    );
  }

  const capturedCount = mobs.filter(m => !!captured[m.fileName]).length;
  const trackedCount  = mobs.filter(m => !!tracked[m.fileName]).length;
  const total         = mobs.length;
  const pct           = total > 0 ? Math.round((capturedCount / total) * 100) : 0;

  const col = category.color ?? 'amber';
  const CM = {
    amber:  { border: 'border-amber-800',  text: 'text-amber-400',  bg: 'bg-amber-900/20',  pill: 'bg-amber-900 text-amber-300 border-amber-800',   bar: 'bg-amber-400'  },
    blue:   { border: 'border-blue-800',   text: 'text-blue-400',   bg: 'bg-blue-900/20',   pill: 'bg-blue-900 text-blue-300 border-blue-800',      bar: 'bg-blue-400'   },
    green:  { border: 'border-green-800',  text: 'text-green-400',  bg: 'bg-green-900/20',  pill: 'bg-green-900 text-green-300 border-green-800',    bar: 'bg-green-400'  },
    red:    { border: 'border-red-800',    text: 'text-red-400',    bg: 'bg-red-900/20',    pill: 'bg-red-900 text-red-300 border-red-800',          bar: 'bg-red-400'    },
    purple: { border: 'border-purple-800', text: 'text-purple-400', bg: 'bg-purple-900/20', pill: 'bg-purple-900 text-purple-300 border-purple-800', bar: 'bg-purple-400' },
    cyan:   { border: 'border-cyan-800',   text: 'text-cyan-400',   bg: 'bg-cyan-900/20',   pill: 'bg-cyan-900 text-cyan-300 border-cyan-800',      bar: 'bg-cyan-400'   },
  };
  const c = CM[col] ?? CM.amber;


  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">

      {/* ── Header ── */}
      <header className={`bg-stone-900 border-b-4 ${c.border} px-6 py-6 shadow-xl`}>
        <div className="max-w-5xl mx-auto">
          <Link to="/" className="text-stone-500 text-xs uppercase hover:text-stone-300 transition-colors mb-5 inline-flex items-center gap-1">
            ← Mob Tracker
          </Link>
          <div className="flex items-start gap-6 mt-2">

            {/* Icona grande */}
            <div className="shrink-0 w-32 h-32 flex items-center justify-center bg-[#181818] border-4 border-stone-700">
              <CatIcon icon={category.icon} label={category.label} className={`w-20 h-20 leading-none select-none ${c.text}`} />
            </div>

            <div className="flex-1 min-w-0">
              <h1 className={`text-4xl uppercase ${c.text} leading-none`}>{category.label}</h1>

              <div className="flex items-center gap-3 mt-3 flex-wrap">
                {loading ? (
                  <span className="text-[10px] uppercase px-2 py-0.5 border-2 bg-stone-800 text-stone-500 border-stone-700">Loading…</span>
                ) : (
                  <>
                    <span className={`text-[10px] uppercase px-2 py-0.5 border-2 ${c.pill}`}>{capturedCount} / {total} caught</span>
                    {captureMode && trackedCount > capturedCount && (
                      <span className="text-[10px] uppercase px-2 py-0.5 border-2 bg-yellow-900 text-yellow-300 border-yellow-800">{trackedCount - capturedCount} spotted</span>
                    )}
                    <span className={`text-[10px] uppercase px-2 py-0.5 border-2 ${pct === 100 ? 'bg-green-900 text-green-300 border-green-800' : 'bg-stone-800 text-stone-400 border-stone-700'}`}>{pct}%</span>
                  </>
                )}
              </div>

              <div className="mt-3 h-2 bg-stone-800 border border-stone-700 w-full max-w-sm">
                <div className={`h-full transition-all duration-500 ${pct === 100 ? 'bg-green-400' : c.bar}`} style={{ width: `${pct}%` }} />
              </div>

              {/* Wiki link */}
              {category.link && (
                <a href={category.link} target="_blank" rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 mt-4 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-3 py-1.5 transition-colors">
                  <img src="/icons/wiki.ico" alt="Wiki" className="w-4 h-4 object-contain" draggable={false} />
                  <span className="text-xs uppercase text-stone-300">Minecraft Wiki</span>
                  <span className="text-stone-600 text-[10px]">↗</span>
                </a>
              )}
            </div>
          </div>
        </div>
      </header>

      {/* ── Popup mob ── */}
      {selectedMob && (() => {
        const vm        = selectedMob;
        const vTracked  = !!tracked[vm.fileName];
        const vDesc     = vm.description || null;
        const vCats     = getMobCategories(vm, MobCategories);
        const vCatsNormal  = vCats.filter(c => !c.special);
        const vCatsSpecial = vCats.filter(c => c.special);
        const specialSuffixIdsFromCats = new Set(vCatsSpecial.map(c => c.variant).filter(Boolean));

        // Categorie speciali aggiuntive da suffix non coperte da vCatsSpecial
        const additionalSpecial = (vm.activeSuffixes ?? [])
          .concat(vm.specialSuffixId ? [vm.specialSuffixId] : [])
          .filter((id, i, a) => a.indexOf(id) === i && !specialSuffixIdsFromCats.has(id))
          .map(id => {
            const dbCat = MobCategories.find(c => c.special && c.variant === id);
            const slug = dbCat ? (dbCat.slug || dbCat.id) : Object.entries(SpecialFolderMap).find(([, v]) => v === id)?.[0]?.replace(/\s+/g, '-');
            return {
              suffixId: id,
              cfg: SuffixConfig[id],
              label: dbCat?.label || SuffixConfig[id]?.label || id,
              slug
            };
          })
          .filter(s => s.cfg && s.slug);

        const suffixDisplay = vm.activeSuffixes?.length > 0
          ? (() => { const l = [...new Set(vm.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))]; return l.length ? `(${l.join(', ')})` : ''; })()
          : '';
        const mobSlug = vm.folder && vm.folder !== 'root' && !vm.folder.startsWith('special:')
          ? vm.folder.toLowerCase().replace(/\s+/g, '-')
          : mobNameToSlug(vm.name);
        return (
          <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/80 backdrop-blur-sm p-4"
            onClick={() => setSelectedMob(null)}>
            <div className="bg-stone-900 border-4 border-stone-600 shadow-2xl max-w-sm w-full" onClick={e => e.stopPropagation()}>

              {/* Immagine → naviga alla pagina mob */}
              <div
                onClick={() => { setSelectedMob(null); navigate(`/mobs/${mobSlug}`); }}
                className={`relative flex items-center justify-center bg-[#181818] border-b-4 cursor-pointer hover:brightness-110 transition-all
                  ${vCaptured ? 'border-green-700' : vTracked ? 'border-yellow-700' : 'border-stone-700'}`}
                style={{ height: '240px' }}>
                <img src={vm.image} alt={vm.name} draggable={false}
                  className={`max-w-full max-h-full object-contain pixelated ${vCaptured ? 'opacity-40' : vTracked ? 'opacity-60' : ''}`}
                  style={{ maxHeight: '220px', imageRendering: 'pixelated' }} />
                {vCaptured && <div className="absolute inset-0 flex items-center justify-center"><span className="text-green-500 text-8xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span></div>}
                {!vCaptured && vTracked && captureMode && <div className="absolute inset-0 flex items-center justify-center"><span className="text-yellow-400 text-8xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span></div>}
                {/* Hint navigazione */}
                <div className="absolute bottom-2 right-2 bg-black/60 px-2 py-0.5 text-[9px] uppercase text-stone-400">Click → mob page</div>
              </div>

              <div className="p-5 space-y-3">
                <p className="text-sm uppercase text-stone-200 leading-tight">{vm.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}</p>

                {/* Categorie normali */}
                {vCatsNormal.length > 0 && (
                  <div className="flex flex-wrap gap-2">
                    {vCatsNormal.map(cat => (
                      <button key={cat.id} onClick={() => { setSelectedMob(null); navigate(`/categories/${cat.id}`); }}
                        className="flex items-center gap-1.5 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors">
                        <CatIcon icon={cat.icon} label={cat.label} className="w-4 h-4" />
                        <span className="text-xs uppercase text-stone-300">{cat.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {/* Categorie speciali (dal DB e suffix) */}
                {(vCatsSpecial.length > 0 || additionalSpecial.length > 0) && (
                  <div className="flex flex-wrap gap-2">
                    {vCatsSpecial.map(sc => (
                      <button key={sc.id} onClick={() => { setSelectedMob(null); navigate(`/${sc.slug || sc.id}`); }}
                        className="flex items-center gap-1.5 border-2 border-purple-900 hover:border-purple-600 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors">
                        <div className="bg-purple-700 text-white text-[8px] px-1 py-0.5 border border-stone-900 leading-none uppercase shrink-0">{sc.variant || 'SP'}</div>
                        <span className="text-xs uppercase text-purple-300">{sc.label}</span>
                      </button>
                    ))}
                    {additionalSpecial.map(s => (
                      <button key={s.suffixId} onClick={() => { setSelectedMob(null); navigate(`/${s.slug}`); }}
                        className="flex items-center gap-1.5 border-2 border-purple-900 hover:border-purple-600 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors">
                        <div className={`${s.cfg.color} text-white text-[8px] px-1 py-0.5 border border-stone-900 leading-none uppercase shrink-0`}>{s.cfg.label}</div>
                        <span className="text-xs uppercase text-purple-300">{s.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {/* Descrizione categoria-specifica */}
                {vDesc ? (
                  <div className="border-t border-stone-700 pt-3 max-h-48 overflow-y-auto">
                    <FormattedDescription content={vDesc} />
                  </div>
                ) : (
                  <p className="text-stone-600 text-xs uppercase">No description for this entry.</p>
                )}

                <div className="flex gap-3 pt-2">
                  <button onClick={() => { toggle(vm.fileName); setSelectedMob(null); }}
                    className={`flex-1 py-2 border-b-4 border-black uppercase text-xs transition-transform active:translate-y-1 active:border-b-0
                      ${vCaptured ? 'bg-red-800 hover:bg-red-700' : 'bg-green-700 hover:bg-green-600'}`}>
                    {vCaptured ? 'Unmark' : 'Mark Caught'}
                  </button>
                  <button onClick={() => setSelectedMob(null)}
                    className="px-4 py-2 bg-stone-700 hover:bg-stone-600 border-b-4 border-black uppercase text-xs transition-transform active:translate-y-1 active:border-b-0">
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
        );
      })()}

      {/* ── Body ── */}
      <main className="flex-1 max-w-5xl mx-auto w-full px-6 py-8 space-y-8">

        {/* Descrizione categoria */}
        {category.description && (
          <section className={`${c.bg} border-2 ${c.border} p-5`}>
            <p className={`text-[10px] uppercase tracking-widest ${c.text} mb-3 opacity-60`}>Description</p>
            <p className="text-stone-300 text-sm leading-relaxed">{category.description}</p>
          </section>
        )}

        {/* Griglia mob */}
        <section>
          {!loading && total > 0 && (
            <div className="flex items-center gap-4 mb-3">
              <span className="text-[10px] uppercase text-stone-600 shrink-0">Size</span>
              <input type="range" min={60} max={160} step={10} value={cardSize}
                onChange={e => setCardSize(Number(e.target.value))}
                className="flex-1 accent-stone-400 h-1 cursor-pointer" />
            </div>
          )}
          <p className="text-[10px] uppercase text-stone-500 tracking-widest border-b-2 border-stone-800 pb-3 mb-5">
            {loading ? 'Loading mobs…' : `${total} mob${total !== 1 ? 's' : ''} in this category — click name to toggle`}
          </p>
          {loading ? (
            <div className="flex items-center justify-center py-24">
              <span className="text-stone-600 uppercase text-sm">Loading…</span>
            </div>
          ) : total === 0 ? (
            <p className="text-stone-600 uppercase text-sm">No mobs found for this category.</p>
          ) : (
            <div className="grid gap-2" style={{ gridTemplateColumns: `repeat(auto-fill, minmax(${cardSize}px, 1fr))` }}>
              {mobs.map(mob => (
                <MobCard
                  key={mob.fileName}
                  mob={mob}
                  isTracked={!!tracked[mob.fileName]}
                  isCaptured={!!captured[mob.fileName]}
                  captureMode={captureMode}
                  onToggle={toggle}
                  onImageClick={setSelectedMob}
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