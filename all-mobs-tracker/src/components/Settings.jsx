import React from 'react';
import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

const Settings = ({ variantMode, setVariantMode, filters, toggleFilter, resetAll, onClose }) => {
  const ToggleBtn = ({ label, active, onClick }) => (
    <div
      onClick={onClick}
      className="flex justify-between items-center bg-stone-900/50 p-3 border-2 border-stone-700 hover:bg-stone-800 transition-colors cursor-pointer select-none"
    >
      <span className="text-lg text-stone-300 uppercase  truncate pr-2">{label}</span>

      <div className={`relative w-14 h-7 border-2 shrink-0 transition-colors duration-300 ${active ? 'bg-green-500 border-green-700' : 'bg-stone-900 border-stone-600'}`}>
        <div className={`absolute top-0 bottom-0 w-1/2 flex items-center justify-center transition-transform duration-300 ease-in-out ${active ? 'translate-x-full' : 'translate-x-0'}`}>
          <div className={`w-4 h-4 border-2 transition-colors duration-300 ${active ? 'bg-white border-green-900' : 'bg-stone-400 border-stone-600'}`} />
        </div>
      </div>
    </div>
  );

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      {/* overscroll-contain impedisce che lo scroll si propaghi alla pagina sotto */}
      <div className="bg-stone-800 w-full max-w-4xl rounded-lg shadow-2xl p-6 md:p-8 border-4 border-stone-600 overflow-y-auto overscroll-contain max-h-[90vh]">
        <div className="flex justify-between items-center mb-8 border-b-4 border-stone-700 pb-4">
          <h2 className="text-3xl md:text-4xl text-green-400 uppercase tracking-widest ">Settings</h2>
          <button onClick={onClose} className="bg-stone-600 hover:bg-stone-500 text-white px-5 py-2 text-xl border-b-4 border-stone-900  uppercase transition-transform active:translate-y-1 active:border-b-0">Chiudi</button>
        </div>

        <div className="space-y-8">
          <section className="bg-stone-900/40 p-4 border-2 border-stone-700">
            <label className="block text-2xl text-stone-300 mb-4 uppercase ">Varianti Generali</label>
            <select
              value={variantMode}
              onChange={(e) => setVariantMode(e.target.value)}
              className="w-full bg-black text-white border-4 border-stone-600 p-3 outline-none uppercase  focus:border-green-500 cursor-pointer"
            >
              <option value="none">Normali (Niente varianti)</option>
              <option value="main">Varianti principali</option>
              <option value="all">Tutte le varianti esistenti</option>
            </select>
          </section>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <section className="space-y-3 bg-stone-900/40 p-4 border-2 border-stone-700">
              <label className="block text-xl text-amber-500 uppercase  mb-4 border-b-2 border-stone-600 pb-2">Categorie Complesse</label>
              {ComplexConfig.map(c => (
                <ToggleBtn key={c.id} label={c.label} active={filters[c.id]} onClick={() => toggleFilter(c.id)} />
              ))}
            </section>

            <section className="space-y-3 bg-stone-900/40 p-4 border-2 border-stone-700">
              <label className="block text-xl text-purple-400 uppercase  mb-4 border-b-2 border-stone-600 pb-2">Suffissi Speciali</label>
              {Object.values(SuffixConfig).map(s => (
                <ToggleBtn key={s.id} label={`Mostra ${s.label}`} active={filters[s.id]} onClick={() => toggleFilter(s.id)} />
              ))}
            </section>
          </div>

          <div className="pt-6 mt-6 border-t-4 border-stone-700">
            <button onClick={resetAll} className="w-full bg-red-800 hover:bg-red-700 text-white text-2xl py-4 border-b-4 border-black uppercase  transition-transform active:translate-y-1 active:border-b-0">
              Reset Progressi
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Settings;