import React, { useState, useEffect, useRef } from 'react';
import { SuffixConfig, SuffixPriority } from '../config/mobConfig';

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';

const MobCard = ({ mob, isTracked, onToggle }) => {
  const [tooltipSide, setTooltipSide] = useState(null);
  const cardRef = useRef(null);
  const instanceId = useRef(Math.random());

  const topSuffixId = SuffixPriority.find(id => mob.activeSuffixes.includes(id));
  const topSuffixBadge = topSuffixId ? SuffixConfig[topSuffixId] : null;
  const allBadges = SuffixPriority.filter(id => mob.activeSuffixes.includes(id)).map(id => SuffixConfig[id]);
  const hasAnyBadge = allBadges.length > 0 || !!mob.complexBadge;

  // Ascolta evento globale: chiudi se un'altra card l'ha emesso
  useEffect(() => {
    const handler = (e) => {
      if (e.detail.id !== instanceId.current) setTooltipSide(null);
    };
    window.addEventListener(TOOLTIP_EVENT, handler);
    return () => window.removeEventListener(TOOLTIP_EVENT, handler);
  }, []);

  const handleContextMenu = (e) => {
    e.preventDefault();
    e.stopPropagation();
    e._handledByMobCard = true;

    // Emetti sempre l'evento per chiudere gli altri tooltip,
    // anche se questa card non ha badge
    window.dispatchEvent(new CustomEvent(TOOLTIP_EVENT, { detail: { id: instanceId.current } }));

    if (!hasAnyBadge) {
      setTooltipSide(null);
      return;
    }

    if (tooltipSide !== null) {
      setTooltipSide(null);
      return;
    }

    const rect = cardRef.current.getBoundingClientRect();
    const side = rect.right + 200 < window.innerWidth ? 'right' : 'left';
    setTooltipSide(side);
  };

  // Chiudi cliccando fuori
  useEffect(() => {
    if (!tooltipSide) return;
    const close = (e) => {
      if (cardRef.current && !cardRef.current.contains(e.target)) setTooltipSide(null);
    };
    window.addEventListener('click', close);
    return () => window.removeEventListener('click', close);
  }, [tooltipSide]);

  return (
    <div
      ref={cardRef}
      onClick={onToggle}
      onContextMenu={handleContextMenu}
      style={{ position: 'relative', zIndex: tooltipSide ? 100 : 'auto' }}
      className={`group bg-stone-800 border-4 transition-all cursor-pointer overflow-visible ${isTracked ? 'border-green-600' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1'}`}
    >
      <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative overflow-hidden ${isTracked ? 'opacity-40' : ''}`}>
        <img
          src={mob.image}
          alt={mob.name}
          draggable={false}
          onDragStart={e => e.preventDefault()}
          className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform select-none"
        />

        {!isTracked && (
          <>
            {topSuffixBadge && (
              <div className="absolute top-1 right-1 z-20">
                <div className={`${topSuffixBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>
                  {topSuffixBadge.label}
                </div>
              </div>
            )}
            {mob.complexBadge && (
              <div className="absolute top-1 left-1 z-20">
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md`}>
                  {mob.complexBadge.label}
                </div>
              </div>
            )}
          </>
        )}

        {isTracked && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
          </div>
        )}
      </div>

      <div className={`p-0.5 text-center border-t-4 ${isTracked ? 'bg-green-900 border-green-700' : 'bg-stone-800 border-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name} {mob.activeSuffixes.length > 0 ? `(${mob.activeSuffixes.join('')})` : ''}
        </p>
      </div>

      {/* Tooltip */}
      {tooltipSide && hasAnyBadge && (
        <div
          onClick={e => e.stopPropagation()}
          onContextMenu={e => {
            e.preventDefault();
            e.stopPropagation();
            e._handledByMobCard = true;
            setTooltipSide(null);
          }}
          style={{
            position: 'absolute',
            top: 0,
            zIndex: 999,
            [tooltipSide === 'right' ? 'left' : 'right']: '100%',
            [tooltipSide === 'right' ? 'marginLeft' : 'marginRight']: '6px',
          }}
          className="bg-stone-800 border-4 border-stone-500 shadow-2xl p-3 min-w-[180px]"
        >
          {/* Nome mob */}
          <p className="text-sm text-white uppercase font-black mb-2 border-b-2 border-stone-600 pb-2 leading-tight">
            {mob.name}
          </p>

          <div className="flex flex-col gap-2">
            {/* Badge categoria complessa */}
            {mob.complexBadge && (
              <div className="flex items-center gap-2">
                <span className="text-stone-400 text-xs uppercase w-12 shrink-0">Cat.</span>
                <div className={`${mob.complexBadge.color} text-xs px-2 py-1 border-2 border-stone-900 leading-none font-black`}>
                  {mob.complexBadge.label}
                </div>
              </div>
            )}

            {/* Suffissi in ordine di priorità */}
            {allBadges.length > 0 && (
              <div className="flex flex-col gap-1">
                <span className="text-stone-400 text-xs uppercase mb-0.5">Suffissi</span>
                {allBadges.map((b, i) => (
                  <div key={b.id} className="flex items-center gap-2">
                    <span className={`text-xs font-black w-4 text-center ${i === 0 ? 'text-yellow-400' : 'text-stone-600'}`}>
                      {i === 0 ? '★' : '·'}
                    </span>
                    <div className={`${b.color} text-xs px-2 py-1 border-2 border-stone-900 leading-none font-black flex-grow`}>
                      {b.label}
                    </div>
                    {i === 0 && (
                      <span className="text-yellow-500 text-[9px] uppercase">top</span>
                    )}
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>
      )}
    </div>
  );
};

export default MobCard;