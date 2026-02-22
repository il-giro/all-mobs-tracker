# 🐾 All Mobs Tracker

**Track every Minecraft mob variant — because the completionist in you demands it.**

🔗 **[all-mobs-tracker.vercel.app](https://all-mobs-tracker.vercel.app/)**

---

## About

A personal tracker to keep track of every mob (and mob variant) in Minecraft. Click a card to mark it as found, filter by category, search by name, and track your overall completion progress.

**A few things to know:**
- The code was written with the help of various AI tools
- Images are taken from the [Minecraft Wiki](https://minecraft.wiki/) or made by me
- Some information (names, variant counts, categories) might not be 100% accurate
- This is a personal project — no guarantees of completeness or correctness

---

## Features

- ✅ Click to track/untrack mobs
- 🔍 Search by name or suffix (e.g. "baby turtle" finds "Turtle (baby)")
- 📁 Filter by mob group (folder) or special category
- ⚙️ Settings to toggle complex variant groups and special suffixes
- 📊 Stats panel with per-category and per-suffix completion
- 🖱️ Right-click any card to see all its badges
- ⌨️ Keyboard shortcuts: `Space` to focus search, `Esc` to close/clear

---

## Future Ideas

A list of things that could be added or improved:

- [ ] Export/import progress (JSON backup)
- [ ] Multiple save slots / profiles
- [ ] Mob detail page with description and spawn info
- [ ] Mark mobs as "seen but not tracked" (partial state)
- [ ] Sort options (alphabetical, by completion, by category)
- [ ] Mobile swipe to mark as tracked
- [ ] Dark/light theme toggle
- [ ] Confetti or animation on 100% completion
- [ ] Filter to show only untracked mobs
- [ ] Filter to show only tracked mobs
- [ ] Show total count per folder/category in filter buttons
- [ ] Multiplayer / shared tracking (Supabase or similar)
- [ ] Changelog or "recently added" section
- [ ] Better handling of unobtainable mobs (greyed out style)

---

## Mob Checklist

Use this to track which mobs have all their variants properly added to the tracker.

### Passive

- [x] Allay
- [x] Armadillo
- [ ] Axolotl (missing green)
- [x] Bat
- [x] Bat
- [ ] Cat (baby)
- [x] Camel
- [ ] Camel husk
- [x] Chicken
- [x] Cod
- [x] Copper Golem
- [x] Cow
- [x] Donkey
- [x] Frog
- [x] Glow Squid
- [ ] Happy Ghast (colors)
- [ ] Horse (baby) - saddle - armor
- [x] Mooshroom
- [x] Mule
- [x] Ocelot
- [x] Parrot
- [x] Pig
- [ ] Rabbit (killer)
- [x] Salmon
- [x] Sheep
- [ ] Skeleton Horse (varaints)
- [x] Sniffer
- [x] Snow Golem
- [x] Squid
- [ ] Strider
- [x] Tadpole
- [ ] Tropical Fish
- [x] Turtle
- [ ] Villager (baby)
- [ ] Wandering Trader
- [ ] Zombie Horse

### Neutral

- [x] Bee
- [x] Cave Spider
- [x] Dolphin
- [x] Drowned
- [ ] Enderman
- [x] Fox
- [x] Goat
- [x] Iron Golem
- [x] Llama
- [x] Panda
- [x] Nautilus
- [x] Piglin
- [x] Pufferfish
- [x] Polar Bear
- [ ] Spider (varaints)
- [ ] Wolf
- [x] Zombified Piglin
- [x] Zombie Nautilus

### Hostile

- [x] Blaze
- [x] Bogged
- [x] Breeze
- [x] Creeper
- [x] Elder Guardian
- [x] Endermite
- [ ] Evoker
- [x] Ghast
- [x] Guardian
- [ ] Hoglin ?
- [ ] Husk ?
- [x] Magma Cube
- [x] Phantom
- [ ] Pillager
- [x] Ravager
- [x] Shulker
- [x] Silverfish
- [ ] Skeleton
- [x] Slime
- [ ] Stray
- [x] Vex
- [ ] Vindicator
- [x] Warden
- [ ] Witch
- [x] Wither Skeleton
- [x] Zoglin
- [x] Zombie
- [ ] Zombie Villager

### Bosses

- [x] Ender Dragon
- [x] Wither

### Special / Variants

- [ ] All Baby variants (all breedable mobs)
- [ ] All Baby monster variants
- [ ] All Pumpkin variants (all mobs that can spawn with pumpkin)
- [ ] All Jockey variants
- [ ] Unobtainable variants

---

## Tech Stack

- React + Vite
- Tailwind CSS
- Deployed on Vercel