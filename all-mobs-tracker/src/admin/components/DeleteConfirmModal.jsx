function DeleteConfirmModal({ record, tableName, onConfirm, onCancel }) {
  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-md w-full">
        <div className="p-6">
          <div className="w-12 h-12 bg-red-900/30 rounded-full flex items-center justify-center text-2xl mx-auto mb-4">
            ⚠️
          </div>

          <h3 className="text-xl font-semibold text-white text-center mb-2">
            Conferma Eliminazione
          </h3>

          <p className="text-gray-400 text-center mb-6">
            Sei sicuro di voler eliminare questo record da <strong className="text-white">{tableName}</strong>?
            <br />
            <span className="text-sm text-gray-500">Questa operazione non può essere annullata.</span>
          </p>

          <div className="bg-gray-800 rounded-lg p-4 mb-6">
            <p className="text-sm font-mono text-gray-300">
              ID: <strong className="text-white">{record.id}</strong>
            </p>
            {Object.entries(record).slice(0, 3).map(([key, value]) => (
              key !== 'id' && (
                <p key={key} className="text-sm font-mono text-gray-300">
                  {key}: <strong className="text-white">{value || 'NULL'}</strong>
                </p>
              )
            ))}
          </div>

          <div className="flex gap-3">
            <button
              onClick={onCancel}
              className="flex-1 px-4 py-2 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white"
            >
              Annulla
            </button>
            <button
              onClick={onConfirm}
              className="flex-1 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors font-medium"
            >
              Elimina
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default DeleteConfirmModal;
