import React, { useState, useEffect, useRef } from 'react';
import { createPortal } from 'react-dom';
import { useNavigate } from 'react-router-dom';
import { resolveIcons, hasVillagerIcons, POSITION_CLASSES, SIZE_CLASSES } from '../config/mobIcons';
import { mobNameToSlug } from '../utils/mobParser';

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';
const TOOLTIP_W = 220;
const TOOLTIP_H = 480;

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

const MobIcon = ({ icon }) => {
  const [visible, setVisible] = useState(true);
  if (!visible) return null;
  return (
    <div className={`${POSITION_CLASSES[icon.position]} border border-stone-900 bg-stone-400`}>
      <img src={icon.src} alt={icon.alt} draggable={false}
        onError={icon.fallbackHide ? () => setVisible(false) : undefined}
        className={`${SIZE_CLASSES[icon.size ?? 'sm']} object-contain pixelated`} />
    </div>
  );
};

const MobCard = ({ mob, isTracked, isCaptured, isSelected, captureMode, selectionMode, onToggle, 'data-mob-id': dataMobId }) => {
  const [tooltipPos, setTooltipPos] = useState(null);
  const navigate   = useNavigate();
  const cardRef    = useRef(null);
  const instanceId = useRef(Math.random());
  const isOpen     = useRef(false);

  const isVillager = hasVillagerIcons(mob);
  const iconMap = resolveIcons(mob);

  // Unica fonte per categorie, badge e tooltip: record del database.
  const allMobCats = Array.isArray(mob.categories) ? mob.categories : [];
  const normalCategories = allMobCats.filter(c => c && !c.special);
  const specialCategories = allMobCats.filter(c => c && c.special);
  // Mostra un badge per ogni tipo: una categoria speciale e una normale possono coesistere.
  const specialCardBadge = specialCategories[0] ?? null;
  const normalCardBadge = normalCategories[0] ?? null;

  const suffixDisplay = specialCategories.length > 0
    ? `(${specialCategories.map(c => c.label.replace(/^Special\s*-\s*/i, '')).join(', ')})`
    : '';

  useEffect(() => {
    const handler = (e) => { if (e.detail.id !== instanceId.current) { setTooltipPos(null); isOpen.current = false; } };
    window.addEventListener(TOOLTIP_EVENT, handler);
    return () => window.removeEventListener(TOOLTIP_EVENT, handler);
  }, []);

  useEffect(() => {
    if (!tooltipPos) return;
    const onMouseDown = (e) => {
      if (cardRef.current && cardRef.current.contains(e.target)) return;
      setTooltipPos(null); isOpen.current = false;
    };
    const onContextMenuGlobal = (e) => {
      if (cardRef.current && cardRef.current.contains(e.target)) return;
      e.preventDefault(); setTooltipPos(null); isOpen.current = false;
    };
    window.addEventListener('mousedown', onMouseDown);
    window.addEventListener('contextmenu', onContextMenuGlobal, { capture: true });
    return () => { window.removeEventListener('mousedown', onMouseDown); window.removeEventListener('contextmenu', onContextMenuGlobal, { capture: true }); };
  }, [!!tooltipPos]);

  const handleContextMenu = (e) => {
    e.preventDefault(); e.stopPropagation(); e._handledByMobCard = true;
    window.dispatchEvent(new CustomEvent(TOOLTIP_EVENT, { detail: { id: instanceId.current } }));
    if (isOpen.current) { setTooltipPos(null); isOpen.current = false; return; }
    isOpen.current = true;
    setTooltipPos(calcPos(cardRef.current.getBoundingClientRect()));
  };

  const navigateToCategory = (categoryId) => {
    setTooltipPos(null); isOpen.current = false;
    const category = allMobCats.find(cat => cat.id === categoryId);
    if (category?.special) {
      navigate(`/${category.slug || category.id}`);
    } else {
      navigate(`/categories/${categoryId}`);
    }
  };

  const borderClass = isCaptured ? 'border-green-600' : isTracked ? 'border-yellow-500' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1';
  const imgOpacity  = isCaptured ? 'opacity-40' : isTracked ? 'opacity-60' : '';

  return (
    <div ref={cardRef} data-mob-id={dataMobId} onClick={onToggle} onContextMenu={handleContextMenu}
      style={{ position: 'relative' }}
      className={`mob-card group bg-stone-800 border-4 transition-all cursor-pointer overflow-visible ${borderClass}`}>

      <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden ${imgOpacity}`}>
        <img src={mob.image} alt={mob.name} loading="lazy" decoding="async" draggable={false} onDragStart={e => e.preventDefault()}
          className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform select-none" />

        {!isTracked && !isCaptured && (
          <>
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>{mob.complexBadge.label}</div>
              </div>
            )}
            {/* Badge derivati esclusivamente dalle categorie assegnate dal DB. */}
            {specialCardBadge && (
              <div className="absolute top-1 right-1 z-20">
                <div className="text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md whitespace-nowrap text-white"
                  style={{ backgroundColor: specialCardBadge.colorHex || specialCardBadge.color || '#57534e' }}>
                  {specialCardBadge.label}
                </div>
              </div>
            )}
            {normalCardBadge && (
              <div className={specialCardBadge || isVillager ? 'absolute bottom-1 left-1/2 -translate-x-1/2 z-20' : 'absolute top-1 right-1 z-20'}>
                <div className="text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md whitespace-nowrap text-white"
                  style={{ backgroundColor: normalCardBadge.colorHex || normalCardBadge.color || '#57534e' }}>
                  {normalCardBadge.label}
                </div>
              </div>
            )}
            {[...iconMap.values()].filter(i => !i.tooltipOnly).map(icon => <MobIcon key={icon.resolverId} icon={icon} />)}
          </>
        )}
        {[...iconMap.values()].filter(i => i.alwaysVisible).map(icon => <MobIcon key={`always_${icon.resolverId}`} icon={icon} />)}
        {isCaptured && <div className="absolute inset-0 flex items-center justify-center z-10"><span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span></div>}
        {!isCaptured && isTracked && <div className="absolute inset-0 flex items-center justify-center z-10"><span className="text-yellow-400 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">👁</span></div>}
      </div>

      <div className={`p-2 text-center border-t-4 ${isCaptured ? 'bg-green-900 border-green-700' : isTracked ? 'bg-yellow-900 border-yellow-700' : 'bg-stone-800 border-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">{mob.name} {suffixDisplay}</p>
      </div>

      {tooltipPos && createPortal(
        <div onMouseDown={e => e.stopPropagation()}
          onContextMenu={e => { e.preventDefault(); e.stopPropagation(); setTooltipPos(null); isOpen.current = false; }}
          style={{ position: 'absolute', top: tooltipPos.y, left: tooltipPos.x, width: TOOLTIP_W, zIndex: 99999 }}
          className="bg-stone-800 border-4 border-stone-500 shadow-2xl p-3">

          {/* Immagine → pagina mob */}
          <div onMouseDown={e => {
              e.stopPropagation(); setTooltipPos(null); isOpen.current = false;
              const slug = mob.folder && mob.folder !== 'root' && !mob.folder.startsWith('special:')
                ? mob.folder.toLowerCase().replace(/\s+/g, '-') : mobNameToSlug(mob.name);
              navigate(`/mobs/${slug}`);
            }}
            className="flex justify-center mb-3 bg-[#181818] border-2 border-stone-700 overflow-hidden cursor-pointer hover:border-stone-500 transition-colors group/img"
            style={{ height: '120px' }}>
            <img src={mob.image} alt={mob.name} draggable={false}
              className="object-contain pixelated group-hover/img:scale-110 transition-transform"
              style={{ width: '100%', height: '100%', imageRendering: 'pixelated' }} />
          </div>

          <p className="text-sm text-white uppercase mb-2 border-b-2 border-stone-600 pb-2 leading-tight">
            {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
          </p>

          {/* Categorie normali dal DB */}
          {normalCategories.length > 0 && (
            <div className="flex flex-col gap-1 mb-2 pb-2 border-b-2 border-stone-700">
              <span className="text-stone-500 text-[9px] uppercase px-1 mb-0.5">Categories</span>
              {normalCategories.map(cat => (
                <button key={cat.id} onMouseDown={e => { e.stopPropagation(); navigateToCategory(cat.id); }}
                  className="flex items-center gap-2 border border-stone-700 hover:border-stone-400 bg-stone-900 hover:bg-stone-700 px-1.5 py-1 transition-colors w-full text-left">
                  {cat.icon && (
                    <img src={cat.icon} alt={cat.label} draggable={false} className="w-5 h-5 object-contain pixelated shrink-0" />
                  )}
                  <span className="text-xs uppercase flex-1 text-stone-200">{cat.label || cat.name}</span>
                  <span className="text-[9px] uppercase ml-auto text-stone-500">→</span>
                </button>
              ))}
            </div>
          )}

          {/* Categorie speciali dal DB */}
          {specialCategories.length > 0 && (
            <div className="flex flex-col gap-1 mb-2 pb-2 border-b-2 border-stone-700">
              <span className="text-stone-500 text-[9px] uppercase px-1 mb-0.5">Special categories</span>
              {specialCategories.map(sc => (
                <button key={sc.id} onMouseDown={e => { e.stopPropagation(); navigateToCategory(sc.id); }}
                  className="flex items-center gap-2 border border-stone-700 hover:border-purple-500 bg-stone-900 hover:bg-stone-700 px-1.5 py-1 transition-colors w-full text-left">
                  {sc.icon && (
                    <img src={sc.icon} alt={sc.label} draggable={false} className="w-5 h-5 object-contain pixelated shrink-0" />
                  )}
                  <span className="text-xs uppercase flex-1 text-purple-300">{sc.label || sc.name}</span>
                  <span className="text-[9px] uppercase ml-auto text-stone-500">→</span>
                </button>
              ))}
            </div>
          )}

          {/* Complex badge */}
          {mob.complexBadge && (
            <div className="flex items-center gap-2 mb-2 pb-2 border-b-2 border-stone-700">
              <span className="text-stone-400 text-xs uppercase w-12 shrink-0">Cat.</span>
              <div className={`${mob.complexBadge.color} text-white text-xs px-2 py-1 border-2 border-stone-900 leading-none`}>{mob.complexBadge.label}</div>
            </div>
          )}

          {normalCategories.length === 0 && specialCategories.length === 0 && !mob.complexBadge && (
            <p className="text-stone-500 text-xs uppercase">No categories</p>
          )}
        </div>,
        document.body
      )}
    </div>
  );
};

export default MobCard;