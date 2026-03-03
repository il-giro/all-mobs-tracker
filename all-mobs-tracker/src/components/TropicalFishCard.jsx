import React, { useState, useEffect, useRef } from 'react';
import { createPortal } from 'react-dom';
import { getFishRenderer, FISH_TYPES, COLOR_NAMES } from '../utils/FishRenderer';

const COLOR_BADGES = [
  'bg-white text-black', 'bg-orange-500', 'bg-purple-400', 'bg-blue-300 text-black',
  'bg-yellow-400 text-black', 'bg-lime-500 text-black', 'bg-pink-400', 'bg-gray-600',
  'bg-gray-400 text-black', 'bg-cyan-600', 'bg-purple-700', 'bg-blue-800',
  'bg-amber-900', 'bg-green-800', 'bg-red-700', 'bg-stone-900',
];

export const OFFICIAL_NAMES = new Map([
  ['7_1_7',   'Anemone'],
  ['6_7_7',   'Black Tang'],
  ['6_7_11',  'Blue Tang'],
  ['11_0_7',  'Butterflyfish'],
  ['1_11_7',  'Cichlid'],
  ['0_1_0',   'Clownfish'],
  ['5_6_3',   'Cotton Candy Betta'],
  ['9_10_4',  'Dottyback'],
  ['11_0_14', 'Emperor Red Snapper'],
  ['5_0_4',   'Goatfish'],
  ['8_0_7',   'Moorish Idol'],
  ['11_0_1',  'Ornate Butterflyfish'],
  ['3_9_6',   'Parrotfish'],
  ['4_5_3',   'Queen Angelfish'],
  ['10_14_0', 'Red Cichlid'],
  ['2_7_14',  'Red Lipped Blenny'],
  ['9_14_0',  'Red Snapper'],
  ['6_0_4',   'Threadfin'],
  ['0_14_0',  'Tomato Clownfish'],
  ['1_7_0',   'Triggerfish'],
  ['3_9_4',   'Yellowtail Parrotfish'],
  ['6_4_4',   'Yellow Tang'],
]);

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';
const TOOLTIP_W = 260;
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

const TropicalFishCard = ({ fish, isTracked, onToggle }) => {
  const [imgSrc, setImgSrc]         = useState(null);
  const [error, setError]           = useState(null);
  const [tooltipPos, setTooltipPos] = useState(null);
  const cardRef    = useRef(null);
  const instanceId = useRef(Math.random());
  const isMounted  = useRef(true);
  const isOpen     = useRef(false);

  const { typeIndex, bodyColor, patternColor } = fish;
  const fishType     = FISH_TYPES[typeIndex];
  const key          = `${typeIndex}_${bodyColor}_${patternColor}`;
  const officialName = OFFICIAL_NAMES.get(key);
  const fishName     = officialName
    ? officialName
    : `${fishType.name} ${COLOR_NAMES[bodyColor]}/${COLOR_NAMES[patternColor]}`;
  const shapeLabel   = fishType.shape === 0 ? 'Small' : 'Large';

  useEffect(() => {
    isMounted.current = true;
    getFishRenderer()
      .render(typeIndex, bodyColor, patternColor)
      .then(dataURL => { if (isMounted.current) setImgSrc(dataURL); })
      .catch(err   => { if (isMounted.current) setError(String(err)); });
    return () => { isMounted.current = false; };
  }, [typeIndex, bodyColor, patternColor]);

  // Chiudi quando un'altra card apre il suo tooltip
  useEffect(() => {
    const handler = (e) => {
      if (e.detail.id !== instanceId.current) { setTooltipPos(null); isOpen.current = false; }
    };
    window.addEventListener(TOOLTIP_EVENT, handler);
    return () => window.removeEventListener(TOOLTIP_EVENT, handler);
  }, []);



  // Chiudi con click sinistro fuori o tasto destro ovunque
  useEffect(() => {
    if (!tooltipPos) return;
    const onMouseDown = (e) => {
      if (cardRef.current && cardRef.current.contains(e.target)) return;
      setTooltipPos(null);
      isOpen.current = false;
    };
    const onContextMenuGlobal = (e) => {
      // tasto destro ovunque chiude (a meno che non sia sulla card stessa, gestito da handleContextMenu)
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

  const tooltip = tooltipPos && createPortal(
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
      className="bg-stone-800 border-4 border-cyan-700 shadow-2xl p-3"
    >
      <div className="flex justify-center mb-3 bg-[#181818] border-2 border-stone-700 overflow-hidden" style={{ height: '140px', paddingTop: '15px' }}>
        {imgSrc
          ? <img src={imgSrc} alt={fishName} className="object-contain"
              style={{ imageRendering: 'auto', width: '100%', height: '100%', transform: 'scale(2) translateY(2px)', transformOrigin: 'center center' }} />
          : <div className="w-full h-full flex items-center justify-center">
              <div className="w-6 h-6 border-2 border-cyan-700 border-t-cyan-400 rounded-full animate-spin" />
            </div>
        }
      </div>

      <div className="mb-3 border-b-2 border-stone-600 pb-2">
        <p className="text-sm text-cyan-300 uppercase font-bold leading-tight">{fishName}</p>
        {officialName && (
          <p className="text-[10px] text-amber-400 mt-0.5 uppercase">{fishType.name} • {shapeLabel}</p>
        )}
      </div>

      <div className="flex flex-col gap-2">
        {!officialName && (
          <div className="flex items-center gap-2">
            <span className="text-stone-500 text-xs uppercase w-16 shrink-0">Shape</span>
            <div className="bg-stone-700 text-xs px-2 py-1 border-2 border-stone-900 text-stone-200 leading-none">{shapeLabel}</div>
          </div>
        )}
        <div className="flex items-center gap-2">
          <span className="text-stone-500 text-xs uppercase w-16 shrink-0">Body</span>
          <div className={`${COLOR_BADGES[bodyColor]} text-xs px-2 py-1 border-2 border-stone-900 leading-none font-bold`}>{COLOR_NAMES[bodyColor]}</div>
        </div>
        <div className="flex items-center gap-2">
          <span className="text-stone-500 text-xs uppercase w-16 shrink-0">Pattern</span>
          <div className={`${COLOR_BADGES[patternColor]} text-xs px-2 py-1 border-2 border-stone-900 leading-none font-bold`}>{COLOR_NAMES[patternColor]}</div>
        </div>
        <div className="flex items-center gap-2 mt-1 pt-2 border-t-2 border-stone-700">
          <span className="text-stone-500 text-xs uppercase w-16 shrink-0">Cat.</span>
          <div className={`text-xs px-2 py-1 border-2 border-stone-900 leading-none font-bold ${officialName ? 'bg-amber-600' : 'bg-cyan-700'}`}>
            {officialName ? '★ NAMED' : 'TROPICAL'}
          </div>
        </div>
      </div>
    </div>,
    document.body
  );

  return (
    <>
      <div
        ref={cardRef}
        onClick={onToggle}
        onContextMenu={handleContextMenu}
        style={{ position: 'relative' }}
        className={`group bg-stone-800 border-4 transition-all cursor-pointer overflow-visible
          ${isTracked ? 'border-green-600' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1'}`}
      >
        <div className={`aspect-square flex items-center justify-center bg-[#181818] relative overflow-hidden ${isTracked ? 'opacity-40' : ''}`}>
          {imgSrc && (
            <img src={imgSrc} alt={fishName} draggable={false}
              className="w-full h-full object-contain group-hover:scale-110 transition-transform select-none" />
          )}
          {!imgSrc && !error && (
            <div className="w-5 h-5 border-2 border-cyan-700 border-t-cyan-400 rounded-full animate-spin" />
          )}
          {error && <span className="text-red-500 text-lg">✕</span>}

          {!isTracked && (
            <div className="absolute top-1 right-1 z-20">
              <div className={`text-[9px] px-1 py-0.5 border-2 border-stone-900 leading-none ${officialName ? 'bg-amber-600' : 'bg-cyan-700'}`}>
                {officialName ? '★' : 'T'}
              </div>
            </div>
          )}
          {isTracked && (
            <div className="absolute inset-0 flex items-center justify-center z-10">
              <span className="text-green-500 text-5xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
            </div>
          )}
        </div>

        <div className={`p-1 text-center border-t-4 ${isTracked ? 'bg-green-900 border-green-700' : 'bg-stone-800 border-stone-700'}`}>
          <p className="text-[9px] leading-tight text-stone-200 uppercase truncate px-1" title={fishName}>
            {fishName}
          </p>
        </div>
      </div>
      {tooltip}
    </>
  );
};

export default TropicalFishCard;