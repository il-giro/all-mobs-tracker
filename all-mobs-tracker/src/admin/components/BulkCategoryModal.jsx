import { useState } from 'react';

function BulkCategoryModal({ count, targetType, categories, onAssign, onCancel, loading }) {
  const [selectedCatId, setSelectedCatId] = useState('');
  const [search, setSearch] = useState('');

  const catList = Object.values(categories || {});
  const filteredCategories = catList
    .filter(c => !search.trim() || c.name.toLowerCase().includes(search.toLowerCase()) || String(c.id) === search)
    .sort((a, b) => a.name.localeCompare(b.name));

  const selectedCategory = categories?.[selectedCatId];

  const handleSubmit = (e) => {
    e.preventDefault();
    if (!selectedCatId) return;
    onAssign(Number(selectedCatId));
  };

  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-md w-full shadow-2xl">
        <div className="p-6">
          <div className="w-14 h-14 bg-indigo-900/30 border border-indigo-800/50 rounded-full flex items-center justify-center text-3xl mx-auto mb-4">
            🏷️
          </div>

          <h3 className="text-xl font-bold text-white text-center mb-1">
            Assegna Categoria in Massa
          </h3>

          <p className="text-sm text-gray-400 text-center mb-6">
            Assegna una categoria a <strong className="text-white font-semibold">{count} {targetType}</strong> selezionati contemporaneamente.
          </p>

          <form onSubmit={handleSubmit} className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-300 mb-1">
                Seleziona Categoria <span className="text-red-500">*</span>
              </label>
              <input
                type="text"
                placeholder="Cerca categoria..."
                value={search}
                onChange={(e) => setSearch(e.target.value)}
                className="w-full px-3 py-1.5 mb-2 text-xs bg-gray-800 border border-gray-700 rounded text-gray-300 placeholder-gray-500 focus:ring-1 focus:ring-indigo-500"
              />
              <select
                value={selectedCatId}
                onChange={(e) => setSelectedCatId(e.target.value)}
                required
                className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-indigo-600 focus:border-transparent text-white"
              >
                <option value="">-- Seleziona una Categoria --</option>
                {filteredCategories.map(cat => (
                  <option key={cat.id} value={cat.id}>
                    #{cat.id} - {cat.name}
                  </option>
                ))}
              </select>
            </div>

            {selectedCategory && (
              <div className="flex items-center gap-3 p-3 bg-gray-850 rounded-lg border border-gray-750">
                <div
                  className="w-10 h-10 flex items-center justify-center rounded border flex-shrink-0"
                  style={{
                    borderColor: selectedCategory.color || '#374151',
                    backgroundColor: selectedCategory.color ? `${selectedCategory.color}15` : '#1f2937'
                  }}
                >
                  {selectedCategory.icon && selectedCategory.icon !== '.' ? (
                    <img
                      src={selectedCategory.icon}
                      alt={selectedCategory.name}
                      className="w-7 h-7 object-contain"
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
                      backgroundColor: selectedCategory.color ? `${selectedCategory.color}25` : '#374151',
                      color: selectedCategory.color || '#e5e7eb',
                      border: `1px solid ${selectedCategory.color || '#4b5563'}`
                    }}
                  >
                    {selectedCategory.name}
                  </span>
                  <div className="text-xs text-gray-400 mt-1">ID Categoria: {selectedCategory.id}</div>
                </div>
              </div>
            )}

            <div className="flex gap-3 pt-2">
              <button
                type="button"
                onClick={onCancel}
                disabled={loading}
                className="flex-1 px-4 py-2.5 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white font-medium disabled:opacity-50"
              >
                Annulla
              </button>
              <button
                type="submit"
                disabled={loading || !selectedCatId}
                className="flex-1 px-4 py-2.5 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors font-medium disabled:opacity-50 shadow-md"
              >
                {loading ? 'Assegnazione...' : `Assegna a ${count}`}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

export default BulkCategoryModal;
