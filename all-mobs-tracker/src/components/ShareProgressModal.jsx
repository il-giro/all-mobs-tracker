import { useEffect, useRef, useState, useMemo } from 'react';
import { MobCategories } from '../config/mobCategories';

/* ── palette ── */
const MC_DARK   = '#1a1007';
const MC_BG     = '#2b1c0a';
const MC_PANEL  = '#3b2510';
const MC_BORDER = '#7a5230';
const MC_GOLD   = '#ffaa00';
const MC_GREEN  = '#55ff55';
const MC_LIME   = '#aaff00';
const MC_RED    = '#ff5555';
const MC_GRAY   = '#aaaaaa';
const MC_WHITE  = '#ffffff';

/* ── canvas helpers ── */
function drawCheckeredBg(ctx, W, H) {
  const S = 24;
  for (let r = 0; r < Math.ceil(H / S); r++)
    for (let c = 0; c < Math.ceil(W / S); c++) {
      ctx.fillStyle = (r + c) % 2 === 0 ? '#1c1208' : '#150e06';
      ctx.fillRect(c * S, r * S, S, S);
    }
}

function drawPanel(ctx, x, y, w, h) {
  ctx.fillStyle = MC_PANEL;
  ctx.fillRect(x, y, w, h);
  const t = 3;
  ctx.fillStyle = '#6b3c1a';
  ctx.fillRect(x, y, w, t); ctx.fillRect(x, y, t, h);
  ctx.fillStyle = '#1a0f00';
  ctx.fillRect(x, y + h - t, w, t); ctx.fillRect(x + w - t, y, t, h);
}

function txt(ctx, text, x, y, color = MC_WHITE, size = 18, shadow = true) {
  ctx.font = `bold ${size}px "Courier New", monospace`;
  if (shadow) { ctx.fillStyle = '#000'; ctx.fillText(text, x + 2, y + 2); }
  ctx.fillStyle = color;
  ctx.fillText(text, x, y);
}

function drawXPBar(ctx, x, y, w, h, pct) {
  ctx.fillStyle = '#0a0a00';
  ctx.fillRect(x, y, w, h);
  const grad = ctx.createLinearGradient(x, y, x + w, y);
  grad.addColorStop(0, '#7ef84a');
  grad.addColorStop(1, '#55cc22');
  ctx.fillStyle = grad;
  ctx.fillRect(x + 1, y + 1, Math.max(0, (w - 2) * pct), h - 2);
}

/* ── Component ── */
const ShareProgressModal = ({ onClose, allMobs, trackedMobs, capturedMobs, captureMode }) => {
  const canvasRef = useRef(null);
  const [copied, setCopied] = useState(false);
  const [status, setStatus] = useState('');

  const stats = useMemo(() => {
    const total   = allMobs.length;
    const caught  = allMobs.filter(m => !!capturedMobs[m.fileName]).length;
    const spotted = captureMode
      ? allMobs.filter(m => !!trackedMobs[m.fileName] && !capturedMobs[m.fileName]).length
      : 0;
    const pct = total > 0 ? caught / total : 0;

    const catStats = MobCategories
      .filter(c => !c.special && !c.id.startsWith('biome-') && !c.id.startsWith('profession-') && !c.id.startsWith('color-'))
      .slice(0, 4)
      .map(cat => {
        const catMobs   = allMobs.filter(m => m.categories?.includes(cat.id));
        const catCaught = catMobs.filter(m => !!capturedMobs[m.fileName]).length;
        return { label: cat.label, caught: catCaught, total: catMobs.length };
      });

    return { total, caught, spotted, pct, catStats };
  }, [allMobs, trackedMobs, capturedMobs, captureMode]);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const W = 680, H = 420;
    canvas.width  = W * 2;
    canvas.height = H * 2;
    canvas.style.width  = W + 'px';
    canvas.style.height = H + 'px';

    const ctx = canvas.getContext('2d');
    ctx.scale(2, 2);

    /* bg */
    ctx.fillStyle = MC_DARK;
    ctx.fillRect(0, 0, W, H);
    drawCheckeredBg(ctx, W, H);

    /* outer border */
    ctx.fillStyle = MC_BORDER;
    ctx.fillRect(0, 0, W, 4); ctx.fillRect(0, H - 4, W, 4);
    ctx.fillRect(0, 0, 4, H); ctx.fillRect(W - 4, 0, 4, H);

    /* ── header panel ── */
    drawPanel(ctx, 12, 12, W - 24, 80);

    /* pixel creeper icon */
    const ix = 28, iy = 20, ic = 8;
    const cpx = [
      [0,0,1,1,1,1,0,0],[0,1,1,1,1,1,1,0],[0,1,0,1,1,0,1,0],[0,1,1,1,1,1,1,0],
      [0,0,1,0,0,1,0,0],[0,0,1,1,1,1,0,0],[0,1,1,0,0,1,1,0],[0,1,0,0,0,0,1,0],
    ];
    cpx.forEach((row, r) => row.forEach((on, c) => {
      if (on) { ctx.fillStyle = '#55aa55'; ctx.fillRect(ix + c * ic, iy + r * ic, ic, ic); }
    }));

    txt(ctx, 'ALL MOBS TRACKER', 108, 47, MC_GOLD, 26);
    txt(ctx, 'Scheda Progresso', 110, 72, MC_GRAY, 14);

    /* big pct */
    const pctStr = Math.round(stats.pct * 100) + '%';
    ctx.font = 'bold 42px "Courier New", monospace';
    ctx.fillStyle = '#000'; ctx.fillText(pctStr, W - 138, 62);
    ctx.fillStyle = stats.pct === 1 ? MC_GOLD : MC_GREEN;
    ctx.fillText(pctStr, W - 140, 60);

    /* XP bar */
    drawXPBar(ctx, 12, 96, W - 24, 12, stats.pct);
    ctx.font = 'bold 11px "Courier New", monospace';
    const countStr = stats.caught + ' / ' + stats.total + ' catturati';
    const cw = ctx.measureText(countStr).width;
    ctx.fillStyle = '#000'; ctx.fillText(countStr, W / 2 - cw / 2 + 1, 111);
    ctx.fillStyle = MC_LIME; ctx.fillText(countStr, W / 2 - cw / 2, 110);

    /* stats panel */
    drawPanel(ctx, 12, 116, 220, 130);
    txt(ctx, '📊 STATISTICHE', 26, 140, MC_GOLD, 13);
    txt(ctx, 'Catturati:  ' + stats.caught, 26, 165, MC_GREEN, 13);
    let row = 185;
    if (captureMode && stats.spotted > 0) { txt(ctx, 'Avvistati:  ' + stats.spotted, 26, row, '#ffff55', 13); row += 20; }
    txt(ctx, 'Mancanti:   ' + (stats.total - stats.caught), 26, row, MC_RED, 13); row += 20;
    txt(ctx, 'Totale:     ' + stats.total, 26, row, MC_GRAY, 13);

    /* category bars */
    const catX = 248, catY = 116, catW = W - catX - 12;
    drawPanel(ctx, catX, catY, catW, 130);
    txt(ctx, '📂 CATEGORIE', catX + 14, catY + 24, MC_GOLD, 13);
    stats.catStats.forEach((cat, i) => {
      const bY   = catY + 40 + i * 26;
      const lbl  = cat.label.length > 16 ? cat.label.slice(0, 15) + '…' : cat.label;
      txt(ctx, lbl, catX + 14, bY + 12, MC_WHITE, 11);
      const bX = catX + 14 + 136, bW = catW - 155;
      const bp = cat.total > 0 ? cat.caught / cat.total : 0;
      ctx.fillStyle = '#0a0a0a'; ctx.fillRect(bX, bY, bW, 14);
      ctx.fillStyle = bp === 1 ? '#ffaa00' : '#55aa00';
      ctx.fillRect(bX + 1, bY + 1, Math.max(0, (bW - 2) * bp), 12);
      const ps = cat.total > 0 ? Math.round(bp * 100) + '%' : '-';
      ctx.font = 'bold 9px "Courier New", monospace';
      ctx.fillStyle = '#000'; ctx.fillText(ps, bX + 5, bY + 11);
      ctx.fillStyle = MC_WHITE; ctx.fillText(ps, bX + 4, bY + 10);
    });

    /* footer */
    drawPanel(ctx, 12, 258, W - 24, 36);
    txt(ctx, '🌐 allmobs.riccardogir07.workers.dev', 26, 283, MC_GRAY, 11, false);
    const dateStr = new Date().toLocaleDateString('it-IT', { day: '2-digit', month: 'long', year: 'numeric' });
    ctx.font = 'bold 11px "Courier New", monospace';
    ctx.fillStyle = MC_GRAY;
    ctx.fillText(dateStr, W - 175, 283);

    /* progress ring */
    const cx = W / 2, cy = H - 80, rr = 52;
    const grd = ctx.createRadialGradient(cx, cy, rr * 0.4, cx, cy, rr + 8);
    grd.addColorStop(0, stats.pct === 1 ? 'rgba(255,170,0,0.25)' : 'rgba(85,255,85,0.15)');
    grd.addColorStop(1, 'rgba(0,0,0,0)');
    ctx.fillStyle = grd; ctx.beginPath(); ctx.arc(cx, cy, rr + 8, 0, Math.PI * 2); ctx.fill();

    ctx.beginPath(); ctx.arc(cx, cy, rr, -Math.PI / 2, Math.PI * 2 - Math.PI / 2);
    ctx.strokeStyle = '#1a1a00'; ctx.lineWidth = 10; ctx.stroke();

    ctx.beginPath(); ctx.arc(cx, cy, rr, -Math.PI / 2, -Math.PI / 2 + Math.PI * 2 * stats.pct);
    ctx.strokeStyle = stats.pct === 1 ? MC_GOLD : MC_GREEN; ctx.lineWidth = 10; ctx.stroke();

    ctx.font = 'bold 22px "Courier New", monospace';
    const tw = ctx.measureText(pctStr).width;
    ctx.fillStyle = '#000'; ctx.fillText(pctStr, cx - tw / 2 + 1, cy + 8);
    ctx.fillStyle = stats.pct === 1 ? MC_GOLD : MC_GREEN;
    ctx.fillText(pctStr, cx - tw / 2, cy + 7);

    txt(ctx, 'COMPLETAMENTO', cx - 65, cy + rr + 22, MC_GRAY, 12, false);

    /* mini badges */
    const badge = (bx, by, label, value, color) => {
      drawPanel(ctx, bx, by, 120, 56);
      txt(ctx, label, bx + 10, by + 20, MC_GRAY, 10, false);
      txt(ctx, value, bx + 10, by + 42, color, 18);
    };
    badge(W / 2 - 200, H - 120, 'CATTURATI', String(stats.caught), MC_GREEN);
    badge(W / 2 + 82,  H - 120, 'TOTALE MOB', String(stats.total), MC_GOLD);

  }, [stats, captureMode]);

  const getBlob = () => new Promise(resolve => canvasRef.current.toBlob(resolve, 'image/png'));

  const download = async () => {
    const blob = await getBlob();
    const url  = URL.createObjectURL(blob);
    const a    = Object.assign(document.createElement('a'), { href: url, download: 'all-mobs-tracker-' + Date.now() + '.png' });
    a.click(); URL.revokeObjectURL(url);
    setStatus('PNG scaricato!');
    setTimeout(() => setStatus(''), 2500);
  };

  const copyImage = async () => {
    try {
      const blob = await getBlob();
      await navigator.clipboard.write([new ClipboardItem({ 'image/png': blob })]);
      setCopied(true); setStatus('Immagine copiata!');
      setTimeout(() => { setCopied(false); setStatus(''); }, 2500);
    } catch {
      setStatus('Copia non supportata — usa Scarica PNG');
      setTimeout(() => setStatus(''), 3000);
    }
  };

  return (
    <div
      className="fixed inset-0 z-[9999] flex items-center justify-center bg-black/85 backdrop-blur-sm p-4"
      onClick={onClose}
    >
      <div
        className="bg-[#1a1007] border-4 border-[#7a5230] shadow-2xl flex flex-col max-w-3xl w-full"
        onClick={e => e.stopPropagation()}
        style={{ boxShadow: '0 0 60px rgba(255,170,0,0.15)' }}
      >
        {/* header */}
        <div className="flex items-center justify-between px-6 py-4 border-b-4 border-[#7a5230] bg-[#2b1c0a]">
          <div className="flex items-center gap-3">
            <span className="text-2xl">🏆</span>
            <span className="text-xl uppercase text-[#ffaa00] tracking-widest" style={{ fontFamily: '"Courier New", monospace' }}>
              Condividi Progresso
            </span>
          </div>
          <button
            onClick={onClose}
            className="bg-stone-800 hover:bg-stone-700 text-stone-300 px-4 py-1.5 text-xs border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0"
          >
            ✕ Chiudi
          </button>
        </div>

        {/* canvas preview */}
        <div className="p-6 flex flex-col items-center gap-5">
          <div style={{ filter: 'drop-shadow(0 8px 32px rgba(0,0,0,0.9))', maxWidth: '100%', overflowX: 'auto' }}>
            <canvas ref={canvasRef} style={{ imageRendering: 'pixelated', display: 'block', maxWidth: '100%' }} />
          </div>

          {/* actions */}
          <div className="flex flex-wrap gap-3 justify-center">
            <button
              onClick={download}
              className="flex items-center gap-2 px-6 py-3 bg-emerald-800 hover:bg-emerald-700 border-b-4 border-black uppercase text-emerald-200 transition-transform active:translate-y-1 active:border-b-0 text-sm"
              style={{ fontFamily: '"Courier New", monospace' }}
            >
              ⬇ Scarica PNG
            </button>
            <button
              onClick={copyImage}
              className={`flex items-center gap-2 px-6 py-3 border-b-4 border-black uppercase transition-transform active:translate-y-1 active:border-b-0 text-sm ${
                copied ? 'bg-green-700 text-green-200' : 'bg-stone-700 hover:bg-stone-600 text-stone-200'
              }`}
              style={{ fontFamily: '"Courier New", monospace' }}
            >
              {copied ? '✔ Copiato!' : '📋 Copia Immagine'}
            </button>
          </div>

          {status && (
            <p className="text-sm uppercase animate-pulse" style={{ color: '#55ff55', fontFamily: '"Courier New", monospace' }}>
              {status}
            </p>
          )}

          {/* live stat row */}
          <div className="flex flex-wrap gap-6 justify-center border-t-2 border-[#3b2510] pt-4 w-full">
            {[
              { label: 'Catturati',     value: stats.caught,  color: '#55ff55' },
              ...(captureMode && stats.spotted > 0 ? [{ label: 'Avvistati', value: stats.spotted, color: '#ffff55' }] : []),
              { label: 'Totale',        value: stats.total,   color: '#ffaa00' },
              { label: 'Completamento', value: Math.round(stats.pct * 100) + '%', color: stats.pct === 1 ? '#ffaa00' : '#aaff00' },
            ].map(s => (
              <div key={s.label} className="text-center">
                <p className="text-xs uppercase text-stone-500" style={{ fontFamily: '"Courier New", monospace' }}>{s.label}</p>
                <p className="text-xl" style={{ color: s.color, fontFamily: '"Courier New", monospace' }}>{s.value}</p>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

export default ShareProgressModal;
