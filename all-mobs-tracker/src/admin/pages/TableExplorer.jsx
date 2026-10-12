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

  const formatValue = (value) => {
    if (value === null || value === undefined) {
      return <span className="text-gray-400 italic">NULL</span>;
    }
    if (typeof value === 'boolean') {
      return value ? '✓' : '✗';
    }
    if (typeof value === 'string' && value.length > 50) {
      return value.substring(0, 50) + '...';
    }
    return value.toString();
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
          <div className="w-16 h-16 border-4 border-green-600 border-t-transparent rounded-full animate-spin mx-auto"></div>
          <p className="mt-4 text-gray-600">Caricamento dati...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-lg p-6">
        <div className="flex items-center gap-3">
          <span className="text-2xl">⚠️</span>
          <div>
            <h3 className="font-semibold text-red-900">Errore</h3>
            <p className="text-red-700">{error}</p>
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
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 p-4">
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
              className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent"
            />
          </div>

          <div className="flex gap-2">
            <button
              onClick={loadData}
              className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              title="Aggiorna"
            >
              🔄
            </button>

            <button
              onClick={() => setShowCreateModal(true)}
              className="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-medium"
            >
              ➕ Nuovo Record
            </button>
          </div>
        </div>

        {pagination && (
          <div className="mt-4 flex items-center justify-between text-sm text-gray-600">
            <span>
              Totale: <strong>{pagination.total}</strong> record
              {search && ` (filtrati)`}
            </span>
            <span>
              Pagina <strong>{pagination.page}</strong> di <strong>{pagination.totalPages}</strong>
            </span>
          </div>
        )}
      </div>

      {/* Table */}
      <div className="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full">
            <thead className="bg-gray-50 border-b border-gray-200">
              <tr>
                {columns.map((col) => (
                  <th
                    key={col.name}
                    className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer hover:bg-gray-100 transition-colors"
                    onClick={() => handleSort(col.name)}
                  >
                    <div className="flex items-center gap-2">
                      {col.name}
                      {col.pk === 1 && <span className="text-yellow-600" title="Chiave primaria">🔑</span>}
                      {orderBy === col.name && (
                        <span>{orderDir === 'asc' ? '↑' : '↓'}</span>
                      )}
                    </div>
                  </th>
                ))}
                <th className="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                  Azioni
                </th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-200">
              {data.length === 0 ? (
                <tr>
                  <td colSpan={columns.length + 1} className="px-6 py-8 text-center text-gray-500">
                    Nessun record trovato
                  </td>
                </tr>
              ) : (
                data.map((row, idx) => (
                  <tr key={idx} className="hover:bg-gray-50 transition-colors">
                    {columns.map((col) => (
                      <td key={col.name} className="px-6 py-4 text-sm text-gray-900">
                        {formatValue(row[col.name])}
                      </td>
                    ))}
                    <td className="px-6 py-4 text-right text-sm space-x-2">
                      <button
                        onClick={() => setEditingRecord(row)}
                        className="text-blue-600 hover:text-blue-800 font-medium"
                      >
                        ✏️ Modifica
                      </button>
                      <button
                        onClick={() => setDeletingRecord(row)}
                        className="text-red-600 hover:text-red-800 font-medium"
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
            className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
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
                      ? 'bg-green-600 text-white'
                      : 'border border-gray-300 hover:bg-gray-50'
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
            className="px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
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
          onSave={handleCreate}
          onClose={() => setShowCreateModal(false)}
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
