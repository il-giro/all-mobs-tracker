import React, { useState, useEffect, useMemo } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';
import { parseFileName } from '../../utils/mobParser';
import { SuffixConfig, SuffixPriority, SpecialFolderMap } from '../../config/mobConfig';
import { getMobDescription, getMobLink, getVariantDescription, mobNameToSlug } from '../../config/mobDescriptions';
import { getMobCategories, resolveIcons, hasVillagerIcons, POSITION_CLASSES, SIZE_CLASSES } from '../../config/mobIcons';
import { MobCategories } from '../../config/mobCategories';
import Footer from '../../components/Footer';

// ─── Hook: tracciamento mob ───────────────────────────────────────────────────
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

// ─── Hook: carica tutti i mob, trova il mob principale e le sue varianti ──────
const useMobData = (slug) => {
  const [allMobs, setAllMobs] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setLoading(true);
    const modules  = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
    const allPaths = Object.keys(modules);

    const parsed = allPaths.map(path => {
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

    setAllMobs(parsed);
    setLoading(false);
  }, []);

  // Trova tutti i mob il cui folder corrisponde allo slug
  const mobGroup = useMemo(() => {
    if (!slug || allMobs.length === 0) return [];

    return allMobs
      .filter(m => {
        // Per mob in root (es. Allay) → usa lo slug del nome
        if (m.folder === 'root' || m.folder.startsWith('special:')) {
          return mobNameToSlug(m.name) === slug;
        }
        // Per mob in cartella → usa il folder come slug
        return m.folder.toLowerCase().replace(/\s+/g, '-') === slug;
      })
      .sort((a, b) => {
        const aScore = (a.num1 ?? 1) * 10000 + (a.num2 ?? 0) * 100 + (a.num3 ?? 0) + a.activeSuffixes.length;
        const bScore = (b.num1 ?? 1) * 10000 + (b.num2 ?? 0) * 100 + (b.num3 ?? 0) + b.activeSuffixes.length;
        return aScore - bScore;
      });
  }, [slug, allMobs]);

  // Mob principale = il primo (base)
  const mainMob = mobGroup[0] ?? null;

  return { mainMob, variants: mobGroup, loading };
};

// ─── Icona categoria ──────────────────────────────────────────────────────────
const CategoryIcon = ({ icon, label, className = '' }) => {
  const [imgFailed, setImgFailed] = useState(false);
  const looksLikePath = icon && (icon.includes('/') || icon.includes('.'));
  if (looksLikePath && !imgFailed) {
    return <img src={icon} alt={label} onError={() => setImgFailed(true)} draggable={false} className={`object-contain pixelated ${className}`} />;
  }
  return <span className={className}>{icon}</span>;
};

// ─── Icona sulla card (identica a MobCard) ────────────────────────────────────
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

// ─── Variant card con badge e icone come MobCard ─────────────────────────────
const VariantCard = ({ mob, isTracked, isCaptured, captureMode, onToggle, onImageClick }) => {
  const borderClass = isCaptured
    ? 'border-green-600'
    : isTracked
      ? 'border-yellow-500'
      : 'border-stone-700 hover:border-stone-400 hover:-translate-y-0.5';

  const imgClass    = isCaptured ? 'opacity-40' : isTracked ? 'opacity-60' : '';
  const isVillager  = hasVillagerIcons(mob);
  const iconMap     = resolveIcons(mob);

  const topSuffixId    = SuffixPriority.find(id => mob.activeSuffixes?.includes(id));
  const topSuffixBadge = topSuffixId ? SuffixConfig[topSuffixId] : null;

  const suffixDisplay = mob.activeSuffixes?.length > 0
    ? (() => {
        const labels = [...new Set(mob.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))];
        return labels.length > 0 ? `(${labels.join(', ')})` : '';
      })()
    : '';

  return (
    <div className={`group border-4 bg-stone-800 transition-all select-none ${borderClass}`}>
      <div
        onClick={() => onImageClick(mob)}
        className="aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden cursor-pointer"
      >
        <img src={mob.image} alt={mob.name} draggable={false}
          className={`max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform ${imgClass}`} />

        {/* Badge e icone — nascosti se tracciato/catturato */}
        {!isTracked && !isCaptured && (
          <>
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none`}>
                  {mob.complexBadge.label}
                </div>
              </div>
            )}
            {topSuffixBadge && (
              <div className={isVillager ? 'absolute bottom-1 left-1/2 -translate-x-1/2 z-20' : 'absolute top-1 right-1 z-20'}>
                <div className={`${topSuffixBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none whitespace-nowrap`}>
                  {topSuffixBadge.label}
                </div>
              </div>
            )}
            {[...iconMap.values()].map(icon => (
              <MobIcon key={icon.resolverId} icon={icon} />
            ))}
          </>
        )}

        {/* alwaysVisible */}
        {[...iconMap.values()].filter(i => i.alwaysVisible).map(icon => (
          <MobIcon key={`always_${icon.resolverId}`} icon={icon} />
        ))}

        {isCaptured && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-green-500 text-4xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
          </div>
        )}
        {!isCaptured && isTracked && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-yellow-400 text-4xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span>
          </div>
        )}
      </div>

      <div
        onClick={() => onToggle(mob.fileName)}
        className={`p-1 text-center border-t-4 cursor-pointer transition-colors
          ${isCaptured ? 'bg-green-900 border-green-700 hover:bg-green-800'
          : isTracked  ? 'bg-yellow-900 border-yellow-700 hover:bg-yellow-800'
          : 'bg-stone-800 border-stone-700 hover:bg-stone-700'}`}
      >
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
        </p>
      </div>
    </div>
  );
};

// ─── Pagina mob ───────────────────────────────────────────────────────────────
const MobPage = () => {
  const { slug }                                 = useParams();
  const navigate                                 = useNavigate();
  const { mainMob, variants, loading }           = useMobData(slug);
  const [tracked, captured, captureMode, toggle] = useTrackedMobs();

  const description = slug ? getMobDescription(slug) : null;
  const wikiLink    = slug ? getMobLink(slug) : null;

  // Favicon dinamica
  useEffect(() => {
    if (!mainMob?.image) return;
    let link = document.querySelector("link[rel~='icon']");
    if (!link) { link = document.createElement('link'); link.rel = 'icon'; document.head.appendChild(link); }
    link.href = mainMob.image;
    return () => { link.href = '/favicon.ico'; };
  }, [mainMob?.image]);

  // Titolo pagina
  useEffect(() => {
    if (!mainMob?.name) return;
    const prev = document.title;
    document.title = `${slug.replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase())} — Mob Tracker`;
    return () => { document.title = prev; };
  }, [mainMob?.name]);

  const [selectedVariant, setSelectedVariant] = useState(null);
  const [cardSize, setCardSize] = useState(120);

  const navigateToVariant = (_mob) => {};

  if (loading) {
    return (
      <div className="min-h-screen bg-[#111] text-stone-100 flex items-center justify-center">
        <span className="text-stone-600 uppercase text-sm">Loading…</span>
      </div>
    );
  }

  if (!mainMob) {
    return (
      <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col items-center justify-center gap-4">
        <p className="text-stone-500 uppercase text-xl">Mob not found</p>
        <Link to="/" className="text-stone-400 hover:text-white text-sm uppercase transition-colors">← Back to Mob Tracker</Link>
      </div>
    );
  }

  const isTrackedMain  = !!tracked[mainMob.fileName];
  const isCapturedMain = !!captured[mainMob.fileName];
  const categories     = getMobCategories(mainMob, MobCategories);

  const capturedCount = variants.filter(m => !!captured[m.fileName]).length;
  const total         = variants.length;
  const pct           = total > 0 ? Math.round((capturedCount / total) * 100) : 0;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">

      {/* Header */}
      <header className="bg-stone-900 border-b-4 border-stone-700 px-6 py-6 shadow-xl">
        <div className="max-w-5xl mx-auto">
          <Link to="/" className="text-stone-500 text-xs uppercase hover:text-stone-300 transition-colors mb-5 inline-flex items-center gap-1">
            ← Mob Tracker
          </Link>

          <div className="flex items-start gap-6 mt-2">
            {/* Immagine principale + toggle */}
            <div
              onClick={() => toggle(mainMob.fileName)}
              className={`shrink-0 w-32 h-32 flex items-center justify-center bg-[#181818] border-4 cursor-pointer relative transition-all
                ${isCapturedMain ? 'border-green-600 hover:border-green-400'
                : isTrackedMain  ? 'border-yellow-500 hover:border-yellow-400'
                : 'border-stone-700 hover:border-stone-500'}`}
            >
              <img
                src={mainMob.image}
                alt={mainMob.name}
                draggable={false}
                className={`w-full h-full object-contain pixelated ${isCapturedMain ? 'opacity-40' : isTrackedMain ? 'opacity-60' : ''}`}
              />
              {isCapturedMain && (
                <div className="absolute inset-0 flex items-center justify-center">
                  <span className="text-green-500 text-6xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
                </div>
              )}
              {!isCapturedMain && isTrackedMain && captureMode && (
                <div className="absolute inset-0 flex items-center justify-center">
                  <span className="text-yellow-400 text-6xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span>
                </div>
              )}
            </div>

            {/* Info */}
            <div className="flex-1 min-w-0">
              <h1 className="text-4xl uppercase text-stone-100 leading-none">
                {slug.replace(/-/g, ' ').replace(/\b\w/g, c => c.toUpperCase())}
              </h1>

              {/* Badge stato */}
              <div className="flex items-center gap-3 mt-3 flex-wrap">
                <span className={`text-[10px] uppercase px-2 py-0.5 border-2
                  ${isCapturedMain ? 'bg-green-900 text-green-300 border-green-700'
                  : isTrackedMain  ? 'bg-yellow-900 text-yellow-300 border-yellow-700'
                  : 'bg-stone-800 text-stone-500 border-stone-700'}`}>
                  {isCapturedMain ? 'Caught' : isTrackedMain ? 'Spotted' : 'Not caught'}
                </span>
                {total > 1 && (
                  <span className={`text-[10px] uppercase px-2 py-0.5 border-2
                    ${pct === 100 ? 'bg-green-900 text-green-300 border-green-800' : 'bg-stone-800 text-stone-400 border-stone-700'}`}>
                    {capturedCount} / {total} variants caught
                  </span>
                )}
              </div>

              {/* Barra progresso varianti */}
              {total > 1 && (
                <div className="mt-3 h-2 bg-stone-800 border border-stone-700 w-full max-w-sm">
                  <div className={`h-full transition-all duration-500 ${pct === 100 ? 'bg-green-400' : 'bg-stone-400'}`}
                    style={{ width: `${pct}%` }} />
                </div>
              )}

              {/* Bottone Wiki */}
              {wikiLink && (
                <a
                  href={wikiLink}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center gap-2 mt-4 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-3 py-1.5 transition-colors"
                >
                  <img src="/icons/wiki.ico" alt="Wiki" className="w-4 h-4 object-contain" draggable={false} />
                  <span className="text-xs uppercase text-stone-300">Minecraft Wiki</span>
                  <span className="text-stone-600 text-[10px]">↗</span>
                </a>
              )}

              {/* Categorie */}
              {categories.length > 0 && (
                <div className="flex flex-wrap gap-2 mt-4">
                  {categories.map(cat => (
                    <Link
                      key={cat.id}
                      to={`/categories/${cat.id}`}
                      className="flex items-center gap-1.5 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors"
                    >
                      <CategoryIcon icon={cat.icon} label={cat.label} className="w-4 h-4" />
                      <span className="text-xs uppercase text-stone-300">{cat.label}</span>
                    </Link>
                  ))}
                </div>
              )}
            </div>
          </div>
        </div>
      </header>

      {/* Modal variante */}
      {selectedVariant && (() => {
        const vm        = selectedVariant;
        const vDesc     = getVariantDescription(slug, vm.fileName);
        const vTracked  = !!tracked[vm.fileName];
        const vCaptured = !!captured[vm.fileName];
        const vCats     = getMobCategories(vm, MobCategories);
        const suffixDisplay = vm.activeSuffixes?.length > 0
          ? (() => {
              const labels = [...new Set(vm.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))];
              return labels.length > 0 ? `(${labels.join(', ')})` : '';
            })()
          : '';
        return (
          <div
            className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/80 backdrop-blur-sm p-4"
            onClick={() => setSelectedVariant(null)}
          >
            <div
              className="bg-stone-900 border-4 border-stone-600 shadow-2xl max-w-sm w-full"
              onClick={e => e.stopPropagation()}
            >
              {/* Immagine grande */}
              <div className={`relative flex items-center justify-center bg-[#181818] border-b-4
                ${vCaptured ? 'border-green-700' : vTracked ? 'border-yellow-700' : 'border-stone-700'}`}
                style={{ height: '240px' }}
              >
                <img src={vm.image} alt={vm.name} draggable={false}
                  className={`max-w-full max-h-full object-contain pixelated ${vCaptured ? 'opacity-40' : vTracked ? 'opacity-60' : ''}`}
                  style={{ maxHeight: '220px', imageRendering: 'pixelated' }}
                />
                {vCaptured && (
                  <div className="absolute inset-0 flex items-center justify-center">
                    <span className="text-green-500 text-8xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
                  </div>
                )}
                {!vCaptured && vTracked && captureMode && (
                  <div className="absolute inset-0 flex items-center justify-center">
                    <span className="text-yellow-400 text-8xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span>
                  </div>
                )}
              </div>

              {/* Info */}
              <div className="p-5 space-y-3">
                <p className="text-sm uppercase text-stone-200 leading-tight">
                  {vm.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
                </p>

                {/* Categorie cliccabili */}
                {vCats.length > 0 && (
                  <div className="flex flex-wrap gap-2">
                    {vCats.map(cat => (
                      <button
                        key={cat.id}
                        onClick={() => { setSelectedVariant(null); navigate(`/categories/${cat.id}`); }}
                        className="flex items-center gap-1.5 border-2 border-stone-700 hover:border-stone-500 bg-stone-800 hover:bg-stone-700 px-2 py-1 transition-colors"
                      >
                        <CategoryIcon icon={cat.icon} label={cat.label} className="w-4 h-4" />
                        <span className="text-xs uppercase text-stone-300">{cat.label}</span>
                      </button>
                    ))}
                  </div>
                )}

                {/* Descrizione variante */}
                {vDesc
                  ? <p className="text-stone-400 text-xs leading-relaxed border-t border-stone-700 pt-3">{vDesc}</p>
                  : <p className="text-stone-600 text-xs uppercase">No description available.</p>
                }

                {/* Toggle + chiudi */}
                <div className="flex gap-3 pt-2">
                  <button
                    onClick={() => { toggle(vm.fileName); setSelectedVariant(null); }}
                    className={`flex-1 py-2 border-b-4 border-black uppercase text-xs transition-transform active:translate-y-1 active:border-b-0
                      ${vCaptured ? 'bg-red-800 hover:bg-red-700' : 'bg-green-700 hover:bg-green-600'}`}
                  >
                    {vCaptured ? 'Unmark' : 'Mark Caught'}
                  </button>
                  <button
                    onClick={() => setSelectedVariant(null)}
                    className="px-4 py-2 bg-stone-700 hover:bg-stone-600 border-b-4 border-black uppercase text-xs transition-transform active:translate-y-1 active:border-b-0"
                  >
                    Close
                  </button>
                </div>
              </div>
            </div>
          </div>
        );
      })()}

      {/* Body */}
      <main className="flex-1 max-w-5xl mx-auto w-full px-6 py-8 space-y-8">

        {/* Descrizione */}
        {description && (
          <section className="bg-stone-900/60 border-2 border-stone-700 p-5">
            <p className="text-[10px] uppercase tracking-widest text-stone-500 mb-3">Informations</p>
            <div className="text-stone-300 text-sm leading-relaxed space-y-2">
              {Array.isArray(description)
                ? description.map((block, i) => {
                    if (typeof block === 'string') {
                      if (block === '\n') return <div key={i} className="h-2" />;
                      if (block === '---') return <hr key={i} className="border-stone-700 my-1" />;
                      if (block.startsWith('## ')) return (
                        <p key={i} className="text-stone-400 text-xs uppercase tracking-widest pt-1">
                          {block.slice(3)}
                        </p>
                      );
                      return <p key={i}>{block}</p>;
                    }
                    const iconMap = {
                      youtube: { src: 'https://www.youtube.com/favicon.ico', alt: 'YouTube' },
                      reddit:  { src: 'https://www.reddit.com/favicon.ico',  alt: 'Reddit'  },
                      wiki:    { src: '/icons/wiki.ico',                     alt: 'Wiki'    },
                      twitch:  { src: 'https://static.twitchsvc.net/assets/uploads/favicon.ico', alt: 'Twitch' },
                    };
                    const ico = block.icon ? iconMap[block.icon] : null;
                    return (
                      <a key={i} href={block.href} target="_blank" rel="noopener noreferrer"
                        className="inline-flex items-center gap-1.5 text-green-400 hover:text-green-300 underline underline-offset-2 transition-colors">
                        {ico && <img src={ico.src} alt={ico.alt} className="w-4 h-4 object-contain shrink-0" />}
                        {block.text}
                        <span className="text-[10px] no-underline">↗</span>
                      </a>
                    );
                  })
                : <p>{description}</p>
              }
            </div>
          </section>
        )}

        {/* Varianti */}
        <section>
          {total > 1 && (
            <div className="flex items-center gap-4 mb-3">
              <span className="text-[10px] uppercase text-stone-600 shrink-0">Size</span>
              <input
                type="range"
                min={60}
                max={160}
                step={10}
                value={cardSize}
                onChange={e => setCardSize(Number(e.target.value))}
                className="flex-1 accent-stone-400 h-1 cursor-pointer"
              />
            </div>
          )}
          <p className="text-[10px] uppercase text-stone-500 tracking-widest border-b-2 border-stone-800 pb-3 mb-5">
            {total <= 1 ? 'Variants' : `${total} variants — click name to toggle`}
          </p>
          {total <= 1 ? (
            <p className="text-stone-600 uppercase text-sm">This mob has no variants.</p>
          ) : (
            <div className="grid gap-2" style={{ gridTemplateColumns: `repeat(auto-fill, minmax(${cardSize}px, 1fr))` }}>
              {variants.map(mob => (
                <VariantCard
                  key={mob.fileName}
                  mob={mob}
                  isTracked={!!tracked[mob.fileName]}
                  isCaptured={!!captured[mob.fileName]}
                  captureMode={captureMode}
                  onToggle={toggle}
                  onImageClick={setSelectedVariant}
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

export default MobPage;