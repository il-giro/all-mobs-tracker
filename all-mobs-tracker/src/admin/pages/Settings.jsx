function Settings() {
  return (
    <div className="space-y-6">
      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Informazioni Sistema</h3>

        <div className="space-y-3">
          <div className="flex justify-between py-2 border-b border-gray-100">
            <span className="text-gray-600">Database</span>
            <span className="font-medium text-gray-900">Cloudflare D1</span>
          </div>

          <div className="flex justify-between py-2 border-b border-gray-100">
            <span className="text-gray-600">Binding</span>
            <span className="font-mono text-sm text-gray-900">DB</span>
          </div>

          <div className="flex justify-between py-2 border-b border-gray-100">
            <span className="text-gray-600">Tabelle Gestite</span>
            <span className="font-medium text-gray-900">5</span>
          </div>

          <div className="flex justify-between py-2">
            <span className="text-gray-600">Ambiente</span>
            <span className="font-medium text-gray-900">Production</span>
          </div>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Sicurezza</h3>

        <div className="bg-yellow-50 border border-yellow-200 rounded-lg p-4 mb-4">
          <div className="flex items-start gap-3">
            <span className="text-2xl">🔐</span>
            <div>
              <h4 className="font-semibold text-yellow-900 mb-1">
                Cloudflare Access Richiesto
              </h4>
              <p className="text-sm text-yellow-800">
                Questa dashboard deve essere protetta con Cloudflare Access.
                Configura una policy di accesso per il percorso <code className="bg-yellow-100 px-1 rounded">/admin</code> e le API <code className="bg-yellow-100 px-1 rounded">/api/admin/*</code>.
              </p>
            </div>
          </div>
        </div>

        <div className="space-y-2 text-sm">
          <p className="text-gray-600">
            <strong>Passaggi per configurare Cloudflare Access:</strong>
          </p>
          <ol className="list-decimal list-inside space-y-1 text-gray-600 ml-2">
            <li>Vai alla dashboard Cloudflare → Zero Trust</li>
            <li>Crea una nuova Application di tipo "Self-hosted"</li>
            <li>Imposta il percorso: <code className="bg-gray-100 px-1 rounded">allmobs.riccardogir07.workers.dev/admin</code></li>
            <li>Configura una policy (es: solo il tuo email)</li>
            <li>Salva e testa l'accesso</li>
          </ol>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Collegamenti Utili</h3>

        <div className="space-y-2">
          <a
            href="https://dash.cloudflare.com"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:border-green-600 hover:bg-green-50 transition-all group"
          >
            <span className="text-gray-900 font-medium">Dashboard Cloudflare</span>
            <span className="text-gray-400 group-hover:text-green-600">→</span>
          </a>

          <a
            href="/api/db-test"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:border-green-600 hover:bg-green-50 transition-all group"
          >
            <span className="text-gray-900 font-medium">Test Database D1</span>
            <span className="text-gray-400 group-hover:text-green-600">→</span>
          </a>

          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-200 rounded-lg hover:border-green-600 hover:bg-green-50 transition-all group"
          >
            <span className="text-gray-900 font-medium">Sito Pubblico</span>
            <span className="text-gray-400 group-hover:text-green-600">→</span>
          </a>
        </div>
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Documentazione</h3>

        <p className="text-sm text-gray-600 mb-4">
          Per maggiori informazioni sulla configurazione e l'utilizzo della dashboard,
          consulta il file <code className="bg-gray-100 px-1 rounded">ADMIN_SETUP.md</code> nella root del progetto.
        </p>
      </div>
    </div>
  );
}

export default Settings;
