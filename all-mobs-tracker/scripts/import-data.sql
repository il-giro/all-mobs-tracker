-- ============================================================
-- AllMobs Database Import Script
-- Generato: 2026-10-14T16:35:21.155Z
-- Origine: public/data + configurazioni reali in src/config
-- Idempotenza: WHERE NOT EXISTS su chiavi logiche, senza richiedere UNIQUE remoti
-- Mob pianificati: 89
-- Varianti pianificate: 980
-- Categorie pianificate: 53
-- Relazioni MOB_CATEGORIES pianificate: 222
-- Relazioni VARIANT_CATEGORIES pianificate: 1464
-- ============================================================

-- ============================================================
-- CATEGORIE (Statiche, Dinamiche e Suffissi Speciali)
-- ============================================================

INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Saddled', '/icons/items/saddle.png', '#ef4444', 'https://minecraft.wiki/w/Saddle', ' These mobs can be saddled using a Saddle. Saddling them allows the player to ride the mob. ', 1, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Saddled'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Shearable', '/icons/items/shears.png', '#f59e0b', 'https://minecraft.wiki/w/Shearing', 'permanently changes their appearance until they respawn or regrow.', 2, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Shearable'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Chested', '/icons/items/chest.png', '#3b82f6', 'https://minecraft.wiki/w/Chest#Donkey,_mule,_or_llama_pack', 'These mobs can have a chest placed on them. A chest can be added to a donkey, a mule, or a llama by pressing use on the animal.', 3, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Chested'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Name Tag', '/icons/items/name-tag.png', '#10b981', 'https://minecraft.wiki/w/Name_Tag#Easter_eggs', 'These mobs obtain a special variant when given a specific name.', 4, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Name Tag'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Banner', '/icons/items/ominous-banner.png', '#a855f7', 'https://minecraft.wiki/w/Raid_captain', 'These mobs can have banners placed on them. You cannot give a banner to a mob.', 5, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Banner'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Lightning', '/icons/items/lightning.png', '#06b6d4', 'https://minecraft.wiki/w/Thunderstorm#Effects_on_mobs', 'These mobs can be struck by lightning, which may cause them to transform into a different mob or gain special properties. I did not include all the mobs that can be struck by lightning, but only those that have a unique transformation or effect when struck. (For example, Pigs become zombified piglins, but they don''t have a unique icon for that, so I didn''t include them in this category.)', 6, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Lightning'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Screaming', '/icons/items/screaming.png', '#ffffff', 'https://minecraft.wiki/w/Goat#Spawning', 'When a goat is spawned naturally, and also through breeding normal goats, it has a 2% chance of being a screaming goat. They look identical to all other goats, but they make screaming sounds and ram more often.', 7, NULL
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Screaming'
    AND variant IS NULL
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - White', '/icons/items/white-wool.png', '#ffffff', '.', 'Mob with White color variant.', 100, 'White'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - White'
    AND variant = 'White'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - LightGray', '/icons/items/light-gray-wool.png', '#9ca3af', '.', 'Mob with LightGray color variant.', 101, 'LightGray'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - LightGray'
    AND variant = 'LightGray'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Gray', '/icons/items/gray-wool.png', '#6b7280', '.', 'Mob with Gray color variant.', 102, 'Gray'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Gray'
    AND variant = 'Gray'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Black', '/icons/items/black-wool.png', '#111827', '.', 'Mob with Black color variant.', 103, 'Black'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Black'
    AND variant = 'Black'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Brown', '/icons/items/brown-wool.png', '#92400e', '.', 'Mob with Brown color variant.', 104, 'Brown'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Brown'
    AND variant = 'Brown'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Red', '/icons/items/red-wool.png', '#dc2626', '.', 'Mob with Red color variant.', 105, 'Red'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Red'
    AND variant = 'Red'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Orange', '/icons/items/orange-wool.png', '#ea580c', '.', 'Mob with Orange color variant.', 106, 'Orange'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Orange'
    AND variant = 'Orange'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Yellow', '/icons/items/yellow-wool.png', '#fbbf24', '.', 'Mob with Yellow color variant.', 107, 'Yellow'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Yellow'
    AND variant = 'Yellow'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Lime', '/icons/items/lime-wool.png', '#84cc16', '.', 'Mob with Lime color variant.', 108, 'Lime'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Lime'
    AND variant = 'Lime'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Green', '/icons/items/green-wool.png', '#16a34a', '.', 'Mob with Green color variant.', 109, 'Green'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Green'
    AND variant = 'Green'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Cyan', '/icons/items/cyan-wool.png', '#06b6d4', '.', 'Mob with Cyan color variant.', 110, 'Cyan'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Cyan'
    AND variant = 'Cyan'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - LightBlue', '/icons/items/light-blue-wool.png', '#38bdf8', '.', 'Mob with LightBlue color variant.', 111, 'LightBlue'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - LightBlue'
    AND variant = 'LightBlue'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Blue', '/icons/items/blue-wool.png', '#3b82f6', '.', 'Mob with Blue color variant.', 112, 'Blue'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Blue'
    AND variant = 'Blue'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Purple', '/icons/items/purple-wool.png', '#a855f7', '.', 'Mob with Purple color variant.', 113, 'Purple'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Purple'
    AND variant = 'Purple'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Magenta', '/icons/items/magenta-wool.png', '#d946ef', '.', 'Mob with Magenta color variant.', 114, 'Magenta'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Magenta'
    AND variant = 'Magenta'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Color - Pink', '/icons/items/pink-wool.png', '#ec4899', '.', 'Mob with Pink color variant.', 115, 'Pink'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Color - Pink'
    AND variant = 'Pink'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Plains', '/icons/biomes/Plains.png', '#10b981', '.', 'Mob from Plains biome.', 116, 'Plains'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Plains'
    AND variant = 'Plains'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Desert', '/icons/biomes/Desert.png', '#10b981', '.', 'Mob from Desert biome.', 117, 'Desert'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Desert'
    AND variant = 'Desert'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Jungle', '/icons/biomes/Jungle.png', '#10b981', '.', 'Mob from Jungle biome.', 118, 'Jungle'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Jungle'
    AND variant = 'Jungle'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Savanna', '/icons/biomes/Savanna.png', '#10b981', '.', 'Mob from Savanna biome.', 119, 'Savanna'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Savanna'
    AND variant = 'Savanna'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Snow', '/icons/biomes/SnowyPlains.png', '#10b981', '.', 'Mob from Snow biome.', 120, 'Snow'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Snow'
    AND variant = 'Snow'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Swamp', '/icons/biomes/Swamp.png', '#10b981', '.', 'Mob from Swamp biome.', 121, 'Swamp'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Swamp'
    AND variant = 'Swamp'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Biome - Taiga', '/icons/biomes/Taiga.png', '#10b981', '.', 'Mob from Taiga biome.', 122, 'Taiga'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Biome - Taiga'
    AND variant = 'Taiga'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Unemployed', '/icons/mobs/VillagerFace.png', '#f59e0b', '.', 'Villager with Unemployed profession.', 123, 'Unemployed'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Unemployed'
    AND variant = 'Unemployed'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Nitwit', '/icons/mobs/VillagerFace.png', '#f59e0b', '.', 'Villager with Nitwit profession.', 124, 'Nitwit'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Nitwit'
    AND variant = 'Nitwit'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Armorer', '/icons/job site/blast-furnace.png', '#f59e0b', '.', 'Villager with Armorer profession.', 125, 'Armorer'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Armorer'
    AND variant = 'Armorer'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Butcher', '/icons/job site/smoker.png', '#f59e0b', '.', 'Villager with Butcher profession.', 126, 'Butcher'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Butcher'
    AND variant = 'Butcher'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Cartographer', '/icons/job site/cartography-table.png', '#f59e0b', '.', 'Villager with Cartographer profession.', 127, 'Cartographer'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Cartographer'
    AND variant = 'Cartographer'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Cleric', '/icons/job site/brewing-stand.png', '#f59e0b', '.', 'Villager with Cleric profession.', 128, 'Cleric'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Cleric'
    AND variant = 'Cleric'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Farmer', '/icons/job site/composter.png', '#f59e0b', '.', 'Villager with Farmer profession.', 129, 'Farmer'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Farmer'
    AND variant = 'Farmer'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Fisherman', '/icons/job site/barrel.png', '#f59e0b', '.', 'Villager with Fisherman profession.', 130, 'Fisherman'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Fisherman'
    AND variant = 'Fisherman'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Fletcher', '/icons/job site/fletching-table.png', '#f59e0b', '.', 'Villager with Fletcher profession.', 131, 'Fletcher'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Fletcher'
    AND variant = 'Fletcher'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Leatherworker', '/icons/job site/cauldron.png', '#f59e0b', '.', 'Villager with Leatherworker profession.', 132, 'Leatherworker'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Leatherworker'
    AND variant = 'Leatherworker'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Librarian', '/icons/job site/lectern.png', '#f59e0b', '.', 'Villager with Librarian profession.', 133, 'Librarian'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Librarian'
    AND variant = 'Librarian'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Mason', '/icons/job site/stonecutter.png', '#f59e0b', '.', 'Villager with Mason profession.', 134, 'Mason'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Mason'
    AND variant = 'Mason'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Shepherd', '/icons/job site/loom.png', '#f59e0b', '.', 'Villager with Shepherd profession.', 135, 'Shepherd'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Shepherd'
    AND variant = 'Shepherd'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Toolsmith', '/icons/job site/smithing-table.png', '#f59e0b', '.', 'Villager with Toolsmith profession.', 136, 'Toolsmith'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Toolsmith'
    AND variant = 'Toolsmith'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Profession - Weaponsmith', '/icons/job site/grindstone.png', '#f59e0b', '.', 'Villager with Weaponsmith profession.', 137, 'Weaponsmith'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Profession - Weaponsmith'
    AND variant = 'Weaponsmith'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Baby Breed', '/icons/items/name-tag.png', '#9333ea', '.', 'Baby variant obtained through breeding.', 138, 'A'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Baby Breed'
    AND variant = 'A'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Baby Monster', '/icons/items/name-tag.png', '#db2777', '.', 'Baby variant of monster mobs.', 139, 'B'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Baby Monster'
    AND variant = 'B'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Baby Animal', '/icons/items/name-tag.png', '#16a34a', '.', 'Baby variant of animal mobs.', 140, 'C'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Baby Animal'
    AND variant = 'C'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Pumpkin', '/icons/items/carved-pumpkin.png', '#ea580c', '.', 'Mob wearing a pumpkin or jack o lantern.', 141, 'P'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Pumpkin'
    AND variant = 'P'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Jockey', '/icons/items/saddle.png', '#ca8a04', '.', 'Jockey mob combination.', 142, 'J'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Jockey'
    AND variant = 'J'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Unobtainable', '/icons/items/name-tag.png', '#dc2626', '.', 'Unobtainable mob variant in normal survival.', 143, 'U'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Unobtainable'
    AND variant = 'U'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Untrapable', '/icons/items/chest.png', '#4b5563', '.', 'Mob that cannot be trapped in typical mob traps.', 144, 'F'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Untrapable'
    AND variant = 'F'
);
INSERT INTO CATEGORIES (name, icon, color, link, description, priority, variant)
SELECT 'Special - Texture Error', '/icons/items/shears.png', '#2563eb', '.', 'Mob variant with texture discrepancies.', 145, 'T'
WHERE NOT EXISTS (
  SELECT 1 FROM CATEGORIES
  WHERE name = 'Special - Texture Error'
    AND variant = 'T'
);

-- ============================================================
-- MOB BASE
-- ============================================================

INSERT INTO MOBS (name, img, link, description)
SELECT 'Allay', '/data/Allay.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Allay'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Armadillo', '/data/armadillo/1.1Armadillo.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Armadillo'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Axolotl', '/data/axolotl/1Axolotl-Lucy.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Axolotl'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Bat', '/data/bat/1.1Bat.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Bat'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Bee', '/data/bee/1.1Bee.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Bee'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Blaze', '/data/Blaze.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Blaze'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Bogged', '/data/bogged/1Bogged.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Bogged'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Breeze', '/data/Breeze.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Breeze'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Camel', '/data/camel/1.1Camel.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Camel'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'CamelHusk', '/data/camel husk/1.1CamelHusk.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'CamelHusk'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Cat', '/data/cat/1.1CatTabby-Tamed.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Cat'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'CaveSpider', '/data/CaveSpider.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'CaveSpider'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Chicken', '/data/chicken/1Chicken-Temperate.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Chicken'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ChickenJockey', '/data/chicken jockey/1.2ChickenJockey-Temperate-Zombie_B.webp', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ChickenJockey'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Cod', '/data/Cod.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Cod'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'CopperGolem', '/data/copper golem/1.1CopperGolem-Unoxidized.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'CopperGolem'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Cow', '/data/cow/1Cow-Temperate.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Cow'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Creaking', '/data/Creaking.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Creaking'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Creeper', '/data/creeper/1Creeper.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Creeper'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Dolphin', '/data/dolphin/Dolphin.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Dolphin'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Donkey', '/data/donkey/1Donkey.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Donkey'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Drowned', '/data/drowned/1.1Drowned.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Drowned'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ElderGuardian', '/data/ElderGuardian.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ElderGuardian'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'EnderDragon', '/data/EnderDragon.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'EnderDragon'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Enderman', '/data/enderman/1Enderman.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Enderman'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Endermite', '/data/Endermite.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Endermite'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Evoker', '/data/evoker/1.1Evoker.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Evoker'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Fox', '/data/fox/1Fox.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Fox'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Frog', '/data/frog/1Frog-Temperate.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Frog'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Frostbite', '/data/frostbite/Frostbite.webp', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Frostbite'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Ghast', '/data/Ghast.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Ghast'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'GlowSquid', '/data/glow squid/GlowSquid.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'GlowSquid'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Goat', '/data/goat/1.1Goat.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Goat'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Guardian', '/data/Guardian.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Guardian'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'HappyGhast', '/data/happy ghast/1.1.1HappyGhast.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'HappyGhast'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Hoglin', '/data/hoglin/1.1Hoglin.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Hoglin'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Horse', '/data/horse/1.1.1.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Horse'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Husk', '/data/husk/Husk.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Husk'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'IronGolem', '/data/iron golem/1IronGolem.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'IronGolem'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Llama', '/data/llama/1.1.1Llama-Brown.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Llama'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'MagmaCube', '/data/magma cube/1MagmaCube-Medium.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'MagmaCube'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Mooshroom', '/data/mooshroom/1Mooshroom-Red.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Mooshroom'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Mule', '/data/mule/1Mule.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Mule'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Nautilus', '/data/nautilus/1.1Nautilus.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Nautilus'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Ocelot', '/data/ocelot/Ocelot.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Ocelot'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Panda', '/data/panda/1Panda.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Panda'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Parched', '/data/Parched.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Parched'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Parrot', '/data/parrot/1Parrot-Red.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Parrot'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Phantom', '/data/Phantom.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Phantom'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Pig', '/data/pig/1.1Pig-Temperate.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Pig'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Piglin', '/data/piglin/1.1Piglin_B.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Piglin'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'PiglinBrute', '/data/PiglinBrute.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'PiglinBrute'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Pillager', '/data/pillager/1.1Pillager.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Pillager'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'PolarBear', '/data/polar bear/PolarBear.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'PolarBear'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Pufferfish', '/data/Pufferfish.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Pufferfish'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Rabbit', '/data/rabbit/1Rabbit-Brown.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Rabbit'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Ravager', '/data/ravager/1.1Ravager.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Ravager'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Salmon', '/data/salmon/1.1Salmon-Normal.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Salmon'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Sheep', '/data/sheep/1.1.1Sheep-White.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Sheep'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Shulker', '/data/Shulker.webp', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Shulker'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Silverfish', '/data/Silverfish.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Silverfish'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Skeleton', '/data/Skeleton.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Skeleton'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'SkeletonHorse', '/data/skeleton horse/1.1SkeletonHorse.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'SkeletonHorse'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Slime', '/data/slime/1Slime-Semi-large.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Slime'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Sniffer', '/data/sniffer/Sniffer.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Sniffer'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'SnowGolem', '/data/snow golem/1SnowGolem.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'SnowGolem'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Spider', '/data/spider/1.1Spider.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Spider'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Squid', '/data/squid/Squid.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Squid'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Stray', '/data/Stray.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Stray'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Strider', '/data/strider/1.1Strider.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Strider'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'SulfurCube', '/data/SulfurCube.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'SulfurCube'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Tadpole', '/data/Tadpole.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Tadpole'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'TraderLlama', '/data/trader llama/1.1TraderLlama-Brown.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'TraderLlama'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Turtle', '/data/turtle/Turtle.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Turtle'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Vex', '/data/Vex_F.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Vex'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Villager', '/data/villager/Villager-Snowy_CF.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Villager'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Vindicator', '/data/vindicator/1.1Vindicator.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Vindicator'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'WanderingTrader', '/data/WanderingTrader_F.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'WanderingTrader'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Warden', '/data/Warden.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Warden'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Witch', '/data/Witch.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Witch'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Wither', '/data/Wither.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Wither'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'WitherSkeleton', '/data/WitherSkeleton.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'WitherSkeleton'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Wolf', '/data/wolf/1.1.1.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Wolf'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Zoglin', '/data/zoglin/Zoglin.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Zoglin'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'Zombie', '/data/zombie/Zombie.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'Zombie'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ZombieHorse', '/data/zombie horse/ZombieHorse-man_J.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ZombieHorse'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ZombieNautilus', '/data/zombie nautilus/1.1ZombieNautilus.gif', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ZombieNautilus'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ZombieVillager', '/data/zombie villager/1.1.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ZombieVillager'
);
INSERT INTO MOBS (name, img, link, description)
SELECT 'ZombifiedPiglin', '/data/zombified piglin/1.1ZombifiedPiglin.png', '.', '.'
WHERE NOT EXISTS (
  SELECT 1 FROM MOBS
  WHERE name = 'ZombifiedPiglin'
);

-- ============================================================
-- VARIANTI
-- ============================================================

INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo', '/data/armadillo/1.1Armadillo.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Armadillo'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Armadillo'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo  Rolled Up', '/data/armadillo/2.2Armadillo-RolledUp.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Armadillo'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Armadillo  Rolled Up'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo  Rolled Up (Baby)', '/data/armadillo/2.2Armadillo-RolledUp_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Armadillo'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Armadillo  Rolled Up (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo (Baby)', '/data/armadillo/1.1Armadillo_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Armadillo'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Armadillo (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Blue', '/data/axolotl/5Axolotl-Blue.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Blue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Blue (Baby)', '/data/axolotl/5Axolotl-Blue_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Blue (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Cyan', '/data/axolotl/4Axolotl-Cyan.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Cyan'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Cyan (Baby)', '/data/axolotl/4Axolotl-Cyan_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Cyan (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Gold', '/data/axolotl/3Axolotl-Gold.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Gold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Gold (Baby)', '/data/axolotl/3Axolotl-Gold_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Gold (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Lucy', '/data/axolotl/1Axolotl-Lucy.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Lucy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Lucy (Baby)', '/data/axolotl/1Axolotl-Lucy_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Lucy (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Wild', '/data/axolotl/2Axolotl-Wild.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Wild'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl  Wild (Baby)', '/data/axolotl/2Axolotl-Wild_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Axolotl'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Axolotl  Wild (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bat', '/data/bat/1.1Bat.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bat'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bat  Hang', '/data/bat/2.2Bat-Hang.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bat  Hang'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee', '/data/bee/1.1Bee.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bee'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bee'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee  Nectar', '/data/bee/1.2Bee-Nectar.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bee'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bee  Nectar'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee  Nectar (Baby)', '/data/bee/1.2Bee-Nectar_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bee'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bee  Nectar (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee (Baby)', '/data/bee/1.1Bee_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bee'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bee (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bogged', '/data/bogged/1Bogged.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bogged'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bogged'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bogged  Sheared', '/data/bogged/2Bogged-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Bogged'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Bogged  Sheared'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel', '/data/camel/1.1Camel.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel  Saddled', '/data/camel/2.1Camel-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel  Sitting', '/data/camel/1.2Camel-Sitting.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel  Sitting'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel  Sitting  Saddled', '/data/camel/2.2Camel-Sitting-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel  Sitting  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel  Sitting (Baby)', '/data/camel/1.2Camel-Sitting_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel  Sitting (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel (Baby)', '/data/camel/1.1Camel_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Camel'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk', '/data/camel husk/1.1CamelHusk.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Jockey', '/data/camel husk/3.1CamelHusk-Jockey_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Jockey'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Jockey ( Husk) (Texture Error)', '/data/camel husk/3.2CamelHusk-Jockey-(Husk)_TJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Jockey ( Husk) (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Jockey ( Parched) (Texture Error)', '/data/camel husk/3.3CamelHusk-Jockey-(Parched)_TJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Jockey ( Parched) (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Saddled', '/data/camel husk/2.1CamelHusk-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Sitting', '/data/camel husk/1.2CamelHusk-Sitting.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Sitting'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel Husk  Sitting  Saddled (Texture Error)', '/data/camel husk/2.2CamelHusk-Sitting-Saddled_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CamelHusk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Camel Husk  Sitting  Saddled (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Black', '/data/cat/11.2Cat-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Black  Tamed', '/data/cat/11.1Cat-Black-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Black  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Black  Tamed (Baby, Texture Error)', '/data/cat/11.1Cat-Black-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Black  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Black (Baby)', '/data/cat/11.2Cat-Black_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Black (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  British Shorthair', '/data/cat/5.2Cat-BritishShorthair.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  British Shorthair'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  British Shorthair  Tamed', '/data/cat/5.1Cat-BritishShorthair-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  British Shorthair  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  British Shorthair  Tamed (Baby, Texture Error)', '/data/cat/5.1Cat-BritishShorthair-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  British Shorthair  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  British Shorthair (Baby)', '/data/cat/5.2Cat-BritishShorthair_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  British Shorthair (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Calico', '/data/cat/6.2Cat-Calico.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Calico'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Calico  Tamed', '/data/cat/6.1Cat-Calico-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Calico  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Calico  Tamed (Baby, Texture Error)', '/data/cat/6.1Cat-Calico-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Calico  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Calico (Baby)', '/data/cat/6.2Cat-Calico_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Calico (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Jellie', '/data/cat/10.2Cat-Jellie.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Jellie'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Jellie  Tamed', '/data/cat/10.1Cat-Jellie-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Jellie  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Jellie  Tamed (Baby, Texture Error)', '/data/cat/10.1Cat-Jellie-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Jellie  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Jellie (Baby)', '/data/cat/10.2Cat-Jellie_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Jellie (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Persian', '/data/cat/7.2Cat-Persian.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Persian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Persian  Tamed', '/data/cat/7.1Cat-Persian-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Persian  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Persian  Tamed (Baby, Texture Error)', '/data/cat/7.1Cat-Persian-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Persian  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Persian (Baby)', '/data/cat/7.2Cat-Persian_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Persian (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Ragdoll', '/data/cat/8.2Cat-Ragdoll.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Ragdoll'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Ragdoll  Tamed', '/data/cat/8.1Cat-Ragdoll-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Ragdoll  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Ragdoll  Tamed (Baby, Texture Error)', '/data/cat/8.1Cat-Ragdoll-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Ragdoll  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Ragdoll (Baby)', '/data/cat/8.2Cat-Ragdoll_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Ragdoll (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Red', '/data/cat/3.2Cat-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Red'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Red  Tamed', '/data/cat/3.1Cat-Red-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Red  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Red  Tamed (Baby, Texture Error)', '/data/cat/3.1Cat-Red-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Red  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Red (Baby)', '/data/cat/3.2Cat-Red_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Red (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Siamese', '/data/cat/4.2Cat-Siamese.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Siamese'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Siamese  Tamed', '/data/cat/4.1Cat-Siamese-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Siamese  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Siamese  Tamed (Baby, Texture Error)', '/data/cat/4.1Cat-Siamese-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Siamese  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Siamese (Baby)', '/data/cat/4.2Cat-Siamese_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Siamese (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Tuxedo', '/data/cat/2.2Cat-Tuxedo.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Tuxedo'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Tuxedo  Tamed', '/data/cat/2.1Cat-Tuxedo-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Tuxedo  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Tuxedo  Tamed (Baby, Texture Error)', '/data/cat/2.1Cat-Tuxedo-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Tuxedo  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  Tuxedo (Baby)', '/data/cat/2.2Cat-Tuxedo_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  Tuxedo (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  White', '/data/cat/9.2Cat-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  White  Tamed', '/data/cat/9.1Cat-White-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  White  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  White  Tamed (Baby, Texture Error)', '/data/cat/9.1Cat-White-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  White  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat  White (Baby)', '/data/cat/9.2Cat-White_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat  White (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat Tabby', '/data/cat/1.2CatTabby.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat Tabby'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat Tabby  Tamed', '/data/cat/1.1CatTabby-Tamed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat Tabby  Tamed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat Tabby  Tamed (Baby, Texture Error)', '/data/cat/1.1CatTabby-Tamed_AT.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat Tabby  Tamed (Baby, Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat Tabby (Baby)', '/data/cat/1.2CatTabby_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cat Tabby (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Cold', '/data/chicken/2Chicken-Cold.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Cold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Cold (Baby)', '/data/chicken/2Chicken-Cold_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Cold (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Temperate', '/data/chicken/1Chicken-Temperate.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Temperate'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Temperate (Baby)', '/data/chicken/1Chicken-Temperate_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Temperate (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Warm', '/data/chicken/3Chicken-Warm.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Warm'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken  Warm (Baby)', '/data/chicken/3Chicken-Warm_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Chicken'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken  Warm (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Drowned (Baby Monster)', '/data/chicken jockey/3.4ChickenJockey-Cold-Drowned_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Drowned (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Frostbite (Baby Monster)', '/data/chicken jockey/3.7ChickenJockey-Cold-Frostbite_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Frostbite (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Husk (Baby Monster)', '/data/chicken jockey/3.3ChickenJockey-Cold-Husk_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Husk (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Zombie (Baby Monster)', '/data/chicken jockey/3.2ChickenJockey-Cold-Zombie_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Zombie (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Zombie Villager (Baby Monster)', '/data/chicken jockey/3.5ChickenJockey-Cold-ZombieVillager_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Zombie Villager (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Cold  Zombified Piglin (Baby Monster)', '/data/chicken jockey/3.6ChickenJockey-Cold-ZombifiedPiglin_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Cold  Zombified Piglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Drowned (Baby Monster)', '/data/chicken jockey/1.4ChickenJockey-Temperate-Drowned_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Drowned (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Frostbite (Baby Monster)', '/data/chicken jockey/1.7ChickenJockey-Temperate-Frostbite_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Frostbite (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Husk (Baby Monster)', '/data/chicken jockey/1.3ChickenJockey-Temperate-Husk_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Husk (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Zombie (Baby Monster)', '/data/chicken jockey/1.2ChickenJockey-Temperate-Zombie_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Zombie (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Zombie Villager (Baby Monster)', '/data/chicken jockey/1.5ChickenJockey-Temperate-ZombieVillager_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Zombie Villager (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Temperate  Zombified Piglin (Baby Monster)', '/data/chicken jockey/1.6ChickenJockey-Temperate-ZombifiedPiglin_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Temperate  Zombified Piglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Drowned (Baby Monster)', '/data/chicken jockey/2.4ChickenJockey-Warm-Drowned_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Drowned (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Frostbite (Baby Monster)', '/data/chicken jockey/2.7ChickenJockey-Warm-Frostbite_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Frostbite (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Husk (Baby Monster)', '/data/chicken jockey/2.3ChickenJockey-Warm-Husk_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Husk (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Zombie (Baby Monster)', '/data/chicken jockey/2.2ChickenJockey-Warm-Zombie_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Zombie (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Zombie Villager (Baby Monster)', '/data/chicken jockey/2.5ChickenJockey-Warm-ZombieVillager_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Zombie Villager (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey  Warm  Zombified Piglin (Baby Monster)', '/data/chicken jockey/2.6ChickenJockey-Warm-ZombifiedPiglin_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey  Warm  Zombified Piglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey (Carved Pumpkin)', '/data/special/pumpkin/1.2ChickenJockey_PJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken Jockey (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3ChickenJockey_PJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ChickenJockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Chicken Jockey (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Exposed', '/data/copper golem/2.1CopperGolem-Exposed.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Exposed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Exposed  Poppy', '/data/copper golem/2.2CopperGolem-Exposed-Poppy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Exposed  Poppy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Oxidized', '/data/copper golem/4.1CopperGolem-Oxidized.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Oxidized'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Oxidized  Poppy', '/data/copper golem/4.2CopperGolem-Oxidized-Poppy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Oxidized  Poppy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Unoxidized', '/data/copper golem/1.1CopperGolem-Unoxidized.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Unoxidized'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Unoxidized  Poppy', '/data/copper golem/1.2CopperGolem-Unoxidized-Poppy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Unoxidized  Poppy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Weathered', '/data/copper golem/3.1CopperGolem-Weathered.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Weathered'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Copper Golem  Weathered  Poppy', '/data/copper golem/3.2CopperGolem-Weathered-Poppy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'CopperGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Copper Golem  Weathered  Poppy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Cold', '/data/cow/2Cow-Cold.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Cold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Cold (Baby)', '/data/cow/2Cow-Cold_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Cold (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Temperate', '/data/cow/1Cow-Temperate.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Temperate'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Temperate (Baby)', '/data/cow/1Cow-Temperate_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Temperate (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Warm', '/data/cow/3Cow-Warm.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Warm'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow  Warm (Baby)', '/data/cow/3Cow-Warm_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Cow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Cow  Warm (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Creeper', '/data/creeper/1Creeper.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Creeper'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Creeper'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Creeper  Charged', '/data/creeper/2Creeper-Charged.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Creeper'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Creeper  Charged'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Dolphin (Baby Animal)', '/data/dolphin/Dolphin_C.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Dolphin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Dolphin (Baby Animal)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey', '/data/donkey/1Donkey.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Donkey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Donkey'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey  Chested', '/data/donkey/3Donkey-Chested.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Donkey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Donkey  Chested'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey  Saddled', '/data/donkey/2Donkey-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Donkey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Donkey  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey  Saddled  Chested', '/data/donkey/4Donkey-Saddled-Chested.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Donkey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Donkey  Saddled  Chested'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey (Baby)', '/data/donkey/1Donkey_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Donkey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Donkey (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned', '/data/drowned/1.1Drowned.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned  Fishing Rod', '/data/drowned/1.3Drowned-FishingRod.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned  Fishing Rod'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned  Nautilus (Texture Error)', '/data/drowned/1.3Drowned-Nautilus_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned  Nautilus (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned  Nautilus Trident', '/data/drowned/1.4Drowned-NautilusTrident.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned  Nautilus Trident'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned  Trident', '/data/drowned/1.2Drowned-Trident.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned  Trident'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned (Baby Monster)', '/data/drowned/1.1Drowned_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned (Carved Pumpkin)', '/data/special/pumpkin/1.2Drowned_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned (Carved Pumpkin) (Baby Monster)', '/data/special/pumpkin/1.2Drowned_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned (Carved Pumpkin) (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned (Jack o''Lantern) (Pumpkin, Baby Monster)', '/data/special/pumpkin/1.3Drowned_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned (Jack o''Lantern) (Pumpkin, Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3Drowned_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Drowned'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Drowned (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman', '/data/enderman/1Enderman.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Cactus', '/data/enderman/3Enderman-Holding-Cactus.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Cactus'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Clay (Texture Error)', '/data/enderman/7Enderman-Holding-Clay_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Clay (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Dandelion', '/data/enderman/6Enderman-Holding-Dandelion.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Dandelion'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Dirt (Texture Error)', '/data/enderman/8Enderman-Holding-Dirt_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Dirt (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Grass', '/data/enderman/5Enderman-Holding-Grass.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Grass'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Gravel (Texture Error)', '/data/enderman/9Enderman-Holding-Gravel_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Gravel (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Melon (Texture Error)', '/data/enderman/10Enderman-Holding-Melon_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Melon (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Mud (Texture Error)', '/data/enderman/11Enderman-Holding-Mud_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Mud (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Mycelium (Texture Error)', '/data/enderman/12Enderman-Holding-Mycelium_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Mycelium (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Podzol (Texture Error)', '/data/enderman/13Enderman-Holding-Podzol_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Podzol (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Pumpkin (Texture Error)', '/data/enderman/14Enderman-Holding-Pumpkin_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Pumpkin (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Red sand (Texture Error)', '/data/enderman/15Enderman-Holding-Red-sand_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Red sand (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Sand', '/data/enderman/2Enderman-Holding-Sand.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Sand'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding  Tnt', '/data/enderman/4Enderman-Holding-Tnt.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding  Tnt'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding allium (Texture Error)', '/data/enderman/31Enderman-Holding-allium_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding allium (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding azure bluet (Texture Error)', '/data/enderman/32Enderman-Holding-azure-bluet_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding azure bluet (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding blue orchid (Texture Error)', '/data/enderman/33Enderman-Holding-blue-orchid_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding blue orchid (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding brown mushroom (Texture Error)', '/data/enderman/28Enderman-Holding-brown-mushroom_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding brown mushroom (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding cactus flower (Texture Error)', '/data/enderman/24Enderman-Holding-cactus-flower_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding cactus flower (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding carved pumpkin (Texture Error)', '/data/enderman/16Enderman-Holding-carved-pumpkin_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding carved pumpkin (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding closed eyeblossom (Texture Error)', '/data/enderman/34Enderman-Holding-closed-eyeblossom_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding closed eyeblossom (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding coarse dirt (Texture Error)', '/data/enderman/25Enderman-Holding-coarse-dirt_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding coarse dirt (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding cornflower (Texture Error)', '/data/enderman/35Enderman-Holding-cornflower_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding cornflower (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding crimson fungus (Texture Error)', '/data/enderman/29Enderman-Holding-crimson-fungus_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding crimson fungus (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding crimson nylium (Texture Error)', '/data/enderman/18Enderman-Holding-crimson-nylium_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding crimson nylium (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding crimson roots (Texture Error)', '/data/enderman/22Enderman-Holding-crimson-roots_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding crimson roots (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding golden dandelion (Texture Error)', '/data/enderman/36Enderman-Holding-golden-dandelion_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding golden dandelion (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding lily of the valley (Texture Error)', '/data/enderman/37Enderman-Holding-lily-of-the-valley_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding lily of the valley (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding moss block (Texture Error)', '/data/enderman/21Enderman-Holding-moss-block_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding moss block (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding muddy mangrove roots (Texture Error)', '/data/enderman/20Enderman-Holding-muddy-mangrove-roots_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding muddy mangrove roots (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding mushroom (Texture Error)', '/data/enderman/27Enderman-Holding-mushroom_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding mushroom (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding open eyeblossom (Texture Error)', '/data/enderman/38Enderman-Holding-open-eyeblossom_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding open eyeblossom (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding orange tulip (Texture Error)', '/data/enderman/39Enderman-Holding-orange-tulip_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding orange tulip (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding oxeye daisy (Texture Error)', '/data/enderman/40Enderman-Holding-oxeye-daisy_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding oxeye daisy (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding pale moss block (Texture Error)', '/data/enderman/17Enderman-Holding-pale-moss-block_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding pale moss block (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding pink tulip (Texture Error)', '/data/enderman/41Enderman-Holding-pink-tulip_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding pink tulip (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding poppy (Texture Error)', '/data/enderman/42Enderman-Holding-poppy_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding poppy (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding red tulip (Texture Error)', '/data/enderman/43Enderman-Holding-red-tulip_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding red tulip (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding rooted dirt (Texture Error)', '/data/enderman/26Enderman-Holding-rooted-dirt_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding rooted dirt (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding torchflower (Texture Error)', '/data/enderman/44Enderman-Holding-torchflower_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding torchflower (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding warped fungus (Texture Error)', '/data/enderman/30Enderman-Holding-warped-fungus_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding warped fungus (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding warped nylium (Texture Error)', '/data/enderman/19Enderman-Holding-warped-nylium_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding warped nylium (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding warped roots (Texture Error)', '/data/enderman/23Enderman-Holding-warped-roots_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding warped roots (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding white tulip (Texture Error)', '/data/enderman/45Enderman-Holding-white-tulip_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding white tulip (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman  Holding wither rose (Texture Error)', '/data/enderman/46Enderman-Holding-wither-rose_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Enderman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Enderman  Holding wither rose (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Evoker', '/data/evoker/1.1Evoker.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Evoker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Evoker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Evoker  Banner', '/data/evoker/1.2Evoker-Banner.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Evoker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Evoker  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox', '/data/fox/1Fox.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Fox'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Fox'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox  Snow', '/data/fox/2Fox-Snow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Fox'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Fox  Snow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox  Snow (Baby)', '/data/fox/2Fox-Snow_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Fox'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Fox  Snow (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox (Baby)', '/data/fox/1Fox_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Fox'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Fox (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog  Cold', '/data/frog/3Frog-Cold.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Frog'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Frog  Cold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog  Temperate', '/data/frog/1Frog-Temperate.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Frog'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Frog  Temperate'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog  Warm', '/data/frog/2Frog-Warm.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Frog'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Frog  Warm'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frostbite (Baby Monster)', '/data/frostbite/Frostbite_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Frostbite'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Frostbite (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Glow Squid (Baby Animal)', '/data/glow squid/GlowSquid_C.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'GlowSquid'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Glow Squid (Baby Animal)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat', '/data/goat/1.1Goat.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Left', '/data/goat/1.2Goat-Left.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Left'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Left  Screaming', '/data/goat/2.2Goat-Left-Screaming.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Left  Screaming'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  No Horns', '/data/goat/1.4Goat-NoHorns.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  No Horns'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  No Horns  Screaming', '/data/goat/3.4Goat-NoHorns-Screaming.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  No Horns  Screaming'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Right', '/data/goat/1.3Goat-Right.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Right'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Right  Screaming', '/data/goat/2.3Goat-Right-Screaming.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Right  Screaming'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Screaming', '/data/goat/2.1Goat-Screaming.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Screaming'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat  Screaming (Baby)', '/data/goat/2.1Goat-Screaming_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat  Screaming (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat (Baby)', '/data/goat/1.1Goat_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Goat'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Goat (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ghastling (Baby Animal)', '/data/happy ghast/Ghastling_C.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ghastling (Baby Animal)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast', '/data/happy ghast/1.1.1HappyGhast.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Black', '/data/happy ghast/1.2.2.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Blue', '/data/happy ghast/1.2.3.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Blue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Brown', '/data/happy ghast/1.2.4.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Cyan', '/data/happy ghast/1.2.5.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Cyan'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Gray', '/data/happy ghast/1.2.6.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Green', '/data/happy ghast/1.2.7.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Green'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Light Blue', '/data/happy ghast/1.2.8.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Light Blue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Light Gray', '/data/happy ghast/1.2.9.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Light Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Lime', '/data/happy ghast/1.2.10.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Lime'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Magenta', '/data/happy ghast/1.2.11.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Magenta'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Orange', '/data/happy ghast/1.2.12.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Orange'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Pink', '/data/happy ghast/1.2.13.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Pink'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Purple', '/data/happy ghast/1.2.14.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Purple'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Red', '/data/happy ghast/1.2.15.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Red'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed White', '/data/happy ghast/1.2.16.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Harnessed Yellow', '/data/happy ghast/1.2.17.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Harnessed Yellow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Happy Ghast Leashed White', '/data/happy ghast/1.3.16.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'HappyGhast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Happy Ghast Leashed White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin', '/data/hoglin/1.1Hoglin.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Hoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Hoglin'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin  Jockey 1 (Baby)', '/data/hoglin/1.2Hoglin-Jockey-1_AJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Hoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Hoglin  Jockey 1 (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin  Jockey 2 (Baby)', '/data/hoglin/1.3Hoglin-Jockey-2_AJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Hoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Hoglin  Jockey 2 (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin  Jockey 3 (Baby)', '/data/hoglin/1.4Hoglin-Jockey-3_AJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Hoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Hoglin  Jockey 3 (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin (Baby)', '/data/hoglin/1.1Hoglin_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Hoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Hoglin (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black', '/data/horse/5.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black (Baby)', '/data/horse/5.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black Black Dots', '/data/horse/5.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black Black Dots (Baby)', '/data/horse/5.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black Copper Armor (Texture Error)', '/data/horse/5.1.13_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black Copper Armor (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black Iron Armor', '/data/horse/5.1.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black Iron Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Dots', '/data/horse/5.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Dots (Baby)', '/data/horse/5.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Dots Saddle + Diamond Armor', '/data/horse/5.4.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Dots Saddle + Diamond Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)', '/data/horse/5.4.12_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Field', '/data/horse/5.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Field (Baby)', '/data/horse/5.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Stockings', '/data/horse/5.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Black White Stockings (Baby)', '/data/horse/5.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Black White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown', '/data/horse/4.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown (Baby)', '/data/horse/4.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown Black Dots', '/data/horse/4.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown Black Dots (Baby)', '/data/horse/4.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown Diamond Armor', '/data/horse/4.1.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown Diamond Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown Netherite Armor (Texture Error)', '/data/horse/4.1.7_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown Netherite Armor (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Dots', '/data/horse/4.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Dots (Baby)', '/data/horse/4.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Field', '/data/horse/4.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Field (Baby)', '/data/horse/4.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Stockings', '/data/horse/4.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Brown White Stockings (Baby)', '/data/horse/4.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Brown White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut', '/data/horse/3.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut (Baby)', '/data/horse/3.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut Black Dots', '/data/horse/3.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut Black Dots (Baby)', '/data/horse/3.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut Saddle + Iron Armor', '/data/horse/3.1.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut Saddle + Iron Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Dots', '/data/horse/3.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Dots (Baby)', '/data/horse/3.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Field', '/data/horse/3.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Field (Baby)', '/data/horse/3.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Stockings', '/data/horse/3.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Chestnut White Stockings (Baby)', '/data/horse/3.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Chestnut White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy', '/data/horse/2.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy (Baby)', '/data/horse/2.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy Black Dots', '/data/horse/2.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy Black Dots (Baby)', '/data/horse/2.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy Saddle + Copper Armor (Texture Error)', '/data/horse/2.1.14_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy Saddle + Copper Armor (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy Saddle + Gold Armor', '/data/horse/2.1.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy Saddle + Gold Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Dots', '/data/horse/2.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Dots (Baby)', '/data/horse/2.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Field', '/data/horse/2.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Field (Baby)', '/data/horse/2.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Stockings', '/data/horse/2.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Creamy White Stockings (Baby)', '/data/horse/2.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Creamy White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown', '/data/horse/7.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown (Baby)', '/data/horse/7.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown Black Dots', '/data/horse/7.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown Black Dots (Baby)', '/data/horse/7.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown Saddle + Leather Armor', '/data/horse/7.1.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown Saddle + Leather Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Dots', '/data/horse/7.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Dots (Baby)', '/data/horse/7.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Field', '/data/horse/7.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Field (Baby)', '/data/horse/7.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Stockings', '/data/horse/7.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Dark Brown White Stockings (Baby)', '/data/horse/7.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Dark Brown White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray', '/data/horse/6.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray (Baby)', '/data/horse/6.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray Black Dots', '/data/horse/6.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray Black Dots (Baby)', '/data/horse/6.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray Gold Armor', '/data/horse/6.1.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray Gold Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Dots', '/data/horse/6.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Dots (Baby)', '/data/horse/6.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Field', '/data/horse/6.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Field (Baby)', '/data/horse/6.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Stockings', '/data/horse/6.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse Gray White Stockings (Baby)', '/data/horse/6.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse Gray White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White', '/data/horse/1.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White (Baby)', '/data/horse/1.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White Black Dots', '/data/horse/1.5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White Black Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White Black Dots (Baby)', '/data/horse/1.5.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White Black Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White Leather Armor', '/data/horse/1.1.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White Leather Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White Saddle', '/data/horse/1.1.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White Saddle'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Dots', '/data/horse/1.4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Dots'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Dots (Baby)', '/data/horse/1.4.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Dots (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Field', '/data/horse/1.3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Field'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Field (Baby)', '/data/horse/1.3.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Field (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Stockings', '/data/horse/1.2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Stockings'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Horse White White Stockings (Baby)', '/data/horse/1.2.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Horse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Horse White White Stockings (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Husk (Baby Monster)', '/data/husk/Husk_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Husk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Husk (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Husk (Carved Pumpkin)', '/data/special/pumpkin/1.2Husk_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Husk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Husk (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Husk (Carved Pumpkin) (Baby Monster)', '/data/special/pumpkin/1.2Husk_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Husk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Husk (Carved Pumpkin) (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Husk (Jack o''Lantern) (Pumpkin, Baby Monster)', '/data/special/pumpkin/1.3Husk_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Husk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Husk (Jack o''Lantern) (Pumpkin, Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Husk (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3Husk_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Husk'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Husk (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Iron Golem', '/data/iron golem/1IronGolem.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'IronGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Iron Golem'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Iron Golem High', '/data/iron golem/4IronGolemHigh.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'IronGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Iron Golem High'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Iron Golem Low', '/data/iron golem/2IronGolemLow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'IronGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Iron Golem Low'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Iron Golem Medium', '/data/iron golem/3IronGolemMedium.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'IronGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Iron Golem Medium'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown ()', '/data/llama/1.1.1Llama-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown ()'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown () (Baby)', '/data/llama/1.1.1Llama-Brown_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown () (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown () with Chest', '/data/llama/1.2.1Llama-Brown-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown () with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Black)', '/data/llama/1.1.2Llama-Brown-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Black)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Black) with Chest', '/data/llama/1.2.2Llama-Brown-Black-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Black) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Blue)', '/data/llama/1.1.3Llama-Brown-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Blue) with Chest', '/data/llama/1.2.3Llama-Brown-Blue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Brown)', '/data/llama/1.1.4Llama-Brown-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Brown)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Brown) with Chest', '/data/llama/1.2.4Llama-Brown-Brown-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Brown) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Cyan)', '/data/llama/1.1.5Llama-Brown-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Cyan)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Cyan) with Chest', '/data/llama/1.2.5Llama-Brown-Cyan-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Cyan) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Gray)', '/data/llama/1.1.6Llama-Brown-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Gray)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Gray) with Chest', '/data/llama/1.2.6Llama-Brown-Gray-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Gray) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Green)', '/data/llama/1.1.7Llama-Brown-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Green)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Green) with Chest', '/data/llama/1.2.7Llama-Brown-Green-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Green) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Light Blue)', '/data/llama/1.1.8Llama-Brown-LightBlue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Light Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Light Blue) with Chest', '/data/llama/1.2.8Llama-Brown-LightBlue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Light Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Lime)', '/data/llama/1.1.9Llama-Brown-Lime.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Lime)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Lime) with Chest', '/data/llama/1.2.9Llama-Brown-Lime-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Lime) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Magenta)', '/data/llama/1.1.10Llama-Brown-Magenta.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Magenta)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Magenta) with Chest', '/data/llama/1.2.10Llama-Brown-Magenta-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Magenta) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Orange)', '/data/llama/1.1.11Llama-Brown-Orange.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Orange)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Orange) with Chest', '/data/llama/1.2.11Llama-Brown-Orange-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Orange) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Pink)', '/data/llama/1.1.12Llama-Brown-Pink.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Pink)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Pink) with Chest', '/data/llama/1.2.12Llama-Brown-Pink-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Pink) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Purple)', '/data/llama/1.1.13Llama-Brown-Purple.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Purple)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Purple) with Chest', '/data/llama/1.2.13Llama-Brown-Purple-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Purple) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Red)', '/data/llama/1.1.14Llama-Brown-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Red) with Chest', '/data/llama/1.2.14Llama-Brown-Red-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Red) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Silver)', '/data/llama/1.1.15Llama-Brown-Silver.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Silver)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Silver) with Chest', '/data/llama/1.2.15Llama-Brown-Silver-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Silver) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (White)', '/data/llama/1.1.16Llama-Brown-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (White)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (White) with Chest', '/data/llama/1.2.16Llama-Brown-White-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (White) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Yellow)', '/data/llama/1.1.17Llama-Brown-Yellow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Yellow)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Brown (Yellow) with Chest', '/data/llama/1.2.17Llama-Brown-Yellow-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Brown (Yellow) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy ()', '/data/llama/2.1.1Llama-Creamy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy ()'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy () (Baby)', '/data/llama/2.1.1Llama-Creamy_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy () (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy () with Chest', '/data/llama/2.2.1Llama-Creamy-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy () with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Black)', '/data/llama/2.1.2Llama-Creamy-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Black)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Black) with Chest', '/data/llama/2.2.2Llama-Creamy-Black-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Black) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Blue)', '/data/llama/2.1.3Llama-Creamy-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Blue) with Chest', '/data/llama/2.2.3Llama-Creamy-Blue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Brown)', '/data/llama/2.1.4Llama-Creamy-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Brown)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Brown) with Chest', '/data/llama/2.2.4Llama-Creamy-Brown-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Brown) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Cyan)', '/data/llama/2.1.5Llama-Creamy-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Cyan)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Cyan) with Chest', '/data/llama/2.2.5Llama-Creamy-Cyan-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Cyan) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Gray)', '/data/llama/2.1.6Llama-Creamy-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Gray)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Gray) with Chest', '/data/llama/2.2.6Llama-Creamy-Gray-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Gray) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Green)', '/data/llama/2.1.7Llama-Creamy-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Green)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Green) with Chest', '/data/llama/2.2.7Llama-Creamy-Green-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Green) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Light Blue)', '/data/llama/2.1.8Llama-Creamy-LightBlue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Light Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Light Blue) with Chest', '/data/llama/2.2.8Llama-Creamy-LightBlue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Light Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Lime)', '/data/llama/2.1.9Llama-Creamy-Lime.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Lime)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Lime) with Chest', '/data/llama/2.2.9Llama-Creamy-Lime-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Lime) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Magenta)', '/data/llama/2.1.10Llama-Creamy-Magenta.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Magenta)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Magenta) with Chest', '/data/llama/2.2.10Llama-Creamy-Magenta-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Magenta) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Orange)', '/data/llama/2.1.11Llama-Creamy-Orange.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Orange)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Orange) with Chest', '/data/llama/2.2.11Llama-Creamy-Orange-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Orange) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Pink)', '/data/llama/2.1.12Llama-Creamy-Pink.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Pink)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Pink) with Chest', '/data/llama/2.2.12Llama-Creamy-Pink-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Pink) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Purple)', '/data/llama/2.1.13Llama-Creamy-Purple.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Purple)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Purple) with Chest', '/data/llama/2.2.13Llama-Creamy-Purple-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Purple) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Red)', '/data/llama/2.1.14Llama-Creamy-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Red) with Chest', '/data/llama/2.2.14Llama-Creamy-Red-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Red) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Silver)', '/data/llama/2.1.15Llama-Creamy-Silver.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Silver)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Silver) with Chest', '/data/llama/2.2.15Llama-Creamy-Silver-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Silver) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (White)', '/data/llama/2.1.16Llama-Creamy-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (White)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (White) with Chest', '/data/llama/2.2.16Llama-Creamy-White-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (White) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Yellow)', '/data/llama/2.1.17Llama-Creamy-Yellow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Yellow)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Creamy (Yellow) with Chest', '/data/llama/2.2.17Llama-Creamy-Yellow-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Creamy (Yellow) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray ()', '/data/llama/3.1.1Llama-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray ()'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray () (Baby)', '/data/llama/3.1.1Llama-Gray_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray () (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray () with Chest', '/data/llama/3.2.1Llama-Gray-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray () with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Black)', '/data/llama/3.1.2Llama-Gray-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Black)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Black) with Chest', '/data/llama/3.2.2Llama-Gray-Black-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Black) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Blue)', '/data/llama/3.1.3Llama-Gray-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Blue) with Chest', '/data/llama/3.2.3Llama-Gray-Blue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Brown)', '/data/llama/3.1.4Llama-Gray-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Brown)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Brown) with Chest', '/data/llama/3.2.4Llama-Gray-Brown-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Brown) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Cyan)', '/data/llama/3.1.5Llama-Gray-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Cyan)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Cyan) with Chest', '/data/llama/3.2.5Llama-Gray-Cyan-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Cyan) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Gray)', '/data/llama/3.1.6Llama-Gray-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Gray)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Gray) with Chest', '/data/llama/3.2.6Llama-Gray-Gray-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Gray) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Green)', '/data/llama/3.1.7Llama-Gray-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Green)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Green) with Chest', '/data/llama/3.2.7Llama-Gray-Green-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Green) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Light Blue)', '/data/llama/3.1.8Llama-Gray-LightBlue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Light Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Light Blue) with Chest', '/data/llama/3.2.8Llama-Gray-LightBlue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Light Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Lime)', '/data/llama/3.1.9Llama-Gray-Lime.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Lime)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Lime) with Chest', '/data/llama/3.2.9Llama-Gray-Lime-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Lime) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Magenta)', '/data/llama/3.1.10Llama-Gray-Magenta.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Magenta)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Magenta) with Chest', '/data/llama/3.2.10Llama-Gray-Magenta-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Magenta) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Orange)', '/data/llama/3.1.11Llama-Gray-Orange.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Orange)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Orange) with Chest', '/data/llama/3.2.11Llama-Gray-Orange-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Orange) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Pink)', '/data/llama/3.1.12Llama-Gray-Pink.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Pink)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Pink) with Chest', '/data/llama/3.2.12Llama-Gray-Pink-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Pink) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Purple)', '/data/llama/3.1.13Llama-Gray-Purple.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Purple)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Purple) with Chest', '/data/llama/3.2.13Llama-Gray-Purple-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Purple) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Red)', '/data/llama/3.1.14Llama-Gray-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Red) with Chest', '/data/llama/3.2.14Llama-Gray-Red-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Red) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Silver)', '/data/llama/3.1.15Llama-Gray-Silver.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Silver)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Silver) with Chest', '/data/llama/3.2.15Llama-Gray-Silver-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Silver) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (White)', '/data/llama/3.1.16Llama-Gray-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (White)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (White) with Chest', '/data/llama/3.2.16Llama-Gray-White-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (White) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Yellow)', '/data/llama/3.1.17Llama-Gray-Yellow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Yellow)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama Gray (Yellow) with Chest', '/data/llama/3.2.17Llama-Gray-Yellow-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama Gray (Yellow) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White ()', '/data/llama/4.1.1Llama-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White ()'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White () (Baby)', '/data/llama/4.1.1Llama-White_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White () (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White () with Chest', '/data/llama/4.2.1Llama-White-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White () with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Black)', '/data/llama/4.1.2Llama-White-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Black)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Black) with Chest', '/data/llama/4.2.2Llama-White-Black-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Black) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Blue)', '/data/llama/4.1.3Llama-White-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Blue) with Chest', '/data/llama/4.2.3Llama-White-Blue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Brown)', '/data/llama/4.1.4Llama-White-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Brown)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Brown) with Chest', '/data/llama/4.2.4Llama-White-Brown-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Brown) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Cyan)', '/data/llama/4.1.5Llama-White-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Cyan)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Cyan) with Chest', '/data/llama/4.2.5Llama-White-Cyan-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Cyan) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Gray)', '/data/llama/4.1.6Llama-White-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Gray)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Gray) with Chest', '/data/llama/4.2.6Llama-White-Gray-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Gray) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Green)', '/data/llama/4.1.7Llama-White-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Green)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Green) with Chest', '/data/llama/4.2.7Llama-White-Green-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Green) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Light Blue)', '/data/llama/4.1.8Llama-White-LightBlue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Light Blue)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Light Blue) with Chest', '/data/llama/4.2.8Llama-White-LightBlue-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Light Blue) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Lime)', '/data/llama/4.1.9Llama-White-Lime.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Lime)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Lime) with Chest', '/data/llama/4.2.9Llama-White-Lime-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Lime) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Magenta)', '/data/llama/4.1.10Llama-White-Magenta.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Magenta)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Magenta) with Chest', '/data/llama/4.2.10Llama-White-Magenta-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Magenta) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Orange)', '/data/llama/4.1.11Llama-White-Orange.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Orange)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Orange) with Chest', '/data/llama/4.2.11Llama-White-Orange-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Orange) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Pink)', '/data/llama/4.1.12Llama-White-Pink.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Pink)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Pink) with Chest', '/data/llama/4.2.12Llama-White-Pink-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Pink) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Purple)', '/data/llama/4.1.13Llama-White-Purple.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Purple)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Purple) with Chest', '/data/llama/4.2.13Llama-White-Purple-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Purple) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Red)', '/data/llama/4.1.14Llama-White-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Red) with Chest', '/data/llama/4.2.14Llama-White-Red-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Red) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Silver)', '/data/llama/4.1.15Llama-White-Silver.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Silver)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Silver) with Chest', '/data/llama/4.2.15Llama-White-Silver-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Silver) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (White)', '/data/llama/4.1.16Llama-White-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (White)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (White) with Chest', '/data/llama/4.2.16Llama-White-White-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (White) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Yellow)', '/data/llama/4.1.17Llama-White-Yellow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Yellow)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama White (Yellow) with Chest', '/data/llama/4.2.17Llama-White-Yellow-Chest.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Llama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Llama White (Yellow) with Chest'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Magma Cube  Big', '/data/magma cube/3MagmaCube-Big.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'MagmaCube'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Magma Cube  Big'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Magma Cube  Medium', '/data/magma cube/1MagmaCube-Medium.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'MagmaCube'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Magma Cube  Medium'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Magma Cube  Small', '/data/magma cube/2MagmaCube-Small.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'MagmaCube'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Magma Cube  Small'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom  Brown', '/data/mooshroom/2Mooshroom-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mooshroom'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mooshroom  Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom  Brown (Baby)', '/data/mooshroom/2Mooshroom-Brown_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mooshroom'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mooshroom  Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom  Red', '/data/mooshroom/1Mooshroom-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mooshroom'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mooshroom  Red'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom  Red (Baby)', '/data/mooshroom/1Mooshroom-Red_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mooshroom'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mooshroom  Red (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule', '/data/mule/1Mule.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mule'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mule'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule  Chested', '/data/mule/3Mule-Chested.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mule'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mule  Chested'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule  Saddled', '/data/mule/2Mule-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mule'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mule  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule  Saddled  Chested', '/data/mule/4Mule-Saddled-Chested.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mule'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mule  Saddled  Chested'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule (Baby)', '/data/mule/1Mule_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Mule'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Mule (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus', '/data/nautilus/1.1Nautilus.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Copper', '/data/nautilus/1.2Nautilus-Copper.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Copper'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Copper  Saddled', '/data/nautilus/2.2Nautilus-Copper-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Copper  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Diamond', '/data/nautilus/1.5Nautilus-Diamond.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Diamond'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Diamond  Saddled', '/data/nautilus/2.5Nautilus-Diamond-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Diamond  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Gold', '/data/nautilus/1.4Nautilus-Gold.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Gold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Gold  Saddled', '/data/nautilus/2.4Nautilus-Gold-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Gold  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Iron', '/data/nautilus/1.3Nautilus-Iron.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Iron'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Iron  Saddled', '/data/nautilus/2.3Nautilus-Iron-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Iron  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Netherite', '/data/nautilus/1.6Nautilus-Netherite.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Netherite'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Netherite  Saddled', '/data/nautilus/2.6Nautilus-Netherite-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Netherite  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus  Saddled', '/data/nautilus/2.1Nautilus-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus (Baby)', '/data/nautilus/1.1Nautilus_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Nautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Nautilus (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ocelot (Baby)', '/data/ocelot/Ocelot_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ocelot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ocelot (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda', '/data/panda/1Panda.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Aggressive', '/data/panda/3Panda-Aggressive.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Aggressive'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Aggressive (Baby)', '/data/panda/3Panda-Aggressive_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Aggressive (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Brown', '/data/panda/7Panda-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Brown (Baby)', '/data/panda/7Panda-Brown_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Lazy', '/data/panda/2Panda-Lazy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Lazy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Lazy (Baby)', '/data/panda/2Panda-Lazy_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Lazy (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Playful', '/data/panda/5Panda-Playful.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Playful'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Playful (Baby)', '/data/panda/5Panda-Playful_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Playful (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Weak', '/data/panda/6Panda-Weak.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Weak'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Weak (Baby)', '/data/panda/6Panda-Weak_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Weak (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Worried', '/data/panda/4Panda-Worried.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Worried'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda  Worried (Baby)', '/data/panda/4Panda-Worried_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda  Worried (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda (Baby)', '/data/panda/1Panda_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Panda'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Panda (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot  Blue', '/data/parrot/2Parrot-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Parrot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Parrot  Blue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot  Cyan', '/data/parrot/4Parrot-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Parrot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Parrot  Cyan'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot  Gray', '/data/parrot/5Parrot-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Parrot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Parrot  Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot  Green', '/data/parrot/3Parrot-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Parrot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Parrot  Green'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot  Red', '/data/parrot/1Parrot-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Parrot'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Parrot  Red'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Cold', '/data/pig/2.1Pig-Cold.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Cold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Cold  Saddle', '/data/pig/2.2Pig-Cold-Saddle.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Cold  Saddle'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Cold (Baby)', '/data/pig/2.1Pig-Cold_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Cold (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Temperate', '/data/pig/1.1Pig-Temperate.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Temperate'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Temperate  Saddle', '/data/pig/1.2Pig-Temperate-Saddle.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Temperate  Saddle'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Temperate (Baby)', '/data/pig/1.1Pig-Temperate_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Temperate (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Warm', '/data/pig/3.1Pig-Warm.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Warm'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Warm  Saddle', '/data/pig/3.2Pig-Warm-Saddle.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Warm  Saddle'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig  Warm (Baby)', '/data/pig/3.1Pig-Warm_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pig'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pig  Warm (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin  Crossbow', '/data/piglin/1.2Piglin-Crossbow.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Piglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Piglin  Crossbow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin  Spear', '/data/piglin/1.3Piglin-Spear.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Piglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Piglin  Spear'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin  Sword', '/data/piglin/1.1Piglin-Sword.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Piglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Piglin  Sword'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin (Baby Monster)', '/data/piglin/1.1Piglin_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Piglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Piglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager', '/data/pillager/1.1Pillager.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pillager'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager  Banner', '/data/pillager/1.3Pillager-Banner.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pillager  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager  No Crossbow', '/data/pillager/1.2Pillager-NoCrossbow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pillager  No Crossbow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager  No Crossbow  Banner (Texture Error)', '/data/pillager/1.4Pillager-NoCrossbow-Banner_T.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Pillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Pillager  No Crossbow  Banner (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Polar Bear (Baby Animal)', '/data/polar bear/PolarBear_C.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'PolarBear'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Polar Bear (Baby Animal)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Black', '/data/rabbit/3Rabbit-Black.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Black (Baby)', '/data/rabbit/3Rabbit-Black_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Black (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Brown', '/data/rabbit/1Rabbit-Brown.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Brown (Baby)', '/data/rabbit/1Rabbit-Brown_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Gold', '/data/rabbit/4Rabbit-Gold.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Gold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Gold (Baby)', '/data/rabbit/4Rabbit-Gold_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Gold (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Killer (Baby, Unobtainable)', '/data/rabbit/8Rabbit-Killer_AU.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Killer (Baby, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Killer (Unobtainable)', '/data/rabbit/8Rabbit-Killer_U.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Killer (Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Salt', '/data/rabbit/5Rabbit-Salt.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Salt'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Salt (Baby)', '/data/rabbit/5Rabbit-Salt_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Salt (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Toast', '/data/rabbit/7Rabbit-Toast.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Toast'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  Toast (Baby)', '/data/rabbit/7Rabbit-Toast_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  Toast (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  White', '/data/rabbit/2Rabbit-White.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  White (Baby)', '/data/rabbit/2Rabbit-White_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  White (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  White Splotched', '/data/rabbit/6Rabbit-WhiteSplotched.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  White Splotched'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit  White Splotched (Baby)', '/data/rabbit/6Rabbit-WhiteSplotched_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Rabbit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Rabbit  White Splotched (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager', '/data/ravager/1.1Ravager.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Evoker)', '/data/ravager/4.1Ravager-Jockey(Evoker)_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Evoker)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Evoker)  Banner', '/data/ravager/4.2Ravager-Jockey(Evoker)-Banner_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Evoker)  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Pillager)', '/data/ravager/2.1Ravager-Jockey(Pillager)_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Pillager)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Pillager)  Banner', '/data/ravager/2.2Ravager-Jockey(Pillager)-Banner_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Pillager)  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Vindicator)', '/data/ravager/3.1Ravager-Jockey(Vindicator)_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Vindicator)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager  Jockey( Vindicator)  Banner', '/data/ravager/3.2Ravager-Jockey(Vindicator)-Banner_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Ravager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Ravager  Jockey( Vindicator)  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon  Large', '/data/salmon/1.3Salmon-Large.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Salmon'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Salmon  Large'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon  Normal', '/data/salmon/1.1Salmon-Normal.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Salmon'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Salmon  Normal'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon  Small', '/data/salmon/1.2Salmon-Small.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Salmon'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Salmon  Small'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Black', '/data/sheep/1.1.4Sheep-Black.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Black (Baby)', '/data/sheep/1.1.4Sheep-Black_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Black (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Black (Sheared)', '/data/sheep/1.2.4Sheep-Black-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Black (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Blue', '/data/sheep/1.1.13Sheep-Blue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Blue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Blue (Baby)', '/data/sheep/1.1.13Sheep-Blue_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Blue (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Blue (Sheared)', '/data/sheep/1.2.13Sheep-Blue-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Blue (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Brown', '/data/sheep/1.1.5Sheep-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Brown (Baby)', '/data/sheep/1.1.5Sheep-Brown_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Brown (Sheared)', '/data/sheep/1.2.5Sheep-Brown-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Brown (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Cyan', '/data/sheep/1.1.11Sheep-Cyan.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Cyan'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Cyan (Baby)', '/data/sheep/1.1.11Sheep-Cyan_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Cyan (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Cyan (Sheared)', '/data/sheep/1.2.11Sheep-Cyan-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Cyan (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Gray', '/data/sheep/1.1.3Sheep-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Gray (Baby)', '/data/sheep/1.1.3Sheep-Gray_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Gray (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Gray (Sheared)', '/data/sheep/1.2.3Sheep-Gray-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Gray (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Green', '/data/sheep/1.1.10Sheep-Green.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Green'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Green (Baby)', '/data/sheep/1.1.10Sheep-Green_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Green (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Green (Sheared)', '/data/sheep/1.2.10Sheep-Green-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Green (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep jeb_', '/data/sheep/1.1.17Sheep-jeb_.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep jeb_'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep jeb_ (Baby)', '/data/sheep/1.1.17Sheep-jeb__A.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep jeb_ (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep jeb_ (Sheared)', '/data/sheep/1.2.17Sheep-jeb_-Sheared.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep jeb_ (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightBlue', '/data/sheep/1.1.12Sheep-LightBlue.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightBlue'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightBlue (Baby)', '/data/sheep/1.1.12Sheep-Cyan_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightBlue (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightBlue (Sheared)', '/data/sheep/1.2.12Sheep-LightBlue-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightBlue (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightGray', '/data/sheep/1.1.2Sheep-LightGray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightGray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightGray (Baby)', '/data/sheep/1.1.2Sheep-LightGray_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightGray (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep LightGray (Sheared)', '/data/sheep/1.2.2Sheep-LightGray-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep LightGray (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Lime', '/data/sheep/1.1.9Sheep-Lime.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Lime'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Lime (Baby)', '/data/sheep/1.1.9Sheep-Lime_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Lime (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Lime (Sheared)', '/data/sheep/1.2.9Sheep-Lime-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Lime (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Magenta', '/data/sheep/1.1.15Sheep-Magenta.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Magenta'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Magenta (Baby)', '/data/sheep/1.1.15Sheep-Magenta_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Magenta (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Magenta (Sheared)', '/data/sheep/1.2.15Sheep-Magenta-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Magenta (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Orange', '/data/sheep/1.1.7Sheep-Orange.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Orange'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Orange (Baby)', '/data/sheep/1.1.7Sheep-Orange_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Orange (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Orange (Sheared)', '/data/sheep/1.2.7Sheep-Orange-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Orange (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Pink', '/data/sheep/1.1.16Sheep-Pink.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Pink'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Pink (Baby)', '/data/sheep/1.1.16Sheep-Pink_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Pink (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Pink (Sheared)', '/data/sheep/1.2.16Sheep-Pink-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Pink (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Purple', '/data/sheep/1.1.14Sheep-Purple.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Purple'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Purple (Baby)', '/data/sheep/1.1.14Sheep-Purple_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Purple (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Purple (Sheared)', '/data/sheep/1.2.14Sheep-Purple-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Purple (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Red', '/data/sheep/1.1.6Sheep-Red.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Red'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Red (Baby)', '/data/sheep/1.1.6Sheep-Red_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Red (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Red (Sheared)', '/data/sheep/1.2.6Sheep-Red-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Red (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep White', '/data/sheep/1.1.1Sheep-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep White (Baby)', '/data/sheep/1.1.1Sheep-White_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep White (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep White (Sheared)', '/data/sheep/1.2.1Sheep-White-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep White (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Yellow', '/data/sheep/1.1.8Sheep-Yellow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Yellow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Yellow (Baby)', '/data/sheep/1.1.8Sheep-Yellow_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Yellow (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep Yellow (Sheared)', '/data/sheep/1.2.8Sheep-Yellow-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sheep'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sheep Yellow (Sheared)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton (Carved Pumpkin)', '/data/special/pumpkin/1.2Skeleton_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Skeleton'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3Skeleton_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Skeleton'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton Horse', '/data/skeleton horse/1.1SkeletonHorse.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SkeletonHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton Horse'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton Horse  Saddled', '/data/skeleton horse/1.2SkeletonHorse-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SkeletonHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton Horse  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton Horse man  Stray (Jockey)', '/data/skeleton horse/2.2SkeletonHorse-man-Stray_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SkeletonHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton Horse man  Stray (Jockey)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton Horse man  Wither Skeleton (Jockey, Unobtainable)', '/data/skeleton horse/2.3SkeletonHorse-man-WitherSkeleton_JU.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SkeletonHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton Horse man  Wither Skeleton (Jockey, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Skeleton Horse man (Jockey)', '/data/skeleton horse/2.1SkeletonHorse-man_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SkeletonHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Skeleton Horse man (Jockey)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime  Big', '/data/slime/2Slime-Big.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Slime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Slime  Big'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime  Medium', '/data/slime/4Slime-Medium.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Slime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Slime  Medium'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime  Semi large', '/data/slime/1Slime-Semi-large.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Slime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Slime  Semi large'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime  Small', '/data/slime/3Slime-Small.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Slime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Slime  Small'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sniffer (Baby)', '/data/sniffer/Sniffer_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Sniffer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Sniffer (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Snow Golem', '/data/snow golem/1SnowGolem.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SnowGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Snow Golem'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Snow Golem  Sheared', '/data/snow golem/2SnowGolem-Sheared.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'SnowGolem'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Snow Golem  Sheared'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider', '/data/spider/1.1Spider.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider  Invisibility', '/data/spider/1.5Spider-Invisibility.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider  Invisibility'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider  Regeneration', '/data/spider/1.4Spider-Regeneration.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider  Regeneration'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider  Speed', '/data/spider/1.2Spider-Speed.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider  Speed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider  Strength', '/data/spider/1.3Spider-Strength.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider  Strength'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey  Bogged (Unobtainable)', '/data/spider/3.2SpiderJockey-Bogged_UJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey  Bogged (Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey  Parched (Unobtainable)', '/data/spider/4.2SpiderJockey-Parched_UJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey  Parched (Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey  Skeleton', '/data/spider/1SpiderJockey-Skeleton_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey  Skeleton'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey  Stray', '/data/spider/2SpiderJockey-Stray_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey  Stray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey  Wither Skeleton (Unobtainable)', '/data/spider/5.2SpiderJockey-WitherSkeleton_UJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey  Wither Skeleton (Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey (Carved Pumpkin)', '/data/special/pumpkin/1.2SpiderJockey_PJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider Jockey (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3SpiderJockey_PJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Spider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Spider Jockey (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Squid (Baby Animal)', '/data/squid/Squid_C.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Squid'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Squid (Baby Animal)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Stray (Carved Pumpkin)', '/data/special/pumpkin/1.2Stray_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Stray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Stray (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Stray (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3Stray_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Stray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Stray (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider', '/data/strider/1.1Strider.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider  Saddled', '/data/strider/1.2Strider-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider  Shiver', '/data/strider/2.1Strider-Shiver.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider  Shiver'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider  Shiver  Saddled', '/data/strider/2.2Strider-Shiver-Saddled.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider  Shiver  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider  Shiver (Baby)', '/data/strider/2.1Strider-Shiver_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider  Shiver (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider (Baby)', '/data/strider/1.1Strider_A.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Baby Strider', '/data/strider/1.3StriderJockey-BabyStrider_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Baby Strider'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Baby Strider 2 (Texture Error, Unobtainable)', '/data/strider/1.3StriderJockey-BabyStrider-2_TUJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Baby Strider 2 (Texture Error, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Shiver  Baby Strider', '/data/strider/1.4StriderJockey-Shiver-BabyStrider_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Shiver  Baby Strider'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Shiver  Baby Strider 2 (Texture Error, Unobtainable)', '/data/strider/1.4StriderJockey-Shiver-BabyStrider-2_TUJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Shiver  Baby Strider 2 (Texture Error, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Zombified Piglin  New', '/data/strider/1.2StriderJockey-ZombifiedPiglin-New_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Zombified Piglin  New'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Zombified Piglin  Old (Unobtainable)', '/data/strider/1.5StriderJockey-ZombifiedPiglin-Old_JU.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Zombified Piglin  Old (Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Zombified Piglin  Shiver  New (Texture Error)', '/data/strider/1.2StriderJockey-ZombifiedPiglin-Shiver-New_TJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Zombified Piglin  Shiver  New (Texture Error)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider Jockey  Zombified Piglin  Shiver  Old (Texture Error, Unobtainable)', '/data/strider/1.5StriderJockey-ZombifiedPiglin-Shiver-Old_TUJ.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Strider Jockey  Zombified Piglin  Shiver  Old (Texture Error, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Brown', '/data/trader llama/1.1TraderLlama-Brown.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Brown'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Brown (Baby)', '/data/trader llama/1.1TraderLlama-Brown_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Brown (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Creamy', '/data/trader llama/1.2TraderLlama-Creamy.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Creamy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Creamy (Baby)', '/data/trader llama/1.2TraderLlama-Creamy_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Creamy (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Gray', '/data/trader llama/1.3TraderLlama-Gray.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Gray'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  Gray (Baby)', '/data/trader llama/1.3TraderLlama-Gray_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  Gray (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  White', '/data/trader llama/1.4TraderLlama-White.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  White'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Trader Llama  White (Baby)', '/data/trader llama/1.4TraderLlama-White_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'TraderLlama'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Trader Llama  White (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Turtle (Baby)', '/data/turtle/Turtle_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Turtle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Turtle (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Desert (Baby Animal, Untrapable)', '/data/villager/Villager-Desert_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Desert (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Jungle (Baby Animal, Untrapable)', '/data/villager/Villager-Jungle_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Jungle (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Plains (Baby Animal, Untrapable)', '/data/villager/Villager-Plains_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Plains (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Savanna (Baby Animal, Untrapable)', '/data/villager/Villager-Savanna_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Savanna (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Snowy (Baby Animal, Untrapable)', '/data/villager/Villager-Snowy_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Snowy (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Swamp (Baby Animal, Untrapable)', '/data/villager/Villager-Swamp_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Swamp (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager  Taiga (Baby Animal, Untrapable)', '/data/villager/Villager-Taiga_CF.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager  Taiga (Baby Animal, Untrapable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Armorer', '/data/villager/2.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Butcher', '/data/villager/2.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Cartographer', '/data/villager/2.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Cleric', '/data/villager/2.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Farmer', '/data/villager/2.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Fisherman', '/data/villager/2.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Fletcher', '/data/villager/2.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Leatherworker', '/data/villager/2.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Librarian', '/data/villager/2.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Mason', '/data/villager/2.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Nitwit', '/data/villager/2.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Shepherd', '/data/villager/2.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Toolsmith', '/data/villager/2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Unemployed', '/data/villager/2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Desert Weaponsmith', '/data/villager/2.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Desert Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Armorer', '/data/villager/3.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Butcher', '/data/villager/3.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Cartographer', '/data/villager/3.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Cleric', '/data/villager/3.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Farmer', '/data/villager/3.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Fisherman', '/data/villager/3.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Fletcher', '/data/villager/3.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Leatherworker', '/data/villager/3.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Librarian', '/data/villager/3.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Mason', '/data/villager/3.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Nitwit', '/data/villager/3.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Shepherd', '/data/villager/3.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Toolsmith', '/data/villager/3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Unemployed', '/data/villager/3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Jungle Weaponsmith', '/data/villager/3.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Jungle Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Armorer', '/data/villager/1.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Butcher', '/data/villager/1.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Cartographer', '/data/villager/1.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Cleric', '/data/villager/1.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Farmer', '/data/villager/1.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Fisherman', '/data/villager/1.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Fletcher', '/data/villager/1.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Leatherworker', '/data/villager/1.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Librarian', '/data/villager/1.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Mason', '/data/villager/1.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Nitwit', '/data/villager/1.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Shepherd', '/data/villager/1.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Toolsmith', '/data/villager/1.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Unemployed', '/data/villager/1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Plains Weaponsmith', '/data/villager/1.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Plains Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Armorer', '/data/villager/4.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Butcher', '/data/villager/4.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Cartographer', '/data/villager/4.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Cleric', '/data/villager/4.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Farmer', '/data/villager/4.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Fisherman', '/data/villager/4.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Fletcher', '/data/villager/4.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Leatherworker', '/data/villager/4.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Librarian', '/data/villager/4.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Mason', '/data/villager/4.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Nitwit', '/data/villager/4.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Shepherd', '/data/villager/4.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Toolsmith', '/data/villager/4.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Unemployed', '/data/villager/4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Savanna Weaponsmith', '/data/villager/4.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Savanna Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Armorer', '/data/villager/5.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Butcher', '/data/villager/5.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Cartographer', '/data/villager/5.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Cleric', '/data/villager/5.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Farmer', '/data/villager/5.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Fisherman', '/data/villager/5.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Fletcher', '/data/villager/5.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Leatherworker', '/data/villager/5.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Librarian', '/data/villager/5.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Mason', '/data/villager/5.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Nitwit', '/data/villager/5.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Shepherd', '/data/villager/5.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Toolsmith', '/data/villager/5.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Unemployed', '/data/villager/5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Snow Weaponsmith', '/data/villager/5.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Snow Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Armorer', '/data/villager/6.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Butcher', '/data/villager/6.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Cartographer', '/data/villager/6.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Cleric', '/data/villager/6.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Farmer', '/data/villager/6.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Fisherman', '/data/villager/6.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Fletcher', '/data/villager/6.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Leatherworker', '/data/villager/6.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Librarian', '/data/villager/6.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Mason', '/data/villager/6.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Nitwit', '/data/villager/6.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Shepherd', '/data/villager/6.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Toolsmith', '/data/villager/6.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Unemployed', '/data/villager/6.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Swamp Weaponsmith', '/data/villager/6.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Swamp Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Armorer', '/data/villager/7.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Butcher', '/data/villager/7.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Cartographer', '/data/villager/7.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Cleric', '/data/villager/7.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Farmer', '/data/villager/7.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Fisherman', '/data/villager/7.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Fletcher', '/data/villager/7.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Leatherworker', '/data/villager/7.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Librarian', '/data/villager/7.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Mason', '/data/villager/7.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Nitwit', '/data/villager/7.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Shepherd', '/data/villager/7.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Toolsmith', '/data/villager/7.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Unemployed', '/data/villager/7.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Villager Taiga Weaponsmith', '/data/villager/7.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Villager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Villager Taiga Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator', '/data/vindicator/1.1Vindicator.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Vindicator'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Vindicator'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator  Banner', '/data/vindicator/1.2Vindicator-Banner.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Vindicator'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Vindicator  Banner'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator  Banner  Johnny', '/data/vindicator/1.4Vindicator-Banner-Johnny.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Vindicator'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Vindicator  Banner  Johnny'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator  Johnny', '/data/vindicator/1.3Vindicator-Johnny.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Vindicator'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Vindicator  Johnny'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wither Skeleton (Carved Pumpkin)', '/data/special/pumpkin/1.2WitherSkeleton_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'WitherSkeleton'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wither Skeleton (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wither Skeleton (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3WitherSkeleton_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'WitherSkeleton'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wither Skeleton (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Ashen', '/data/wolf/2.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Ashen'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Ashen  with Armor (Red)', '/data/wolf/2.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Ashen  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Ashen  with Collar (Red)', '/data/wolf/2.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Ashen  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Ashen  with Collar (Red) (Baby)', '/data/wolf/2.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Ashen  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Ashen (Baby)', '/data/wolf/2.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Ashen (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Black', '/data/wolf/3.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Black'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Black  with Armor (Red)', '/data/wolf/3.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Black  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Black  with Collar (Red)', '/data/wolf/3.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Black  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Black  with Collar (Red) (Baby)', '/data/wolf/3.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Black  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Black (Baby)', '/data/wolf/3.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Black (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Chestnut', '/data/wolf/4.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Chestnut'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Chestnut  with Armor (Red)', '/data/wolf/4.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Chestnut  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Chestnut  with Collar (Red)', '/data/wolf/4.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Chestnut  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Chestnut  with Collar (Red) (Baby)', '/data/wolf/4.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Chestnut  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Chestnut (Baby)', '/data/wolf/4.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Chestnut (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Pale', '/data/wolf/1.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Pale'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Pale  with Armor (Red)', '/data/wolf/1.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Pale  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Pale  with Collar (Red)', '/data/wolf/1.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Pale  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Pale  with Collar (Red) (Baby)', '/data/wolf/1.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Pale  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Pale (Baby)', '/data/wolf/1.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Pale (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Rusty', '/data/wolf/5.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Rusty'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Rusty  with Armor (Red)', '/data/wolf/5.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Rusty  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Rusty  with Collar (Red)', '/data/wolf/5.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Rusty  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Rusty  with Collar (Red) (Baby)', '/data/wolf/5.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Rusty  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Rusty (Baby)', '/data/wolf/5.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Rusty (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Snowy', '/data/wolf/6.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Snowy'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Snowy  with Armor (Red)', '/data/wolf/6.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Snowy  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Snowy  with Collar (Red)', '/data/wolf/6.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Snowy  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Snowy  with Collar (Red) (Baby)', '/data/wolf/6.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Snowy  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Snowy (Baby)', '/data/wolf/6.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Snowy (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Spotted', '/data/wolf/7.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Spotted'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Spotted  with Armor (Red)', '/data/wolf/7.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Spotted  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Spotted  with Collar (Red)', '/data/wolf/7.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Spotted  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Spotted  with Collar (Red) (Baby)', '/data/wolf/7.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Spotted  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Spotted (Baby)', '/data/wolf/7.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Spotted (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Striped', '/data/wolf/8.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Striped'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Striped  with Armor (Red)', '/data/wolf/8.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Striped  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Striped  with Collar (Red)', '/data/wolf/8.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Striped  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Striped  with Collar (Red) (Baby)', '/data/wolf/8.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Striped  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Striped (Baby)', '/data/wolf/8.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Striped (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Woods', '/data/wolf/9.1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Woods'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Woods  with Armor (Red)', '/data/wolf/9.3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Woods  with Armor (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Woods  with Collar (Red)', '/data/wolf/9.2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Woods  with Collar (Red)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Woods  with Collar (Red) (Baby)', '/data/wolf/9.2.14_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Woods  with Collar (Red) (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Wolf Woods (Baby)', '/data/wolf/9.1.1_A.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Wolf'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Wolf Woods (Baby)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zoglin (Baby Monster)', '/data/zoglin/Zoglin_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zoglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zoglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie (Baby Monster)', '/data/zombie/Zombie_B.webp', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zombie'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie (Carved Pumpkin)', '/data/special/pumpkin/1.2Zombie_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zombie'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie (Carved Pumpkin) (Baby Monster)', '/data/special/pumpkin/1.2Zombie_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zombie'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie (Carved Pumpkin) (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie (Jack o''Lantern) (Pumpkin, Baby Monster)', '/data/special/pumpkin/1.3Zombie_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zombie'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie (Jack o''Lantern) (Pumpkin, Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3Zombie_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'Zombie'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse', '/data/zombie horse/1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse (Baby Monster, Unobtainable)', '/data/zombie horse/1.1ZombieHorse_BU.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse (Baby Monster, Unobtainable)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Copper Armor', '/data/zombie horse/1.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Copper Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Diamond Armor', '/data/zombie horse/1.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Diamond Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Gold Armor', '/data/zombie horse/1.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Gold Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Iron Armor', '/data/zombie horse/1.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Iron Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse man (Jockey)', '/data/zombie horse/ZombieHorse-man_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse man (Jockey)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Netherite Armor', '/data/zombie horse/1.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Netherite Armor'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Horse Saddle', '/data/zombie horse/1.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieHorse'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Horse Saddle'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus', '/data/zombie nautilus/1.1ZombieNautilus.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Copper', '/data/zombie nautilus/1.2ZombieNautilus-Copper.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Copper'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Copper  Saddled', '/data/zombie nautilus/2.2ZombieNautilus-Copper-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Copper  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral', '/data/zombie nautilus/3.1ZombieNautilus-Coral.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Copper', '/data/zombie nautilus/3.2ZombieNautilus-Coral-Copper.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Copper'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Copper  Saddled', '/data/zombie nautilus/4.2ZombieNautilus-Coral-Copper-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Copper  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Diamond', '/data/zombie nautilus/3.5ZombieNautilus-Coral-Diamond.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Diamond'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Diamond  Saddled', '/data/zombie nautilus/4.5ZombieNautilus-Coral-Diamond-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Diamond  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Gold', '/data/zombie nautilus/3.4ZombieNautilus-Coral-Gold.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Gold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Gold  Saddled', '/data/zombie nautilus/4.4ZombieNautilus-Coral-Gold-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Gold  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Iron', '/data/zombie nautilus/3.3ZombieNautilus-Coral-Iron.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Iron'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Iron  Saddled', '/data/zombie nautilus/4.3ZombieNautilus-Coral-Iron-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Iron  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Jockey', '/data/zombie nautilus/1.3ZombieNautilus-Coral-Jockey_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Jockey'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Netherite', '/data/zombie nautilus/3.6ZombieNautilus-Coral-Netherite.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Netherite'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Netherite  Saddled', '/data/zombie nautilus/4.6ZombieNautilus-Coral-Netherite-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Netherite  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Coral  Saddled', '/data/zombie nautilus/4.1ZombieNautilus-Coral-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Coral  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Diamond', '/data/zombie nautilus/1.5ZombieNautilus-Diamond.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Diamond'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Diamond  Saddled', '/data/zombie nautilus/2.5ZombieNautilus-Diamond-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Diamond  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Gold', '/data/zombie nautilus/1.4ZombieNautilus-Gold.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Gold'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Gold  Saddled', '/data/zombie nautilus/2.4ZombieNautilus-Gold-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Gold  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Iron', '/data/zombie nautilus/1.3ZombieNautilus-Iron.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Iron'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Iron  Saddled', '/data/zombie nautilus/2.3ZombieNautilus-Iron-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Iron  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Jockey', '/data/zombie nautilus/1.2ZombieNautilus-Jockey_J.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Jockey'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Netherite', '/data/zombie nautilus/1.6ZombieNautilus-Netherite.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Netherite'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Netherite  Saddled', '/data/zombie nautilus/2.6ZombieNautilus-Netherite-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Netherite  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Nautilus  Saddled', '/data/zombie nautilus/2.1ZombieNautilus-Saddled.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieNautilus'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Nautilus  Saddled'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager (Carved Pumpkin)', '/data/special/pumpkin/1.2ZombieVillager_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager (Carved Pumpkin) (Baby Monster)', '/data/special/pumpkin/1.2ZombieVillager_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager (Carved Pumpkin) (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager (Jack o''Lantern) (Pumpkin, Baby Monster)', '/data/special/pumpkin/1.3ZombieVillager_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager (Jack o''Lantern) (Pumpkin, Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3ZombieVillager_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Armorer', '/data/zombie villager/2.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Butcher', '/data/zombie villager/2.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Cartographer', '/data/zombie villager/2.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Cleric', '/data/zombie villager/2.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Farmer', '/data/zombie villager/2.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Fisherman', '/data/zombie villager/2.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Fletcher', '/data/zombie villager/2.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Leatherworker', '/data/zombie villager/2.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Librarian', '/data/zombie villager/2.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Mason', '/data/zombie villager/2.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Nitwit', '/data/zombie villager/2.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Shepherd', '/data/zombie villager/2.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Toolsmith', '/data/zombie villager/2.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Unemployed', '/data/zombie villager/2.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Unemployed (Baby Monster)', '/data/zombie villager/2.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Desert Weaponsmith', '/data/zombie villager/2.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Desert Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Armorer', '/data/zombie villager/3.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Butcher', '/data/zombie villager/3.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Cartographer', '/data/zombie villager/3.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Cleric', '/data/zombie villager/3.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Farmer', '/data/zombie villager/3.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Fisherman', '/data/zombie villager/3.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Fletcher', '/data/zombie villager/3.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Leatherworker', '/data/zombie villager/3.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Librarian', '/data/zombie villager/3.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Mason', '/data/zombie villager/3.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Nitwit', '/data/zombie villager/3.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Shepherd', '/data/zombie villager/3.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Toolsmith', '/data/zombie villager/3.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Unemployed', '/data/zombie villager/3.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Unemployed (Baby Monster)', '/data/zombie villager/3.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Jungle Weaponsmith', '/data/zombie villager/3.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Jungle Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Armorer', '/data/zombie villager/1.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Butcher', '/data/zombie villager/1.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Cartographer', '/data/zombie villager/1.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Cleric', '/data/zombie villager/1.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Farmer', '/data/zombie villager/1.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Fisherman', '/data/zombie villager/1.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Fletcher', '/data/zombie villager/1.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Leatherworker', '/data/zombie villager/1.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Librarian', '/data/zombie villager/1.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Mason', '/data/zombie villager/1.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Nitwit', '/data/zombie villager/1.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Shepherd', '/data/zombie villager/1.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Toolsmith', '/data/zombie villager/1.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Unemployed', '/data/zombie villager/1.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Unemployed (Baby Monster)', '/data/zombie villager/1.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Plains Weaponsmith', '/data/zombie villager/1.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Plains Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Armorer', '/data/zombie villager/4.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Butcher', '/data/zombie villager/4.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Cartographer', '/data/zombie villager/4.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Cleric', '/data/zombie villager/4.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Farmer', '/data/zombie villager/4.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Fisherman', '/data/zombie villager/4.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Fletcher', '/data/zombie villager/4.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Leatherworker', '/data/zombie villager/4.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Librarian', '/data/zombie villager/4.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Mason', '/data/zombie villager/4.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Nitwit', '/data/zombie villager/4.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Shepherd', '/data/zombie villager/4.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Toolsmith', '/data/zombie villager/4.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Unemployed', '/data/zombie villager/4.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Unemployed (Baby Monster)', '/data/zombie villager/4.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Savanna Weaponsmith', '/data/zombie villager/4.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Savanna Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Armorer', '/data/zombie villager/5.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Butcher', '/data/zombie villager/5.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Cartographer', '/data/zombie villager/5.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Cleric', '/data/zombie villager/5.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Farmer', '/data/zombie villager/5.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Fisherman', '/data/zombie villager/5.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Fletcher', '/data/zombie villager/5.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Leatherworker', '/data/zombie villager/5.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Librarian', '/data/zombie villager/5.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Mason', '/data/zombie villager/5.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Nitwit', '/data/zombie villager/5.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Shepherd', '/data/zombie villager/5.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Toolsmith', '/data/zombie villager/5.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Unemployed', '/data/zombie villager/5.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Unemployed (Baby Monster)', '/data/zombie villager/5.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Snow Weaponsmith', '/data/zombie villager/5.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Snow Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Armorer', '/data/zombie villager/6.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Butcher', '/data/zombie villager/6.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Cartographer', '/data/zombie villager/6.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Cleric', '/data/zombie villager/6.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Farmer', '/data/zombie villager/6.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Fisherman', '/data/zombie villager/6.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Fletcher', '/data/zombie villager/6.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Leatherworker', '/data/zombie villager/6.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Librarian', '/data/zombie villager/6.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Mason', '/data/zombie villager/6.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Nitwit', '/data/zombie villager/6.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Shepherd', '/data/zombie villager/6.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Toolsmith', '/data/zombie villager/6.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Unemployed', '/data/zombie villager/6.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Unemployed (Baby Monster)', '/data/zombie villager/6.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Swamp Weaponsmith', '/data/zombie villager/6.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Swamp Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Armorer', '/data/zombie villager/7.3.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Armorer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Butcher', '/data/zombie villager/7.4.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Butcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Cartographer', '/data/zombie villager/7.5.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Cartographer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Cleric', '/data/zombie villager/7.6.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Cleric'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Farmer', '/data/zombie villager/7.7.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Farmer'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Fisherman', '/data/zombie villager/7.8.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Fisherman'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Fletcher', '/data/zombie villager/7.9.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Fletcher'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Leatherworker', '/data/zombie villager/7.10.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Leatherworker'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Librarian', '/data/zombie villager/7.11.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Librarian'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Mason', '/data/zombie villager/7.12.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Mason'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Nitwit', '/data/zombie villager/7.2.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Nitwit'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Shepherd', '/data/zombie villager/7.13.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Shepherd'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Toolsmith', '/data/zombie villager/7.14.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Toolsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Unemployed', '/data/zombie villager/7.1.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Unemployed'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Unemployed (Baby Monster)', '/data/zombie villager/7.1_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Unemployed (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombie Villager Taiga Weaponsmith', '/data/zombie villager/7.15.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombieVillager'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombie Villager Taiga Weaponsmith'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin', '/data/zombified piglin/1.1ZombifiedPiglin.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin  Axe', '/data/zombified piglin/1.3ZombifiedPiglin-Axe.gif', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin  Axe'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin  Crossbow', '/data/zombified piglin/1.2ZombifiedPiglin-Crossbow.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin  Crossbow'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin (Baby Monster)', '/data/zombified piglin/1ZombifiedPiglin_B.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin (Carved Pumpkin)', '/data/special/pumpkin/1.2ZombifiedPiglin_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin (Carved Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin (Carved Pumpkin) (Baby Monster)', '/data/special/pumpkin/1.2ZombifiedPiglin_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin (Carved Pumpkin) (Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin (Jack o''Lantern) (Pumpkin, Baby Monster)', '/data/special/pumpkin/1.3ZombifiedPiglin_PB.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin (Jack o''Lantern) (Pumpkin, Baby Monster)'
      AND v.mob_id = m.id
  )
LIMIT 1;
INSERT INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Zombified Piglin (Jack o''Lantern) (Pumpkin)', '/data/special/pumpkin/1.3ZombifiedPiglin_P.png', '.', '.', m.id
FROM MOBS m
WHERE m.name = 'ZombifiedPiglin'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANTS v
    WHERE v.name = 'Zombified Piglin (Jack o''Lantern) (Pumpkin)'
      AND v.mob_id = m.id
  )
LIMIT 1;

-- ============================================================
-- RELAZIONI MOB ↔ CATEGORIE
-- ============================================================

INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Armadillo'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Axolotl'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Axolotl'
  AND c.name = 'Color - Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Axolotl'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Bee'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Bogged'
  AND c.name = 'Shearable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Camel'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Camel'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'CamelHusk'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'CamelHusk'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cat'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cat'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cat'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cat'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cat'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Chicken'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ChickenJockey'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ChickenJockey'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ChickenJockey'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Cow'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Creeper'
  AND c.name = 'Lightning'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Dolphin'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Donkey'
  AND c.name = 'Chested'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Donkey'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Donkey'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Drowned'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Drowned'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Drowned'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - Orange'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - Pink'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Enderman'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Evoker'
  AND c.name = 'Banner'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Fox'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Frostbite'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'GlowSquid'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Goat'
  AND c.name = 'Screaming'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Goat'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Green'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Lime'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Magenta'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Orange'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Pink'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Purple'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Color - Yellow'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'HappyGhast'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Hoglin'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Hoglin'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Horse'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Husk'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Husk'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Chested'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Green'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - LightBlue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Lime'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Magenta'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Orange'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Pink'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Purple'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Color - Yellow'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Llama'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mooshroom'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mooshroom'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mooshroom'
  AND c.name = 'Lightning'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mooshroom'
  AND c.name = 'Shearable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mooshroom'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mule'
  AND c.name = 'Chested'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mule'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Mule'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Nautilus'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Ocelot'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Panda'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Panda'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Parrot'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Parrot'
  AND c.name = 'Color - Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Parrot'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Parrot'
  AND c.name = 'Color - Green'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Parrot'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Pig'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Pig'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Piglin'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Pillager'
  AND c.name = 'Banner'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Pillager'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'PolarBear'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Name Tag'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Rabbit'
  AND c.name = 'Special - Unobtainable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Ravager'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Blue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Green'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - LightBlue'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - LightGray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Lime'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Magenta'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Orange'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Pink'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Purple'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Color - Yellow'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Name Tag'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Shearable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sheep'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Skeleton'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'SkeletonHorse'
  AND c.name = 'Lightning'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'SkeletonHorse'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'SkeletonHorse'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'SkeletonHorse'
  AND c.name = 'Special - Unobtainable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Sniffer'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'SnowGolem'
  AND c.name = 'Shearable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Spider'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Spider'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Spider'
  AND c.name = 'Special - Unobtainable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Squid'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Stray'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Strider'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Strider'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Strider'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Strider'
  AND c.name = 'Special - Texture Error'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Strider'
  AND c.name = 'Special - Unobtainable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'TraderLlama'
  AND c.name = 'Chested'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'TraderLlama'
  AND c.name = 'Color - Brown'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'TraderLlama'
  AND c.name = 'Color - Gray'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'TraderLlama'
  AND c.name = 'Color - White'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'TraderLlama'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Turtle'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Vex'
  AND c.name = 'Special - Untrapable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Desert'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Jungle'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Plains'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Savanna'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Snow'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Swamp'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Biome - Taiga'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Mason'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Profession - Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Special - Baby Animal'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Villager'
  AND c.name = 'Special - Untrapable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Vindicator'
  AND c.name = 'Banner'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Vindicator'
  AND c.name = 'Name Tag'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'WanderingTrader'
  AND c.name = 'Special - Untrapable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'WitherSkeleton'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Wolf'
  AND c.name = 'Color - Black'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Wolf'
  AND c.name = 'Color - Red'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Wolf'
  AND c.name = 'Special - Baby Breed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Zoglin'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Zombie'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'Zombie'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieHorse'
  AND c.name = 'Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieHorse'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieHorse'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieHorse'
  AND c.name = 'Special - Unobtainable'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieNautilus'
  AND c.name = 'Special - Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Desert'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Jungle'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Plains'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Savanna'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Snow'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Swamp'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Biome - Taiga'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Mason'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Profession - Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombieVillager'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombifiedPiglin'
  AND c.name = 'Special - Baby Monster'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );
INSERT INTO MOB_CATEGORIES (mob_id, category_id)
SELECT m.id, c.id
FROM MOBS m, CATEGORIES c
WHERE m.name = 'ZombifiedPiglin'
  AND c.name = 'Special - Pumpkin'
  AND NOT EXISTS (
    SELECT 1 FROM MOB_CATEGORIES mc
    WHERE mc.mob_id = m.id AND mc.category_id = c.id
  );

-- ============================================================
-- RELAZIONI VARIANTI ↔ CATEGORIE
-- ============================================================

INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Armadillo'
  AND v.name = 'Armadillo  Rolled Up (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Armadillo'
  AND v.name = 'Armadillo (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Blue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Blue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Blue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Cyan (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Cyan (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Gold (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Lucy (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Axolotl'
  AND v.name = 'Axolotl  Wild (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Bee'
  AND v.name = 'Bee  Nectar (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Bee'
  AND v.name = 'Bee (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Bogged'
  AND v.name = 'Bogged  Sheared'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Camel'
  AND v.name = 'Camel  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Camel'
  AND v.name = 'Camel  Sitting  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Camel'
  AND v.name = 'Camel  Sitting (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Camel'
  AND v.name = 'Camel (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Jockey ( Husk) (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Jockey ( Husk) (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Jockey ( Parched) (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Jockey ( Parched) (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Sitting  Saddled (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'CamelHusk'
  AND v.name = 'Camel Husk  Sitting  Saddled (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black  Tamed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  British Shorthair  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  British Shorthair  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  British Shorthair (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Calico  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Calico  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Calico (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Jellie  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Jellie  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Jellie (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Persian  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Persian  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Persian (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Ragdoll  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Ragdoll  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Ragdoll (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red  Tamed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Siamese  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Siamese  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Siamese (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Tuxedo  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Tuxedo  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  Tuxedo (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White  Tamed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat Tabby  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Cat'
  AND v.name = 'Cat Tabby  Tamed (Baby, Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cat'
  AND v.name = 'Cat Tabby (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Chicken'
  AND v.name = 'Chicken  Cold (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Chicken'
  AND v.name = 'Chicken  Temperate (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Chicken'
  AND v.name = 'Chicken  Warm (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Cold  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Temperate  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombie Villager (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey  Warm  Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ChickenJockey'
  AND v.name = 'Chicken Jockey (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cow'
  AND v.name = 'Cow  Cold (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cow'
  AND v.name = 'Cow  Temperate (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Cow'
  AND v.name = 'Cow  Warm (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Lightning'
WHERE m.name = 'Creeper'
  AND v.name = 'Creeper  Charged'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Dolphin'
  AND v.name = 'Dolphin (Baby Animal)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Donkey'
  AND v.name = 'Donkey  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Donkey'
  AND v.name = 'Donkey  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Donkey'
  AND v.name = 'Donkey  Saddled  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Donkey'
  AND v.name = 'Donkey  Saddled  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Donkey'
  AND v.name = 'Donkey (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned  Nautilus (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Drowned'
  AND v.name = 'Drowned (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Clay (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Dirt (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Gravel (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Melon (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Mud (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Mycelium (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Podzol (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Pumpkin (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Red sand (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding  Red sand (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding allium (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding azure bluet (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding blue orchid (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding blue orchid (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding brown mushroom (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding brown mushroom (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding cactus flower (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding carved pumpkin (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding closed eyeblossom (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding coarse dirt (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding cornflower (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding crimson fungus (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding crimson nylium (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding crimson roots (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding golden dandelion (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding lily of the valley (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding moss block (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding muddy mangrove roots (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding mushroom (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding open eyeblossom (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding orange tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding orange tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding oxeye daisy (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding pale moss block (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding pink tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding pink tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding poppy (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding red tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding red tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding rooted dirt (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding torchflower (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding warped fungus (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding warped nylium (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding warped roots (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding white tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding white tulip (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Enderman'
  AND v.name = 'Enderman  Holding wither rose (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Evoker'
  AND v.name = 'Evoker  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Fox'
  AND v.name = 'Fox  Snow (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Fox'
  AND v.name = 'Fox (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Frostbite'
  AND v.name = 'Frostbite (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'GlowSquid'
  AND v.name = 'Glow Squid (Baby Animal)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Screaming'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  Left  Screaming'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Screaming'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  No Horns  Screaming'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Screaming'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  Right  Screaming'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Screaming'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  Screaming'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Screaming'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  Screaming (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Goat'
  AND v.name = 'Goat  Screaming (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Goat'
  AND v.name = 'Goat (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Ghastling (Baby Animal)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Blue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Green'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Light Blue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Light Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Lime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Magenta'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Orange'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Pink'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Purple'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Red'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Harnessed Yellow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'HappyGhast'
  AND v.name = 'Happy Ghast Leashed White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 1 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 1 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 2 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 2 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 3 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin  Jockey 3 (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Hoglin'
  AND v.name = 'Hoglin (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Copper Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Copper Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black Iron Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Diamond Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Diamond Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Diamond Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Dots Saddle + Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Black White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Diamond Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown Netherite Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Saddle + Iron Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut Saddle + Iron Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Chestnut White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Saddle + Copper Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Saddle + Copper Armor (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy Saddle + Gold Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Creamy White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Saddle + Leather Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown Saddle + Leather Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Dark Brown White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray Gold Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse Gray White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Black Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Black Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Leather Armor'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Dots'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Dots (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Field'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Field (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Stockings'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Horse'
  AND v.name = 'Horse White White Stockings (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Husk'
  AND v.name = 'Husk (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown ()'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Silver)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Brown (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Creamy (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray ()'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Silver)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama Gray (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White ()'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White () (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White () with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Black)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Black) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Brown)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Brown) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Cyan)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Cyan) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Gray)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Gray) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Green)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Green) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Light Blue) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Lime)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Lime) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Magenta)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Magenta) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Orange)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Orange) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Pink)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Pink) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Purple)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Purple) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Red) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Silver)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Silver) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (White)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (White) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Yellow)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Llama'
  AND v.name = 'Llama White (Yellow) with Chest'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Red'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Mooshroom'
  AND v.name = 'Mooshroom  Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Mule'
  AND v.name = 'Mule  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Mule'
  AND v.name = 'Mule  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Mule'
  AND v.name = 'Mule  Saddled  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Mule'
  AND v.name = 'Mule  Saddled  Chested'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Mule'
  AND v.name = 'Mule (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Copper  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Diamond  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Gold  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Iron  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Netherite  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Nautilus'
  AND v.name = 'Nautilus (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Ocelot'
  AND v.name = 'Ocelot (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Aggressive (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Lazy (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Playful (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Weak (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda  Worried (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Panda'
  AND v.name = 'Panda (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Parrot'
  AND v.name = 'Parrot  Blue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Parrot'
  AND v.name = 'Parrot  Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Parrot'
  AND v.name = 'Parrot  Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Parrot'
  AND v.name = 'Parrot  Green'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Parrot'
  AND v.name = 'Parrot  Red'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Cold  Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Cold (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Temperate  Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Temperate (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Warm  Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Pig'
  AND v.name = 'Pig  Warm (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Piglin'
  AND v.name = 'Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Pillager'
  AND v.name = 'Pillager  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Pillager'
  AND v.name = 'Pillager  No Crossbow  Banner (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Pillager'
  AND v.name = 'Pillager  No Crossbow  Banner (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'PolarBear'
  AND v.name = 'Polar Bear (Baby Animal)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Gold (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Killer (Baby, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Killer (Baby, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Killer (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Salt (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Toast'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Toast (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  Toast (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White Splotched'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White Splotched (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Rabbit'
  AND v.name = 'Rabbit  White Splotched (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Evoker)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Evoker)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Evoker)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Pillager)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Pillager)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Pillager)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Vindicator)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Vindicator)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Ravager'
  AND v.name = 'Ravager  Jockey( Vindicator)  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Black (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Black (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Blue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Blue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Blue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Blue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Blue (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Blue (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Brown (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Brown (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Cyan'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Cyan (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Cyan (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Cyan'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Cyan (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Cyan (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Gray (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Gray (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Green'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Green (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Green (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Green'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Green (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Green (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep jeb_'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep jeb_ (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep jeb_ (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep jeb_ (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep jeb_ (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightBlue'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightBlue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightBlue (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightBlue'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightBlue (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightBlue (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightGray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightGray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightGray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightGray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightGray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - LightGray'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightGray (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep LightGray (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Lime'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Lime (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Lime (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Lime'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Lime (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Lime (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Magenta'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Magenta (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Magenta (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Magenta'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Magenta (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Magenta (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Orange'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Orange (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Orange (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Orange'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Orange (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Orange (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Pink'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Pink (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Pink (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Pink'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Pink (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Pink (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Purple'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Purple (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Purple (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Purple'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Purple (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Purple (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Red'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Red (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Red (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Red (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep White (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep White (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Yellow'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Yellow (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Yellow (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Yellow'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Yellow (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'Sheep'
  AND v.name = 'Sheep Yellow (Sheared)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Skeleton'
  AND v.name = 'Skeleton (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Skeleton'
  AND v.name = 'Skeleton (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'SkeletonHorse'
  AND v.name = 'Skeleton Horse  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'SkeletonHorse'
  AND v.name = 'Skeleton Horse man  Stray (Jockey)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'SkeletonHorse'
  AND v.name = 'Skeleton Horse man  Wither Skeleton (Jockey, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'SkeletonHorse'
  AND v.name = 'Skeleton Horse man  Wither Skeleton (Jockey, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'SkeletonHorse'
  AND v.name = 'Skeleton Horse man (Jockey)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Sniffer'
  AND v.name = 'Sniffer (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Shearable'
WHERE m.name = 'SnowGolem'
  AND v.name = 'Snow Golem  Sheared'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Bogged (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Bogged (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Parched (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Parched (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Skeleton'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Stray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Wither Skeleton (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey  Wither Skeleton (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Spider'
  AND v.name = 'Spider Jockey (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Squid'
  AND v.name = 'Squid (Baby Animal)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Stray'
  AND v.name = 'Stray (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Stray'
  AND v.name = 'Stray (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Strider'
  AND v.name = 'Strider  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'Strider'
  AND v.name = 'Strider  Shiver  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Strider'
  AND v.name = 'Strider  Shiver (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Strider'
  AND v.name = 'Strider (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Baby Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Shiver  Baby Strider'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Shiver  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Shiver  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Shiver  Baby Strider 2 (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  New'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Old (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Old (Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Shiver  New (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Shiver  New (Texture Error)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Shiver  Old (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Texture Error'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Shiver  Old (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'Strider'
  AND v.name = 'Strider Jockey  Zombified Piglin  Shiver  Old (Texture Error, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Brown'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Brown'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Brown (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Creamy (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Gray'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Gray'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  Gray (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  White'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - White'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'TraderLlama'
  AND v.name = 'Trader Llama  White (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Turtle'
  AND v.name = 'Turtle (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Desert (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Desert (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Desert (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Jungle (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Jungle (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Jungle (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Plains (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Plains (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Plains (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Savanna (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Savanna (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Savanna (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Snowy (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Snowy (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Snowy (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Swamp (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Swamp (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Swamp (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Taiga (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Animal'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Taiga (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Untrapable'
WHERE m.name = 'Villager'
  AND v.name = 'Villager  Taiga (Baby Animal, Untrapable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Desert Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Jungle Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Plains Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Savanna Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Snow Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Swamp Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'Villager'
  AND v.name = 'Villager Taiga Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Vindicator'
  AND v.name = 'Vindicator  Banner'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Banner'
WHERE m.name = 'Vindicator'
  AND v.name = 'Vindicator  Banner  Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Vindicator'
  AND v.name = 'Vindicator  Banner  Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Name Tag'
WHERE m.name = 'Vindicator'
  AND v.name = 'Vindicator  Johnny'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'WitherSkeleton'
  AND v.name = 'Wither Skeleton (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'WitherSkeleton'
  AND v.name = 'Wither Skeleton (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Ashen  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Ashen  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Ashen  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Ashen  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Ashen (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Black'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Black (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Chested'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Chestnut (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Pale  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Pale  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Pale  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Pale  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Pale (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Rusty  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Rusty  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Rusty  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Rusty  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Rusty (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Snowy  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Snowy  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Snowy  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Snowy  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Snowy (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Spotted  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Spotted  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Spotted  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Spotted  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Spotted (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Striped  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Striped  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Striped  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Striped  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Striped (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Woods  with Armor (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Woods  with Collar (Red)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Color - Red'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Woods  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Woods  with Collar (Red) (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Breed'
WHERE m.name = 'Wolf'
  AND v.name = 'Wolf Woods (Baby)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Zoglin'
  AND v.name = 'Zoglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'Zombie'
  AND v.name = 'Zombie (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieHorse'
  AND v.name = 'Zombie Horse (Baby Monster, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Unobtainable'
WHERE m.name = 'ZombieHorse'
  AND v.name = 'Zombie Horse (Baby Monster, Unobtainable)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ZombieHorse'
  AND v.name = 'Zombie Horse man (Jockey)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieHorse'
  AND v.name = 'Zombie Horse Saddle'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Copper  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Copper  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Diamond  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Gold  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Iron  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Netherite  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Coral  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Diamond  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Gold  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Iron  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Jockey'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Jockey'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Netherite  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Saddled'
WHERE m.name = 'ZombieNautilus'
  AND v.name = 'Zombie Nautilus  Saddled'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Desert'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Desert Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Jungle'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Jungle Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Plains'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Plains Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Savanna'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Savanna Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Snow'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Snow Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Swamp'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Swamp Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Armorer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Armorer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Butcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Butcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cartographer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Cartographer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Cleric'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Cleric'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Farmer'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Farmer'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fisherman'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Fisherman'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Fletcher'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Fletcher'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Leatherworker'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Leatherworker'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Librarian'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Librarian'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Mason'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Mason'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Nitwit'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Nitwit'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Shepherd'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Shepherd'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Toolsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Toolsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Unemployed'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Unemployed'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Unemployed (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Biome - Taiga'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Profession - Weaponsmith'
WHERE m.name = 'ZombieVillager'
  AND v.name = 'Zombie Villager Taiga Weaponsmith'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Carved Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Carved Pumpkin) (Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Baby Monster'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Jack o''Lantern) (Pumpkin, Baby Monster)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );
INSERT INTO VARIANT_CATEGORIES (variant_id, category_id)
SELECT v.id, c.id
FROM VARIANTS v
JOIN MOBS m ON m.id = v.mob_id
JOIN CATEGORIES c ON c.name = 'Special - Pumpkin'
WHERE m.name = 'ZombifiedPiglin'
  AND v.name = 'Zombified Piglin (Jack o''Lantern) (Pumpkin)'
  AND NOT EXISTS (
    SELECT 1 FROM VARIANT_CATEGORIES vc
    WHERE vc.variant_id = v.id AND vc.category_id = c.id
  );


-- ============================================================
-- Fine importazione
-- ============================================================
