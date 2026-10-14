import { useState, useEffect } from 'react';
import RecordModal from '../components/RecordModal';
import DeleteConfirmModal from '../components/DeleteConfirmModal';

const TABLES_LABELS = {
  'MOBS': 'Mob',
  'VARIANTS': 'Varianti',
  'CATEGORIES': 'Categorie',
  'MOB_CATEGORIES': 'Relazioni Mob - Categorie',
  'VARIANT_CATEGORIES': 'Relazioni Varianti - Categorie'
};

function TableExplorer({ table }) {
  const [data, setData] = useState([]);
  const [columns, setColumns] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [page, setPage] = useState(1);
  const [pagination, setPagination] = useState(null);
  const [search, setSearch] = useState('');
  const [orderBy, setOrderBy] = useState('');
  const [orderDir, setOrderDir] = useState('asc');
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [editingRecord, setEditingRecord] = useState(null);
  const [deletingRecord, setDeletingRecord] = useState(null);
  const [selectedRecords, setSelectedRecords] = useState(new Set());
  const [duplicatingRecord, setDuplicatingRecord] = useState(null);

  // Cache per arricchimento visivo delle tuple di collegamento
  const [mobsCache, setMobsCache] = useState({});
  const [categoriesCache, setCategoriesCache] = useState({});
  const [variantsCache, setVariantsCache] = useState({});

  useEffect(() => {
    if (table) {
      loadSchema();
      loadData();
    }
  }, [table]);

  useEffect(() => {
    if (table) {
      loadData();
    }
  }, [page, search, orderBy, orderDir]);

  // Caricamento cache per metadati visivi di mob, categorie e varianti
  const loadRelationMetadata = async () => {
    let currentMobs = mobsCache;
    let currentCats = categoriesCache;
    let currentVars = variantsCache;

    if (Object.keys(currentCats).length === 0) {
      try {
        const res = await fetch('/api/admin/data/CATEGORIES?limit=100');
        const json = await res.json();
        if (json.success && Array.isArray(json.data)) {
          currentCats = Object.fromEntries(json.data.map(c => [c.id, c]));
          setCategoriesCache(currentCats);
        }
      } catch (e) {
        console.error('Errore nel caricamento cache CATEGORIES:', e);
      }
    }

    if (table === 'MOB_CATEGORIES' && Object.keys(currentMobs).length === 0) {
      try {
        const res = await fetch('/api/admin/data/MOBS?limit=100');
        const json = await res.json();
        if (json.success && Array.isArray(json.data)) {
          currentMobs = Object.fromEntries(json.data.map(m => [m.id, m]));
          setMobsCache(currentMobs);
        }
      } catch (e) {
        console.error('Errore nel caricamento cache MOBS:', e);
      }
    }

    if (table === 'VARIANT_CATEGORIES' && Object.keys(currentVars).length === 0) {
      try {
        const pages = Array.from({ length: 10 }, (_, i) => i + 1);
        const responses = await Promise.all(
          pages.map(p => fetch(`/api/admin/data/VARIANTS?page=${p}&limit=100`).then(r => r.json()))
        );
        const map = {};
        for (const res of responses) {
          if (res?.success && Array.isArray(res.data)) {
            for (const v of res.data) {
              map[v.id] = v;
            }
          }
        }
        currentVars = map;
        setVariantsCache(currentVars);
      } catch (e) {
        console.error('Errore nel caricamento cache VARIANTS:', e);
      }
    }

    return { mobs: currentMobs, categories: currentCats, variants: currentVars };
  };

  const loadSchema = async () => {
    try {
      const response = await fetch(`/api/admin/schema/${table}`);
      const result = await response.json();

      if (result.success) {
        setColumns(result.columns);
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError('Errore nel caricamento dello schema');
      console.error(err);
    }
  };

  const loadData = async () => {
    try {
      setLoading(true);
      setError(null);

      const params = new URLSearchParams({
        page: page.toString(),
        limit: '50'
      });

      if (search) params.append('search', search);
      if (orderBy) {
        params.append('orderBy', orderBy);
        params.append('orderDir', orderDir);
      }

      const [dataResponse, metadata] = await Promise.all([
        fetch(`/api/admin/data/${table}?${params}`),
        table === 'MOB_CATEGORIES' || table === 'VARIANT_CATEGORIES'
          ? loadRelationMetadata()
          : Promise.resolve(null)
      ]);

      const result = await dataResponse.json();

      if (result.success) {
        let rows = result.data;

        // Arricchimento visivo delle tuple di collegamento
        if (table === 'MOB_CATEGORIES' && metadata) {
          rows = rows.map(r => {
            const mob = metadata.mobs[r.mob_id];
            const cat = metadata.categories[r.category_id];
            return {
              ...r,
              mob_img: mob?.img || null,
              mob_name: mob?.name || (r.mob_id ? `Mob #${r.mob_id}` : ''),
              category_icon: cat?.icon || null,
              category_name: cat?.name || (r.category_id ? `Categoria #${r.category_id}` : ''),
              category_color: cat?.color || null,
            };
          });
        } else if (table === 'VARIANT_CATEGORIES' && metadata) {
          rows = rows.map(r => {
            const variant = metadata.variants[r.variant_id];
            const cat = metadata.categories[r.category_id];
            return {
              ...r,
              variant_img: variant?.img || null,
              variant_name: variant?.name || (r.variant_id ? `Variante #${r.variant_id}` : ''),
              category_icon: cat?.icon || null,
              category_name: cat?.name || (r.category_id ? `Categoria #${r.category_id}` : ''),
              category_color: cat?.color || null,
            };
          });
        }

        setData(rows);
        setPagination(result.pagination);
        setSelectedRecords(new Set());
      } else {
        setError(result.error);
      }
    } catch (err) {
      setError('Errore nel caricamento dei dati');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  // Pulizia campi virtuali prima di inviare al backend
  const cleanRecordForBackend = (record) => {
    if (!record) return record;
    const { mob_img, mob_name, variant_img, variant_name, category_icon, category_name, category_color, ...clean } = record;
    return clean;
  };

  const handleCreate = async (values) => {
    try {
      const cleanValues = cleanRecordForBackend(values);
      const response = await fetch(`/api/admin/data/${table}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cleanValues)
      });

      const result = await response.json();

      if (result.success) {
        setShowCreateModal(false);
        setDuplicatingRecord(null);
        loadData();
      } else {
        throw new Error(result.error);
      }
    } catch (err) {
      alert('Errore nella creazione: ' + err.message);
    }
  };

  const handleUpdate = async (id, values) => {
    try {
      const cleanValues = cleanRecordForBackend(values);
      const response = await fetch(`/api/admin/data/${table}/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cleanValues)
      });

      const result = await response.json();

      if (result.success) {
        setEditingRecord(null);
        loadData();
      } else {
        throw new Error(result.error);
      }
    } catch (err) {
      alert('Errore nella modifica: ' + err.message);
    }
  };

  const handleDelete = async () => {
    if (!deletingRecord) return;

    try {
      const recordId = deletingRecord.id ?? `${deletingRecord.mob_id || deletingRecord.variant_id}_${deletingRecord.category_id}`;
      const response = await fetch(`/api/admin/data/${table}/${recordId}`, {
        method: 'DELETE'
      });

      const result = await response.json();

      if (result.success) {
        setDeletingRecord(null);
        loadData();
      } else {
        throw new Error(result.error);
      }
    } catch (err) {
      alert('Errore nella cancellazione: ' + err.message);
    }
  };

  const handleSort = (columnName) => {
    if (orderBy === columnName) {
      setOrderDir(orderDir === 'asc' ? 'desc' : 'asc');
    } else {
      setOrderBy(columnName);
      setOrderDir('asc');
    }
  };

  const getRecordKey = (record, idx) => {
    if (record.id !== undefined && record.id !== null) return record.id;
    if (record.mob_id !== undefined && record.category_id !== undefined) return `${record.mob_id}_${record.category_id}`;
    if (record.variant_id !== undefined && record.category_id !== undefined) return `${record.variant_id}_${record.category_id}`;
    return idx;
  };

  const handleSelectRecord = (recordKey) => {
    const newSelected = new Set(selectedRecords);
    if (newSelected.has(recordKey)) {
      newSelected.delete(recordKey);
    } else {
      newSelected.add(recordKey);
    }
    setSelectedRecords(newSelected);
  };

  const handleSelectAll = () => {
    if (selectedRecords.size === data.length) {
      setSelectedRecords(new Set());
    } else {
      setSelectedRecords(new Set(data.map((r, idx) => getRecordKey(r, idx))));
    }
  };

  const handleDuplicate = (record) => {
    const clean = cleanRecordForBackend(record);
    const { id, ...recordWithoutId } = clean;
    setDuplicatingRecord(recordWithoutId);
    setShowCreateModal(true);
  };

  const isImageColumn = (columnName) => {
    return columnName === 'img' || columnName === 'icon' || columnName === 'mob_img' || columnName === 'variant_img' || columnName === 'category_icon';
  };

  const formatValue = (value, columnName, rowData) => {
    // Colonna combinata Mob: immagine + nome + ID inline
    if (columnName === '_combined_mob') {
      return (
        <div className="flex items-center gap-3">
          {rowData.mob_img ? (
            <img
              src={rowData.mob_img}
              alt={rowData.mob_name || ''}
              className="w-10 h-10 object-contain bg-gray-800 rounded border border-gray-700 flex-shrink-0"
              style={{ imageRendering: 'pixelated' }}
              onError={(e) => { e.target.style.display = 'none'; }}
            />
          ) : (
            <div className="w-10 h-10 bg-gray-800 rounded border border-gray-700 flex items-center justify-center text-gray-600 flex-shrink-0">🐾</div>
          )}
          <div className="min-w-0">
            <div className="font-medium text-white truncate">{rowData.mob_name || `Mob #${rowData.mob_id}`}</div>
            <div className="text-xs text-gray-500">ID: {rowData.mob_id}</div>
          </div>
        </div>
      );
    }

    // Colonna combinata Variante: immagine + nome + ID inline
    if (columnName === '_combined_variant') {
      return (
        <div className="flex items-center gap-3">
          {rowData.variant_img ? (
            <img
              src={rowData.variant_img}
              alt={rowData.variant_name || ''}
              className="w-10 h-10 object-contain bg-gray-800 rounded border border-gray-700 flex-shrink-0"
              style={{ imageRendering: 'pixelated' }}
              onError={(e) => { e.target.style.display = 'none'; }}
            />
          ) : (
            <div className="w-10 h-10 bg-gray-800 rounded border border-gray-700 flex items-center justify-center text-gray-600 flex-shrink-0">🎨</div>
          )}
          <div className="min-w-0">
            <div className="font-medium text-white truncate">{rowData.variant_name || `Variante #${rowData.variant_id}`}</div>
            <div className="text-xs text-gray-500">ID: {rowData.variant_id}</div>
          </div>
        </div>
      );
    }

    // Colonna combinata Categoria: icona + nome + ID inline
    if (columnName === '_combined_category') {
      const icon = rowData.category_icon;
      const color = rowData.category_color;
      const name = rowData.category_name || `Categoria #${rowData.category_id}`;
      return (
        <div className="flex items-center gap-3">
          <div
            className="w-10 h-10 flex items-center justify-center rounded border flex-shrink-0"
            style={{ borderColor: color || '#374151', backgroundColor: color ? `${color}15` : '#1f2937' }}
          >
            {icon && icon !== '.' ? (
              <img
                src={icon}
                alt={name}
                className="w-7 h-7 object-contain"
                style={{ imageRendering: 'pixelated' }}
                onError={(e) => { e.target.style.display = 'none'; e.target.nextSibling.style.display = 'block'; }}
              />
            ) : null}
            <span className="text-lg" style={{ display: icon && icon !== '.' ? 'none' : 'block' }}>📁</span>
          </div>
          <div className="min-w-0">
            <span
              className="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-semibold truncate"
              style={{
                backgroundColor: color ? `${color}25` : '#374151',
                color: color || '#e5e7eb',
                border: `1px solid ${color || '#4b5563'}`
              }}
            >
              {name}
            </span>
            <div className="text-xs text-gray-500 mt-0.5">ID: {rowData.category_id}</div>
          </div>
        </div>
      );
    }

    if (value === null || value === undefined) {
      return <span className="text-gray-600 italic">NULL</span>;
    }

    // Visualizza icona categoria con bordo colorato
    if (columnName === 'category_icon' && typeof value === 'string' && value.length > 0 && value !== '.') {
      return (
        <div className="flex items-center gap-2">
          <div
            className="w-12 h-12 flex items-center justify-center bg-gray-850 rounded border p-1"
            style={rowData.category_color ? { borderColor: rowData.category_color } : { borderColor: '#374151' }}
            title={rowData.category_name}
          >
            <img
              src={value}
              alt={rowData.category_name || 'Icona Categoria'}
              className="w-8 h-8 object-contain pixelated"
              onError={(e) => {
                e.target.style.display = 'none';
                e.target.nextSibling.style.display = 'inline';
              }}
            />
            <span className="text-xs text-gray-500 hidden">{value}</span>
          </div>
        </div>
      );
    }

    // Visualizza immagini per colonne img, icon, mob_img, variant_img
    if (isImageColumn(columnName) && typeof value === 'string' && value.length > 0 && value !== '.') {
      return (
        <div className="flex items-center gap-2">
          <img
            src={value}
            alt={rowData.mob_name || rowData.variant_name || rowData.name || 'Immagine'}
            className="w-12 h-12 object-contain bg-gray-800 rounded border border-gray-700"
            onError={(e) => {
              e.target.style.display = 'none';
              e.target.nextSibling.style.display = 'inline';
            }}
          />
          <span className="text-xs text-gray-500 hidden">{value}</span>
        </div>
      );
    }

    // Badge colorato per category_name
    if (columnName === 'category_name' && typeof value === 'string') {
      return (
        <span
          className="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold"
          style={{
            backgroundColor: rowData.category_color ? `${rowData.category_color}25` : '#374151',
            color: rowData.category_color || '#e5e7eb',
            border: `1px solid ${rowData.category_color || '#4b5563'}`
          }}
        >
          {value}
        </span>
      );
    }

    // Testo evidenziato per mob_name o variant_name
    if ((columnName === 'mob_name' || columnName === 'variant_name') && typeof value === 'string') {
      return <span className="font-medium text-white">{value}</span>;
    }

    if (typeof value === 'boolean') {
      return value ? '✓' : '✗';
    }
    if (typeof value === 'string' && value.length > 50) {
      return value.substring(0, 50) + '...';
    }
    return value.toString();
  };

  const getRowStyle = (row) => {
    // Applica bordo colorato alle righe di CATEGORIES o delle tabelle di relazione con category_color
    if (table === 'CATEGORIES' && row.color) {
      return {
        borderLeft: `4px solid ${row.color}`
      };
    }
    if ((table === 'MOB_CATEGORIES' || table === 'VARIANT_CATEGORIES') && row.category_color) {
      return {
        borderLeft: `4px solid ${row.category_color}`
      };
    }
    return {};
  };

  // Colonne mostrate nella tabella (semplificate visivamente per le tabelle di collegamento)
  const getDisplayedColumns = () => {
    if (table === 'MOB_CATEGORIES') {
      return [
        { name: '_combined_mob', label: 'Mob', isVirtual: true },
        { name: '_combined_category', label: 'Categoria', isVirtual: true },
      ];
    }
    if (table === 'VARIANT_CATEGORIES') {
      return [
        { name: '_combined_variant', label: 'Variante', isVirtual: true },
        { name: '_combined_category', label: 'Categoria', isVirtual: true },
      ];
    }
    return columns;
  };

  const displayedColumns = getDisplayedColumns();

  if (!table) {
    return (
      <div className="text-center py-12">
        <p className="text-gray-500">Seleziona una tabella dalla sidebar</p>
      </div>
    );
  }

  if (loading && data.length === 0) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-blue-600 border-t-transparent rounded-full animate-spin mx-auto"></div>
          <p className="mt-4 text-gray-400">Caricamento dati...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-900/20 border border-red-900/50 rounded-lg p-6">
        <div className="flex items-center gap-3">
          <span className="text-2xl">⚠️</span>
          <div>
            <h3 className="font-semibold text-red-400">Errore</h3>
            <p className="text-red-300">{error}</p>
          </div>
        </div>
        <button
          onClick={loadData}
          className="mt-4 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
        >
          Riprova
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {/* Toolbar */}
      <div className="bg-gray-900 rounded-lg border border-gray-800 p-4">
        <div className="flex flex-col md:flex-row gap-4 items-start md:items-center justify-between">
          <div className="flex-1 w-full md:w-auto">
            <input
              type="text"
              placeholder="Cerca..."
              value={search}
              onChange={(e) => {
                setSearch(e.target.value);
                setPage(1);
              }}
              className="w-full px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white placeholder-gray-500"
            />
          </div>

          <div className="flex gap-2">
            <button
              onClick={loadData}
              className="px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white"
              title="Aggiorna"
            >
              🔄
            </button>

            <button
              onClick={() => {
                setDuplicatingRecord(null);
                setShowCreateModal(true);
              }}
              className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-medium"
            >
              ➕ Nuovo
            </button>
          </div>
        </div>

        {pagination && (
          <div className="mt-4 flex items-center justify-between text-sm text-gray-400">
            <span>
              Totale: <strong className="text-white">{pagination.total}</strong> record
              {search && ` (filtrati)`}
              {selectedRecords.size > 0 && ` • ${selectedRecords.size} selezionati`}
            </span>
            <span>
              Pagina <strong className="text-white">{pagination.page}</strong> di <strong className="text-white">{pagination.totalPages}</strong>
            </span>
          </div>
        )}
      </div>

      {/* Table */}
      <div className="bg-gray-900 rounded-lg border border-gray-800 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-800 border-b border-gray-700">
              <tr>
                <th className="px-4 py-3 text-left">
                  <input
                    type="checkbox"
                    checked={selectedRecords.size === data.length && data.length > 0}
                    onChange={handleSelectAll}
                    className="w-4 h-4 rounded bg-gray-700 border-gray-600"
                  />
                </th>
                {displayedColumns.map((col) => (
                  <th
                    key={col.name}
                    className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider cursor-pointer hover:bg-gray-750 transition-colors"
                    onClick={() => !col.isVirtual && handleSort(col.name)}
                  >
                    <div className="flex items-center gap-2">
                      {col.label || col.name}
                      {col.pk === 1 && <span className="text-yellow-500" title="Chiave primaria">🔑</span>}
                      {orderBy === col.name && (
                        <span className="text-blue-400">{orderDir === 'asc' ? '↑' : '↓'}</span>
                      )}
                    </div>
                  </th>
                ))}
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-400 uppercase tracking-wider">
                  Azioni
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-800">
              {data.length === 0 ? (
                <tr>
                  <td colSpan={displayedColumns.length + 2} className="px-6 py-8 text-center text-gray-500">
                    Nessun record trovato
                  </td>
                </tr>
              ) : (
                data.map((row, idx) => {
                  const recordKey = getRecordKey(row, idx);
                  return (
                    <tr
                      key={recordKey}
                      className={`hover:bg-gray-800 transition-colors ${selectedRecords.has(recordKey) ? 'bg-gray-800/50' : ''}`}
                      style={getRowStyle(row)}
                    >
                      <td className="px-4 py-4">
                        <input
                          type="checkbox"
                          checked={selectedRecords.has(recordKey)}
                          onChange={() => handleSelectRecord(recordKey)}
                          className="w-4 h-4 rounded bg-gray-700 border-gray-600"
                        />
                      </td>
                      {displayedColumns.map((col) => (
                        <td key={col.name} className="px-6 py-4 text-sm text-gray-300">
                          {formatValue(row[col.name], col.name, row)}
                        </td>
                      ))}
                      <td className="px-6 py-4 text-right text-sm space-x-2">
                        <button
                          onClick={() => setEditingRecord(cleanRecordForBackend(row))}
                          className="inline-flex items-center gap-1 px-3 py-1.5 bg-blue-600 text-white rounded-lg hover:bg-blue-700 font-medium transition-colors"
                        >
                          ✏️ Modifica
                        </button>
                        <button
                          onClick={() => handleDuplicate(row)}
                          className="inline-flex items-center gap-1 px-3 py-1.5 bg-gray-700 text-white rounded-lg hover:bg-gray-600 font-medium transition-colors"
                          title="Duplica record"
                        >
                          📋 Duplica
                        </button>
                        <button
                          onClick={() => setDeletingRecord(row)}
                          className="inline-flex items-center gap-1 px-3 py-1.5 bg-red-600/80 text-white rounded-lg hover:bg-red-600 font-medium transition-colors"
                        >
                          🗑️ Elimina
                        </button>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Pagination */}
      {pagination && pagination.totalPages > 1 && (
        <div className="flex justify-center gap-2">
          <button
            onClick={() => setPage(Math.max(1, page - 1))}
            disabled={page === 1}
            className="px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed text-white"
          >
            ← Precedente
          </button>

          <div className="flex items-center gap-1">
            {Array.from({ length: Math.min(5, pagination.totalPages) }, (_, i) => {
              let pageNum;
              if (pagination.totalPages <= 5) {
                pageNum = i + 1;
              } else if (page <= 3) {
                pageNum = i + 1;
              } else if (page >= pagination.totalPages - 2) {
                pageNum = pagination.totalPages - 4 + i;
              } else {
                pageNum = page - 2 + i;
              }

              return (
                <button
                  key={pageNum}
                  onClick={() => setPage(pageNum)}
                  className={`w-10 h-10 rounded-lg transition-colors ${
                    page === pageNum
                      ? 'bg-blue-600 text-white'
                      : 'bg-gray-800 border border-gray-700 hover:bg-gray-700 text-gray-300'
                  }`}
                >
                  {pageNum}
                </button>
              );
            })}
          </div>

          <button
            onClick={() => setPage(Math.min(pagination.totalPages, page + 1))}
            disabled={page === pagination.totalPages}
            className="px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed text-white"
          >
            Successiva →
          </button>
        </div>
      )}

      {/* Modals */}
      {showCreateModal && (
        <RecordModal
          table={table}
          columns={columns}
          record={duplicatingRecord}
          onSave={handleCreate}
          onClose={() => {
            setShowCreateModal(false);
            setDuplicatingRecord(null);
          }}
        />
      )}

      {editingRecord && (
        <RecordModal
          table={table}
          columns={columns}
          record={editingRecord}
          onSave={(values) => handleUpdate(editingRecord.id ?? `${editingRecord.mob_id || editingRecord.variant_id}_${editingRecord.category_id}`, values)}
          onClose={() => setEditingRecord(null)}
        />
      )}

      {deletingRecord && (
        <DeleteConfirmModal
          record={deletingRecord}
          tableName={TABLES_LABELS[table] || table}
          onConfirm={handleDelete}
          onCancel={() => setDeletingRecord(null)}
        />
      )}
    </div>
  );
}

export default TableExplorer;
