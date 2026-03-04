import React, { useState } from 'react';
import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

const PAGES = [
  { id: 'principale',        label: 'Principale',       icon: '⚙' },
  { id: 'varianti-mob',      label: 'Varianti Mob',      icon: '🐾' },
  { id: 'varianti-speciali', label: 'Varianti Speciali', icon: '✦' },
  { id: 'extra',             label: 'Extra',             icon: '◈' },
];

const ToggleBtn = ({ label, active, onClick }) => (
  <div className="flex justify-between items-center bg-stone-900/60 p-3 border-2 border-stone-700 select-none">
    <span className="text-sm text-stone-300 uppercase truncate pr-2">{label}</span>
    <div
      onClick={onClick}
      className={`relative w-14 h-7 border-2 shrink-0 transition-colors duration-300 cursor-pointer hover:opacity-80 ${active ? 'bg-green-500 border-green-700' : 'bg-stone-900 border-stone-600 hover:border-stone-400'}`}
    >
      <div className={`absolute top-0 bottom-0 w-1/2 flex items-center justify-center transition-transform duration-300 ease-in-out ${active ? 'translate-x-full' : 'translate-x-0'}`}>
        <div className={`w-4 h-4 border-2 transition-colors duration-300 ${active ? 'bg-white border-green-900' : 'bg-stone-400 border-stone-600'}`} />
      </div>
    </div>
  </div>
);

const Settings = ({ variantMode, setVariantMode, filters, toggleFilter, showAllFish, setShowAllFish, resetAll, onClose }) => {
  const [activePage, setActivePage] = useState('principale');

  const fishCount = variantMode === 'none' ? 1 : variantMode === 'main' ? 22 : showAllFish ? 3072 : 22;

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <div
        className="bg-stone-900 w-full max-w-5xl shadow-2xl border-4 border-stone-600 flex flex-col"
        style={{ height: '80vh' }}
      >

        {/* Header */}
        <div className="flex justify-between items-center px-8 py-5 border-b-4 border-stone-700 bg-stone-800 shrink-0">
          <h2 className="text-4xl text-green-400 uppercase tracking-widest">Settings</h2>
          <button
            onClick={onClose}
            className="bg-stone-700 hover:bg-stone-600 text-white px-6 py-2 text-sm border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0"
          >
            Chiudi
          </button>
        </div>

        {/* Body: sidebar + contenuto */}
        <div className="flex flex-1 overflow-hidden">

          {/* Sidebar */}
          <nav className="w-52 shrink-0 border-r-4 border-stone-700 bg-stone-950 flex flex-col">
            {PAGES.map(page => (
              <button
                key={page.id}
                onClick={() => setActivePage(page.id)}
                className={`w-full text-left px-5 py-5 text-sm uppercase transition-colors border-b-2 border-stone-800 flex items-center gap-3
                  ${activePage === page.id
                    ? 'bg-stone-800 text-green-400 border-l-4 border-l-green-500'
                    : 'text-stone-500 hover:bg-stone-900 hover:text-stone-300 border-l-4 border-l-transparent'
                  }`}
              >
                <span className="text-lg leading-none">{page.icon}</span>
                <span>{page.label}</span>
              </button>
            ))}
          </nav>

          {/* Contenuto */}
          <div className="flex-1 overflow-y-auto p-8 overscroll-contain">

            {/* PRINCIPALE */}
            {activePage === 'principale' && (
              <div className="space-y-6">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Principale</h3>

                <section className="bg-stone-800/50 p-5 border-2 border-stone-700 space-y-3">
                  <label className="block text-sm text-amber-400 uppercase mb-3">Varianti Generali</label>
                  <select
                    value={variantMode}
                    onChange={(e) => setVariantMode(e.target.value)}
                    className="w-full bg-black text-white border-4 border-stone-600 p-3 outline-none uppercase focus:border-green-500 cursor-pointer text-sm"
                  >
                    <option value="none">Normali (Niente varianti)</option>
                    <option value="main">Varianti principali</option>
                    <option value="all">Tutte le varianti esistenti</option>
                  </select>
                </section>

                <section className="bg-stone-800/50 p-5 border-2 border-cyan-900 space-y-3">
                  <div className="flex items-center justify-between">
                    <label className="text-sm text-cyan-400 uppercase">🐠 Tropical Fish</label>
                    <span className="text-stone-500 text-xs uppercase border-2 border-stone-700 px-2 py-1">
                      {fishCount === 1 ? '1 variante' : `${fishCount} varianti`}
                    </span>
                  </div>
                  <p className="text-stone-400 text-sm leading-relaxed">
                    {variantMode === 'none' && 'Con "Niente varianti" viene mostrato solo 1 pesce base.'}
                    {variantMode === 'main' && 'Con "Varianti principali" vengono mostrate le 22 varianti con nome.'}
                    {variantMode === 'all'  && 'Con "Tutte le varianti" puoi scegliere se mostrare tutte le 3072 combinazioni.'}
                  </p>
                  {variantMode === 'all' && (
                    <ToggleBtn
                      label="Mostra tutte le 3072 varianti"
                      active={showAllFish}
                      onClick={() => setShowAllFish(v => !v)}
                    />
                  )}
                </section>
              </div>
            )}

            {/* VARIANTI MOB */}
            {activePage === 'varianti-mob' && (
              <div className="space-y-4">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Varianti Mob</h3>
                <div className="space-y-2">
                  {ComplexConfig.map(c => (
                    <ToggleBtn key={c.id} label={c.label} active={filters[c.id]} onClick={() => toggleFilter(c.id)} />
                  ))}
                </div>
              </div>
            )}

            {/* VARIANTI SPECIALI */}
            {activePage === 'varianti-speciali' && (
              <div className="space-y-4">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Varianti Speciali</h3>
                <div className="space-y-2">
                  {Object.values(SuffixConfig).map(s => (
                    <ToggleBtn key={s.id} label={`Mostra ${s.label}`} active={filters[s.id]} onClick={() => toggleFilter(s.id)} />
                  ))}
                </div>
              </div>
            )}

            {/* EXTRA */}
            {activePage === 'extra' && (
              <div className="space-y-6">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Extra</h3>
                <button
                  onClick={resetAll}
                  className="w-full bg-red-900 hover:bg-red-800 text-red-200 text-sm py-4 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 border-2 border-red-700"
                >
                  ⚠ Reset Progressi
                </button>
              </div>
            )}

          </div>
        </div>

      </div>
    </div>
  );
};

export default Settings;