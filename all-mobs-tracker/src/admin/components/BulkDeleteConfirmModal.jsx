function BulkDeleteConfirmModal({ count, tableName, onConfirm, onCancel, loading }) {
  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-md w-full shadow-2xl">
        <div className="p-6">
          <div className="w-14 h-14 bg-red-900/30 border border-red-800/50 rounded-full flex items-center justify-center text-3xl mx-auto mb-4">
            🗑️
          </div>

          <h3 className="text-xl font-bold text-white text-center mb-2">
            Eliminazione di Massa
          </h3>

          <p className="text-gray-300 text-center mb-6">
            Sei sicuro di voler eliminare definitivamente <strong className="text-red-400 font-bold">{count} record</strong> selezionati da <strong className="text-white">{tableName}</strong>?
            <br />
            <span className="text-xs text-gray-500 mt-2 block">Questa operazione eliminerà tutti i record selezionati e non può essere annullata.</span>
          </p>

          <div className="flex gap-3">
            <button
              onClick={onCancel}
              disabled={loading}
              className="flex-1 px-4 py-2.5 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white font-medium disabled:opacity-50"
            >
              Annulla
            </button>
            <button
              onClick={onConfirm}
              disabled={loading}
              className="flex-1 px-4 py-2.5 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors font-medium disabled:opacity-50 shadow-md"
            >
              {loading ? 'Eliminazione...' : `Elimina ${count} record`}
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}

export default BulkDeleteConfirmModal;
