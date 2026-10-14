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

      const response = await fetch(`/api/admin/data/${table}?${params}`);
      const result = await response.json();

      if (result.success) {
        setData(result.data);
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

  const handleCreate = async (values) => {
    try {
      const response = await fetch(`/api/admin/data/${table}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(values)
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
      const response = await fetch(`/api/admin/data/${table}/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(values)
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
      const response = await fetch(`/api/admin/data/${table}/${deletingRecord.id}`, {
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

  const handleSelectRecord = (recordId) => {
    const newSelected = new Set(selectedRecords);
    if (newSelected.has(recordId)) {
      newSelected.delete(recordId);
    } else {
      newSelected.add(recordId);
    }
    setSelectedRecords(newSelected);
  };

  const handleSelectAll = () => {
    if (selectedRecords.size === data.length) {
      setSelectedRecords(new Set());
    } else {
      setSelectedRecords(new Set(data.map(r => r.id)));
    }
  };

  const handleDuplicate = (record) => {
    const { id, ...recordWithoutId } = record;
    setDuplicatingRecord(recordWithoutId);
    setShowCreateModal(true);
  };

  const isImageColumn = (columnName) => {
    return columnName === 'img' || columnName === 'icon';
  };

  const formatValue = (value, columnName, rowData) => {
    if (value === null || value === undefined) {
      return <span className="text-gray-600 italic">NULL</span>;
    }

    // Visualizza immagini per colonne img e icon
    if (isImageColumn(columnName) && typeof value === 'string' && value.length > 0 && value !== '.') {
      return (
        <div className="flex items-center gap-2">
          <img
            src={value}
            alt={rowData.name || 'Image'}
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

    if (typeof value === 'boolean') {
      return value ? '✓' : '✗';
    }
    if (typeof value === 'string' && value.length > 50) {
      return value.substring(0, 50) + '...';
    }
    return value.toString();
  };

  const getRowStyle = (row) => {
    // Applica bordo colorato solo alle righe della tabella CATEGORIES
    if (table === 'CATEGORIES' && row.color) {
      return {
        borderLeft: `4px solid ${row.color}`
      };
    }
    return {};
  };

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
                {columns.map((col) => (
                  <th
                    key={col.name}
                    className="px-6 py-3 text-left text-xs font-medium text-gray-400 uppercase tracking-wider cursor-pointer hover:bg-gray-750 transition-colors"
                    onClick={() => handleSort(col.name)}
                  >
                    <div className="flex items-center gap-2">
                      {col.name}
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
                  <td colSpan={columns.length + 2} className="px-6 py-8 text-center text-gray-500">
                    Nessun record trovato
                  </td>
                </tr>
              ) : (
                data.map((row, idx) => (
                  <tr
                    key={idx}
                    className={`hover:bg-gray-800 transition-colors ${selectedRecords.has(row.id) ? 'bg-gray-800/50' : ''}`}
                    style={getRowStyle(row)}
                  >
                    <td className="px-4 py-4">
                      <input
                        type="checkbox"
                        checked={selectedRecords.has(row.id)}
                        onChange={() => handleSelectRecord(row.id)}
                        className="w-4 h-4 rounded bg-gray-700 border-gray-600"
                      />
                    </td>
                    {columns.map((col) => (
                      <td key={col.name} className="px-6 py-4 text-sm text-gray-300">
                        {formatValue(row[col.name], col.name, row)}
                      </td>
                    ))}
                    <td className="px-6 py-4 text-right text-sm space-x-2">
                      <button
                        onClick={() => setEditingRecord(row)}
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
                ))
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
          onSave={(values) => handleUpdate(editingRecord.id, values)}
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
