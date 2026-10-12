import { useState } from 'react';
import Sidebar from './components/Sidebar';
import Header from './components/Header';
import Dashboard from './pages/Dashboard';
import TableExplorer from './pages/TableExplorer';
import Settings from './pages/Settings';

function AdminApp() {
  const [currentPage, setCurrentPage] = useState('dashboard');
  const [selectedTable, setSelectedTable] = useState(null);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  const renderPage = () => {
    switch (currentPage) {
      case 'dashboard':
        return <Dashboard />;
      case 'table':
        return <TableExplorer table={selectedTable} />;
      case 'settings':
        return <Settings />;
      default:
        return <Dashboard />;
    }
  };

  const handleNavigate = (page, table = null) => {
    setCurrentPage(page);
    if (table) {
      setSelectedTable(table);
    }
  };

  return (
    <div className="flex h-screen bg-gray-50">
      <Sidebar
        currentPage={currentPage}
        selectedTable={selectedTable}
        onNavigate={handleNavigate}
        collapsed={sidebarCollapsed}
        onToggleCollapse={() => setSidebarCollapsed(!sidebarCollapsed)}
      />

      <div className="flex-1 flex flex-col overflow-hidden">
        <Header
          currentPage={currentPage}
          selectedTable={selectedTable}
          onToggleSidebar={() => setSidebarCollapsed(!sidebarCollapsed)}
        />

        <main className="flex-1 overflow-y-auto p-6">
          {renderPage()}
        </main>
      </div>
    </div>
  );
}

export default AdminApp;
