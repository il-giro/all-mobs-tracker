const TABLES_LABELS = {
  'MOBS': 'Mob',
  'VARIANTS': 'Varianti',
  'CATEGORIES': 'Categorie',
  'MOB_CATEGORIES': 'Relazioni Mob - Categorie',
  'VARIANT_CATEGORIES': 'Relazioni Varianti - Categorie'
};

function Header({ currentPage, selectedTable, onToggleSidebar, darkMode, onToggleDarkMode }) {
  const getPageTitle = () => {
    if (currentPage === 'dashboard') return 'Dashboard';
    if (currentPage === 'table' && selectedTable) {
      return TABLES_LABELS[selectedTable] || selectedTable;
    }
    if (currentPage === 'settings') return 'Impostazioni';
    return 'Admin';
  };

  return (
    <header className="bg-gray-900 border-b border-gray-800">
      <div className="px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <button
            onClick={onToggleSidebar}
            className="lg:hidden p-2 rounded-lg hover:bg-gray-800 transition-colors text-gray-400"
            aria-label="Toggle sidebar"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>

          <div>
            <h2 className="text-xl font-semibold text-white">{getPageTitle()}</h2>
            <p className="text-sm text-gray-400">
              Gestione database AllMobs
            </p>
          </div>
        </div>

        <div className="flex items-center gap-3">
          <a
            href="/"
            target="_blank"
            rel="noopener noreferrer"
            className="px-3 py-2 text-sm font-medium text-gray-300 hover:bg-gray-800 rounded-lg transition-colors"
          >
            Sito Pubblico
          </a>

          <div className="flex items-center gap-3 pl-3 border-l border-gray-800">
            <div className="w-8 h-8 bg-blue-600 rounded-full flex items-center justify-center text-white font-semibold text-sm">
              A
            </div>
          </div>
        </div>
      </div>
    </header>
  );
}

export default Header;
