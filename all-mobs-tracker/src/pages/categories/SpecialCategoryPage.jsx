import React, { useState, useMemo } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import { SuffixConfig, SuffixPriority, SpecialFolderMap } from '../../config/mobConfig';
import { getMobCategories, resolveIcons, hasVillagerIcons, POSITION_CLASSES, SIZE_CLASSES } from '../../config/mobIcons';
import { MobCategories } from '../../config/mobCategories';
import { getSpecialCategoryDesc } from '../../config/mobDescriptions';
import Footer from '../../components/Footer';
import useTrackerData from '../../utils/mobDatabase';

// ─── Helpers ─────────────────────────────────────────────────────────────────
// Trova la categoria speciale per slug tra le categorie del DB (con fallback su SpecialFolderMap)
export const slugToSuffixId = (slug, categories = MobCategories) => {
  const clean = String(slug || '').toLowerCase().trim();
  const cat = (categories || []).find(c => c.special && (
    c.id === clean ||
    c.slug === clean ||
    c.id === `special-${clean}` ||
    c.slug === `special-${clean}` ||
    (c.id && clean === String(c.id).replace(/^special-/, '')) ||
    (c.slug && clean === String(c.slug).replace(/^special-/, ''))
  ));
  if (cat?.variant) return cat.variant;
  return SpecialFolderMap[clean.replace(/-/g, ' ')] ?? null;
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

// ─── (rimosso) useSpecialMobs: ora usiamo useTrackerData dal database ─────────

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

// ─── Icona categoria ──────────────────────────────────────────────────────────
const CatIcon = ({ icon, label, className = '' }) => {
  const [failed, setFailed] = useState(false);
  const isPath = icon && (icon.includes('/') || icon.includes('.'));
  if (isPath && !failed)
    return <img src={icon} alt={label} onError={() => setFailed(true)} draggable={false} className={`object-contain pixelated ${className}`} />;
  return <span className={className}>{icon}</span>;
};

// ─── Card mob ─────────────────────────────────────────────────────────────────
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

// ─── Pagina categoria speciale ────────────────────────────────────────────────
const SpecialCategoryPage = () => {
  const { slug }   = useParams();
  const navigate   = useNavigate();
  const { allMobs, categories: dbCategories, loading } = useTrackerData();
  const [tracked, captured, captureMode, toggle] = useTrackedMobs();
  const [selectedMob, setSelectedMob] = useState(null);
  const [cardSize, setCardSize]       = useState(120);

  // Trova la categoria speciale dal DB (special: true, slug corrispondente)
  const dbCategory = useMemo(() => {
    const clean = String(slug || '').toLowerCase().trim();
    return (dbCategories || []).find(c => c.special && (
      c.slug === clean ||
      c.id === clean ||
      String(c.dbId) === clean ||
      c.slug === `special-${clean}` ||
      c.id === `special-${clean}` ||
      (c.slug && clean === String(c.slug).replace(/^special-/, '')) ||
      (c.id && clean === String(c.id).replace(/^special-/, ''))
    )) ?? null;
  }, [dbCategories, slug]);

  // suffixId = campo variant della categoria DB (es. 'A', 'J', ecc.)
  const suffixId = dbCategory?.variant ?? slugToSuffixId(slug ?? '', dbCategories?.length ? dbCategories : MobCategories);
  const config   = suffixId ? SuffixConfig[suffixId] : null;

  const mobs = useMemo(() => {
    if (!suffixId || !allMobs.length) return [];
    return allMobs
      .filter(mob =>
        (dbCategory?.dbId && mob.categoryIds?.includes(dbCategory.dbId)) ||
        mob.specialSuffixId === suffixId ||
        mob.activeSuffixes?.includes(suffixId)
      )
      .sort((a, b) => a.name.localeCompare(b.name));
  }, [suffixId, dbCategory, allMobs]);

  if (!config) {
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

  // Colore badge del suffisso → tema pagina
  // config.color es. 'bg-purple-600' → estrae 'purple'
  const colorName = config.color?.match(/bg-(\w+)-/)?.[1] ?? 'purple';
  const CM = {
    purple: { border: 'border-purple-800', text: 'text-purple-400', bg: 'bg-purple-900/20', pill: 'bg-purple-900 text-purple-300 border-purple-800', bar: 'bg-purple-400' },
    pink:   { border: 'border-pink-800',   text: 'text-pink-400',   bg: 'bg-pink-900/20',   pill: 'bg-pink-900 text-pink-300 border-pink-800',       bar: 'bg-pink-400'   },
    green:  { border: 'border-green-800',  text: 'text-green-400',  bg: 'bg-green-900/20',  pill: 'bg-green-900 text-green-300 border-green-800',     bar: 'bg-green-400'  },
    orange: { border: 'border-orange-800', text: 'text-orange-400', bg: 'bg-orange-900/20', pill: 'bg-orange-900 text-orange-300 border-orange-800',   bar: 'bg-orange-400' },
    yellow: { border: 'border-yellow-800', text: 'text-yellow-400', bg: 'bg-yellow-900/20', pill: 'bg-yellow-900 text-yellow-300 border-yellow-800',   bar: 'bg-yellow-400' },
    red:    { border: 'border-red-800',    text: 'text-red-400',    bg: 'bg-red-900/20',    pill: 'bg-red-900 text-red-300 border-red-800',           bar: 'bg-red-400'    },
    gray:   { border: 'border-stone-700',  text: 'text-stone-400',  bg: 'bg-stone-800/40',  pill: 'bg-stone-800 text-stone-300 border-stone-700',     bar: 'bg-stone-400'  },
    blue:   { border: 'border-blue-800',   text: 'text-blue-400',   bg: 'bg-blue-900/20',   pill: 'bg-blue-900 text-blue-300 border-blue-800',        bar: 'bg-blue-400'   },
  };
  const c = CM[colorName] ?? CM.purple;

  const label = dbCategory?.label || dbCategory?.name || config.label;
  const description = dbCategory?.description || '';

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">

      {/* ── Header ── */}
      <header className={`bg-stone-900 border-b-4 ${c.border} px-6 py-6 shadow-xl`}>
        <div className="max-w-5xl mx-auto">
          <Link to="/" className="text-stone-500 text-xs uppercase hover:text-stone-300 transition-colors mb-5 inline-flex items-center gap-1">
            ← Mob Tracker
          </Link>
          <div className="flex items-start gap-6 mt-2">

            {/* Badge grande come icona */}
            <div className="shrink-0 w-32 h-32 flex items-center justify-center bg-[#181818] border-4 border-stone-700">
              <div className={`${config.color} text-white text-2xl px-4 py-2 border-2 border-stone-900 uppercase tracking-wider`}>
                {label}
              </div>
            </div>

            <div className="flex-1 min-w-0">
              <h1 className={`text-4xl uppercase ${c.text} leading-none`}>{label}</h1>
              <p className="text-stone-500 text-xs uppercase mt-1">Special category</p>
              {description && (
                <p className="text-stone-400 text-xs mt-2 max-w-xl leading-relaxed">{description}</p>
              )}

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
            </div>
          </div>
        </div>
      </header>

      {/* ── Popup mob ── */}
      {selectedMob && (() => {
        const vm        = selectedMob;
        const vTracked  = !!tracked[vm.fileName];
        const vCaptured = !!captured[vm.fileName];
        const vCats     = getMobCategories(vm, MobCategories);
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
                <div className="absolute bottom-2 right-2 bg-black/60 px-2 py-0.5 text-[9px] uppercase text-stone-400">Click → mob page</div>
              </div>

              <div className="p-5 space-y-3">
                <p className="text-sm uppercase text-stone-200 leading-tight">{vm.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}</p>

                {/* Badge speciale */}
                <div className={`inline-flex items-center gap-1.5 ${config.color} text-white text-[10px] px-2 py-1 border-2 border-stone-900`}>
                  {label}
                </div>

                {/* Categorie normali (escluse quelle speciali per evitare duplicati) */}
                {vCats.filter(cat => !cat.special).length > 0 && (
                  <div className="flex flex-wrap gap-2 mt-1">
                    {vCats.filter(cat => !cat.special).map(cat => (
                      <button key={cat.id} onClick={() => { setSelectedMob(null); navigate(`/categories/${cat.id}`); }}
                        className="flex items-center gap-1.5 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors">
                        <span className="text-xs uppercase text-stone-300">{cat.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {(() => {
                  const desc = getSpecialCategoryDesc(slug, vm.fileName);
                  return desc
                    ? <p className="text-stone-400 text-xs leading-relaxed border-t border-stone-700 pt-3">{desc}</p>
                    : <p className="text-stone-600 text-xs uppercase border-t border-stone-700 pt-3">No description for this entry.</p>;
                })()}

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
                <MobCard key={mob.fileName} mob={mob}
                  isTracked={!!tracked[mob.fileName]} isCaptured={!!captured[mob.fileName]}
                  captureMode={captureMode} onToggle={toggle} onImageClick={setSelectedMob} />
              ))}
            </div>
          )}
        </section>
      </main>

      <Footer />
    </div>
  );
};

export default SpecialCategoryPage;