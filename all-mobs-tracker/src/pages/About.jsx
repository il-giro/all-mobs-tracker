import { Link } from 'react-router-dom';
import Footer from '../components/Footer';

const About = () => {
  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">
      <div className="flex-1 p-4 md:p-6">
        <div className="max-w-[900px] mx-auto">
          <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
            <div className="flex items-center justify-between gap-4">
              <Link to="/" className="bg-stone-700 hover:bg-stone-600 px-4 py-2 text-sm uppercase border-b-4 border-black transition-transform active:translate-y-1 active:border-b-0 shrink-0">
                ← Back
              </Link>
              <h1 className="text-4xl md:text-5xl text-green-400 uppercase drop-shadow-md">About</h1>
              <div className="w-24" />
            </div>
          </header>

          <div className="space-y-4">
            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
              <h2 className="text-green-400 uppercase text-xl mb-4 border-b-2 border-stone-600 pb-2">Cos'è Mob Tracker?</h2>
              <p className="text-stone-300 leading-relaxed">
                Mob Tracker è uno strumento per i giocatori di Minecraft che vogliono tenere traccia di tutti i mob incontrati nel gioco. Ogni creatura ha la sua card — basta un click per segnarla come trovata.
              </p>
            </div>

            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
              <h2 className="text-green-400 uppercase text-xl mb-4 border-b-2 border-stone-600 pb-2">Come funziona</h2>
              <div className="space-y-3">
                {[
                  { num: '01', text: 'Sfoglia la lista completa dei mob disponibili.' },
                  { num: '02', text: 'Clicca su un mob per segnarlo come trovato.' },
                  { num: '03', text: 'Usa filtri e ricerca per trovare rapidamente quello che cerchi.' },
                  { num: '04', text: 'I progressi vengono salvati nel browser — nessun account necessario.' },
                ].map(item => (
                  <div key={item.num} className="flex gap-4 items-start">
                    <span className="text-green-400 font-bold text-lg shrink-0 w-8">{item.num}</span>
                    <p className="text-stone-300">{item.text}</p>
                  </div>
                ))}
              </div>
            </div>

            <div className="bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
              <h2 className="text-green-400 uppercase text-xl mb-4 border-b-2 border-stone-600 pb-2">Privacy</h2>
              <p className="text-stone-300 leading-relaxed">
                Tutti i dati vengono salvati nel <span className="text-green-400">localStorage</span> del tuo browser. Nessun server esterno, nessun tracciamento.
              </p>
            </div>

            <div className="bg-stone-800 border-4 border-green-800 rounded-lg p-6">
              <div className="flex flex-col sm:flex-row gap-4 items-center justify-between">
                <p className="text-stone-300">Vuoi sapere chi ha creato questo progetto?</p>
                <Link to="/whoami" className="bg-green-700 hover:bg-green-600 px-6 py-2 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 shrink-0">
                  Who Am I →
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default About;