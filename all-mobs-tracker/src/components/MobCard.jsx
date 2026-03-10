import React, { useState, useEffect, useRef } from 'react';
import { createPortal } from 'react-dom';
import { useNavigate } from 'react-router-dom';
import { SuffixConfig, SuffixPriority, ComplexConfig, VillagerBiomes, VillagerJobs } from '../config/mobConfig';
import { getCategoriesForMob } from '../config/mobCategories';

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';
const TOOLTIP_W = 220;
const TOOLTIP_H = 420;

const getVillagerIcons = (mob) => {
  if (!mob.complexId) return null;
  const config = ComplexConfig.find(c => c.id === mob.complexId);
  if (!config?.useVillagerIcons) return null;
  const biomeData = VillagerBiomes[mob.num1] ?? null;
  const jobData   = VillagerJobs[mob.num2]   ?? null;
  return { biome: biomeData ?? null, job: jobData ?? null };
};

const calcPos = (rect) => {
  let x = rect.right + 8 + TOOLTIP_W < window.innerWidth
    ? rect.right + 8
    : rect.left - TOOLTIP_W - 8;
  let y = rect.top + window.scrollY;
  const yFixed = rect.top;
  if (yFixed + TOOLTIP_H > window.innerHeight - 8) y = window.scrollY + window.innerHeight - TOOLTIP_H - 8;
  if (yFixed < 8) y = window.scrollY + 8;
  x = x + window.scrollX;
  return { x, y };
};

const MobCard = ({ mob, isTracked, isCaptured, isSelected, captureMode, selectionMode, onToggle, 'data-mob-id': dataMobId }) => {
  const [tooltipPos, setTooltipPos] = useState(null);
  const navigate    = useNavigate();
  const cardRef     = useRef(null);
  const instanceId = useRef(Math.random());
  const isOpen     = useRef(false);

  const topSuffixId    = SuffixPriority.find(id => mob.activeSuffixes.includes(id));
  const topSuffixBadge = topSuffixId ? SuffixConfig[topSuffixId] : null;
  const allBadges      = SuffixPriority.filter(id => mob.activeSuffixes.includes(id)).map(id => SuffixConfig[id]);
  const hasAnyBadge    = allBadges.length > 0 || !!mob.complexBadge;
  const villagerIcons  = getVillagerIcons(mob);
  const mobCategories  = getCategoriesForMob(mob.name, mob.activeSuffixes.map(id => SuffixConfig[id]?.label ?? ''));

  // Estrae item tenuto dall'enderman dal path immagine (es. "Holding-Dandelion" → "dandelion")
  const holdingItemMatch = mob.image?.match(/[Hh]olding-([A-Za-z]+(?:-[A-Za-z]+)*)/);
  const holdingItem = holdingItemMatch ? holdingItemMatch[1].toLowerCase().replace(/-/g, '_') : null;

  const suffixDisplay = mob.activeSuffixes.length > 0
    ? (() => {
        const labels = [...new Set(mob.activeSuffixes.map(id => SuffixConfig[id]?.shortLabel).filter(Boolean))];
        return labels.length > 0 ? `(${labels.join(', ')})` : '';
      })()
    : '';

  useEffect(() => {
    const handler = (e) => {
      if (e.detail.id !== instanceId.current) { setTooltipPos(null); isOpen.current = false; }
    };
    window.addEventListener(TOOLTIP_EVENT, handler);
    return () => window.removeEventListener(TOOLTIP_EVENT, handler);
  }, []);

  useEffect(() => {
    if (!tooltipPos) return;
    const onMouseDown = (e) => {
      if (cardRef.current && cardRef.current.contains(e.target)) return;
      setTooltipPos(null);
      isOpen.current = false;
    };
    const onContextMenuGlobal = (e) => {
      if (cardRef.current && cardRef.current.contains(e.target)) return;
      e.preventDefault();
      setTooltipPos(null);
      isOpen.current = false;
    };
    window.addEventListener('mousedown', onMouseDown);
    window.addEventListener('contextmenu', onContextMenuGlobal, { capture: true });
    return () => {
      window.removeEventListener('mousedown', onMouseDown);
      window.removeEventListener('contextmenu', onContextMenuGlobal, { capture: true });
    };
  }, [!!tooltipPos]);

  const handleContextMenu = (e) => {
    e.preventDefault();
    e.stopPropagation();
    e._handledByMobCard = true;
    window.dispatchEvent(new CustomEvent(TOOLTIP_EVENT, { detail: { id: instanceId.current } }));
    if (isOpen.current) {
      setTooltipPos(null);
      isOpen.current = false;
      return;
    }
    isOpen.current = true;
    setTooltipPos(calcPos(cardRef.current.getBoundingClientRect()));
  };

  // Colore bordo via className — isSelected viene ignorato durante drag (usa data-selected CSS)
  const borderClass = isCaptured
    ? 'border-green-600'
    : isTracked
      ? 'border-yellow-500'
      : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1';

  const imgOpacity = isCaptured ? 'opacity-40' : isTracked ? 'opacity-60' : '';

  return (
    <div
      ref={cardRef}
      data-mob-id={dataMobId}
      onClick={onToggle}
      onContextMenu={handleContextMenu}
      style={{ position: 'relative' }}
      className={`mob-card group bg-stone-800 border-4 transition-all cursor-pointer overflow-visible ${borderClass}`}
    >
      <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden ${imgOpacity}`}>
        <img
          src={mob.image}
          alt={mob.name}
          draggable={false}
          onDragStart={e => e.preventDefault()}
          className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform select-none"
        />

        {!isTracked && !isCaptured && (
          <>
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>
                  {mob.complexBadge.label}
                </div>
              </div>
            )}
            {topSuffixBadge && !villagerIcons && (
              <div className="absolute top-1 right-1 z-20">
                <div className={`${topSuffixBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>
                  {topSuffixBadge.label}
                </div>
              </div>
            )}
            {topSuffixBadge && villagerIcons && (
              <div className="absolute bottom-1 left-1/2 -translate-x-1/2 z-20">
                <div className={`${topSuffixBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md whitespace-nowrap`}>
                  {topSuffixBadge.label}
                </div>
              </div>
            )}
            {villagerIcons?.job?.icon && !topSuffixBadge && (
              <div className="absolute bottom-1 left-1 z-20">
                <img src={villagerIcons.job.icon} alt={villagerIcons.job.label} draggable={false}
                  className="w-5 h-5 object-contain pixelated drop-shadow-[0_1px_2px_rgba(0,0,0,1)]" />
              </div>
            )}
            {villagerIcons?.job?.icon && topSuffixBadge && (
              <div className="absolute top-1 right-1 z-20">
                <img src={villagerIcons.job.icon} alt={villagerIcons.job.label} draggable={false}
                  className="w-5 h-5 object-contain pixelated drop-shadow-[0_1px_2px_rgba(0,0,0,1)]" />
              </div>
            )}
            {villagerIcons?.biome?.icon && (
              <div className="absolute bottom-1 right-1 z-20">
                <img src={villagerIcons.biome.icon} alt={villagerIcons.biome.label} draggable={false}
                  className="w-5 h-5 object-contain pixelated drop-shadow-[0_1px_2px_rgba(0,0,0,1)]" />
              </div>
            )}
          </>
        )}

        {/* Icona item tenuto — sempre visibile anche se tracciato/catturato */}
        {holdingItem && (
          <div className="absolute bottom-1 right-1 z-20">
            <img
              src={`/icons/items/${holdingItem}.png`}
              alt={holdingItem}
              draggable={false}
              onError={e => { e.currentTarget.style.display = 'none'; }}
              className="w-5 h-5 object-contain pixelated drop-shadow-[0_1px_2px_rgba(0,0,0,1)]"
            />
          </div>
        )}

        {isCaptured && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
          </div>
        )}
        {!isCaptured && isTracked && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-yellow-400 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span>
          </div>
        )}
      </div>

      <div className={`p-2 text-center border-t-4
        ${isCaptured ? 'bg-green-900 border-green-700'
        : isTracked  ? 'bg-yellow-900 border-yellow-700'
        : 'bg-stone-800 border-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name} {suffixDisplay}
        </p>
      </div>

      {/* Tooltip via portale */}
      {tooltipPos && createPortal(
        <div
          onClick={e => e.stopPropagation()}
          onContextMenu={e => { e.preventDefault(); e.stopPropagation(); setTooltipPos(null); isOpen.current = false; }}
          style={{
            position: 'absolute',
            top: tooltipPos.y,
            left: tooltipPos.x,
            width: TOOLTIP_W,
            zIndex: 99999,
          }}
          className="bg-stone-800 border-4 border-stone-500 shadow-2xl p-3"
        >
          {/* Preview immagine */}
          <div className="flex justify-center mb-3 bg-[#181818] border-2 border-stone-700 overflow-hidden" style={{ height: '120px' }}>
            <img
              src={mob.image}
              alt={mob.name}
              draggable={false}
              className="object-contain pixelated"
              style={{ width: '100%', height: '100%', imageRendering: 'pixelated' }}
            />
          </div>

          <p className="text-sm text-white uppercase mb-2 border-b-2 border-stone-600 pb-2 leading-tight">
            {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
          </p>

          {holdingItem && (
            <div className="flex items-center gap-2 mb-3 pb-2 border-b-2 border-stone-700">
              <img
                src={`/icons/items/${holdingItem}.png`}
                alt={holdingItem}
                draggable={false}
                onError={e => { e.currentTarget.style.display = 'none'; }}
                className="w-5 h-5 object-contain pixelated shrink-0"
              />
              <span className="text-stone-300 text-xs uppercase">{holdingItem.replace(/_/g, ' ')}</span>
              <span className="text-stone-600 text-[9px] uppercase ml-auto">holds</span>
            </div>
          )}

          {villagerIcons && (
            <div className="flex flex-col gap-1 mb-3 pb-2 border-b-2 border-stone-700">
              {villagerIcons.biome && (
                <div className="flex items-center gap-2">
                  {villagerIcons.biome.icon
                    ? <img src={villagerIcons.biome.icon} alt={villagerIcons.biome.label} className="w-5 h-5 object-contain pixelated shrink-0" />
                    : <div className="w-5 h-5 shrink-0" />
                  }
                  <span className="text-stone-300 text-xs uppercase">{villagerIcons.biome.label}</span>
                  <span className="text-stone-600 text-[9px] uppercase ml-auto">bioma</span>
                </div>
              )}
              {villagerIcons.job && (
                <div className="flex items-center gap-2">
                  {villagerIcons.job.icon
                    ? <img src={villagerIcons.job.icon} alt={villagerIcons.job.label} className="w-5 h-5 object-contain pixelated shrink-0" />
                    : <div className="w-5 h-5 shrink-0" />
                  }
                  <span className="text-stone-300 text-xs uppercase">{villagerIcons.job.label}</span>
                  <span className="text-stone-600 text-[9px] uppercase ml-auto">job</span>
                </div>
              )}
            </div>
          )}

          {hasAnyBadge ? (
            <div className="flex flex-col gap-2">
              {mob.complexBadge && (
                <div className="flex items-center gap-2">
                  <span className="text-stone-400 text-xs uppercase w-12 shrink-0">Cat.</span>
                  <div className={`${mob.complexBadge.color} text-white text-xs px-2 py-1 border-2 border-stone-900 leading-none`}>
                    {mob.complexBadge.label}
                  </div>
                </div>
              )}
              {allBadges.length > 0 && (
                <div className="flex flex-col gap-1">
                  <span className="text-stone-400 text-xs uppercase mb-0.5">Categories</span>
                  {allBadges.map((b, i) => (
                    <div key={b.id} className="flex items-center gap-2">
                      <span className={`text-xs w-4 text-center ${i === 0 ? 'text-yellow-400' : 'text-stone-600'}`}>
                        {i === 0 ? '★' : '·'}
                      </span>
                      <div className={`${b.color} text-white text-xs px-2 py-1 border-2 border-stone-900 leading-none flex-grow`}>
                        {b.label}
                      </div>
                      {i === 0 && <span className="text-yellow-500 text-[9px] uppercase">top</span>}
                    </div>
                  ))}
                </div>
              )}
            </div>
          ) : (
            !villagerIcons && <p className="text-stone-500 text-xs uppercase">Nessun badge</p>
          )}

          {mobCategories.length > 0 && (
            <div className="mt-2 pt-2 border-t-2 border-stone-700 flex flex-col gap-1">
              <span className="text-stone-500 text-[9px] uppercase">Categorie</span>
              {mobCategories.map(cat => (
                <button
                  key={cat.id}
                  onMouseDown={e => {
                    e.stopPropagation();
                    setTooltipPos(null);
                    isOpen.current = false;
                    navigate(`/category/${cat.id}`);
                  }}
                  className="flex items-center gap-2 bg-amber-900/40 border border-amber-800 px-2 py-1 hover:bg-amber-900/70 transition-colors w-full text-left"
                >
                  <span className="text-amber-400 text-sm">{cat.icon}</span>
                  <span className="text-amber-300 text-xs uppercase">{cat.label}</span>
                  <span className="text-stone-600 text-[9px] ml-auto">→</span>
                </button>
              ))}
            </div>
          )}
        </div>,
        document.body
      )}
    </div>
  );
};

export default MobCard;