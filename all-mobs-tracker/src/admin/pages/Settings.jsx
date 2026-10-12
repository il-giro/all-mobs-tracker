function Settings() {
  return (
    <div className="space-y-6">
      <div className="bg-gray-900 rounded-xl border border-gray-800 p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Informazioni Sistema</h3>

        <div className="space-y-3">
          <div className="flex justify-between py-2 border-b border-gray-800">
            <span className="text-gray-400">Database</span>
            <span className="font-medium text-white">Cloudflare D1</span>
          </div>

          <div className="flex justify-between py-2 border-b border-gray-800">
            <span className="text-gray-400">Binding</span>
            <span className="font-mono text-sm text-white">DB</span>
          </div>

          <div className="flex justify-between py-2 border-b border-gray-800">
            <span className="text-gray-400">Tabelle Gestite</span>
            <span className="font-medium text-white">5</span>
          </div>

          <div className="flex justify-between py-2">
            <span className="text-gray-400">Ambiente</span>
            <span className="font-medium text-white">Production</span>
          </div>
        </div>
      </div>

      <div className="bg-gray-900 rounded-xl border border-gray-800 p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Sicurezza</h3>

        <div className="bg-green-900/20 border border-green-900/50 rounded-lg p-4 mb-4">
          <div className="flex items-start gap-3">
            <span className="text-2xl">✅</span>
            <div>
              <h4 className="font-semibold text-green-400 mb-1">
                Cloudflare Access Configurato
              </h4>
              <p className="text-sm text-green-300">
                La dashboard è protetta con Cloudflare Access. Solo gli utenti autorizzati possono accedere.
              </p>
            </div>
          </div>
        </div>
      </div>

      <div className="bg-gray-900 rounded-xl border border-gray-800 p-6">
        <h3 className="text-lg font-semibold text-white mb-4">Collegamenti Utili</h3>

        <div className="space-y-2">
          <a
            href="https://dash.cloudflare.com"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-800 rounded-lg hover:border-blue-600 hover:bg-gray-800/50 transition-all group"
          >
            <span className="text-white font-medium">Dashboard Cloudflare</span>
            <span className="text-gray-500 group-hover:text-blue-400">→</span>
          </a>

          <a
            href="/api/db-test"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-800 rounded-lg hover:border-blue-600 hover:bg-gray-800/50 transition-all group"
          >
            <span className="text-white font-medium">Test Database D1</span>
            <span className="text-gray-500 group-hover:text-blue-400">→</span>
          </a>

          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center justify-between p-3 border border-gray-800 rounded-lg hover:border-blue-600 hover:bg-gray-800/50 transition-all group"
          >
            <span className="text-white font-medium">Sito Pubblico</span>
            <span className="text-gray-500 group-hover:text-blue-400">→</span>
          </a>
        </div>
      </div>
    </div>
  );
}

export default Settings;
