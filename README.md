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

- [x] Export/import progress (JSON backup)
- [x] Mob detail page with description and spawn info
- [x] Mark mobs as "seen but not tracked" (partial state)
- [x] Sort options (alphabetical, by completion, by category)
- [ ] Mobile compatibility
- [x] Filter to show only untracked mobs
- [x] Filter to show only tracked mobs
- [ ] Show total count per folder/category in filter buttons

---

Further future improvements:
- [ ] Multiple save slots / profiles
- [ ] Dark/light theme toggle
- [ ] Confetti or animation on 100% completion
- [ ] Multiplayer / shared tracking (Supabase or similar)
---

## Mob Checklist

Use this to track which mobs have all their variants properly added to the tracker.

### Passive [ ]

- [x] Allay
- [x] Armadillo
- [x] Axolotl
- [x] Bat
- [x] Bat
- [ ] Cat (baby)
- [x] Camel
- [x] Camel husk
- [ ] Chicken (jockey)
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
- [x] Rabbit
- [x] Salmon
- [x] Sheep
- [x] Skeleton Horse
- [x] Sniffer
- [x] Snow Golem
- [x] Squid
- [x] Strider
- [x] Tadpole
- [x] Tropical Fish
- [x] Turtle
- [ ] Villager (baby)
- [ ] Wandering Trader
- [ ] Zombie Horse

### Neutral [x]

- [x] Bee
- [x] Cave Spider
- [x] Dolphin
- [x] Drowned
- [x] Enderman
- [x] Fox
- [x] Goat
- [x] Iron Golem
- [x] Llama
- [x] Panda
- [x] Nautilus
- [x] Piglin
- [x] Pufferfish
- [x] Polar Bear
- [x] Spider + Jockeys
- [x] Trader Llama
- [x] Wolf
- [x] Zombified Piglin
- [x] Zombie Nautilus

### Hostile [x]

- [x] Blaze
- [x] Bogged
- [x] Breeze
- [x] Creeper
- [x] Elder Guardian
- [x] Endermite
- [x] Evoker
- [x] Ghast
- [x] Guardian
- [x] Hoglin
- [x] Husk
- [x] Magma Cube
- [x] Phantom
- [x] Pillager
- [x] Ravager
- [x] Shulker
- [x] Silverfish
- [x] Skeleton
- [x] Slime
- [x] Stray
- [x] Vex
- [x] Vindicator
- [x] Warden
- [x] Witch
- [x] Wither Skeleton
- [x] Zoglin
- [x] Zombie
- [x] Zombie Villager

### Bosses [x]

- [x] Ender Dragon
- [x] Wither

### Special / Variants [ ]

- [ ] All Baby variants (all breedable mobs)
- [x] All Baby monster variants
- [X] All Pumpkin variants (all mobs that can spawn with pumpkin)
- [ ] All Jockey variants
- [ ] Unobtainable variants
- [ ] All color variants (wolf collars, happy ghasts...)

---

## Tech Stack

- React + Vite
- Tailwind CSS
- Deployed on Vercel