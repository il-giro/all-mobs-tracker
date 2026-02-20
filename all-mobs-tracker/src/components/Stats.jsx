import React, { useMemo } from 'react';
import { ComplexConfig, SuffixConfig } from '../config/mobConfig';

const Stats = ({ allMobs, trackedMobs, onClose }) => {
  
  const stats = useMemo(() => {
    // Statistiche Globali
    const total = allMobs.length;
    const tracked = allMobs.filter(m => trackedMobs[m.fileName]).length;
    const percentage = total === 0 ? 0 : Math.round((tracked / total) * 100);

    // Statistiche Categorie Complesse
    const complexStats = ComplexConfig.map(config => {
      const categoryMobs = allMobs.filter(m => m.complexId === config.id);
      const catTracked = categoryMobs.filter(m => trackedMobs[m.fileName]).length;
      return {
        label: config.label,
        total: categoryMobs.length,
        tracked: catTracked,
        percent: categoryMobs.length === 0 ? 0 : Math.round((catTracked / categoryMobs.length) * 100)
      };
    });

    // Statistiche Suffissi Speciali
    const suffixStats = Object.values(SuffixConfig).map(config => {
      const suffixMobs = allMobs.filter(m => m.activeSuffixes.includes(config.id));
      const sufTracked = suffixMobs.filter(m => trackedMobs[m.fileName]).length;
      return {
        label: config.label,
        total: suffixMobs.length,
        tracked: sufTracked,
        percent: suffixMobs.length === 0 ? 0 : Math.round((sufTracked / suffixMobs.length) * 100)
      };
    });

    return { total, tracked, percentage, complexStats, suffixStats };
  }, [allMobs, trackedMobs]);

  const ProgressBar = ({ percent }) => (
    <div className="h-4 bg-black border-2 border-stone-600 w-full mt-2">
      <div className="h-full bg-blue-500 transition-all duration-500" style={{ width: `${percent}%` }} />
    </div>
  );

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/80 backdrop-blur-sm p-4">
      <div className="bg-stone-800 w-full max-w-4xl rounded-lg shadow-2xl p-6 md:p-8 border-4 border-stone-600 overflow-y-auto max-h-[90vh]">
        <div className="flex justify-between items-center mb-8 border-b-4 border-stone-700 pb-4">
          <h2 className="text-3xl md:text-4xl text-blue-400 uppercase tracking-widest font-bold">Statistiche</h2>
          <button onClick={onClose} className="bg-stone-600 hover:bg-stone-500 text-white px-5 py-2 text-xl border-b-4 border-stone-900 font-bold uppercase transition-transform active:translate-y-1 active:border-b-0">Chiudi</button>
        </div>

        {/* Progressi Totali */}
        <div className="bg-stone-900 p-6 border-4 border-stone-700 mb-8 text-center">
          <h3 className="text-2xl text-stone-300 uppercase font-bold mb-2">Completamento Globale (Tutti i mob esistenti)</h3>
          <div className="text-5xl text-blue-400 font-bold mb-4">{stats.tracked} / {stats.total}</div>
          <div className="h-8 bg-black border-2 border-stone-600 p-1">
            <div className="h-full bg-blue-500 transition-all duration-500 flex items-center justify-center overflow-hidden relative" style={{ width: `${stats.percentage}%` }}>
            </div>
          </div>
          <p className="mt-2 text-xl font-bold">{stats.percentage}%</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {/* Categorie */}
          <div>
            <h3 className="text-2xl text-amber-500 uppercase font-bold mb-4 border-b-2 border-stone-600 pb-2">Per Categoria</h3>
            <div className="space-y-4">
              {stats.complexStats.map(stat => stat.total > 0 && (
                <div key={stat.label} className="bg-stone-900/60 p-3 border-2 border-stone-700">
                  <div className="flex justify-between font-bold uppercase text-stone-300">
                    <span>{stat.label}</span>
                    <span>{stat.tracked} / {stat.total} ({stat.percent}%)</span>
                  </div>
                  <ProgressBar percent={stat.percent} />
                </div>
              ))}
            </div>
          </div>

          {/* Suffissi */}
          <div>
            <h3 className="text-2xl text-purple-400 uppercase font-bold mb-4 border-b-2 border-stone-600 pb-2">Per Suffisso (Baby, Pet, ecc)</h3>
            <div className="space-y-4">
              {stats.suffixStats.map(stat => stat.total > 0 && (
                <div key={stat.label} className="bg-stone-900/60 p-3 border-2 border-stone-700">
                  <div className="flex justify-between font-bold uppercase text-stone-300">
                    <span>{stat.label}</span>
                    <span>{stat.tracked} / {stat.total} ({stat.percent}%)</span>
                  </div>
                  <ProgressBar percent={stat.percent} />
                </div>
              ))}
            </div>
          </div>
        </div>

      </div>
    </div>
  );
};

export default Stats;