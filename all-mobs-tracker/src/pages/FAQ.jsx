import { useState } from 'react';
import { Link } from 'react-router-dom';
import Footer from '../components/Footer';

const FAQS = [
  {
    q: 'I miei progressi vengono salvati automaticamente?',
    a: 'Sì. Ogni click viene salvato in tempo reale nel localStorage del tuo browser. Non devi fare nulla di manuale.',
  },
  {
    q: 'Cosa succede se pulisco la cache del browser?',
    a: 'I progressi salvati nel localStorage verranno cancellati. Ti consiglio di fare uno screenshot o di esportare i dati prima di pulire la cache.',
  },
  {
    q: 'Posso usarlo su mobile?',
    a: 'Sì, il sito è completamente responsive e funziona su smartphone e tablet.',
  },
  {
    q: 'Supporta la versione Bedrock di Minecraft?',
    a: 'I mob presenti sono quelli della versione Java. La maggior parte esiste anche in Bedrock, ma potrebbero esserci piccole differenze.',
  },
  {
    q: 'Come faccio a resettare tutti i progressi?',
    a: 'Vai in Settings e clicca il pulsante di reset. Ti verrà chiesta una conferma prima di cancellare tutto.',
  },
  {
    q: 'Perché i Tropical Fish sono separati dagli altri mob?',
    a: 'I pesci tropicali hanno 3072 varianti di colore e pattern, quindi sono gestiti in una sezione dedicata con filtri specifici.',
  },
];

const FAQItem = ({ q, a }) => {
  const [open, setOpen] = useState(false);
  return (
    <div className={`bg-stone-800 border-4 ${open ? 'border-green-700' : 'border-stone-600'} rounded-lg overflow-hidden transition-colors`}>
      <button
        onClick={() => setOpen(v => !v)}
        className="w-full flex justify-between items-center px-6 py-4 hover:bg-stone-700 transition-colors text-left gap-4"
      >
        <span className="text-stone-100 uppercase text-sm font-bold">{q}</span>
        <span className="text-green-400 text-xl shrink-0">{open ? '▲' : '▼'}</span>
      </button>
      {open && (
        <div className="px-6 pb-5 border-t-2 border-stone-600 pt-4">
          <p className="text-stone-300 leading-relaxed">{a}</p>
        </div>
      )}
    </div>
  );
};

const FAQ = () => {
  return (
    <div className="min-h-screen bg-[#111] text-stone-100 flex flex-col">
      <div className="flex-1 p-4 md:p-6">
        <div className="max-w-[900px] mx-auto">
          <header className="bg-stone-800 rounded-lg p-6 mb-6 border-4 border-stone-600 shadow-xl">
            <div className="flex items-center justify-between gap-4">
              <Link to="/" className="bg-stone-700 hover:bg-stone-600 px-4 py-2 text-sm uppercase border-b-4 border-black transition-transform active:translate-y-1 active:border-b-0 shrink-0">
                ← Back
              </Link>
              <h1 className="text-4xl md:text-5xl text-green-400 uppercase drop-shadow-md">FAQ</h1>
              <div className="w-24" />
            </div>
          </header>

          <div className="space-y-3">
            {FAQS.map((item, i) => (
              <FAQItem key={i} q={item.q} a={item.a} />
            ))}
          </div>

          <div className="mt-4 bg-stone-800 border-4 border-stone-600 rounded-lg p-6">
            <p className="text-stone-400 text-sm">
              Non hai trovato risposta? Vai alla pagina{' '}
              <Link to="/about" className="text-green-400 hover:underline">About</Link>{' '}
              per i contatti.
            </p>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default FAQ;