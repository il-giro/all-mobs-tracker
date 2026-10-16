import React from 'react';

const ICON_MAP = {
  youtube:    { src: 'https://www.youtube.com/favicon.ico',                  alt: 'YouTube' },
  reddit:     { src: 'https://www.reddit.com/favicon.ico',                   alt: 'Reddit' },
  wiki:       { src: '/icons/wiki.ico',                                      alt: 'Wiki' },
  modrinth:   { src: 'https://modrinth.com/favicon-light.ico',              alt: 'Modrinth' },
  twitch:     { src: 'https://static.twitchsvc.net/assets/uploads/favicon.ico', alt: 'Twitch' },
  github:     { src: 'https://github.githubassets.com/favicons/favicon.png', alt: 'GitHub' },
  curseforge: { src: 'https://curseforge.com/favicon.ico',                   alt: 'CurseForge' },
};

export function getIconForUrl(url, explicitIcon) {
  if (explicitIcon && ICON_MAP[explicitIcon.toLowerCase()]) {
    return ICON_MAP[explicitIcon.toLowerCase()];
  }
  if (!url) return null;
  const lower = url.toLowerCase();
  if (lower.includes('youtube.com') || lower.includes('youtu.be')) return ICON_MAP.youtube;
  if (lower.includes('reddit.com')) return ICON_MAP.reddit;
  if (lower.includes('minecraft.wiki') || lower.includes('fandom.com')) return ICON_MAP.wiki;
  if (lower.includes('modrinth.com')) return ICON_MAP.modrinth;
  if (lower.includes('twitch.tv')) return ICON_MAP.twitch;
  if (lower.includes('github.com')) return ICON_MAP.github;
  if (lower.includes('curseforge.com')) return ICON_MAP.curseforge;
  return null;
}

/**
 * Converte testo, JSON string, o array JS in una lista strutturata di blocchi.
 */
export function parseDescription(raw) {
  if (!raw) return [];
  if (Array.isArray(raw)) return raw;
  if (typeof raw !== 'string') return [String(raw)];

  const trimmed = raw.trim();
  if (!trimmed) return [];

  // 1. Prova JSON.parse diretto
  try {
    const parsed = JSON.parse(trimmed);
    if (Array.isArray(parsed)) return parsed;
    if (typeof parsed === 'object' && parsed !== null) return [parsed];
  } catch (_) {}

  // 2. Prova array letterale JS (es. ['• item 1', { text: '...', href: '...' }])
  let candidate = trimmed;
  if (!candidate.startsWith('[') && (
    candidate.includes("', '") ||
    candidate.includes('", "') ||
    candidate.includes('{ text:') ||
    candidate.includes('{"text":') ||
    candidate.startsWith("'") ||
    candidate.startsWith('"')
  )) {
    candidate = `[${candidate}]`;
  }

  if (candidate.startsWith('[') && candidate.endsWith(']')) {
    try {
      const parsed = new Function(`"use strict"; return (${candidate});`)();
      if (Array.isArray(parsed)) return parsed;
    } catch (_) {}
  }

  // 3. Fallback: parse riga per riga (Markdown / testo libero)
  const lines = trimmed.split(/\r?\n/);
  const blocks = [];
  for (const line of lines) {
    const l = line.trim();
    if (!l) {
      blocks.push('\n');
      continue;
    }
    if (l === '---' || l === '***') {
      blocks.push('---');
      continue;
    }
    // Markdown standalone link: [Text](https://...) o [youtube:Text](https://...)
    const linkMatch = l.match(/^\[(?:([a-z0-9_-]+):)?([^\]]+)\]\((https?:\/\/[^\s)]+)\)$/i);
    if (linkMatch) {
      blocks.push({
        icon: linkMatch[1] || null,
        text: linkMatch[2],
        href: linkMatch[3]
      });
      continue;
    }
    blocks.push(line);
  }
  return blocks;
}

/**
 * Renderizza testo inline con supporto per **bold**, *italic*, `code`, e [link](url).
 */
function renderInlineText(text) {
  if (typeof text !== 'string') return text;

  // Regex per token inline: markdown link [title](url) | **bold** | *italic* | `code`
  const regex = /(\[(?:([a-z0-9_-]+):)?([^\]]+)\]\((https?:\/\/[^\s)]+)\)|\*\*(.+?)\*\*|\*(.+?)\*|`(.+?)`)/g;
  const parts = [];
  let lastIndex = 0;
  let match;

  while ((match = regex.exec(text)) !== null) {
    if (match.index > lastIndex) {
      parts.push(text.slice(lastIndex, match.index));
    }
    const [full, , tagIcon, linkTitle, linkUrl, bold, italic, code] = match;

    if (linkUrl) {
      const ico = getIconForUrl(linkUrl, tagIcon);
      parts.push(
        <a
          key={match.index}
          href={linkUrl}
          target="_blank"
          rel="noopener noreferrer"
          className="inline-flex items-center gap-1 text-emerald-400 hover:text-emerald-300 underline underline-offset-2 transition-colors mx-0.5"
        >
          {ico && <img src={ico.src} alt={ico.alt} className="w-3.5 h-3.5 object-contain inline-block shrink-0 pixelated" />}
          <span>{linkTitle}</span>
          <span className="text-[9px] no-underline">↗</span>
        </a>
      );
    } else if (bold) {
      parts.push(<strong key={match.index} className="text-stone-100 font-semibold">{bold}</strong>);
    } else if (italic) {
      parts.push(<em key={match.index} className="text-stone-200 italic">{italic}</em>);
    } else if (code) {
      parts.push(<code key={match.index} className="bg-stone-800 text-amber-300 px-1 py-0.5 text-xs border border-stone-700 mx-0.5">{code}</code>);
    }

    lastIndex = regex.lastIndex;
  }

  if (lastIndex < text.length) {
    parts.push(text.slice(lastIndex));
  }

  return parts.length > 0 ? parts : text;
}

/**
 * Componente principale per renderizzare una descrizione formattata.
 */
export default function FormattedDescription({ content, className = '' }) {
  const blocks = parseDescription(content);

  if (!blocks || blocks.length === 0) return null;

  return (
    <div className={`space-y-2.5 ${className}`}>
      {blocks.map((block, i) => {
        // Line break
        if (block === '\n' || block === '') {
          return <div key={i} className="h-1.5" />;
        }

        // Divider
        if (block === '---' || block === '***') {
          return <hr key={i} className="border-stone-700/80 my-2" />;
        }

        // String blocks
        if (typeof block === 'string') {
          // Heading ## o ###
          if (block.startsWith('## ') || block.startsWith('### ') || block.startsWith('# ')) {
            const level = block.startsWith('### ') ? 3 : block.startsWith('## ') ? 2 : 1;
            const title = block.replace(/^#{1,3}\s+/, '');
            return (
              <div key={i} className="pt-2 pb-0.5 border-b border-stone-800 flex items-center gap-2">
                <span className="text-amber-400 text-xs select-none">◆</span>
                <span className={`text-stone-200 uppercase tracking-widest font-bold ${level === 1 ? 'text-sm' : 'text-xs'}`}>
                  {title}
                </span>
              </div>
            );
          }

          // Bullet point (•, -, *)
          const bulletMatch = block.match(/^([•\-\*])\s+(.+)$/s);
          if (bulletMatch) {
            return (
              <div key={i} className="flex items-start gap-2.5 text-stone-300 text-xs sm:text-sm leading-relaxed">
                <span className="text-emerald-400 mt-1 select-none text-[9px] shrink-0">■</span>
                <div className="flex-1">
                  {renderInlineText(bulletMatch[2])}
                </div>
              </div>
            );
          }

          // Plain paragraph
          return (
            <p key={i} className="text-stone-300 text-xs sm:text-sm leading-relaxed">
              {renderInlineText(block)}
            </p>
          );
        }

        // Link Object: { text, href, icon }
        if (typeof block === 'object' && block !== null && block.href) {
          const ico = getIconForUrl(block.href, block.icon);
          return (
            <div key={i} className="pt-0.5">
              <a
                href={block.href}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center gap-2 px-3 py-1.5 bg-stone-800/90 hover:bg-stone-700/90 border border-stone-700 hover:border-emerald-500/80 text-emerald-400 hover:text-emerald-300 text-xs sm:text-sm transition-all shadow-sm group"
              >
                {ico && (
                  <img
                    src={ico.src}
                    alt={ico.alt}
                    className="w-4 h-4 object-contain shrink-0 pixelated"
                    onError={(e) => { e.currentTarget.style.display = 'none'; }}
                  />
                )}
                <span className="underline underline-offset-2 font-medium">{block.text || block.href}</span>
                <span className="text-stone-500 group-hover:text-emerald-400 text-[10px] no-underline transition-colors">↗</span>
              </a>
            </div>
          );
        }

        return null;
      })}
    </div>
  );
}
