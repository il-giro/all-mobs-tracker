/**
 * mobDescriptions.js
 *
 * Descrizioni e link wiki per ogni mob, mostrate nella pagina /mobs/:slug.
 *
 * Struttura:
 * {
 *   '<slug>': {
 *     general:  string,            // descrizione generale (opzionale)
 *     link:     string,            // URL wiki (opzionale)
 *     variants: {
 *       '<fileName>': string,      // descrizione per variante specifica (opzionale)
 *     }
 *   }
 * }
 */

export const MobDescriptions = {

  'allay': {
    general: [
      '• The Allay can easily be trapped with a leash or by boxing it up.',
      '• An easy way to trap it is to place a note block and lure it in with a music disc.',
      '• You can also use an Elytra and it will keep up with you.',
      '\n',
      '## Useful Links',
      { text: 'How to move Allay a long way.', href: 'https://www.youtube.com/watch?v=7LJ4adEXPWo', icon: 'youtube' },
      '---',
      { text: 'Using allays to transport other mobs.', href: 'https://www.reddit.com/r/Minecraft/comments/1k0v9b1/official_best_way_to_move_mobs_the_allay/' , icon: 'reddit'  },
    ],
    link: 'https://minecraft.wiki/w/Allay',
  },

  'wolf': {
    general: 'Wolves can be tamed with bones.',
    link: 'https://minecraft.wiki/w/Wolf',
    variants: {
      'data/wolf/1.2.14.png': 'Pale wolf with a red collar.',
    }
  },

};

export function getMobDescription(slug) {
  return MobDescriptions[slug]?.general ?? null;
}

export function getMobLink(slug) {
  return MobDescriptions[slug]?.link ?? null;
}

export function getVariantDescription(slug, fileName) {
  return MobDescriptions[slug]?.variants?.[fileName] ?? null;
}

export function mobNameToSlug(name) {
  return name.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');
}