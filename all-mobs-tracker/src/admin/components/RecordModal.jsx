import { useState, useEffect } from 'react';

function RecordModal({ table, columns, record, onSave, onClose }) {
  const [values, setValues] = useState({});
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (record) {
      setValues(record);
    } else {
      const initialValues = {};
      columns.forEach(col => {
        if (col.pk !== 1) {
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
      await onSave(values);
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

  const renderInput = (col) => {
    const value = values[col.name] || '';

    if (col.pk === 1 && !record) {
      return null;
    }

    if (col.pk === 1 && record) {
      return (
        <div key={col.name} className="mb-4">
          <label className="block text-sm font-medium text-gray-400 mb-1">
            {col.name} 🔑
          </label>
          <input
            type="text"
            value={value}
            disabled
            className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg text-gray-500 cursor-not-allowed"
          />
        </div>
      );
    }

    let inputType = 'text';
    if (col.type.includes('INT')) {
      inputType = 'number';
    }

    const isRequired = col.notnull === 1 && !col.dflt_value;

    return (
      <div key={col.name} className="mb-4">
        <label className="block text-sm font-medium text-gray-300 mb-1">
          {col.name}
          {isRequired && <span className="text-red-500 ml-1">*</span>}
          <span className="text-xs text-gray-500 ml-2">({col.type})</span>
        </label>

        {col.type === 'TEXT' && !col.name.toLowerCase().includes('url') ? (
          <textarea
            value={value}
            onChange={(e) => handleChange(col.name, e.target.value)}
            required={isRequired}
            rows={3}
            className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white placeholder-gray-500"
          />
        ) : (
          <input
            type={inputType}
            value={value}
            onChange={(e) => handleChange(col.name, e.target.value)}
            required={isRequired}
            className="w-full px-3 py-2 bg-gray-800 border border-gray-700 rounded-lg focus:ring-2 focus:ring-blue-600 focus:border-transparent text-white placeholder-gray-500"
          />
        )}

        {col.name.toLowerCase().includes('url') && value && (
          <div className="mt-2">
            <img
              src={value}
              alt="Anteprima"
              className="w-32 h-32 object-contain border border-gray-700 rounded bg-gray-800"
              onError={(e) => {
                e.target.style.display = 'none';
              }}
            />
          </div>
        )}
      </div>
    );
  };

  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div className="sticky top-0 bg-gray-900 border-b border-gray-800 px-6 py-4 flex items-center justify-between">
          <h3 className="text-xl font-semibold text-white">
            {record ? 'Modifica Record' : 'Nuovo Record'}
          </h3>
          <button
            onClick={onClose}
            className="text-gray-400 hover:text-white text-2xl"
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
              className="flex-1 px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white"
              disabled={loading}
            >
              Annulla
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors font-medium disabled:opacity-50"
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
