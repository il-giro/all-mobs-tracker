import React, { useState, useEffect, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { CategoryMap } from '../../config/mobCategories';
import Footer from '../../components/Footer';

const CATEGORY_ID = 'shearable';

const useTrackedMobs = () => {
  const [tracked, setTracked] = useState(() =>
    JSON.parse(localStorage.getItem('mobTracker_saves') || '{}')
  );
  const toggle = (fileName) => {
    setTracked(prev => {
      const next = { ...prev, [fileName]: !prev[fileName] };
      localStorage.setItem('mobTracker_saves', JSON.stringify(next));
      return next;
    });
  };
  return [tracked, toggle];
};

// Risolve ogni mob entry:
// - stringa → cerca il file col glob (word match)
// - oggetto { name, file } → usa file direttamente
const useMobData = (mobs) => {
  const [data, setData] = useState({});
  useEffect(() => {
    const load = async () => {
      const modules = import.meta.glob('/public/data/**/*.{png,jpg,jpeg,gif,webp}', { eager: true });
      const allPaths = Object.keys(modules);
      const result = {};

      for (const mob of mobs) {
        const isObj   = typeof mob === 'object';
        const display = isObj ? mob.name : mob;
        const fileHint = isObj ? mob.file : null;

        if (fileHint) {
          // Path esplicito fornito — cerca il path che finisce con questo filename
          const match = allPaths.find(p => p.endsWith(fileHint) || p.includes(fileHint));
          if (match) {
            result[display] = {
              image:    match.replace('/public', ''),
              fileName: match.replace('/public/', ''),
            };
          }
        } else {
          // Word match: cerca sia nel filename che nel path completo
          const words = display.toLowerCase().replace(/[()_]/g, ' ').trim().split(/\s+/).filter(Boolean);
          const matches = allPaths.filter(path => {
            // Normalizza l'intero path (cartella + filename senza estensione)
            const fullPath = path.toLowerCase().replace(/[_\-\/]/g, ' ').replace(/\.[^.]+$/, '');
            const pathWords = fullPath.split(/\s+/).filter(Boolean);
            return words.every(w => pathWords.includes(w));
          });
          const best = matches.sort((a, b) => a.split('/').pop().length - b.split('/').pop().length)[0];
          if (best) {
            result[display] = {
              image:    best.replace('/public', ''),
              fileName: best.replace('/public/', ''),
            };
          }
        }
      }
      setData(result);
    };
    load();
  }, [JSON.stringify(mobs)]);
  return data;
};

const MobItem = ({ name, mobData, isTracked, onToggle }) => {
  const image    = mobData?.image;
  const fileName = mobData?.fileName;

  return (
    <div
      onClick={() => fileName && onToggle(fileName)}
      className={`flex items-center gap-4 p-4 border-2 transition-colors group cursor-pointer select-none
        ${isTracked
          ? 'bg-green-950/40 border-green-700 hover:border-green-500'
          : 'bg-stone-900 border-stone-700 hover:border-amber-700'
        }`}
    >
      <div className={`w-10 h-10 shrink-0 flex items-center justify-center border-2 text-2xl
        ${isTracked
          ? 'border-green-600 bg-green-900/50 text-green-400'
          : 'border-stone-700 bg-stone-800/50 text-stone-600'
        }`}>
        {isTracked ? '✔' : '✖'}
      </div>

      <div className="w-14 h-14 shrink-0 flex items-center justify-center bg-[#181818] border-2 border-stone-800"
        style={{ imageRendering: 'pixelated' }}>
        {image
          ? <img src={image} alt={name} className="max-w-full max-h-full object-contain"
              style={{ imageRendering: 'pixelated' }} />
          : <span className="text-stone-700 text-xs uppercase">?</span>
        }
      </div>

      <div className="flex-1 min-w-0">
        <p className={`uppercase text-sm tracking-wide truncate ${isTracked ? 'text-green-400' : 'text-amber-400'}`}>
          {name}
        </p>
        <p className="text-stone-600 text-xs uppercase mt-1">✂ Shearable</p>
      </div>

      <div className={`shrink-0 text-xs uppercase transition-colors ${isTracked ? 'text-green-600' : 'text-stone-700 group-hover:text-amber-800'}`}>
        {isTracked ? 'Caught' : 'Not caught'}
      </div>
    </div>
  );
};

const ShearablePage = () => {
  const category          = CategoryMap[CATEGORY_ID];
  // mobs può contenere stringhe o oggetti { name, file }
  const mobs              = useMemo(() => category?.mobs ?? [], []);
  const mobData           = useMobData(mobs);
  const [tracked, toggle] = useTrackedMobs();

  if (!category) {
    return (
      <div className="min-h-screen bg-[#111] text-stone-100 flex items-center justify-center">
        <p className="text-stone-500 uppercase">Category not found.</p>
      </div>
    );
  }

  const displayNames  = mobs.map(m => typeof m === 'object' ? m.name : m);
  const trackedCount  = displayNames.filter(n => mobData[n] && tracked[mobData[n].fileName]).length;

  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">

      <header className="bg-stone-900 border-b-4 border-amber-800 px-6 py-6 shadow-xl">
        <div className="max-w-3xl mx-auto">
          <Link to="/"
            className="text-stone-500 text-xs uppercase hover:text-stone-300 transition-colors mb-5 inline-flex items-center gap-1">
            ← Mob Tracker
          </Link>
          <div className="flex items-end gap-5 mt-2">
            <span className="text-6xl text-amber-400 leading-none select-none">✂</span>
            <div>
              <h1 className="text-4xl uppercase text-amber-400 leading-none">Shearable</h1>
              <div className="flex items-center gap-3 mt-2">
                <p className="text-stone-500 text-xs uppercase">{displayNames.length} mobs</p>
                <span className="text-stone-700">·</span>
                <p className={`text-xs uppercase ${trackedCount === displayNames.length ? 'text-green-400' : 'text-stone-500'}`}>
                  {trackedCount} / {displayNames.length} caught
                </p>
              </div>
            </div>
          </div>
        </div>
      </header>

      <main className="flex-1 max-w-3xl mx-auto w-full px-6 py-8 space-y-8">

        <section className="bg-stone-900/60 border-2 border-amber-900 p-6">
          <p className="text-xs uppercase text-amber-800 mb-3 tracking-widest">Description</p>
          <p className="text-stone-300 text-sm leading-relaxed">
            These mobs can be sheared using Shears.<br/>
            Shearing them drops wool, mushrooms, or other materials, and in some cases<br/>
            permanently changes their appearance until they respawn or regrow.
          </p>
        </section>

        <section>
          <p className="text-xs uppercase text-stone-500 tracking-widest border-b-2 border-stone-800 pb-3 mb-4">
            Mobs in this category
          </p>
          {displayNames.length === 0
            ? <p className="text-stone-600 uppercase text-sm">No mobs assigned.</p>
            : <div className="space-y-2">
                {displayNames.map(name => (
                  <MobItem
                    key={name}
                    name={name}
                    mobData={mobData[name]}
                    isTracked={!!(mobData[name] && tracked[mobData[name].fileName])}
                    onToggle={toggle}
                  />
                ))}
              </div>
          }
        </section>

      </main>

      <Footer />
    </div>
  );
};

export default ShearablePage;