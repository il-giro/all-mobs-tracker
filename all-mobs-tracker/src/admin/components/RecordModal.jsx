import { useState, useEffect, useMemo } from 'react';

function RecordModal({ table, columns, record, metadata, onSave, onClose }) {
  const [values, setValues] = useState({});
  const [loading, setLoading] = useState(false);

  // Fallback cache locale nel caso in cui i metadati non siano stati passati
  const [localMobs, setLocalMobs] = useState(metadata?.mobs || {});
  const [localCats, setLocalCats] = useState(metadata?.categories || {});
  const [localVars, setLocalVars] = useState(metadata?.variants || {});

  // Filtri di ricerca per i selettori a discesa
  const [mobSearch, setMobSearch] = useState('');
  const [varSearch, setVarSearch] = useState('');
  const [catSearch, setCatSearch] = useState('');

  useEffect(() => {
    if (metadata?.mobs && Object.keys(metadata.mobs).length > 0) setLocalMobs(metadata.mobs);
    if (metadata?.categories && Object.keys(metadata.categories).length > 0) setLocalCats(metadata.categories);
    if (metadata?.variants && Object.keys(metadata.variants).length > 0) setLocalVars(metadata.variants);
  }, [metadata]);

  // Caricamento asincrono di categorie e mob se non ancora in cache
  useEffect(() => {
    if (Object.keys(localCats).length === 0) {
      fetch('/api/admin/data/CATEGORIES?limit=100')
        .then(r => r.json())
        .then(res => {
          if (res.success && Array.isArray(res.data)) {
            setLocalCats(Object.fromEntries(res.data.map(c => [c.id, c])));
          }
        })
        .catch(console.error);
    }

    if ((table === 'MOB_CATEGORIES' || table === 'VARIANTS') && Object.keys(localMobs).length === 0) {
      fetch('/api/admin/data/MOBS?limit=100')
        .then(r => r.json())
        .then(res => {
          if (res.success && Array.isArray(res.data)) {
            setLocalMobs(Object.fromEntries(res.data.map(m => [m.id, m])));
          }
        })
        .catch(console.error);
    }

    if (table === 'VARIANT_CATEGORIES' && Object.keys(localVars).length === 0) {
      // Carica le prime pagine di varianti
      const pages = Array.from({ length: 10 }, (_, i) => i + 1);
      Promise.all(
        pages.map(p => fetch(`/api/admin/data/VARIANTS?page=${p}&limit=100`).then(r => r.json()))
      ).then(responses => {
        const map = {};
        for (const res of responses) {
          if (res?.success && Array.isArray(res.data)) {
            for (const v of res.data) map[v.id] = v;
          }
        }
        setLocalVars(map);
      }).catch(console.error);
    }
  }, [table]);

  useEffect(() => {
    if (record) {
      setValues(record);
    } else {
      const initialValues = {};
      columns.forEach(col => {
        if (col.name !== 'id') {
          initialValues[col.name] = col.dflt_value || '';
        }
      });
      setValues(initialValues);
    }
  }, [record, columns]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      // Cast numerico per colonne intere
      const cleanedValues = { ...values };
      columns.forEach(col => {
        if (col.type?.includes('INT') && cleanedValues[col.name] !== undefined && cleanedValues[col.name] !== '') {
          cleanedValues[col.name] = Number(cleanedValues[col.name]);
        }
      });
      await onSave(cleanedValues);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (columnName, value) => {
    setValues(prev => ({
      ...prev,
      [columnName]: value
    }));
  };

  // Liste filtrate per i menu a discesa
  const filteredMobsList = useMemo(() => {
    const list = Object.values(localMobs);
    if (!mobSearch.trim()) return list.sort((a, b) => a.name.localeCompare(b.name));
    const q = mobSearch.toLowerCase();
    return list
      .filter(m => m.name.toLowerCase().includes(q) || String(m.id) === q)
      .sort((a, b) => a.name.localeCompare(b.name));
  }, [localMobs, mobSearch]);

  const filteredCategoriesList = useMemo(() => {
    const list = Object.values(localCats);
    if (!catSearch.trim()) return list.sort((a, b) => a.name.localeCompare(b.name));
    const q = catSearch.toLowerCase();
    return list
      .filter(c => c.name.toLowerCase().includes(q) || String(c.id) === q)
      .sort((a, b) => a.name.localeCompare(b.name));
  }, [localCats, catSearch]);

  const filteredVariantsList = useMemo(() => {
    const list = Object.values(localVars);
    if (!varSearch.trim()) return list.slice(0, 150).sort((a, b) => a.name.localeCompare(b.name));
    const q = varSearch.toLowerCase();
    return list
      .filter(v => v.name.toLowerCase().includes(q) || String(v.id) === q)
      .slice(0, 150)
      .sort((a, b) => a.name.localeCompare(b.name));
  }, [localVars, varSearch]);

  const renderInput = (col) => {
    const value = values[col.name] ?? '';
    const isAutoId = col.name === 'id';

    // Se è la colonna auto-increment 'id'
    if (isAutoId && !record) {
      return null;
    }

    if (isAutoId && record) {
      return (
        <div key={col.name} className="mb-4">
          <label className="block text-sm font-medium text-gray-400 mb-1">
            {col.name} 🔑
          </label>
          <input
            type="text"
            value={value}
            disabled
            className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg text-gray-500 cursor-not-allowed font-mono"
          />
        </div>
      );
    }

    const isRequired = col.notnull === 1 && !col.dflt_value;

    // 1. Campo mob_id (per MOB_CATEGORIES e VARIANTS)
    if (col.name === 'mob_id' && Object.keys(localMobs).length > 0) {
      const selectedMob = localMobs[value];
      return (
        <div key={col.name} className="mb-4 bg-gray-850 p-3 rounded-lg border border-gray-750">
          <label className="block text-sm font-medium text-gray-300 mb-1">
            Mob {isRequired && <span className="text-red-500">*</span>}
            <span className="text-xs text-gray-500 ml-2">(mob_id INTEGER)</span>
          </label>
          <div className="space-y-2">
            <input
              type="text"
              placeholder="Filtra mob per nome o ID..."
              value={mobSearch}
              onChange={(e) => setMobSearch(e.target.value)}
              className="w-full px-3 py-1.5 text-xs bg-gray-800 border border-gray-700 rounded text-gray-300 placeholder-gray-500 focus:ring-1 focus:ring-blue-500"
            />
            <select
              value={value}
              onChange={(e) => handleChange(col.name, e.target.value ? Number(e.target.value) : '')}
              required={isRequired}
              className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white"
            >
              <option value="">-- Seleziona un Mob --</option>
              {filteredMobsList.map(mob => (
                <option key={mob.id} value={mob.id}>
                  #{mob.id} - {mob.name}
                </option>
              ))}
            </select>
            {selectedMob && (
              <div className="flex items-center gap-3 p-2 bg-gray-900 rounded border border-gray-700">
                {selectedMob.img ? (
                  <img
                    src={selectedMob.img}
                    alt={selectedMob.name}
                    className="w-10 h-10 object-contain bg-gray-800 rounded border border-gray-700 flex-shrink-0"
                    style={{ imageRendering: 'pixelated' }}
                    onError={(e) => { e.target.style.display = 'none'; }}
                  />
                ) : (
                  <div className="w-10 h-10 bg-gray-800 rounded border border-gray-700 flex items-center justify-center text-gray-600 flex-shrink-0">🐾</div>
                )}
                <div className="min-w-0">
                  <div className="text-sm font-semibold text-white truncate">{selectedMob.name}</div>
                  <div className="text-xs text-gray-400">ID Mob: {selectedMob.id}</div>
                </div>
              </div>
            )}
          </div>
        </div>
      );
    }

    // 2. Campo variant_id (per VARIANT_CATEGORIES)
    if (col.name === 'variant_id' && Object.keys(localVars).length > 0) {
      const selectedVar = localVars[value];
      return (
        <div key={col.name} className="mb-4 bg-gray-850 p-3 rounded-lg border border-gray-750">
          <label className="block text-sm font-medium text-gray-300 mb-1">
            Variante {isRequired && <span className="text-red-500">*</span>}
            <span className="text-xs text-gray-500 ml-2">(variant_id INTEGER)</span>
          </label>
          <div className="space-y-2">
            <input
              type="text"
              placeholder="Filtra varianti per nome o ID..."
              value={varSearch}
              onChange={(e) => setVarSearch(e.target.value)}
              className="w-full px-3 py-1.5 text-xs bg-gray-800 border border-gray-700 rounded text-gray-300 placeholder-gray-500 focus:ring-1 focus:ring-blue-500"
            />
            <select
              value={value}
              onChange={(e) => handleChange(col.name, e.target.value ? Number(e.target.value) : '')}
              required={isRequired}
              className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white"
            >
              <option value="">-- Seleziona una Variante --</option>
              {filteredVariantsList.map(v => (
                <option key={v.id} value={v.id}>
                  #{v.id} - {v.name}
                </option>
              ))}
            </select>
            {selectedVar && (
              <div className="flex items-center gap-3 p-2 bg-gray-900 rounded border border-gray-700">
                {selectedVar.img ? (
                  <img
                    src={selectedVar.img}
                    alt={selectedVar.name}
                    className="w-10 h-10 object-contain bg-gray-800 rounded border border-gray-700 flex-shrink-0"
                    style={{ imageRendering: 'pixelated' }}
                    onError={(e) => { e.target.style.display = 'none'; }}
                  />
                ) : (
                  <div className="w-10 h-10 bg-gray-800 rounded border border-gray-700 flex items-center justify-center text-gray-600 flex-shrink-0">🎨</div>
                )}
                <div className="min-w-0">
                  <div className="text-sm font-semibold text-white truncate">{selectedVar.name}</div>
                  <div className="text-xs text-gray-400">ID Variante: {selectedVar.id} • Mob #{selectedVar.mob_id}</div>
                </div>
              </div>
            )}
          </div>
        </div>
      );
    }

    // 3. Campo category_id (per MOB_CATEGORIES e VARIANT_CATEGORIES)
    if (col.name === 'category_id' && Object.keys(localCats).length > 0) {
      const selectedCat = localCats[value];
      return (
        <div key={col.name} className="mb-4 bg-gray-850 p-3 rounded-lg border border-gray-750">
          <label className="block text-sm font-medium text-gray-300 mb-1">
            Categoria {isRequired && <span className="text-red-500">*</span>}
            <span className="text-xs text-gray-500 ml-2">(category_id INTEGER)</span>
          </label>
          <div className="space-y-2">
            <input
              type="text"
              placeholder="Filtra categorie per nome o ID..."
              value={catSearch}
              onChange={(e) => setCatSearch(e.target.value)}
              className="w-full px-3 py-1.5 text-xs bg-gray-800 border border-gray-700 rounded text-gray-300 placeholder-gray-500 focus:ring-1 focus:ring-blue-500"
            />
            <select
              value={value}
              onChange={(e) => handleChange(col.name, e.target.value ? Number(e.target.value) : '')}
              required={isRequired}
              className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white"
            >
              <option value="">-- Seleziona una Categoria --</option>
              {filteredCategoriesList.map(cat => (
                <option key={cat.id} value={cat.id}>
                  #{cat.id} - {cat.name}
                </option>
              ))}
            </select>
            {selectedCat && (
              <div className="flex items-center gap-3 p-2 bg-gray-900 rounded border border-gray-700">
                <div
                  className="w-9 h-9 flex items-center justify-center rounded border flex-shrink-0"
                  style={{
                    borderColor: selectedCat.color || '#374151',
                    backgroundColor: selectedCat.color ? `${selectedCat.color}15` : '#1f2937'
                  }}
                >
                  {selectedCat.icon && selectedCat.icon !== '.' ? (
                    <img
                      src={selectedCat.icon}
                      alt={selectedCat.name}
                      className="w-6 h-6 object-contain"
                      style={{ imageRendering: 'pixelated' }}
                      onError={(e) => { e.target.style.display = 'none'; }}
                    />
                  ) : (
                    <span>📁</span>
                  )}
                </div>
                <div className="min-w-0">
                  <span
                    className="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold"
                    style={{
                      backgroundColor: selectedCat.color ? `${selectedCat.color}25` : '#374151',
                      color: selectedCat.color || '#e5e7eb',
                      border: `1px solid ${selectedCat.color || '#4b5563'}`
                    }}
                  >
                    {selectedCat.name}
                  </span>
                  <div className="text-xs text-gray-400 mt-0.5">ID Categoria: {selectedCat.id}</div>
                </div>
              </div>
            )}
          </div>
        </div>
      );
    }

    let inputType = 'text';
    if (col.type.includes('INT')) {
      inputType = 'number';
    }

    return (
      <div key={col.name} className="mb-4">
        <label className="block text-sm font-medium text-gray-300 mb-1">
          {col.name}
          {isRequired && <span className="text-red-500 ml-1">*</span>}
          <span className="text-xs text-gray-500 ml-2">({col.type})</span>
        </label>

        {col.type === 'TEXT' && !col.name.toLowerCase().includes('url') && !col.name.toLowerCase().includes('img') && !col.name.toLowerCase().includes('icon') ? (
          <textarea
            value={value}
            onChange={(e) => handleChange(col.name, e.target.value)}
            required={isRequired}
            rows={3}
            className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white placeholder-gray-500"
          />
        ) : (
          <div className="flex gap-2">
            <input
              type={inputType}
              value={value}
              onChange={(e) => handleChange(col.name, e.target.value)}
              required={isRequired}
              className="flex-1 px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white placeholder-gray-500"
            />
            {col.name === 'color' && value && (
              <div
                className="w-10 h-10 rounded border border-gray-700 flex-shrink-0"
                style={{ backgroundColor: value }}
                title={value}
              />
            )}
          </div>
        )}

        {(col.name === 'img' || col.name === 'icon' || col.name.toLowerCase().includes('url')) && value && typeof value === 'string' && value.length > 1 && (
          <div className="mt-2 flex items-center gap-3 p-2 bg-gray-850 rounded border border-gray-750">
            <img
              src={value}
              alt="Anteprima"
              className="w-14 h-14 object-contain border border-gray-700 rounded bg-gray-900"
              style={{ imageRendering: 'pixelated' }}
              onError={(e) => {
                e.target.style.display = 'none';
              }}
            />
            <span className="text-xs text-gray-400 truncate">{value}</span>
          </div>
        )}
      </div>
    );
  };

  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-2xl w-full max-h-[90vh] overflow-y-auto shadow-2xl">
        <div className="sticky top-0 bg-gray-900 border-b border-gray-800 px-6 py-4 flex items-center justify-between z-10">
          <div>
            <h3 className="text-xl font-semibold text-white">
              {record ? 'Modifica Record' : 'Nuovo Record'}
            </h3>
            <p className="text-xs text-gray-400 mt-0.5">Tabella: <span className="text-blue-400 font-mono">{table}</span></p>
          </div>
          <button
            onClick={onClose}
            className="text-gray-400 hover:text-white text-2xl transition-colors p-1"
          >
            ×
          </button>
        </div>

        <form onSubmit={handleSubmit} className="p-6">
          {columns.map(col => renderInput(col))}

          <div className="flex gap-3 pt-4 border-t border-gray-800">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2.5 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white font-medium"
              disabled={loading}
            >
              Annulla
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-medium disabled:opacity-50 shadow-md"
              disabled={loading}
            >
              {loading ? 'Salvataggio...' : 'Salva'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

export default RecordModal;
