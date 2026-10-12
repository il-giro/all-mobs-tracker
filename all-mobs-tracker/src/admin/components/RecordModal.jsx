import { useState, useEffect } from 'react';

function RecordModal({ table, columns, record, onSave, onClose }) {
  const [values, setValues] = useState({});
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (record) {
      setValues(record);
    } else {
      // Inizializza con valori vuoti
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

    // Non mostrare chiavi primarie autogenerate in modalità creazione
    if (col.pk === 1 && !record) {
      return null;
    }

    // Mostra chiave primaria in sola lettura in modalità modifica
    if (col.pk === 1 && record) {
      return (
        <div key={col.name} className="mb-4">
          <label className="block text-sm font-medium text-gray-700 mb-1">
            {col.name} 🔑
          </label>
          <input
            type="text"
            value={value}
            disabled
            className="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
          />
        </div>
      );
    }

    // Determina il tipo di input
    let inputType = 'text';
    if (col.type.includes('INT')) {
      inputType = 'number';
    }

    const isRequired = col.notnull === 1 && !col.dflt_value;

    return (
      <div key={col.name} className="mb-4">
        <label className="block text-sm font-medium text-gray-700 mb-1">
          {col.name}
          {isRequired && <span className="text-red-600 ml-1">*</span>}
          <span className="text-xs text-gray-500 ml-2">({col.type})</span>
        </label>

        {col.type === 'TEXT' && !col.name.toLowerCase().includes('url') ? (
          <textarea
            value={value}
            onChange={(e) => handleChange(col.name, e.target.value)}
            required={isRequired}
            rows={3}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent"
          />
        ) : (
          <input
            type={inputType}
            value={value}
            onChange={(e) => handleChange(col.name, e.target.value)}
            required={isRequired}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent"
          />
        )}

        {col.name.toLowerCase().includes('url') && value && (
          <div className="mt-2">
            <img
              src={value}
              alt="Anteprima"
              className="w-32 h-32 object-contain border border-gray-300 rounded"
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
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-xl shadow-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div className="sticky top-0 bg-white border-b border-gray-200 px-6 py-4 flex items-center justify-between">
          <h3 className="text-xl font-semibold text-gray-900">
            {record ? 'Modifica Record' : 'Nuovo Record'}
          </h3>
          <button
            onClick={onClose}
            className="text-gray-400 hover:text-gray-600 text-2xl"
          >
            ×
          </button>
        </div>

        <form onSubmit={handleSubmit} className="p-6">
          {columns.map(col => renderInput(col))}

          <div className="flex gap-3 pt-4 border-t border-gray-200">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              disabled={loading}
            >
              Annulla
            </button>
            <button
              type="submit"
              className="flex-1 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors font-medium disabled:opacity-50"
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
