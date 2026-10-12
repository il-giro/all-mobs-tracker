import { useState, useEffect } from 'react';

const TABLES = [
  { name: 'MOBS', label: 'Mob', icon: '🐾' },
  { name: 'VARIANTS', label: 'Varianti', icon: '🎨' },
  { name: 'CATEGORIES', label: 'Categorie', icon: '📁' },
  { name: 'MOB_CATEGORIES', label: 'Mob ↔ Categorie', icon: '🔗' },
  { name: 'VARIANT_CATEGORIES', label: 'Varianti ↔ Categorie', icon: '🔗' }
];

function Sidebar({ currentPage, selectedTable, onNavigate, collapsed }) {
  const [availableTables, setAvailableTables] = useState([]);

  useEffect(() => {
    fetch('/api/admin/tables')
      .then(res => res.json())
      .then(data => {
        if (data.success) {
          setAvailableTables(data.tables);
        }
      })
      .catch(err => console.error('Errore nel caricamento delle tabelle:', err));
  }, []);

  const MenuItem = ({ id, label, icon, onClick, active }) => (
    <button
      onClick={onClick}
      className={`w-full flex items-center gap-3 px-4 py-2.5 rounded-lg transition-colors text-sm ${
        active
          ? 'bg-blue-600 text-white shadow-sm'
          : 'text-gray-300 hover:bg-gray-800 hover:text-white'
      }`}
    >
      <span className="text-lg">{icon}</span>
      {!collapsed && <span className="font-medium">{label}</span>}
    </button>
  );

  return (
    <aside
      className={`bg-gray-900 border-r border-gray-800 transition-all duration-300 flex flex-col ${
        collapsed ? 'w-16' : 'w-64'
      }`}
    >
      <div className="p-4 border-b border-gray-800">
        <div className="flex items-center gap-3">
          <div className="w-8 h-8 bg-blue-600 rounded-lg flex items-center justify-center text-white text-sm font-bold">
            A
          </div>
          {!collapsed && (
            <div>
              <h1 className="text-sm font-semibold text-white">AllMobs Admin</h1>
            </div>
          )}
        </div>
      </div>

      <nav className="px-3 py-4 space-y-1 flex-1 overflow-y-auto">
        <MenuItem
          id="dashboard"
          label="Dashboard"
          icon="📊"
          onClick={() => onNavigate('dashboard')}
          active={currentPage === 'dashboard'}
        />

        {!collapsed && (
          <div className="pt-4 pb-2 px-2">
            <p className="text-xs font-semibold text-gray-500 uppercase tracking-wider">
              Tabelle
            </p>
          </div>
        )}

        {TABLES.filter(t => availableTables.includes(t.name)).map(table => (
          <MenuItem
            key={table.name}
            id={table.name}
            label={table.label}
            icon={table.icon}
            onClick={() => onNavigate('table', table.name)}
            active={currentPage === 'table' && selectedTable === table.name}
          />
        ))}
      </nav>

      <div className="p-3 border-t border-gray-800">
        <MenuItem
          id="settings"
          label="Impostazioni"
          icon="⚙️"
          onClick={() => onNavigate('settings')}
          active={currentPage === 'settings'}
        />
      </div>
    </aside>
  );
}

export default Sidebar;
