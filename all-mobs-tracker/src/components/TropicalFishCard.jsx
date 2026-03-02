import React, { useState, useEffect, useRef } from 'react';
import { getFishRenderer, FISH_TYPES, COLOR_NAMES } from '../utils/FishRenderer';

const COLOR_BADGES = [
  'bg-white text-black', 'bg-orange-500', 'bg-purple-400', 'bg-blue-300 text-black',
  'bg-yellow-400 text-black', 'bg-lime-500 text-black', 'bg-pink-400', 'bg-gray-600',
  'bg-gray-400 text-black', 'bg-cyan-600', 'bg-purple-700', 'bg-blue-800',
  'bg-amber-900', 'bg-green-800', 'bg-red-700', 'bg-stone-900',
];

// Mappa ufficiale Minecraft JE: typeIndex_bodyColor_patternColor → nome
// typeIndex: 0=Kob,1=Sunstreak,2=Snooper,3=Dasher,4=Brinely,5=Spotty,
//            6=Flopper,7=Stripey,8=Glitter,9=Blockfish,10=Betty,11=Clayfish
// Colori: 0=White,1=Orange,2=Magenta,3=LightBlue,4=Yellow,5=Lime,6=Pink,
//         7=Gray,8=LightGray,9=Cyan,10=Purple,11=Blue,12=Brown,13=Green,14=Red,15=Black
export const OFFICIAL_NAMES = new Map([
  ['7_1_7',   'Anemone'],           // Orange-Gray Stripey
  ['6_7_15',  'Black Tang'],        // Gray Flopper (gray body, black pattern)
  ['6_7_11',  'Blue Tang'],         // Gray-Blue Flopper
  ['11_0_7',  'Butterflyfish'],     // White-Gray Clayfish
  ['9_11_7',  'Cichlid'],           // Blue-Gray Blockfish  (JE: Blue-Gray Sunstreak → shape1)
  ['0_1_0',   'Clownfish'],         // Orange-White Kob
  ['5_6_3',   'Cotton Candy Betta'],// Pink-LightBlue Spotty
  ['9_10_4',  'Dottyback'],         // Purple-Yellow Blockfish
  ['11_0_14', 'Emperor Red Snapper'],// White-Red Clayfish
  ['5_0_4',   'Goatfish'],          // White-Yellow Spotty
  ['8_0_7',   'Moorish Idol'],      // White-Gray Glitter
  ['0_1_14',  'Kob'],               // base Kob (il "Kob" con nome proprio)
  ['11_0_1',  'Ornate Butterflyfish'],// White-Orange Clayfish
  ['3_9_6',   'Parrotfish'],        // Cyan-Pink Dasher
  ['4_5_3',   'Queen Angelfish'],   // Lime-LightBlue Brinely
  ['10_14_0', 'Red Cichlid'],       // Red-White Betty
  ['9_14_0',  'Red Snapper'],       // Red-White Blockfish
  ['6_0_4',   'Threadfin'],         // White-Yellow Flopper
  ['0_14_0',  'Tomato Clownfish'],  // Red-White Kob
  ['1_7_0',   'Triggerfish'],       // Gray-White Sunstreak
  ['3_9_4',   'Yellowtail Parrotfish'], // Cyan-Yellow Dasher
  ['7_4_4',   'Yellow Tang'],       // Yellow Stripey (JE: Yellow Flopper → Flopper=shape 0 idx 6... ma wiki dice Stripey)
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
    setTooltipSide(rect.right + 270 < window.innerWidth ? 'right' : 'left');
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

      {tooltipSide && (
        <div
          onClick={e => e.stopPropagation()}
          onContextMenu={e => { e.preventDefault(); e.stopPropagation(); e._handledByMobCard = true; setTooltipSide(null); }}
          style={{
            position: 'absolute', top: 0, zIndex: 999,
            [tooltipSide === 'right' ? 'left' : 'right']: '100%',
            [tooltipSide === 'right' ? 'marginLeft' : 'marginRight']: '6px',
          }}
          className="bg-stone-800 border-4 border-cyan-700 shadow-2xl p-3 min-w-[250px]"
        >
          {/* Preview grande con zoom */}
          <div className="flex justify-center mb-3 bg-[#181818] p-3 border-2 border-stone-700">
            {imgSrc
              ? <img src={imgSrc} alt={fishName} className="w-44 h-44 object-contain" style={{ imageRendering: 'auto' }} />
              : <div className="w-44 h-44 flex items-center justify-center">
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
        </div>
      )}
    </div>
  );
};

export default TropicalFishCard;