import { useState, useEffect } from 'react';

function Dashboard() {
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    loadStats();
  }, []);

  const loadStats = async () => {
    try {
      setLoading(true);
      const response = await fetch('/api/admin/stats');
      const data = await response.json();

      if (data.success) {
        setStats(data.stats);
      } else {
        setError(data.error);
      }
    } catch (err) {
      setError('Errore nel caricamento delle statistiche');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const StatCard = ({ title, value, icon, description, color }) => (
    <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow">
      <div className="flex items-start justify-between">
        <div>
          <p className="text-sm font-medium text-gray-600">{title}</p>
          <p className={`text-3xl font-bold mt-2 ${color}`}>{value}</p>
          {description && (
            <p className="text-sm text-gray-500 mt-1">{description}</p>
          )}
        </div>
        <div className={`w-12 h-12 rounded-lg flex items-center justify-center text-2xl ${color.replace('text-', 'bg-').replace('-600', '-100')}`}>
          {icon}
        </div>
      </div>
    </div>
  );

  if (loading) {
    return (
      <div className="flex items-center justify-center h-64">
        <div className="text-center">
          <div className="w-16 h-16 border-4 border-green-600 border-t-transparent rounded-full animate-spin mx-auto"></div>
          <p className="mt-4 text-gray-600">Caricamento statistiche...</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="bg-red-50 border border-red-200 rounded-lg p-6">
        <div className="flex items-center gap-3">
          <span className="text-2xl">⚠️</span>
          <div>
            <h3 className="font-semibold text-red-900">Errore</h3>
            <p className="text-red-700">{error}</p>
          </div>
        </div>
        <button
          onClick={loadStats}
          className="mt-4 px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition-colors"
        >
          Riprova
        </button>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div className="bg-gradient-to-r from-green-600 to-green-700 rounded-xl p-8 text-white">
        <h2 className="text-3xl font-bold mb-2">Benvenuto nella Dashboard</h2>
        <p className="text-green-100">
          Gestisci i mob, le varianti e le categorie del tuo database AllMobs
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <StatCard
          title="Mob Totali"
          value={stats?.mobs || 0}
          icon="🐾"
          description="Creature nel database"
          color="text-blue-600"
        />

        <StatCard
          title="Varianti Totali"
          value={stats?.variants || 0}
          icon="🎨"
          description="Variazioni dei mob"
          color="text-purple-600"
        />

        <StatCard
          title="Categorie"
          value={stats?.categories || 0}
          icon="📁"
          description="Gruppi di classificazione"
          color="text-green-600"
        />

        <StatCard
          title="Mob ↔ Categorie"
          value={stats?.mobCategories || 0}
          icon="🔗"
          description="Associazioni mob"
          color="text-orange-600"
        />

        <StatCard
          title="Varianti ↔ Categorie"
          value={stats?.variantCategories || 0}
          icon="🔗"
          description="Associazioni varianti"
          color="text-pink-600"
        />

        <StatCard
          title="Record Totali"
          value={(stats?.mobs || 0) + (stats?.variants || 0) + (stats?.categories || 0)}
          icon="📊"
          description="Somma delle entità principali"
          color="text-gray-600"
        />
      </div>

      <div className="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
        <h3 className="text-lg font-semibold text-gray-900 mb-4">Azioni Rapide</h3>
        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <a
            href="#"
            className="flex items-center gap-4 p-4 border border-gray-200 rounded-lg hover:border-green-600 hover:bg-green-50 transition-all group"
          >
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center text-2xl group-hover:bg-blue-200 transition-colors">
              🐾
            </div>
            <div>
              <p className="font-medium text-gray-900">Gestisci Mob</p>
              <p className="text-sm text-gray-500">Aggiungi, modifica o elimina mob</p>
            </div>
          </a>

          <a
            href="#"
            className="flex items-center gap-4 p-4 border border-gray-200 rounded-lg hover:border-purple-600 hover:bg-purple-50 transition-all group"
          >
            <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center text-2xl group-hover:bg-purple-200 transition-colors">
              🎨
            </div>
            <div>
              <p className="font-medium text-gray-900">Gestisci Varianti</p>
              <p className="text-sm text-gray-500">Crea nuove varianti dei mob</p>
            </div>
          </a>

          <a
            href="#"
            className="flex items-center gap-4 p-4 border border-gray-200 rounded-lg hover:border-green-600 hover:bg-green-50 transition-all group"
          >
            <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center text-2xl group-hover:bg-green-200 transition-colors">
              📁
            </div>
            <div>
              <p className="font-medium text-gray-900">Gestisci Categorie</p>
              <p className="text-sm text-gray-500">Organizza i mob in categorie</p>
            </div>
          </a>

          <a
            href="/api/db-test"
            target="_blank"
            rel="noopener noreferrer"
            className="flex items-center gap-4 p-4 border border-gray-200 rounded-lg hover:border-gray-600 hover:bg-gray-50 transition-all group"
          >
            <div className="w-12 h-12 bg-gray-100 rounded-lg flex items-center justify-center text-2xl group-hover:bg-gray-200 transition-colors">
              🔧
            </div>
            <div>
              <p className="font-medium text-gray-900">Test Database</p>
              <p className="text-sm text-gray-500">Verifica connessione D1</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  );
}

export default Dashboard;
