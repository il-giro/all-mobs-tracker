import React from 'react';

const Settings = ({ 
  allMobs, 
  displayedMobs, 
  trackedCount, 
  variantMode, 
  setVariantMode, 
  resetAll, 
  onClose 
}) => {
  return (
    <div className="min-h-screen bg-stone-900 p-4 md:p-8">
      <div className="max-w-2xl mx-auto">
        <div className="bg-stone-800 rounded-lg shadow-2xl p-6 border-4 border-stone-700">
          <div className="flex justify-between items-center mb-6">
            <h2 className="text-3xl font-bold text-green-400">Impostazioni</h2>
            <button
              onClick={onClose}
              className="bg-stone-700 hover:bg-stone-600 text-white px-4 py-2 rounded-lg font-semibold transition-colors"
            >
              Chiudi
            </button>
          </div>

          <div className="space-y-6">
            {/* Modalità Varianti */}
            <div>
              <label className="block text-white text-lg font-semibold mb-3">
                Modalità Visualizzazione Varianti
              </label>
              <select
                value={variantMode}
                onChange={(e) => setVariantMode(e.target.value)}
                className="w-full bg-stone-900 text-white border-2 border-stone-700 rounded-lg px-4 py-3 text-base focus:border-green-500 focus:outline-none"
              >
                <option value="none">Nessuna Variante</option>
                <option value="main">Varianti Principali</option>
                <option value="complex">Varianti Complesse</option>
                <option value="all">Tutte le Varianti</option>
              </select>
              
              <div className="mt-4 bg-stone-900 rounded-lg p-4 text-gray-300 text-sm space-y-2">
                <p className="font-semibold text-green-400">Dettagli visualizzazione:</p>
                <ul className="space-y-2 ml-4 list-disc">
                  <li>
                    <strong className="text-white">Nessuna Variante:</strong> Solo mob base e il primo di ogni gruppo.
                  </li>
                  <li>
                    <strong className="text-white">Varianti Principali:</strong> Include varianti di primo livello.
                  </li>
                  <li>
                    <strong className="text-white">Varianti Complesse:</strong> Include varianti fino al secondo livello numerico.
                  </li>
                  <li>
                    <strong className="text-white">Tutte le Varianti:</strong> Mostra l'intero database incluse le variazioni di colore.
                  </li>
                </ul>
              </div>
            </div>

            {/* Statistiche */}
            <div className="bg-stone-900 rounded-lg p-4 border-2 border-stone-700">
              <h3 className="text-white font-semibold mb-2">Statistiche</h3>
              <div className="text-gray-300 text-sm grid grid-cols-2 gap-2">
                <p>Totale caricati: <span className="text-green-400 font-bold">{allMobs.length}</span></p>
                <p>Visualizzati: <span className="text-green-400 font-bold">{displayedMobs.length}</span></p>
                <p>Tracciati: <span className="text-green-400 font-bold">{trackedCount}</span></p>
                <div className="col-span-2 mt-2 pt-2 border-t border-stone-700 space-y-1">
                  <p>Base: {allMobs.filter(m => m.type === 'base').length}</p>
                  <p>Principali: {allMobs.filter(m => m.type === 'main_variant').length}</p>
                  <p>Complesse: {allMobs.filter(m => m.type === 'complex_variant').length}</p>
                  <p>Colore: {allMobs.filter(m => m.type === 'color_variant').length}</p>
                </div>
              </div>
            </div>

            <div className="pt-4 border-t border-stone-700">
              <button
                onClick={resetAll}
                className="w-full bg-red-600 hover:bg-red-700 text-white px-6 py-3 rounded-lg font-semibold transition-colors shadow-lg"
              >
                Reset Progressi
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Settings;