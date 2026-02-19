import React from 'react';

const Settings = ({ 
  variantMode, setVariantMode, 
  showRealBaby, setShowRealBaby,
  showBreedBaby, setShowBreedBaby,
  showVillagers, setShowVillagers,
  showHorses, setShowHorses, // Nuovo prop
  resetAll, onClose 
}) => {
  const ToggleBtn = ({ label, active, onClick }) => (
    <div className="flex justify-between items-center bg-stone-900/50 p-3 border-2 border-stone-700">
      <span className="text-lg md:text-xl text-stone-300 uppercase">{label}</span>
      <button 
        onClick={onClick}
        className={`w-14 h-7 md:w-16 md:h-8 border-b-4 transition-all ${
          active ? 'bg-green-600 border-green-900' : 'bg-stone-600 border-stone-800'
        }`}
      >
        <div className={`h-full w-1/2 bg-white/20 transition-all ${active ? 'translate-x-full' : 'translate-x-0'}`} />
      </button>
    </div>
  );

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <div className="bg-stone-800 w-full max-w-lg rounded-lg shadow-2xl p-6 border-4 border-stone-600 relative">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-3xl md:text-4xl text-green-400 uppercase tracking-widest">Impostazioni</h2>
          <button onClick={onClose} className="bg-stone-600 text-white px-4 py-1 text-xl border-b-4 border-stone-800">X</button>
        </div>

        <div className="space-y-6">
          <section>
            <label className="block text-xl text-stone-300 mb-2 uppercase">Modalità Varianti</label>
            <select
              value={variantMode}
              onChange={(e) => setVariantMode(e.target.value)}
              className="w-full bg-stone-900 text-white border-4 border-stone-700 p-3 outline-none uppercase"
            >
              <option value="none">Nessuna (Solo Base)</option>
              <option value="main">Principali (1.1, 1.2...)</option>
              <option value="complex">Complesse</option>
              <option value="all">Tutte (Complete)</option>
            </select>
          </section>

          <section className="space-y-2">
            <label className="block text-xl text-stone-300 uppercase font-bold text-green-500/50">Filtri Speciali</label>
            <ToggleBtn label="Varianti Villager" active={showVillagers} onClick={() => setShowVillagers(!showVillagers)} />
            <ToggleBtn label="Varianti Cavalli" active={showHorses} onClick={() => setShowHorses(!showHorses)} />
            <ToggleBtn label="Natural Baby" active={showRealBaby} onClick={() => setShowRealBaby(!showRealBaby)} />
            <ToggleBtn label="Breed Baby" active={showBreedBaby} onClick={() => setShowBreedBaby(!showBreedBaby)} />
          </section>

          <button onClick={resetAll} className="w-full bg-red-700 text-white text-xl py-3 border-b-4 border-red-900 uppercase">
            Reset Progressi
          </button>
        </div>
      </div>
    </div>
  );
};

export default Settings;