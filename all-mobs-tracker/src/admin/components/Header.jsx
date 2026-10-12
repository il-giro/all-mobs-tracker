const TABLES_LABELS = {
  'MOBS': 'Mob',
  'VARIANTS': 'Varianti',
  'CATEGORIES': 'Categorie',
  'MOB_CATEGORIES': 'Relazioni Mob - Categorie',
  'VARIANT_CATEGORIES': 'Relazioni Varianti - Categorie'
};

function Header({ currentPage, selectedTable, onToggleSidebar }) {
  const getPageTitle = () => {
    if (currentPage === 'dashboard') return 'Dashboard';
    if (currentPage === 'table' && selectedTable) {
      return TABLES_LABELS[selectedTable] || selectedTable;
    }
    if (currentPage === 'settings') return 'Impostazioni';
    return 'Admin';
  };

  return (
    <header className="bg-white border-b border-gray-200">
      <div className="px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <button
            onClick={onToggleSidebar}
            className="lg:hidden p-2 rounded-lg hover:bg-gray-100 transition-colors"
            aria-label="Toggle sidebar"
          >
            <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>

          <div>
            <h2 className="text-2xl font-bold text-gray-900">{getPageTitle()}</h2>
            <p className="text-sm text-gray-500">
              Gestisci il database AllMobs
            </p>
          </div>
        </div>

        <div className="flex items-center gap-4">
          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-100 rounded-lg transition-colors"
          >
            Visualizza Sito
          </a>

          <div className="flex items-center gap-3 pl-4 border-l border-gray-200">
            <div className="w-9 h-9 bg-green-600 rounded-full flex items-center justify-center text-white font-semibold">
              A
            </div>
            <div className="hidden md:block">
              <p className="text-sm font-medium text-gray-900">Admin</p>
              <p className="text-xs text-gray-500">Amministratore</p>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

export default Header;
