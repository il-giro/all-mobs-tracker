import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <footer style={{ fontFamily: "'Georgia', 'Times New Roman', serif" }}
      className="bg-[#0e0e0e] border-t border-stone-800 mt-12 px-8 py-8"
    >
      <div className="max-w-[1600px] mx-auto">
        <div className="flex flex-col md:flex-row justify-between gap-10 mb-10">

          {/* Brand */}
          <div className="max-w-xs">
            <p className="text-stone-100 text-lg tracking-wide mb-3">Mob Tracker</p>
            <p className="text-stone-500 text-sm leading-relaxed">
              Track your progress in collecting Minecraft mobs and their variants. All data is saved locally in your browser.
            </p>
          </div>

          {/* Info */}
          <div>
            <p className="text-stone-400 text-xs uppercase tracking-widest mb-4">Info</p>
            <ul className="space-y-2">
              <li><Link to="/about"  className="text-stone-400 hover:text-stone-100 text-sm transition-colors duration-200">About</Link></li>
              <li><Link to="/whoami" className="text-stone-400 hover:text-stone-100 text-sm transition-colors duration-200">Who Am I</Link></li>
            </ul>
          </div>

          {/* Supporto */}
          <div>
            <p className="text-stone-400 text-xs uppercase tracking-widest mb-4">Supporto</p>
            <ul className="space-y-2">
              <li><Link to="/faq" className="text-stone-400 hover:text-stone-100 text-sm transition-colors duration-200">FAQ</Link></li>
            </ul>
          </div>

        </div>

        {/* Bottom bar */}
        <div className="border-t border-stone-800 pt-6 text-center">
          <p className="text-stone-600 text-xs tracking-wide">
            © {new Date().getFullYear()} Mob Tracker. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;