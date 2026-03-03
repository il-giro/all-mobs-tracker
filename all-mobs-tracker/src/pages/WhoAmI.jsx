import { Link } from 'react-router-dom';
import Footer from '../components/Footer';

const WhoAmI = () => {
  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">
      <div className="flex-1 p-4 md:p-6">
        <div className="max-w-[900px] mx-auto">
          <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
            <div className="flex items-center justify-between gap-4">
              <Link to="/" className="bg-stone-700 hover:bg-stone-600 px-4 py-2 text-sm uppercase border-b-4 border-black transition-transform active:translate-y-1 active:border-b-0 shrink-0">
                ← Back
              </Link>
              <h1 className="text-4xl md:text-5xl text-green-400 uppercase drop-shadow-md">Who Am I</h1>
              <div className="w-24" />
            </div>
          </header>

          <div className="space-y-4">
            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6 flex flex-col sm:flex-row gap-6 items-start">
              <div className="w-20 h-20 bg-stone-700 border-4 border-stone-500 rounded shrink-0 flex items-center justify-center text-4xl">
                🧑‍💻
              </div>
              <div>
                <h2 className="text-green-400 uppercase text-xl mb-1">Il Creatore</h2>
                <p className="text-stone-400 text-sm uppercase mb-3">Developer & Minecraft nerd</p>
                <p className="text-stone-300 leading-relaxed">
                  Sono un appassionato di Minecraft e sviluppo web. Ho creato questo tracker perché volevo un modo semplice per tenere traccia dei mob che incontro nelle mie sessioni di gioco, senza dover usare fogli Excel o note sparse.
                </p>
              </div>
            </div>

            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
              <h2 className="text-green-400 uppercase text-xl mb-4 border-b-2 border-stone-600 pb-2">Stack tecnico</h2>
              <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
                {['React', 'Vite', 'Tailwind CSS', 'React Router', 'Vercel', 'localStorage'].map(tech => (
                  <div key={tech} className="bg-stone-900 border-2 border-stone-700 px-3 py-2 text-center">
                    <span className="text-stone-300 text-sm uppercase">{tech}</span>
                  </div>
                ))}
              </div>
            </div>

            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
              <h2 className="text-green-400 uppercase text-xl mb-4 border-b-2 border-stone-600 pb-2">Contatti</h2>
              <p className="text-stone-300 leading-relaxed">
                Hai trovato un bug? Vuoi suggerire una feature? Apri una issue su GitHub o contattami direttamente.
              </p>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default WhoAmI;