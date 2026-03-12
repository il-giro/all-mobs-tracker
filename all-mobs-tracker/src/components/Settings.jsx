import React, { useState, useMemo, useEffect } from 'react';
import { SuffixConfig, ComplexConfig, SpecialFolderMap } from '../config/mobConfig';

const SCROLLBAR_STYLE = `
  .settings-scroll::-webkit-scrollbar { width: 6px; }
  .settings-scroll::-webkit-scrollbar-track { background: #0c0c0c; }
  .settings-scroll::-webkit-scrollbar-thumb { background: #44403c; border-radius: 0; }
  .settings-scroll::-webkit-scrollbar-thumb:hover { background: #78716c; }
`;

const PAGES = [
  { id: 'principale',        label: 'Principale',       icon: '⚙' },
  { id: 'varianti-mob',      label: 'Varianti Mob',      icon: '🐾' },
  { id: 'varianti-speciali', label: 'Varianti Speciali', icon: '✦' },
  { id: 'data',              label: 'Data',              icon: '💾' },
];

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

const Settings = ({
  variantMode, setVariantMode,
  filters, toggleFilter, setFilters,
  showAllFish, setShowAllFish,
  folderList = [],
  resetAll, onClose,
  captureMode, setCaptureMode,
  selectionMode, setSelectionMode,
  confirmAdd, setConfirmAdd,
  confirmRemove, setConfirmRemove,
}) => {
  const [activePage, setActivePage] = useState('principale');

  const linkedComplexIds = useMemo(() => new Set(folderList.map(f => f.linkedComplexId).filter(Boolean)), [folderList]);
  const unlinkedComplex  = useMemo(() => ComplexConfig.filter(c => !linkedComplexIds.has(c.id)), [linkedComplexIds]);

  const FISH_FOLDER_KEY = 'folder:__fish__';

  // ── Varianti Mob ──────────────────────────────────────────────────────────
  const allFoldersActive = useMemo(() =>
    folderList.every(f => filters[f.id] !== false) &&
    unlinkedComplex.every(c => !!filters[c.id]) &&
    filters[FISH_FOLDER_KEY] !== false,
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
      updated[FISH_FOLDER_KEY] = next;
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

  // ── Varianti Speciali ─────────────────────────────────────────────────────
  // suffixList ordinata per label
  const suffixList = useMemo(
    () => Object.values(SuffixConfig).sort((a, b) => a.label.localeCompare(b.label)),
    []
  );

  // Chiave per il toggle "mostra cartella" = suffixId (es. 'A', 'B', …)
  // Chiave per il toggle "mostra varianti" = 'variants:special:<suffixId>'
  const specialVariantsKey = (suffixId) => `variants:special:${suffixId}`;

  const allSpecialFoldersActive = useMemo(
    () => suffixList.every(s => filters[s.id] !== false),
    [suffixList, filters]
  );

  const allSpecialVariantsActive = useMemo(
    () => suffixList.every(s => filters[specialVariantsKey(s.id)] !== false),
    [suffixList, filters]
  );

  const toggleAllSpecialFolders = () => {
    const next = !allSpecialFoldersActive;
    setFilters(prev => {
      const updated = { ...prev };
      suffixList.forEach(s => { updated[s.id] = next; });
      return updated;
    });
  };

  const toggleAllSpecialVariants = () => {
    const next = !allSpecialVariantsActive;
    setFilters(prev => {
      const updated = { ...prev };
      suffixList.forEach(s => { updated[specialVariantsKey(s.id)] = next; });
      return updated;
    });
  };

  // Inizializza le chiavi variants:special:* mancanti a true
  useEffect(() => {
    setFilters(prev => {
      const updated = { ...prev };
      let changed = false;
      suffixList.forEach(s => {
        const k = specialVariantsKey(s.id);
        if (updated[k] === undefined) { updated[k] = true; changed = true; }
      });
      return changed ? updated : prev;
    });
  }, []);

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <style>{SCROLLBAR_STYLE}</style>
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
          <div className="settings-scroll flex-1 overflow-y-auto p-8 overscroll-contain">

            {/* ── PRINCIPALE ──────────────────────────────────────────────── */}
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

                <section className="bg-stone-800/50 p-5 border-2 border-stone-700 space-y-4">
                  <label className="block text-sm text-amber-400 uppercase mb-1">Conferme</label>

                  <div className="flex justify-between items-start gap-4 py-3 border-b-2 border-stone-700">
                    <div className="flex-1">
                      <p className="text-sm text-stone-200 uppercase">Conferma Aggiunta</p>
                      <p className="text-xs text-stone-500 mt-1">
                        Mostra una finestra di conferma prima di segnare un mob come avvistato o catturato
                      </p>
                    </div>
                    <Toggle active={confirmAdd} onClick={() => setConfirmAdd(v => !v)} />
                  </div>

                  <div className="flex justify-between items-start gap-4 py-3">
                    <div className="flex-1">
                      <p className="text-sm text-stone-200 uppercase">Conferma Rimozione</p>
                      <p className="text-xs text-stone-500 mt-1">
                        Mostra una finestra di conferma prima di rimuovere un mob dai catturati
                      </p>
                    </div>
                    <Toggle active={confirmRemove} onClick={() => setConfirmRemove(v => !v)} />
                  </div>
                </section>
              </div>
            )}

            {/* ── VARIANTI MOB ────────────────────────────────────────────── */}
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

            {/* ── VARIANTI SPECIALI ────────────────────────────────────────── */}
            {activePage === 'varianti-speciali' && (
              <div className="space-y-4">
                <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Varianti Speciali</h3>
                <p className="text-stone-500 text-xs uppercase leading-relaxed border-2 border-stone-800 p-3">
                  Cartella off → nasconde il pulsante nella home e i mob di quella categoria.
                  Varianti off → mostra solo il mob base di ogni categoria speciale (senza sub-varianti).
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
                    <Toggle active={allSpecialFoldersActive}  onClick={toggleAllSpecialFolders}  />
                    <Toggle active={allSpecialVariantsActive} onClick={toggleAllSpecialVariants} />
                  </div>
                </div>

                {/* Righe per ogni suffisso */}
                <div className="space-y-2">
                  {suffixList.map(s => {
                    const varKey      = specialVariantsKey(s.id);
                    const folderActive  = filters[s.id] !== false;
                    const variantActive = filters[varKey] !== false;
                    return (
                      <div
                        key={s.id}
                        className="flex items-center bg-stone-900/60 p-3 border-2 border-stone-700 select-none gap-2"
                      >
                        {/* Pallino colore categoria */}
                        <span className={`w-3 h-3 shrink-0 border border-stone-600 ${s.color}`} />
                        <span className="text-sm text-stone-300 uppercase truncate flex-1 pr-2">
                          {s.label}
                        </span>
                        <div className="flex gap-2 shrink-0">
                          {/* Toggle cartella */}
                          <Toggle
                            active={folderActive}
                            onClick={() => toggleFilter(s.id)}
                          />
                          {/* Toggle varianti */}
                          <Toggle
                            active={variantActive}
                            onClick={() => setFilters(prev => ({ ...prev, [varKey]: !variantActive }))}
                          />
                        </div>
                      </div>
                    );
                  })}
                </div>
              </div>
            )}

            {/* ── DATA ────────────────────────────────────────────────────── */}
            {activePage === 'data' && (() => {
              const handleExport = () => {
                const data = {
                  version: 1,
                  exportedAt: new Date().toISOString(),
                  progress: {
                    saves:    JSON.parse(localStorage.getItem('mobTracker_saves')    || '{}'),
                    captured: JSON.parse(localStorage.getItem('mobTracker_captured') || '{}'),
                  },
                  settings: {
                    filters:        JSON.parse(localStorage.getItem('mobTracker_filters')       || '{}'),
                    mode:           localStorage.getItem('mobTracker_mode')           || 'main',
                    showAllFish:    localStorage.getItem('mobTracker_showAllFish')    || 'false',
                    sort:           localStorage.getItem('mobTracker_sort')           || 'alpha-asc',
                    groupByFolder:  localStorage.getItem('mobTracker_groupByFolder')  || 'false',
                    captureMode:    localStorage.getItem('mobTracker_captureMode')    || 'false',
                    selectionMode:  localStorage.getItem('mobTracker_selectionMode')  || 'false',
                    confirmAdd:     localStorage.getItem('mobTracker_confirmAdd')     || 'false',
                    confirmRemove:  localStorage.getItem('mobTracker_confirmRemove')  || 'false',
                  },
                };
                const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
                const url  = URL.createObjectURL(blob);
                const a    = document.createElement('a');
                a.href     = url;
                a.download = `mobtracker-backup-${new Date().toISOString().slice(0,10)}.json`;
                a.click();
                URL.revokeObjectURL(url);
              };

              const handleImport = (e) => {
                const file = e.target.files?.[0];
                if (!file) return;
                const reader = new FileReader();
                reader.onload = (ev) => {
                  try {
                    const data = JSON.parse(ev.target.result);
                    if (data.progress) {
                      if (data.progress.saves)    localStorage.setItem('mobTracker_saves',    JSON.stringify(data.progress.saves));
                      if (data.progress.captured) localStorage.setItem('mobTracker_captured', JSON.stringify(data.progress.captured));
                    }
                    if (data.settings) {
                      const s = data.settings;
                      if (s.filters)       localStorage.setItem('mobTracker_filters',       JSON.stringify(s.filters));
                      if (s.mode)          localStorage.setItem('mobTracker_mode',           s.mode);
                      if (s.showAllFish)   localStorage.setItem('mobTracker_showAllFish',    s.showAllFish);
                      if (s.sort)          localStorage.setItem('mobTracker_sort',           s.sort);
                      if (s.groupByFolder) localStorage.setItem('mobTracker_groupByFolder',  s.groupByFolder);
                      if (s.captureMode)   localStorage.setItem('mobTracker_captureMode',    s.captureMode);
                      if (s.selectionMode) localStorage.setItem('mobTracker_selectionMode',  s.selectionMode);
                      if (s.confirmAdd)    localStorage.setItem('mobTracker_confirmAdd',     s.confirmAdd);
                      if (s.confirmRemove) localStorage.setItem('mobTracker_confirmRemove',  s.confirmRemove);
                    }
                    window.location.reload();
                  } catch {
                    alert('File non valido.');
                  }
                };
                reader.readAsText(file);
                e.target.value = '';
              };

              return (
                <div className="space-y-6">
                  <h3 className="text-xl text-stone-300 uppercase border-b-2 border-stone-700 pb-3">Data</h3>

                  <section className="bg-stone-800/50 p-5 border-2 border-stone-700 space-y-3">
                    <p className="text-sm text-amber-400 uppercase">Importa</p>
                    <p className="text-xs text-stone-500">Carica un backup precedente. La pagina verrà ricaricata.</p>
                    <label className="block w-full mt-2">
                      <span className="block w-full text-center bg-stone-700 hover:bg-stone-600 text-stone-200 text-sm py-3 border-b-4 border-black uppercase transition-transform cursor-pointer border-2 border-stone-600">
                        ⬆ Importa backup
                      </span>
                      <input type="file" accept=".json" className="hidden" onChange={handleImport} />
                    </label>
                  </section>

                  <section className="bg-stone-800/50 p-5 border-2 border-stone-700 space-y-3">
                    <p className="text-sm text-amber-400 uppercase">Esporta</p>
                    <p className="text-xs text-stone-500">Salva progressi e impostazioni in un file JSON.</p>
                    <button
                      onClick={handleExport}
                      className="w-full bg-stone-700 hover:bg-stone-600 text-stone-200 text-sm py-3 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 border-2 border-stone-600 mt-2"
                    >
                      ⬇ Esporta backup
                    </button>
                  </section>

                  <section className="bg-stone-800/50 p-5 border-2 border-red-900 space-y-3">
                    <p className="text-sm text-red-400 uppercase">Pericoloso</p>
                    <p className="text-xs text-stone-500">Rimuove tutti i progressi. Non reversibile.</p>
                    <button
                      onClick={resetAll}
                      className="w-full bg-red-900 hover:bg-red-800 text-red-200 text-sm py-3 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 border-2 border-red-700 mt-2"
                    >
                      ⚠ Reset Progressi
                    </button>
                  </section>
                </div>
              );
            })()}

          </div>
        </div>
      </div>
    </div>
  );
};

export default Settings;