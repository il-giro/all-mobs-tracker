import React, { useState, useMemo } from 'react';
import { SuffixConfig, ComplexConfig } from '../config/mobConfig';

const PAGES = [
  { id: 'principale',        label: 'Principale',       icon: '⚙' },
  { id: 'varianti-mob',      label: 'Varianti Mob',      icon: '🐾' },
  { id: 'varianti-speciali', label: 'Varianti Speciali', icon: '✦' },
  { id: 'extra',             label: 'Extra',             icon: '◈' },
];

// Converte il nome cartella in PascalCase per il path icona
// es. "zombie villagers" → "ZombieVillagers", "wolves" → "Wolves"
const toIconName = (label) =>
  label.replace(/(?:^|\s)\w/g, c => c.trim().toUpperCase());

const FolderIcon = ({ label }) => {
  const [visible, setVisible] = React.useState(true);
  const name = toIconName(label);
  if (!visible) return <span className="w-5 h-5 shrink-0" />;
  return (
    <img
      src={`/icons/mobs/${name}Face.png`}
      alt={label}
      onError={() => setVisible(false)}
      className="w-5 h-5 object-contain pixelated shrink-0"
      draggable={false}
    />
  );
};

// Toggle solo sul quadratino
const Toggle = ({ active, onClick }) => (
  <div
    onClick={onClick}
    className={`relative w-14 h-7 border-2 shrink-0 transition-colors duration-300 cursor-pointer hover:opacity-80
      ${active ? 'bg-green-500 border-green-700' : 'bg-stone-900 border-stone-600 hover:border-stone-400'}`}
  >
    <div className={`absolute top-0 bottom-0 w-1/2 flex items-center justify-center transition-transform duration-300 ease-in-out ${active ? 'translate-x-full' : 'translate-x-0'}`}>
      <div className={`w-4 h-4 border-2 transition-colors duration-300 ${active ? 'bg-white border-green-900' : 'bg-stone-400 border-stone-600'}`} />
    </div>
  </div>
);

const ToggleBtn = ({ label, showIcon, active, onClick }) => (
  <div className="flex justify-between items-center bg-stone-900/60 p-3 border-2 border-stone-700 select-none">
    <div className="flex items-center gap-2 truncate pr-2">
      {showIcon && <FolderIcon label={label} />}
      <span className="text-sm text-stone-300 uppercase truncate">{label}</span>
    </div>
    <Toggle active={active} onClick={onClick} />
  </div>
);

const Settings = ({ variantMode, setVariantMode, filters, toggleFilter, setFilters, showAllFish, setShowAllFish, folderList = [], resetAll, onClose,
  captureMode, setCaptureMode, selectionMode, setSelectionMode }) => {
  const [activePage, setActivePage] = useState('principale');

  const linkedComplexIds = useMemo(() => new Set(folderList.map(f => f.linkedComplexId).filter(Boolean)), [folderList]);
  const unlinkedComplex  = useMemo(() => ComplexConfig.filter(c => !linkedComplexIds.has(c.id)), [linkedComplexIds]);

  const allFoldersActive = useMemo(() =>
    folderList.every(f => filters[f.id] !== false) && unlinkedComplex.every(c => !!filters[c.id]),
    [folderList, unlinkedComplex, filters]
  );

  const allVariantsActive = useMemo(() =>
    folderList.every(f =>
      filters[f.variantsId] !== false &&
      (f.linkedComplexId ? !!filters[f.linkedComplexId] : true)
    ),
    [folderList, filters]
  );

  const toggleAllFolders = () => {
    const next = !allFoldersActive;
    setFilters(prev => {
      const updated = { ...prev };
      folderList.forEach(f => { updated[f.id] = next; });
      unlinkedComplex.forEach(c => { updated[c.id] = next; });
      return updated;
    });
  };

  const toggleAllVariants = () => {
    const next = !allVariantsActive;
    setFilters(prev => {
      const updated = { ...prev };
      folderList.forEach(f => {
        updated[f.variantsId] = next;
        if (f.linkedComplexId) updated[f.linkedComplexId] = next;
      });
      return updated;
    });
  };

  const suffixList = Object.values(SuffixConfig);

  const allSpecialsActive = useMemo(
    () => suffixList.every(s => filters[s.id] !== false),
    [suffixList, filters]
  );

  const toggleAllSpecials = () => {
    const next = !allSpecialsActive;
    setFilters(prev => {
      const updated = { ...prev };
      suffixList.forEach(s => { updated[s.id] = next; });
      return updated;
    });
  };

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

        {/* Body */}
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

                <section className="bg-stone-800/50 p-5 border-2 border-stone-700 space-y-4">
                  <label className="block text-sm text-amber-400 uppercase mb-1">Modalità</label>

                  <div className="flex justify-between items-start gap-4 py-3 border-b-2 border-stone-700">
                    <div className="flex-1">
                      <p className="text-sm text-stone-200 uppercase">Modalità Cattura</p>
                      <p className="text-xs text-stone-500 mt-1">
                        1° click → <span className="text-yellow-400">Avvistato</span> &nbsp;·&nbsp;
                        2° click → <span className="text-green-400">Catturato</span> &nbsp;·&nbsp;
                        3° click → <span className="text-stone-400">Nessuno</span>
                      </p>
                    </div>
                    <Toggle active={captureMode} onClick={() => setCaptureMode(v => !v)} />
                  </div>

                  <div className="flex justify-between items-start gap-4 py-3">
                    <div className="flex-1">
                      <p className="text-sm text-stone-200 uppercase">Modalità Selezione</p>
                      <p className="text-xs text-stone-500 mt-1">
                        Clicca e trascina per selezionare più card contemporaneamente
                      </p>
                    </div>
                    <Toggle active={selectionMode} onClick={() => setSelectionMode(v => !v)} />
                  </div>
                </section>
              </div>
            )}

            {/* VARIANTI MOB */}
            {activePage === 'varianti-mob' && (() => {
              const linkedComplexIds = new Set(folderList.map(f => f.linkedComplexId).filter(Boolean));
              const FISH_KEY     = 'folder:__fish__';
              const FISH_VAR_KEY = 'variants:__fish__';
              const merged = [
                ...folderList.map(f => ({
                  key:          f.id,
                  variantsKey:  f.variantsId,
                  label:        f.label,
                  visibile:     filters[f.id] !== false,
                  varianti:     filters[f.variantsId] !== false,
                  linkedComplexId: f.linkedComplexId,
                  isFish:       false,
                })),
                ...ComplexConfig
                  .filter(c => !linkedComplexIds.has(c.id))
                  .map(c => ({
                    key:         c.id,
                    variantsKey: null,
                    label:       c.label,
                    visibile:    !!filters[c.id],
                    varianti:    null,
                    linkedComplexId: null,
                    isFish:      false,
                  })),
                {
                  key:         FISH_KEY,
                  variantsKey: FISH_VAR_KEY,
                  label:       'Tropical Fish',
                  visibile:    filters[FISH_KEY] !== false,
                  varianti:    filters[FISH_VAR_KEY] !== false,
                  linkedComplexId: null,
                  isFish:      true,
                },
              ].sort((a, b) => a.label.localeCompare(b.label));

              const toggleVarianti = (item) => {
                const next = !item.varianti;
                setFilters(prev => {
                  const u = { ...prev, [item.variantsKey]: next };
                  if (item.linkedComplexId) u[item.linkedComplexId] = next;
                  return u;
                });
              };

              const toggleVisibile = (item) => {
                setFilters(prev => ({ ...prev, [item.key]: !item.visibile }));
              };

              return (
                <div className="space-y-4">
                  <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Varianti Mob</h3>
                  <p className="text-stone-500 text-xs uppercase leading-relaxed border-2 border-stone-800 p-3">
                    Varianti off → mostra solo il mob base. Disattiva anche la cartella.
                    Cartella off → nasconde il pulsante cartella nella home, ma le varianti restano visibili.
                    {variantMode === 'none' && <span className="block mt-1 text-amber-600">Varianti generali disattivate: il toggle varianti non ha effetto.</span>}
                  </p>
                  {/* Header colonne */}
                  <div className="flex items-center border-b border-stone-800 pb-2 pr-1">
                    <div className="flex-1" />
                    <div className="flex gap-2 shrink-0">
                      <span className="w-14 text-center text-[10px] text-stone-600 uppercase">Cartella</span>
                      <span className="w-14 text-center text-[10px] text-stone-600 uppercase">Varianti</span>
                    </div>
                  </div>
                  {/* Toggle globali */}
                  <div className="flex items-center border-b border-stone-800 pb-2">
                    <p className="text-xs text-stone-500 uppercase flex-1">Tutti</p>
                    <div className="flex gap-2 shrink-0">
                      <Toggle active={allFoldersActive} onClick={toggleAllFolders} />
                      <Toggle active={allVariantsActive} onClick={toggleAllVariants} />
                    </div>
                  </div>
                  <div className="space-y-2">
                    {merged.map(item => (
                      <div key={item.key} className="flex items-center bg-stone-900/60 p-3 border-2 border-stone-700 select-none gap-2">
                        <FolderIcon label={item.label} />
                        <span className="text-sm text-stone-300 uppercase truncate flex-1 pr-2">{item.label}</span>
                        <div className="flex gap-2 shrink-0 items-center">
                          <Toggle active={item.visibile} onClick={() => toggleVisibile(item)} />
                          {item.isFish
                            ? <select
                                value={showAllFish ? 'all' : (variantMode === 'none' ? 'none' : variantMode === 'main' ? 'main' : 'main')}
                                onChange={e => {
                                  const v = e.target.value;
                                  if (v === 'none') { setVariantMode('none'); setShowAllFish(false); }
                                  else if (v === 'main') { if (variantMode === 'none') setVariantMode('main'); setShowAllFish(false); }
                                  else { setVariantMode('all'); setShowAllFish(true); }
                                }}
                                className="bg-black text-white border-2 border-stone-600 px-2 py-1 text-[10px] uppercase outline-none cursor-pointer"
                                style={{ width: '7rem' }}
                              >
                                <option value="none">1 variante</option>
                                <option value="main">22 principali</option>
                                <option value="all">3072 varianti</option>
                              </select>
                            : item.variantsKey !== null
                              ? <Toggle active={item.varianti} onClick={() => toggleVarianti(item)} />
                              : <div className="w-14 h-7" />
                          }
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              );
            })()}

            {/* VARIANTI SPECIALI */}
            {activePage === 'varianti-speciali' && (
              <div className="space-y-4">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Varianti Speciali</h3>
                <div className="space-y-2">
                  {/* Toggle globale speciali */}
                  <div className="flex items-center justify-between mb-2 border-b border-stone-800 pb-2">
                    <p className="text-xs text-stone-500 uppercase">Tutti</p>
                    <Toggle active={allSpecialsActive} onClick={toggleAllSpecials} />
                  </div>
                  {suffixList.map(s => (
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