import React, { useState, useEffect, useRef } from 'react';
import { getFishRenderer, FISH_TYPES, COLOR_NAMES } from '../utils/FishRenderer';

const COLOR_BADGES = [
  'bg-white text-black', 'bg-orange-500', 'bg-purple-400', 'bg-blue-300 text-black',
  'bg-yellow-400 text-black', 'bg-lime-500 text-black', 'bg-pink-400', 'bg-gray-600',
  'bg-gray-400 text-black', 'bg-cyan-600', 'bg-purple-700', 'bg-blue-800',
  'bg-amber-900', 'bg-green-800', 'bg-red-700', 'bg-stone-900',
];

// 22 varianti con nome proprio — typeIndex_bodyColor_patternColor
const NAMED_VARIANTS = {
  '0_0_0':   'Kob',
  '0_1_0':   'Sunstreak',  // Kob Orange/Orange ma convenzionalmente
  '1_15_15': 'Blockfish',
  '1_7_7':   'Betty',
  '0_14_1':  'Brinely',
  '1_14_1':  'Clayfish',
  '1_3_3':   'Dasher',
  '0_0_6':   'Flopper',
  '1_4_5':   'Glitter',
  '0_7_8':   'Kob',
  '1_0_0':   'Spotty',
  '1_1_2':   'Snooper',
  '0_5_4':   'Stripey',
  // Nomi ufficiali Minecraft per le 22 varianti named
  // typeIndex(shape0=small,shape1=large) _ bodyColor _ patternColor
};

// Mappa ufficiale: variant_id → nome
// Dalla wiki: https://minecraft.wiki/w/Tropical_fish#Named_varieties
const OFFICIAL_NAMES = new Map([
  ['0_0_1',   'Anemone'],
  ['0_7_7',   'Black Tang'],
  ['1_14_1',  'Blue Tang'],      // Dasher shape=1
  ['0_7_0',   'Butterfly Fish'],
  ['1_15_15', 'Cichlid'],
  ['1_0_0',   'Clownfish'],
  ['0_3_3',   'Cotton Candy Betta'],
  ['1_7_8',   'Dottyback'],
  ['1_5_5',   'Emperor Red Snapper'],
  ['0_14_14', 'Goatfish'],
  ['0_0_0',   'Kob'],
  ['1_1_2',   'Ornate Butterflyfish'],
  ['0_5_4',   'Parrotfish'],
  ['1_3_3',   'Queen Angelfish'],
  ['0_14_1',  'Red Cichlid'],
  ['0_1_14',  'Red Lipped Blenny'],
  ['1_14_14', 'Red Snapper'],
  ['1_0_5',   'Threadfin'],
  ['0_0_6',   'Tomato Clownfish'],
  ['1_15_1',  'Triggerfish'],
  ['0_7_8',   'Yellowtail Parrotfish'],
  ['1_4_5',   'Yellow Tang'],
]);

if (typeof window !== 'undefined') {
  document.addEventListener('contextmenu', (e) => {
    if (!e._handledByMobCard) e.preventDefault();
  });
}

const TOOLTIP_EVENT = 'mobcard:tooltip';

const TropicalFishCard = ({ fish, isTracked, onToggle }) => {
  const [imgSrc, setImgSrc]           = useState(null);
  const [error, setError]             = useState(null);
  const [tooltipSide, setTooltipSide] = useState(null);
  const cardRef    = useRef(null);
  const instanceId = useRef(Math.random());
  const isMounted  = useRef(true);

  const { typeIndex, bodyColor, patternColor } = fish;
  const fishType   = FISH_TYPES[typeIndex];
  const key        = `${typeIndex}_${bodyColor}_${patternColor}`;
  const officialName = OFFICIAL_NAMES.get(key);
  const fishName   = officialName
    ? officialName
    : `${fishType.name} ${COLOR_NAMES[bodyColor]}/${COLOR_NAMES[patternColor]}`;
  const shapeLabel = fishType.shape === 0 ? 'Small' : 'Large';

  useEffect(() => {
    isMounted.current = true;
    getFishRenderer()
      .render(typeIndex, bodyColor, patternColor)
      .then(dataURL => { if (isMounted.current) setImgSrc(dataURL); })
      .catch(err   => { if (isMounted.current) setError(String(err)); });
    return () => { isMounted.current = false; };
  }, [typeIndex, bodyColor, patternColor]);

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
    window.dispatchEvent(new CustomEvent(TOOLTIP_EVENT, { detail: { id: instanceId.current } }));
    if (tooltipSide !== null) { setTooltipSide(null); return; }
    const rect = cardRef.current.getBoundingClientRect();
    setTooltipSide(rect.right + 260 < window.innerWidth ? 'right' : 'left');
  };

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

        {/* Badge nome ufficiale o TROPICAL */}
        {!isTracked && (
          <div className="absolute top-1 right-1 z-20">
            <div className={`text-[9px] px-1 py-0.5 border-2 border-stone-900 leading-none ${officialName ? 'bg-amber-600' : 'bg-cyan-600'}`}>
              {officialName ? '★' : 'TROPICAL'}
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

      {/* Tooltip */}
      {tooltipSide && (
        <div
          onClick={e => e.stopPropagation()}
          onContextMenu={e => { e.preventDefault(); e.stopPropagation(); e._handledByMobCard = true; setTooltipSide(null); }}
          style={{
            position: 'absolute', top: 0, zIndex: 999,
            [tooltipSide === 'right' ? 'left' : 'right']: '100%',
            [tooltipSide === 'right' ? 'marginLeft' : 'marginRight']: '6px',
          }}
          className="bg-stone-800 border-4 border-cyan-700 shadow-2xl p-3 min-w-[240px]"
        >
          {/* Preview grande */}
          <div className="flex justify-center mb-3 bg-[#181818] p-2 border-2 border-stone-700">
            {imgSrc
              ? <img src={imgSrc} alt={fishName} className="w-36 h-36 object-contain" style={{ imageRendering: 'pixelated' }} />
              : <div className="w-36 h-36 flex items-center justify-center">
                  <div className="w-6 h-6 border-2 border-cyan-700 border-t-cyan-400 rounded-full animate-spin" />
                </div>
            }
          </div>

          {/* Nome */}
          <div className="mb-3 border-b-2 border-stone-600 pb-2">
            <p className="text-sm text-cyan-300 uppercase font-bold leading-tight">{fishName}</p>
            {officialName && (
              <p className="text-[10px] text-amber-400 mt-0.5">{fishType.name} variant</p>
            )}
          </div>

          <div className="flex flex-col gap-2">
            <div className="flex items-center gap-2">
              <span className="text-stone-500 text-xs uppercase w-16 shrink-0">Shape</span>
              <div className="bg-stone-700 text-xs px-2 py-1 border-2 border-stone-900 text-stone-200 leading-none">{shapeLabel}</div>
            </div>
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
              <div className={`text-xs px-2 py-1 border-2 border-stone-900 leading-none font-bold ${officialName ? 'bg-amber-600' : 'bg-cyan-600'}`}>
                {officialName ? '★ NAMED' : 'TROPICAL'}
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default TropicalFishCard;