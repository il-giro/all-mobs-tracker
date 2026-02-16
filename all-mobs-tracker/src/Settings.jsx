import React from 'react';

const Settings = ({ 
  variantMode, 
  setVariantMode, 
  showRealBaby,
  setShowRealBaby,
  showBreedBaby,
  setShowBreedBaby,
  resetAll, 
  onClose 
}) => {
  // Stile per il toggle personalizzato
  const ToggleBtn = ({ label, active, onClick }) => (
    <div className="flex justify-between items-center bg-stone-900/50 p-3 border-2 border-stone-700">
      <span className="text-xl text-stone-300 uppercase">{label}</span>
      <button 
        onClick={onClick}
        className={`w-16 h-8 border-b-4 transition-all ${
          active 
          ? 'bg-green-600 border-green-900 translate-y-0' 
          : 'bg-stone-600 border-stone-800'
        }`}
      >
        <div className={`h-full w-1/2 bg-white/20 transition-all ${active ? 'translate-x-full' : 'translate-x-0'}`} />
      </button>
    </div>
  );

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4 font-['VT323']">
      <div className="bg-stone-800 w-full max-w-lg rounded-lg shadow-2xl p-6 border-4 border-stone-600 relative">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-4xl text-green-400 uppercase tracking-widest shadow-black drop-shadow-md">Impostazioni</h2>
          <button onClick={onClose} className="bg-stone-600 hover:bg-stone-500 text-white px-4 py-2 text-xl border-b-4 border-stone-800 active:border-b-0 active:translate-y-1 transition-all">X</button>
        </div>

        <div className="space-y-6">
          {/* Selezione Modalità */}
          <section>
            <label className="block text-2xl text-stone-300 mb-2 uppercase">Modalità Varianti</label>
            <select
              value={variantMode}
              onChange={(e) => setVariantMode(e.target.value)}
              className="w-full bg-stone-900 text-xl text-white border-4 border-stone-700 p-3 focus:border-green-500 outline-none uppercase"
            >
              <option value="none">Nessuna (Solo Base)</option>
              <option value="main">Principali (1.1, 1.2...)</option>
              <option value="complex">Complesse</option>
              <option value="all">Tutte (Complete)</option>
            </select>
          </section>

          {/* Nuovi Toggle per i Baby */}
          <section className="space-y-2">
            <label className="block text-2xl text-stone-300 uppercase">Filtri Speciali</label>
            <ToggleBtn 
              label="Show Natual Spawning Baby" 
              active={showRealBaby} 
              onClick={() => setShowRealBaby(!showRealBaby)} 
            />
            <ToggleBtn 
              label="Show Breed Baby" 
              active={showBreedBaby} 
              onClick={() => setShowBreedBaby(!showBreedBaby)} 
            />
          </section>

          <button
            onClick={resetAll}
            className="w-full bg-red-700 hover:bg-red-600 text-white text-2xl py-3 border-b-4 border-red-900 active:border-b-0 active:translate-y-1 transition-all uppercase tracking-wider"
          >
            Reset Progressi
          </button>
        </div>
      </div>
    </div>
  );
};

export default Settings;