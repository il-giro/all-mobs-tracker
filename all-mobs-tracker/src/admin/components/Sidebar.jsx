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
    // Carica le tabelle disponibili dall'API
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
      className={`w-full flex items-center gap-3 px-4 py-3 rounded-lg transition-colors ${
        active
          ? 'bg-green-600 text-white'
          : 'text-gray-700 hover:bg-gray-100'
      }`}
    >
      <span className="text-xl">{icon}</span>
      {!collapsed && <span className="font-medium">{label}</span>}
    </button>
  );

  return (
    <aside
      className={`bg-white border-r border-gray-200 transition-all duration-300 ${
        collapsed ? 'w-20' : 'w-64'
      }`}
    >
      <div className="p-6">
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 bg-green-600 rounded-lg flex items-center justify-center text-white text-xl font-bold">
            A
          </div>
          {!collapsed && (
            <div>
              <h1 className="text-xl font-bold text-gray-900">AllMobs</h1>
              <p className="text-sm text-gray-500">Admin Dashboard</p>
            </div>
          )}
        </div>
      </div>

      <nav className="px-4 space-y-1">
        <MenuItem
          id="dashboard"
          label="Dashboard"
          icon="📊"
          onClick={() => onNavigate('dashboard')}
          active={currentPage === 'dashboard'}
        />

        {!collapsed && (
          <div className="pt-4 pb-2 px-4">
            <p className="text-xs font-semibold text-gray-400 uppercase tracking-wider">
              Database
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

        <div className="pt-4">
          <MenuItem
            id="settings"
            label="Impostazioni"
            icon="⚙️"
            onClick={() => onNavigate('settings')}
            active={currentPage === 'settings'}
          />
        </div>
      </nav>
    </aside>
  );
}

export default Sidebar;
