function DeleteConfirmModal({ record, tableName, onConfirm, onCancel }) {
  const displayId = record.id ?? (
    record.mob_id !== undefined && record.category_id !== undefined
      ? `Mob #${record.mob_id} • Cat #${record.category_id}`
      : record.variant_id !== undefined && record.category_id !== undefined
      ? `Var #${record.variant_id} • Cat #${record.category_id}`
      : 'N/A'
  );

  return (
    <div className="fixed inset-0 bg-black/70 flex items-center justify-center z-50 p-4">
      <div className="bg-gray-900 rounded-xl border border-gray-800 max-w-md w-full shadow-2xl">
        <div className="p-6">
          <div className="w-12 h-12 bg-red-900/30 border border-red-800/50 rounded-full flex items-center justify-center text-2xl mx-auto mb-4">
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

          <div className="bg-gray-800/80 rounded-lg p-4 mb-6 border border-gray-700/60 space-y-1.5">
            <p className="text-sm font-mono text-gray-300">
              Identificatore: <strong className="text-white">{displayId}</strong>
            </p>
            {record.mob_name && (
              <p className="text-sm text-gray-300">
                Mob: <strong className="text-white">{record.mob_name}</strong>
              </p>
            )}
            {record.variant_name && (
              <p className="text-sm text-gray-300">
                Variante: <strong className="text-white">{record.variant_name}</strong>
              </p>
            )}
            {record.category_name && (
              <p className="text-sm text-gray-300">
                Categoria: <strong className="text-white">{record.category_name}</strong>
              </p>
            )}
            {record.name && !record.mob_name && !record.variant_name && (
              <p className="text-sm text-gray-300">
                Nome: <strong className="text-white">{record.name}</strong>
              </p>
            )}
          </div>

          <div className="flex gap-3">
            <button
              onClick={onCancel}
              className="flex-1 px-4 py-2.5 bg-gray-800 border border-gray-700 rounded-lg hover:bg-gray-700 transition-colors text-white font-medium"
            >
              Annulla
            </button>
            <button
              onClick={onConfirm}
              className="flex-1 px-4 py-2.5 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors font-medium shadow-md"
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
