import React, { useState, useEffect, useRef } from 'react';
import { createPortal } from 'react-dom';
import { useNavigate } from 'react-router-dom';
import { SuffixConfig, SuffixPriority } from '../config/mobConfig';
import { MobCategories } from '../config/mobCategories';
import { resolveIcons, hasVillagerIcons, getMobCategories, POSITION_CLASSES, SIZE_CLASSES } from '../config/mobIcons';
import { mobNameToSlug } from '../config/mobDescriptions';

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';
const TOOLTIP_W = 220;
const TOOLTIP_H = 420;

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

// ─── Icona sulla card ─────────────────────────────────────────────────────────
const MobIcon = ({ icon }) => {
  const [visible, setVisible] = useState(true);
  if (!visible) return null;
  return (
    <div className={`${POSITION_CLASSES[icon.position]} border border-stone-900 bg-stone-400`}>
      <img
        src={icon.src}
        alt={icon.alt}
        draggable={false}
        onError={icon.fallbackHide ? () => setVisible(false) : undefined}
        className={`${SIZE_CLASSES[icon.size ?? 'sm']} object-contain pixelated`}
      />
    </div>
  );
};

// ─── Riga icona nel tooltip ───────────────────────────────────────────────────
// Se l'icona ha categoryId → è un bottone cliccabile che naviga alla pagina categoria.
// Altrimenti → div statico con info.
const TooltipIconRow = ({ icon, onNavigate }) => {
  const [visible, setVisible] = useState(true);
  const isLink = !!icon.categoryId;

  const handleError = icon.fallbackHide
    ? () => setVisible(false)
    : undefined;

  if (!visible) return null;

  const inner = (
    <>
      <img
        src={icon.src}
        alt={icon.alt}
        draggable={false}
        onError={handleError}
        className="w-5 h-5 object-contain pixelated shrink-0"
      />
      <span className={`text-xs uppercase flex-1 ${isLink ? 'text-stone-200' : 'text-stone-300'}`}>
        {icon.label}
      </span>
      <span className="text-[9px] uppercase ml-auto text-stone-500">
        {isLink ? '→' : (icon.labelRole ?? '')}
      </span>
    </>
  );

  if (isLink) {
    return (
      <button
        onMouseDown={e => { e.stopPropagation(); onNavigate(icon.categoryId); }}
        className="flex items-center gap-2 border border-stone-700 hover:border-stone-400 bg-stone-900 hover:bg-stone-700 px-1.5 py-1 transition-colors w-full text-left"
      >
        {inner}
      </button>
    );
  }

  return (
    <div className="flex items-center gap-2 px-1.5 py-1">
      {inner}
    </div>
  );
};

// ─── MobCard ──────────────────────────────────────────────────────────────────
const MobCard = ({ mob, isTracked, isCaptured, isSelected, captureMode, selectionMode, onToggle, 'data-mob-id': dataMobId }) => {
  const [tooltipPos, setTooltipPos] = useState(null);
  const navigate   = useNavigate();
  const cardRef    = useRef(null);
  const instanceId = useRef(Math.random());
  const isOpen     = useRef(false);

  const topSuffixId    = SuffixPriority.find(id => mob.activeSuffixes.includes(id));
  const topSuffixBadge = topSuffixId ? SuffixConfig[topSuffixId] : null;
  const allBadges      = SuffixPriority.filter(id => mob.activeSuffixes.includes(id)).map(id => SuffixConfig[id]);
  const hasAnyBadge    = allBadges.length > 0 || !!mob.complexBadge;
  const isVillager     = hasVillagerIcons(mob);

  // Risolve le icone una sola volta — fonte di verità per card e tooltip
  const iconMap = resolveIcons(mob);

  // Icone che hanno label da mostrare nel tooltip
  const tooltipIcons = [...iconMap.values()].filter(icon => icon.label);

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

  const navigateToCategory = (categoryId) => {
    setTooltipPos(null);
    isOpen.current = false;
    navigate(`/categories/${categoryId}`);
  };

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

        {/* Badge e icone — nascosti se già tracciato/catturato */}
        {!isTracked && !isCaptured && (
          <>
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>
                  {mob.complexBadge.label}
                </div>
              </div>
            )}

            {topSuffixBadge && (
              <div className={isVillager
                ? 'absolute bottom-1 left-1/2 -translate-x-1/2 z-20'
                : 'absolute top-1 right-1 z-20'
              }>
                <div className={`${topSuffixBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md whitespace-nowrap`}>
                  {topSuffixBadge.label}
                </div>
              </div>
            )}

            {[...iconMap.values()].map(icon => (
              <MobIcon key={icon.resolverId} icon={icon} />
            ))}
          </>
        )}

        {/* Icone alwaysVisible — mostrate anche quando tracciato/catturato */}
        {[...iconMap.values()]
          .filter(icon => icon.alwaysVisible)
          .map(icon => <MobIcon key={`always_${icon.resolverId}`} icon={icon} />)
        }

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
          onMouseDown={e => e.stopPropagation()}
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
          {/* Preview immagine — cliccabile → pagina mob */}
          <div
            onMouseDown={e => {
              e.stopPropagation();
              setTooltipPos(null);
              isOpen.current = false;
              const slug = mob.folder && mob.folder !== 'root' && !mob.folder.startsWith('special:')
                ? mob.folder.toLowerCase().replace(/\s+/g, '-')
                : mobNameToSlug(mob.name);
              navigate(`/mobs/${slug}`);
            }}
            className="flex justify-center mb-3 bg-[#181818] border-2 border-stone-700 overflow-hidden cursor-pointer hover:border-stone-500 transition-colors group/img"
            style={{ height: '120px' }}
          >
            <img
              src={mob.image}
              alt={mob.name}
              draggable={false}
              className="object-contain pixelated group-hover/img:scale-110 transition-transform"
              style={{ width: '100%', height: '100%', imageRendering: 'pixelated' }}
            />
          </div>

          <p className="text-sm text-white uppercase mb-2 border-b-2 border-stone-600 pb-2 leading-tight">
            {mob.name}{suffixDisplay ? ` ${suffixDisplay}` : ''}
          </p>

          {/* Icone: statiche o cliccabili (se hanno categoryId) */}
          {tooltipIcons.length > 0 && (
            <div className="flex flex-col gap-1 mb-2 pb-2 border-b-2 border-stone-700">
              {tooltipIcons.map(icon => (
                <TooltipIconRow
                  key={icon.resolverId}
                  icon={icon}
                  onNavigate={navigateToCategory}
                />
              ))}
            </div>
          )}

          {/* Suffix badges */}
          {hasAnyBadge && (
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
                  <span className="text-stone-400 text-xs uppercase mb-0.5">Suffixes</span>
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
          )}

          {!hasAnyBadge && !isVillager && tooltipIcons.length === 0 && (
            <p className="text-stone-500 text-xs uppercase">No badges</p>
          )}
        </div>,
        document.body
      )}
    </div>
  );
};

export default MobCard;