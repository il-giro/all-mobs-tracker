import React from 'react';

const MobCard = ({ mob, isTracked, onToggle }) => {
  return (
    <div
      onClick={onToggle}
      className={`group relative bg-stone-800 border-4 transition-all cursor-pointer overflow-hidden ${isTracked ? 'border-green-600' : 'border-stone-700 hover:border-stone-400 hover:-translate-y-1'}`}
    >
      <div className={`aspect-square p-2 flex items-center justify-center bg-[#181818] relative ${isTracked ? 'opacity-40' : ''}`}>
        <img src={mob.image} alt={mob.name} className="max-w-full max-h-full object-contain pixelated group-hover:scale-110 transition-transform" />
        
        {!isTracked && (
          <>
            {/* Badge Destra (Suffissi come BABY, PET) */}
            <div className="absolute top-1 right-1 flex flex-col gap-1 z-20 items-end">
              {mob.suffixBadges.map(b => (
                <div key={b.id} className={`${b.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md font-bold`}>
                  {b.label}
                </div>
              ))}
            </div>
            
            {/* Badge Sinistra (Categoria come VILLAGER) */}
            <div className="absolute top-1 left-1 z-20">
              {mob.complexBadge ? (
                <div className={`${mob.complexBadge.color} text-[10px] px-2 py-1 border-2 border-stone-900 leading-none shadow-md font-bold`}>
                  {mob.complexBadge.label}
                </div>
              ) : null}
            </div>
          </>
        )}

        {isTracked && (
          <div className="absolute inset-0 flex items-center justify-center z-10">
            <span className="text-green-500 text-7xl drop-shadow-[0_4px_4px_rgba(0,0,0,1)]">✔</span>
          </div>
        )}
      </div>

      <div className={`p-1 text-center border-t-4 ${isTracked ? 'bg-green-900 border-green-700' : 'bg-stone-800 border-stone-700'}`}>
        <p className="text-[10px] leading-tight text-stone-200 uppercase truncate px-1">
          {mob.name} {mob.activeSuffixes.length > 0 ? `(${mob.activeSuffixes.join('')})` : ''}
        </p>
      </div>
    </div>
  );
};

export default MobCard;