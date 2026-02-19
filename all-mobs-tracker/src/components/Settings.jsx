import React from 'react';
import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

const Settings = ({ variantMode, setVariantMode, filters, toggleFilter, resetAll, onClose }) => {
  const ToggleBtn = ({ label, active, onClick }) => (
    <div className="flex justify-between items-center bg-stone-900/50 p-3 border-2 border-stone-700">
      <span className="text-lg text-stone-300 uppercase font-bold">{label}</span>
      <button onClick={onClick} className={`w-14 h-7 border-b-4 transition-all ${active ? 'bg-green-600 border-green-900' : 'bg-stone-600 border-stone-800'}`}>
        <div className={`h-full w-1/2 bg-white/20 transition-all ${active ? 'translate-x-full' : 'translate-x-0'}`} />
      </button>
    </div>
  );

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <div className="bg-stone-800 w-full max-w-lg rounded-lg shadow-2xl p-6 border-4 border-stone-600 overflow-y-auto max-h-[90vh]">
        <div className="flex justify-between items-center mb-6">
          <h2 className="text-3xl text-green-400 uppercase tracking-widest">Settings</h2>
          <button onClick={onClose} className="bg-stone-600 text-white px-4 py-1 text-xl border-b-4 border-stone-800">X</button>
        </div>

        <div className="space-y-6">
          <section>
            <label className="block text-xl text-stone-300 mb-2 uppercase font-bold">Varianti Mostrate</label>
            <select
              value={variantMode}
              onChange={(e) => setVariantMode(e.target.value)}
              className="w-full bg-stone-900 text-white border-4 border-stone-700 p-3 outline-none uppercase font-bold"
            >
              <option value="none">Solo Basi (1.1)</option>
              <option value="main">Principali (1.x)</option>
              <option value="all">Tutte</option>
            </select>
          </section>

          <section className="space-y-2">
            <label className="block text-xl text-green-500 uppercase font-bold mb-2">Filtri Categorie</label>
            {ComplexConfig.map(c => (
              <ToggleBtn key={c.id} label={c.label} active={filters[c.id]} onClick={() => toggleFilter(c.id)} />
            ))}
            {Object.values(SuffixConfig).map(s => (
              <ToggleBtn key={s.id} label={`Mostra ${s.label}`} active={filters[s.id]} onClick={() => toggleFilter(s.id)} />
            ))}
          </section>

          <button onClick={resetAll} className="w-full bg-red-700 text-white text-xl py-3 border-b-4 border-red-900 uppercase font-bold">
            Reset Progressi
          </button>
        </div>
      </div>
    </div>
  );
};

export default Settings;