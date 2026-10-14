-- ============================================================
-- AllMobs Database Import Script
-- Generato: 2026-10-13T12:42:08.611Z
-- Mob: 359
-- Varianti: 659
-- ============================================================

BEGIN TRANSACTION;

-- ============================================================
-- CATEGORIE ESISTENTI
-- ============================================================

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Saddled', '/icons/items/saddle.png', '#ef4444', 'https://minecraft.wiki/w/Saddle', 'These mobs can be saddled using a Saddle.', 1, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Shearable', '/icons/items/shears.png', '#f59e0b', 'https://minecraft.wiki/w/Shearing', 'These mobs can be sheared using Shears.', 2, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Chested', '/icons/items/chest.png', '#3b82f6', 'https://minecraft.wiki/w/Chest#Donkey,_mule,_or_llama_pack', 'These mobs can have a chest placed on them.', 3, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Name Tag', '/icons/items/name-tag.png', '#10b981', 'https://minecraft.wiki/w/Name_Tag#Easter_eggs', 'These mobs obtain a special variant when given a specific name.', 4, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Banner', '/icons/items/ominous-banner.png', '#a855f7', 'https://minecraft.wiki/w/Raid_captain', 'These mobs can have banners placed on them.', 5, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Lightning', '/icons/items/lightning.png', '#06b6d4', 'https://minecraft.wiki/w/Thunderstorm#Effects_on_mobs', 'These mobs can be struck by lightning.', 6, NULL);

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Screaming', '/icons/items/screaming.png', '#ffffff', 'https://minecraft.wiki/w/Goat#Spawning', 'Goats have a 2% chance of being screaming goats.', 7, NULL);

-- ============================================================
-- CATEGORIE DINAMICHE (Colori, Biomi, Professioni)
-- ============================================================

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - White', '/icons/items/wool.png', '#ffffff', '.', 'Mob with White color variant.', 100, 'White');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - LightGray', '/icons/items/wool.png', '#9ca3af', '.', 'Mob with LightGray color variant.', 101, 'LightGray');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Gray', '/icons/items/wool.png', '#6b7280', '.', 'Mob with Gray color variant.', 102, 'Gray');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Black', '/icons/items/wool.png', '#000000', '.', 'Mob with Black color variant.', 103, 'Black');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Brown', '/icons/items/wool.png', '#92400e', '.', 'Mob with Brown color variant.', 104, 'Brown');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Red', '/icons/items/wool.png', '#dc2626', '.', 'Mob with Red color variant.', 105, 'Red');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Orange', '/icons/items/wool.png', '#ea580c', '.', 'Mob with Orange color variant.', 106, 'Orange');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Yellow', '/icons/items/wool.png', '#fbbf24', '.', 'Mob with Yellow color variant.', 107, 'Yellow');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Lime', '/icons/items/wool.png', '#84cc16', '.', 'Mob with Lime color variant.', 108, 'Lime');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Green', '/icons/items/wool.png', '#16a34a', '.', 'Mob with Green color variant.', 109, 'Green');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Cyan', '/icons/items/wool.png', '#06b6d4', '.', 'Mob with Cyan color variant.', 110, 'Cyan');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - LightBlue', '/icons/items/wool.png', '#38bdf8', '.', 'Mob with LightBlue color variant.', 111, 'LightBlue');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Blue', '/icons/items/wool.png', '#3b82f6', '.', 'Mob with Blue color variant.', 112, 'Blue');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Purple', '/icons/items/wool.png', '#a855f7', '.', 'Mob with Purple color variant.', 113, 'Purple');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Magenta', '/icons/items/wool.png', '#d946ef', '.', 'Mob with Magenta color variant.', 114, 'Magenta');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Color - Pink', '/icons/items/wool.png', '#ec4899', '.', 'Mob with Pink color variant.', 115, 'Pink');

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Plains', '/icons/biomes/plains.png', '#10b981', '.', 'Mob from Plains biome.', 116, 'Plains');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Desert', '/icons/biomes/desert.png', '#10b981', '.', 'Mob from Desert biome.', 117, 'Desert');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Jungle', '/icons/biomes/jungle.png', '#10b981', '.', 'Mob from Jungle biome.', 118, 'Jungle');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Savanna', '/icons/biomes/savanna.png', '#10b981', '.', 'Mob from Savanna biome.', 119, 'Savanna');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Snow', '/icons/biomes/snow.png', '#10b981', '.', 'Mob from Snow biome.', 120, 'Snow');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Swamp', '/icons/biomes/swamp.png', '#10b981', '.', 'Mob from Swamp biome.', 121, 'Swamp');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Biome - Taiga', '/icons/biomes/taiga.png', '#10b981', '.', 'Mob from Taiga biome.', 122, 'Taiga');

INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Unemployed', '/icons/items/villager.png', '#f59e0b', '.', 'Villager with Unemployed profession.', 123, 'Unemployed');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Nitwit', '/icons/items/villager.png', '#f59e0b', '.', 'Villager with Nitwit profession.', 124, 'Nitwit');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Armorer', '/icons/job site/armorer.png', '#f59e0b', '.', 'Villager with Armorer profession.', 125, 'Armorer');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Butcher', '/icons/job site/butcher.png', '#f59e0b', '.', 'Villager with Butcher profession.', 126, 'Butcher');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Cartographer', '/icons/job site/cartographer.png', '#f59e0b', '.', 'Villager with Cartographer profession.', 127, 'Cartographer');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Cleric', '/icons/job site/cleric.png', '#f59e0b', '.', 'Villager with Cleric profession.', 128, 'Cleric');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Farmer', '/icons/job site/farmer.png', '#f59e0b', '.', 'Villager with Farmer profession.', 129, 'Farmer');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Fisherman', '/icons/job site/fisherman.png', '#f59e0b', '.', 'Villager with Fisherman profession.', 130, 'Fisherman');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Fletcher', '/icons/job site/fletcher.png', '#f59e0b', '.', 'Villager with Fletcher profession.', 131, 'Fletcher');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Leatherworker', '/icons/job site/leatherworker.png', '#f59e0b', '.', 'Villager with Leatherworker profession.', 132, 'Leatherworker');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Librarian', '/icons/job site/librarian.png', '#f59e0b', '.', 'Villager with Librarian profession.', 133, 'Librarian');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Mason', '/icons/job site/mason.png', '#f59e0b', '.', 'Villager with Mason profession.', 134, 'Mason');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Shepherd', '/icons/job site/shepherd.png', '#f59e0b', '.', 'Villager with Shepherd profession.', 135, 'Shepherd');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Toolsmith', '/icons/job site/toolsmith.png', '#f59e0b', '.', 'Villager with Toolsmith profession.', 136, 'Toolsmith');
INSERT OR IGNORE INTO CATEGORIES (name, icon, color, link, description, priority, variant)
VALUES ('Profession - Weaponsmith', '/icons/job site/weaponsmith.png', '#f59e0b', '.', 'Villager with Weaponsmith profession.', 137, 'Weaponsmith');

-- ============================================================
-- MOB BASE
-- ============================================================

INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Allay', '/data/Allay.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Blaze', '/data/Blaze.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Breeze', '/data/Breeze.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('CaveSpider', '/data/CaveSpider.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Cod', '/data/Cod.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Creaking', '/data/Creaking.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ElderGuardian', '/data/ElderGuardian.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('EnderDragon', '/data/EnderDragon.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Endermite', '/data/Endermite.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Ghast', '/data/Ghast.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Guardian', '/data/Guardian.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Parched', '/data/Parched.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Phantom', '/data/Phantom.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('PiglinBrute', '/data/PiglinBrute.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Pufferfish', '/data/Pufferfish.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Shulker', '/data/Shulker.webp', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Silverfish', '/data/Silverfish.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Skeleton', '/data/Skeleton.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Stray', '/data/Stray.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('SulfurCube', '/data/SulfurCube.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Tadpole', '/data/Tadpole.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Vex', '/data/Vex_F.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('WanderingTrader', '/data/WanderingTrader_F.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Warden', '/data/Warden.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Witch', '/data/Witch.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Wither', '/data/Wither.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('WitherSkeleton', '/data/WitherSkeleton.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Armadillo', '/data/armadillo/1.1Armadillo.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Bat', '/data/bat/1.1Bat.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Bee', '/data/bee/1.1Bee.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Bogged', '/data/bogged/1Bogged.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Camel', '/data/camel/1.1Camel.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('CamelHusk', '/data/camel husk/1.1CamelHusk.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('CatTabby', '/data/cat/1.2CatTabby.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Creeper', '/data/creeper/1Creeper.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Dolphin', '/data/dolphin/Dolphin.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Donkey', '/data/donkey/1Donkey.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Drowned', '/data/drowned/1.1Drowned.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Enderman', '/data/enderman/1Enderman.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Evoker', '/data/evoker/1.1Evoker.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Fox', '/data/fox/1Fox.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Frostbite', '/data/frostbite/Frostbite.webp', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('GlowSquid', '/data/glow squid/GlowSquid.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Goat', '/data/goat/1.1Goat.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Ghastling', '/data/happy ghast/Ghastling_C.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Hoglin', '/data/hoglin/1.1Hoglin.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Husk', '/data/husk/Husk.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('IronGolem', '/data/iron golem/1IronGolem.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('IronGolemLow', '/data/iron golem/2IronGolemLow.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('IronGolemMedium', '/data/iron golem/3IronGolemMedium.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('IronGolemHigh', '/data/iron golem/4IronGolemHigh.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Mule', '/data/mule/1Mule.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Nautilus', '/data/nautilus/1.1Nautilus.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Ocelot', '/data/ocelot/Ocelot.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Panda', '/data/panda/1Panda.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Piglin', '/data/piglin/1.1Piglin_B.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Pillager', '/data/pillager/1.1Pillager.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('PolarBear', '/data/polar bear/PolarBear.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Ravager', '/data/ravager/1.1Ravager.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('SkeletonHorse', '/data/skeleton horse/1.1SkeletonHorse.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Sniffer', '/data/sniffer/Sniffer.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('SnowGolem', '/data/snow golem/1SnowGolem.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ChickenJockey_PJ', '/data/special/pumpkin/1.2ChickenJockey_PJ.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Drowned_PB', '/data/special/pumpkin/1.2Drowned_PB.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Husk_PB', '/data/special/pumpkin/1.2Husk_PB.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('SpiderJockey_PJ', '/data/special/pumpkin/1.2SpiderJockey_PJ.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombieVillager', '/data/special/pumpkin/1.2ZombieVillager_P.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombieVillager_PB', '/data/special/pumpkin/1.2ZombieVillager_PB.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Zombie', '/data/zombie/Zombie.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Zombie_PB', '/data/special/pumpkin/1.2Zombie_PB.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombifiedPiglin', '/data/zombified piglin/1.1ZombifiedPiglin.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombifiedPiglin_PB', '/data/special/pumpkin/1.2ZombifiedPiglin_PB.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Spider', '/data/spider/1.1Spider.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Squid', '/data/squid/Squid.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Strider', '/data/strider/1.1Strider.gif', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Turtle', '/data/turtle/Turtle.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('', '/data/zombie villager/7.9.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Desert_CF', '/data/villager/Villager-Desert_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Jungle_CF', '/data/villager/Villager-Jungle_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Plains_CF', '/data/villager/Villager-Plains_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Savanna_CF', '/data/villager/Villager-Savanna_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Snowy_CF', '/data/villager/Villager-Snowy_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Swamp_CF', '/data/villager/Villager-Swamp_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Villager-Taiga_CF', '/data/villager/Villager-Taiga_CF.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Vindicator', '/data/vindicator/1.1Vindicator.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('Zoglin', '/data/zoglin/Zoglin.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombieHorse', '/data/zombie horse/1.1ZombieHorse_BU.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombieHorse-man', '/data/zombie horse/ZombieHorse-man_J.png', '.', '.');
INSERT OR IGNORE INTO MOBS (name, img, link, description)
VALUES ('ZombieNautilus', '/data/zombie nautilus/1.1ZombieNautilus.gif', '.', '.');

-- Totale mob base: 89

-- ============================================================
-- VARIANTI
-- ============================================================

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo-RolledUp', '/data/armadillo/2.2Armadillo-RolledUp.gif', '.', '.', id
FROM MOBS WHERE name = 'Armadillo' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Armadillo-RolledUp', '/data/armadillo/2.2Armadillo-RolledUp_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Armadillo' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Lucy', '/data/axolotl/1Axolotl-Lucy.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Lucy', '/data/axolotl/1Axolotl-Lucy_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Wild', '/data/axolotl/2Axolotl-Wild.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Wild', '/data/axolotl/2Axolotl-Wild_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Gold', '/data/axolotl/3Axolotl-Gold.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Gold', '/data/axolotl/3Axolotl-Gold_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Cyan', '/data/axolotl/4Axolotl-Cyan.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Cyan', '/data/axolotl/4Axolotl-Cyan_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Blue', '/data/axolotl/5Axolotl-Blue.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Axolotl-Blue', '/data/axolotl/5Axolotl-Blue_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Axolotl' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bat-Hang', '/data/bat/2.2Bat-Hang.png', '.', '.', id
FROM MOBS WHERE name = 'Bat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee-Nectar', '/data/bee/1.2Bee-Nectar.gif', '.', '.', id
FROM MOBS WHERE name = 'Bee' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bee-Nectar', '/data/bee/1.2Bee-Nectar_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Bee' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Bogged-Sheared', '/data/bogged/2Bogged-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Bogged' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel-Sitting', '/data/camel/1.2Camel-Sitting.png', '.', '.', id
FROM MOBS WHERE name = 'Camel' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel-Sitting', '/data/camel/1.2Camel-Sitting_A.png', '.', '.', id
FROM MOBS WHERE name = 'Camel' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel-Saddled', '/data/camel/2.1Camel-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Camel' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Camel-Sitting-Saddled', '/data/camel/2.2Camel-Sitting-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'Camel' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Sitting', '/data/camel husk/1.2CamelHusk-Sitting.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Saddled', '/data/camel husk/2.1CamelHusk-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Sitting-Saddled', '/data/camel husk/2.2CamelHusk-Sitting-Saddled_T.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Jockey', '/data/camel husk/3.1CamelHusk-Jockey_J.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Jockey-(Husk)_TJ', '/data/camel husk/3.2CamelHusk-Jockey-(Husk)_TJ.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CamelHusk-Jockey-(Parched)_TJ', '/data/camel husk/3.3CamelHusk-Jockey-(Parched)_TJ.png', '.', '.', id
FROM MOBS WHERE name = 'CamelHusk' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CatTabby-Tamed', '/data/cat/1.1CatTabby-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'CatTabby' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CatTabby-Tamed', '/data/cat/1.1CatTabby-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'CatTabby' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Jellie-Tamed', '/data/cat/10.1Cat-Jellie-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Jellie-Tamed', '/data/cat/10.1Cat-Jellie-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Jellie', '/data/cat/10.2Cat-Jellie.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Jellie', '/data/cat/10.2Cat-Jellie_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Black-Tamed', '/data/cat/11.1Cat-Black-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Black-Tamed', '/data/cat/11.1Cat-Black-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Black', '/data/cat/11.2Cat-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Black', '/data/cat/11.2Cat-Black_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Tuxedo-Tamed', '/data/cat/2.1Cat-Tuxedo-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Tuxedo-Tamed', '/data/cat/2.1Cat-Tuxedo-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Tuxedo', '/data/cat/2.2Cat-Tuxedo.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Tuxedo', '/data/cat/2.2Cat-Tuxedo_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Red-Tamed', '/data/cat/3.1Cat-Red-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Red-Tamed', '/data/cat/3.1Cat-Red-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Red', '/data/cat/3.2Cat-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Red', '/data/cat/3.2Cat-Red_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Siamese-Tamed', '/data/cat/4.1Cat-Siamese-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Siamese-Tamed', '/data/cat/4.1Cat-Siamese-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Siamese', '/data/cat/4.2Cat-Siamese.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Siamese', '/data/cat/4.2Cat-Siamese_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-BritishShorthair-Tamed', '/data/cat/5.1Cat-BritishShorthair-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-BritishShorthair-Tamed', '/data/cat/5.1Cat-BritishShorthair-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-BritishShorthair', '/data/cat/5.2Cat-BritishShorthair.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-BritishShorthair', '/data/cat/5.2Cat-BritishShorthair_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Calico-Tamed', '/data/cat/6.1Cat-Calico-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Calico-Tamed', '/data/cat/6.1Cat-Calico-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Calico', '/data/cat/6.2Cat-Calico.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Calico', '/data/cat/6.2Cat-Calico_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Persian-Tamed', '/data/cat/7.1Cat-Persian-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Persian-Tamed', '/data/cat/7.1Cat-Persian-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Persian', '/data/cat/7.2Cat-Persian.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Persian', '/data/cat/7.2Cat-Persian_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Ragdoll-Tamed', '/data/cat/8.1Cat-Ragdoll-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Ragdoll-Tamed', '/data/cat/8.1Cat-Ragdoll-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Ragdoll', '/data/cat/8.2Cat-Ragdoll.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-Ragdoll', '/data/cat/8.2Cat-Ragdoll_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-White-Tamed', '/data/cat/9.1Cat-White-Tamed.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-White-Tamed', '/data/cat/9.1Cat-White-Tamed_AT.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-White', '/data/cat/9.2Cat-White.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cat-White', '/data/cat/9.2Cat-White_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Temperate', '/data/chicken/1Chicken-Temperate.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Temperate', '/data/chicken/1Chicken-Temperate_A.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Cold', '/data/chicken/2Chicken-Cold.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Cold', '/data/chicken/2Chicken-Cold_A.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Warm', '/data/chicken/3Chicken-Warm.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Chicken-Warm', '/data/chicken/3Chicken-Warm_A.png', '.', '.', id
FROM MOBS WHERE name = 'Chicken' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-Zombie', '/data/chicken jockey/1.2ChickenJockey-Temperate-Zombie_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-Husk', '/data/chicken jockey/1.3ChickenJockey-Temperate-Husk_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-Drowned', '/data/chicken jockey/1.4ChickenJockey-Temperate-Drowned_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-ZombieVillager', '/data/chicken jockey/1.5ChickenJockey-Temperate-ZombieVillager_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-ZombifiedPiglin', '/data/chicken jockey/1.6ChickenJockey-Temperate-ZombifiedPiglin_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Temperate-Frostbite', '/data/chicken jockey/1.7ChickenJockey-Temperate-Frostbite_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-Zombie', '/data/chicken jockey/2.2ChickenJockey-Warm-Zombie_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-Husk', '/data/chicken jockey/2.3ChickenJockey-Warm-Husk_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-Drowned', '/data/chicken jockey/2.4ChickenJockey-Warm-Drowned_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-ZombieVillager', '/data/chicken jockey/2.5ChickenJockey-Warm-ZombieVillager_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-ZombifiedPiglin', '/data/chicken jockey/2.6ChickenJockey-Warm-ZombifiedPiglin_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Warm-Frostbite', '/data/chicken jockey/2.7ChickenJockey-Warm-Frostbite_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-Zombie', '/data/chicken jockey/3.2ChickenJockey-Cold-Zombie_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-Husk', '/data/chicken jockey/3.3ChickenJockey-Cold-Husk_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-Drowned', '/data/chicken jockey/3.4ChickenJockey-Cold-Drowned_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-ZombieVillager', '/data/chicken jockey/3.5ChickenJockey-Cold-ZombieVillager_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-ZombifiedPiglin', '/data/chicken jockey/3.6ChickenJockey-Cold-ZombifiedPiglin_B.png', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ChickenJockey-Cold-Frostbite', '/data/chicken jockey/3.7ChickenJockey-Cold-Frostbite_B.webp', '.', '.', id
FROM MOBS WHERE name = 'ChickenJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Unoxidized', '/data/copper golem/1.1CopperGolem-Unoxidized.gif', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Unoxidized-Poppy', '/data/copper golem/1.2CopperGolem-Unoxidized-Poppy.png', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Exposed', '/data/copper golem/2.1CopperGolem-Exposed.gif', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Exposed-Poppy', '/data/copper golem/2.2CopperGolem-Exposed-Poppy.png', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Weathered', '/data/copper golem/3.1CopperGolem-Weathered.gif', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Weathered-Poppy', '/data/copper golem/3.2CopperGolem-Weathered-Poppy.png', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Oxidized', '/data/copper golem/4.1CopperGolem-Oxidized.gif', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'CopperGolem-Oxidized-Poppy', '/data/copper golem/4.2CopperGolem-Oxidized-Poppy.png', '.', '.', id
FROM MOBS WHERE name = 'CopperGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Temperate', '/data/cow/1Cow-Temperate.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Temperate', '/data/cow/1Cow-Temperate_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Cold', '/data/cow/2Cow-Cold.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Cold', '/data/cow/2Cow-Cold_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Warm', '/data/cow/3Cow-Warm.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Cow-Warm', '/data/cow/3Cow-Warm_A.png', '.', '.', id
FROM MOBS WHERE name = 'Cow' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Creeper-Charged', '/data/creeper/2Creeper-Charged.webp', '.', '.', id
FROM MOBS WHERE name = 'Creeper' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey-Saddled', '/data/donkey/2Donkey-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'Donkey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey-Chested', '/data/donkey/3Donkey-Chested.png', '.', '.', id
FROM MOBS WHERE name = 'Donkey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Donkey-Saddled-Chested', '/data/donkey/4Donkey-Saddled-Chested.png', '.', '.', id
FROM MOBS WHERE name = 'Donkey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned-Trident', '/data/drowned/1.2Drowned-Trident.png', '.', '.', id
FROM MOBS WHERE name = 'Drowned' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned-FishingRod', '/data/drowned/1.3Drowned-FishingRod.png', '.', '.', id
FROM MOBS WHERE name = 'Drowned' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned-Nautilus', '/data/drowned/1.3Drowned-Nautilus_T.png', '.', '.', id
FROM MOBS WHERE name = 'Drowned' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Drowned-NautilusTrident', '/data/drowned/1.4Drowned-NautilusTrident.png', '.', '.', id
FROM MOBS WHERE name = 'Drowned' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Melon', '/data/enderman/10Enderman-Holding-Melon_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Mud', '/data/enderman/11Enderman-Holding-Mud_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Mycelium', '/data/enderman/12Enderman-Holding-Mycelium_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Podzol', '/data/enderman/13Enderman-Holding-Podzol_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Pumpkin', '/data/enderman/14Enderman-Holding-Pumpkin_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Red-sand', '/data/enderman/15Enderman-Holding-Red-sand_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-carved-pumpkin', '/data/enderman/16Enderman-Holding-carved-pumpkin_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-pale-moss-block', '/data/enderman/17Enderman-Holding-pale-moss-block_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-crimson-nylium', '/data/enderman/18Enderman-Holding-crimson-nylium_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-warped-nylium', '/data/enderman/19Enderman-Holding-warped-nylium_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-muddy-mangrove-roots', '/data/enderman/20Enderman-Holding-muddy-mangrove-roots_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-moss-block', '/data/enderman/21Enderman-Holding-moss-block_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-crimson-roots', '/data/enderman/22Enderman-Holding-crimson-roots_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-warped-roots', '/data/enderman/23Enderman-Holding-warped-roots_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-cactus-flower', '/data/enderman/24Enderman-Holding-cactus-flower_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-coarse-dirt', '/data/enderman/25Enderman-Holding-coarse-dirt_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-rooted-dirt', '/data/enderman/26Enderman-Holding-rooted-dirt_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-mushroom', '/data/enderman/27Enderman-Holding-mushroom_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-brown-mushroom', '/data/enderman/28Enderman-Holding-brown-mushroom_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-crimson-fungus', '/data/enderman/29Enderman-Holding-crimson-fungus_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Sand', '/data/enderman/2Enderman-Holding-Sand.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-warped-fungus', '/data/enderman/30Enderman-Holding-warped-fungus_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-allium', '/data/enderman/31Enderman-Holding-allium_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-azure-bluet', '/data/enderman/32Enderman-Holding-azure-bluet_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-blue-orchid', '/data/enderman/33Enderman-Holding-blue-orchid_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-closed-eyeblossom', '/data/enderman/34Enderman-Holding-closed-eyeblossom_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-cornflower', '/data/enderman/35Enderman-Holding-cornflower_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-golden-dandelion', '/data/enderman/36Enderman-Holding-golden-dandelion_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-lily-of-the-valley', '/data/enderman/37Enderman-Holding-lily-of-the-valley_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-open-eyeblossom', '/data/enderman/38Enderman-Holding-open-eyeblossom_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-orange-tulip', '/data/enderman/39Enderman-Holding-orange-tulip_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Cactus', '/data/enderman/3Enderman-Holding-Cactus.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-oxeye-daisy', '/data/enderman/40Enderman-Holding-oxeye-daisy_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-pink-tulip', '/data/enderman/41Enderman-Holding-pink-tulip_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-poppy', '/data/enderman/42Enderman-Holding-poppy_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-red-tulip', '/data/enderman/43Enderman-Holding-red-tulip_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-torchflower', '/data/enderman/44Enderman-Holding-torchflower_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-white-tulip', '/data/enderman/45Enderman-Holding-white-tulip_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-wither-rose', '/data/enderman/46Enderman-Holding-wither-rose_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Tnt', '/data/enderman/4Enderman-Holding-Tnt.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Grass', '/data/enderman/5Enderman-Holding-Grass.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Dandelion', '/data/enderman/6Enderman-Holding-Dandelion.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Clay', '/data/enderman/7Enderman-Holding-Clay_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Dirt', '/data/enderman/8Enderman-Holding-Dirt_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Enderman-Holding-Gravel', '/data/enderman/9Enderman-Holding-Gravel_T.png', '.', '.', id
FROM MOBS WHERE name = 'Enderman' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Evoker-Banner', '/data/evoker/1.2Evoker-Banner.png', '.', '.', id
FROM MOBS WHERE name = 'Evoker' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox-Snow', '/data/fox/2Fox-Snow.png', '.', '.', id
FROM MOBS WHERE name = 'Fox' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Fox-Snow', '/data/fox/2Fox-Snow_A.png', '.', '.', id
FROM MOBS WHERE name = 'Fox' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog-Temperate', '/data/frog/1Frog-Temperate.gif', '.', '.', id
FROM MOBS WHERE name = 'Frog' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog-Warm', '/data/frog/2Frog-Warm.gif', '.', '.', id
FROM MOBS WHERE name = 'Frog' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Frog-Cold', '/data/frog/3Frog-Cold.gif', '.', '.', id
FROM MOBS WHERE name = 'Frog' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Left', '/data/goat/1.2Goat-Left.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Right', '/data/goat/1.3Goat-Right.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-NoHorns', '/data/goat/1.4Goat-NoHorns.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Screaming', '/data/goat/2.1Goat-Screaming.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Screaming', '/data/goat/2.1Goat-Screaming_A.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Left-Screaming', '/data/goat/2.2Goat-Left-Screaming.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-Right-Screaming', '/data/goat/2.3Goat-Right-Screaming.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Goat-NoHorns-Screaming', '/data/goat/3.4Goat-NoHorns-Screaming.png', '.', '.', id
FROM MOBS WHERE name = 'Goat' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'HappyGhast', '/data/happy ghast/1.1.1HappyGhast.gif', '.', '.', id
FROM MOBS WHERE name = 'HappyGhast' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.10.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.11.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.12.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.13.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.14.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.15.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.16.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.17.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.2.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.3.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.4.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.5.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.6.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.7.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.8.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.2.9.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/happy ghast/1.3.16.gif', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin-Jockey-1_AJ', '/data/hoglin/1.2Hoglin-Jockey-1_AJ.png', '.', '.', id
FROM MOBS WHERE name = 'Hoglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin-Jockey-2_AJ', '/data/hoglin/1.3Hoglin-Jockey-2_AJ.png', '.', '.', id
FROM MOBS WHERE name = 'Hoglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Hoglin-Jockey-3_AJ', '/data/hoglin/1.4Hoglin-Jockey-3_AJ.png', '.', '.', id
FROM MOBS WHERE name = 'Hoglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.1.2.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.1.3.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/1.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.1.10.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.1.14_T.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/2.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.1.9.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/3.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.1.6.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.1.7_T.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/4.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.1.13_T.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.1.4.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.4.11.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.4.12_T.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/5.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.1.5.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/6.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.1.8.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.2.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.2.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.3.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.3.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.4.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.4.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.5.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/horse/7.5.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Magenta', '/data/llama/1.1.10Llama-Brown-Magenta.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Orange', '/data/llama/1.1.11Llama-Brown-Orange.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Pink', '/data/llama/1.1.12Llama-Brown-Pink.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Purple', '/data/llama/1.1.13Llama-Brown-Purple.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Red', '/data/llama/1.1.14Llama-Brown-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Silver', '/data/llama/1.1.15Llama-Brown-Silver.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-White', '/data/llama/1.1.16Llama-Brown-White.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Yellow', '/data/llama/1.1.17Llama-Brown-Yellow.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown', '/data/llama/1.1.1Llama-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown', '/data/llama/1.1.1Llama-Brown_A.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Black', '/data/llama/1.1.2Llama-Brown-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Blue', '/data/llama/1.1.3Llama-Brown-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Brown', '/data/llama/1.1.4Llama-Brown-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Cyan', '/data/llama/1.1.5Llama-Brown-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Gray', '/data/llama/1.1.6Llama-Brown-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Green', '/data/llama/1.1.7Llama-Brown-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-LightBlue', '/data/llama/1.1.8Llama-Brown-LightBlue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Lime', '/data/llama/1.1.9Llama-Brown-Lime.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Magenta-Chest', '/data/llama/1.2.10Llama-Brown-Magenta-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Orange-Chest', '/data/llama/1.2.11Llama-Brown-Orange-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Pink-Chest', '/data/llama/1.2.12Llama-Brown-Pink-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Purple-Chest', '/data/llama/1.2.13Llama-Brown-Purple-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Red-Chest', '/data/llama/1.2.14Llama-Brown-Red-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Silver-Chest', '/data/llama/1.2.15Llama-Brown-Silver-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-White-Chest', '/data/llama/1.2.16Llama-Brown-White-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Yellow-Chest', '/data/llama/1.2.17Llama-Brown-Yellow-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Chest', '/data/llama/1.2.1Llama-Brown-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Black-Chest', '/data/llama/1.2.2Llama-Brown-Black-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Blue-Chest', '/data/llama/1.2.3Llama-Brown-Blue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Brown-Chest', '/data/llama/1.2.4Llama-Brown-Brown-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Cyan-Chest', '/data/llama/1.2.5Llama-Brown-Cyan-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Gray-Chest', '/data/llama/1.2.6Llama-Brown-Gray-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Green-Chest', '/data/llama/1.2.7Llama-Brown-Green-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-LightBlue-Chest', '/data/llama/1.2.8Llama-Brown-LightBlue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Brown-Lime-Chest', '/data/llama/1.2.9Llama-Brown-Lime-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Magenta', '/data/llama/2.1.10Llama-Creamy-Magenta.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Orange', '/data/llama/2.1.11Llama-Creamy-Orange.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Pink', '/data/llama/2.1.12Llama-Creamy-Pink.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Purple', '/data/llama/2.1.13Llama-Creamy-Purple.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Red', '/data/llama/2.1.14Llama-Creamy-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Silver', '/data/llama/2.1.15Llama-Creamy-Silver.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-White', '/data/llama/2.1.16Llama-Creamy-White.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Yellow', '/data/llama/2.1.17Llama-Creamy-Yellow.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy', '/data/llama/2.1.1Llama-Creamy.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy', '/data/llama/2.1.1Llama-Creamy_A.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Black', '/data/llama/2.1.2Llama-Creamy-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Blue', '/data/llama/2.1.3Llama-Creamy-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Brown', '/data/llama/2.1.4Llama-Creamy-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Cyan', '/data/llama/2.1.5Llama-Creamy-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Gray', '/data/llama/2.1.6Llama-Creamy-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Green', '/data/llama/2.1.7Llama-Creamy-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-LightBlue', '/data/llama/2.1.8Llama-Creamy-LightBlue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Lime', '/data/llama/2.1.9Llama-Creamy-Lime.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Magenta-Chest', '/data/llama/2.2.10Llama-Creamy-Magenta-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Orange-Chest', '/data/llama/2.2.11Llama-Creamy-Orange-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Pink-Chest', '/data/llama/2.2.12Llama-Creamy-Pink-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Purple-Chest', '/data/llama/2.2.13Llama-Creamy-Purple-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Red-Chest', '/data/llama/2.2.14Llama-Creamy-Red-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Silver-Chest', '/data/llama/2.2.15Llama-Creamy-Silver-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-White-Chest', '/data/llama/2.2.16Llama-Creamy-White-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Yellow-Chest', '/data/llama/2.2.17Llama-Creamy-Yellow-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Chest', '/data/llama/2.2.1Llama-Creamy-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Black-Chest', '/data/llama/2.2.2Llama-Creamy-Black-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Blue-Chest', '/data/llama/2.2.3Llama-Creamy-Blue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Brown-Chest', '/data/llama/2.2.4Llama-Creamy-Brown-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Cyan-Chest', '/data/llama/2.2.5Llama-Creamy-Cyan-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Gray-Chest', '/data/llama/2.2.6Llama-Creamy-Gray-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Green-Chest', '/data/llama/2.2.7Llama-Creamy-Green-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-LightBlue-Chest', '/data/llama/2.2.8Llama-Creamy-LightBlue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Creamy-Lime-Chest', '/data/llama/2.2.9Llama-Creamy-Lime-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Magenta', '/data/llama/3.1.10Llama-Gray-Magenta.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Orange', '/data/llama/3.1.11Llama-Gray-Orange.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Pink', '/data/llama/3.1.12Llama-Gray-Pink.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Purple', '/data/llama/3.1.13Llama-Gray-Purple.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Red', '/data/llama/3.1.14Llama-Gray-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Silver', '/data/llama/3.1.15Llama-Gray-Silver.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-White', '/data/llama/3.1.16Llama-Gray-White.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Yellow', '/data/llama/3.1.17Llama-Gray-Yellow.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray', '/data/llama/3.1.1Llama-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray', '/data/llama/3.1.1Llama-Gray_A.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Black', '/data/llama/3.1.2Llama-Gray-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Blue', '/data/llama/3.1.3Llama-Gray-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Brown', '/data/llama/3.1.4Llama-Gray-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Cyan', '/data/llama/3.1.5Llama-Gray-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Gray', '/data/llama/3.1.6Llama-Gray-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Green', '/data/llama/3.1.7Llama-Gray-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-LightBlue', '/data/llama/3.1.8Llama-Gray-LightBlue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Lime', '/data/llama/3.1.9Llama-Gray-Lime.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Magenta-Chest', '/data/llama/3.2.10Llama-Gray-Magenta-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Orange-Chest', '/data/llama/3.2.11Llama-Gray-Orange-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Pink-Chest', '/data/llama/3.2.12Llama-Gray-Pink-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Purple-Chest', '/data/llama/3.2.13Llama-Gray-Purple-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Red-Chest', '/data/llama/3.2.14Llama-Gray-Red-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Silver-Chest', '/data/llama/3.2.15Llama-Gray-Silver-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-White-Chest', '/data/llama/3.2.16Llama-Gray-White-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Yellow-Chest', '/data/llama/3.2.17Llama-Gray-Yellow-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Chest', '/data/llama/3.2.1Llama-Gray-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Black-Chest', '/data/llama/3.2.2Llama-Gray-Black-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Blue-Chest', '/data/llama/3.2.3Llama-Gray-Blue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Brown-Chest', '/data/llama/3.2.4Llama-Gray-Brown-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Cyan-Chest', '/data/llama/3.2.5Llama-Gray-Cyan-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Gray-Chest', '/data/llama/3.2.6Llama-Gray-Gray-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Green-Chest', '/data/llama/3.2.7Llama-Gray-Green-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-LightBlue-Chest', '/data/llama/3.2.8Llama-Gray-LightBlue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-Gray-Lime-Chest', '/data/llama/3.2.9Llama-Gray-Lime-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Magenta', '/data/llama/4.1.10Llama-White-Magenta.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Orange', '/data/llama/4.1.11Llama-White-Orange.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Pink', '/data/llama/4.1.12Llama-White-Pink.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Purple', '/data/llama/4.1.13Llama-White-Purple.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Red', '/data/llama/4.1.14Llama-White-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Silver', '/data/llama/4.1.15Llama-White-Silver.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-White', '/data/llama/4.1.16Llama-White-White.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Yellow', '/data/llama/4.1.17Llama-White-Yellow.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White', '/data/llama/4.1.1Llama-White.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White', '/data/llama/4.1.1Llama-White_A.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Black', '/data/llama/4.1.2Llama-White-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Blue', '/data/llama/4.1.3Llama-White-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Brown', '/data/llama/4.1.4Llama-White-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Cyan', '/data/llama/4.1.5Llama-White-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Gray', '/data/llama/4.1.6Llama-White-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Green', '/data/llama/4.1.7Llama-White-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-LightBlue', '/data/llama/4.1.8Llama-White-LightBlue.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Lime', '/data/llama/4.1.9Llama-White-Lime.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Magenta-Chest', '/data/llama/4.2.10Llama-White-Magenta-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Orange-Chest', '/data/llama/4.2.11Llama-White-Orange-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Pink-Chest', '/data/llama/4.2.12Llama-White-Pink-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Purple-Chest', '/data/llama/4.2.13Llama-White-Purple-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Red-Chest', '/data/llama/4.2.14Llama-White-Red-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Silver-Chest', '/data/llama/4.2.15Llama-White-Silver-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-White-Chest', '/data/llama/4.2.16Llama-White-White-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Yellow-Chest', '/data/llama/4.2.17Llama-White-Yellow-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Chest', '/data/llama/4.2.1Llama-White-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Black-Chest', '/data/llama/4.2.2Llama-White-Black-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Blue-Chest', '/data/llama/4.2.3Llama-White-Blue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Brown-Chest', '/data/llama/4.2.4Llama-White-Brown-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Cyan-Chest', '/data/llama/4.2.5Llama-White-Cyan-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Gray-Chest', '/data/llama/4.2.6Llama-White-Gray-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Green-Chest', '/data/llama/4.2.7Llama-White-Green-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-LightBlue-Chest', '/data/llama/4.2.8Llama-White-LightBlue-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Llama-White-Lime-Chest', '/data/llama/4.2.9Llama-White-Lime-Chest.png', '.', '.', id
FROM MOBS WHERE name = 'Llama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'MagmaCube-Medium', '/data/magma cube/1MagmaCube-Medium.gif', '.', '.', id
FROM MOBS WHERE name = 'MagmaCube' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'MagmaCube-Small', '/data/magma cube/2MagmaCube-Small.gif', '.', '.', id
FROM MOBS WHERE name = 'MagmaCube' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'MagmaCube-Big', '/data/magma cube/3MagmaCube-Big.gif', '.', '.', id
FROM MOBS WHERE name = 'MagmaCube' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom-Red', '/data/mooshroom/1Mooshroom-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Mooshroom' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom-Red', '/data/mooshroom/1Mooshroom-Red_A.png', '.', '.', id
FROM MOBS WHERE name = 'Mooshroom' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom-Brown', '/data/mooshroom/2Mooshroom-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Mooshroom' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mooshroom-Brown', '/data/mooshroom/2Mooshroom-Brown_A.png', '.', '.', id
FROM MOBS WHERE name = 'Mooshroom' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule-Saddled', '/data/mule/2Mule-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'Mule' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule-Chested', '/data/mule/3Mule-Chested.png', '.', '.', id
FROM MOBS WHERE name = 'Mule' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Mule-Saddled-Chested', '/data/mule/4Mule-Saddled-Chested.png', '.', '.', id
FROM MOBS WHERE name = 'Mule' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Copper', '/data/nautilus/1.2Nautilus-Copper.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Iron', '/data/nautilus/1.3Nautilus-Iron.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Gold', '/data/nautilus/1.4Nautilus-Gold.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Diamond', '/data/nautilus/1.5Nautilus-Diamond.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Netherite', '/data/nautilus/1.6Nautilus-Netherite.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Saddled', '/data/nautilus/2.1Nautilus-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Copper-Saddled', '/data/nautilus/2.2Nautilus-Copper-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Iron-Saddled', '/data/nautilus/2.3Nautilus-Iron-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Gold-Saddled', '/data/nautilus/2.4Nautilus-Gold-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Diamond-Saddled', '/data/nautilus/2.5Nautilus-Diamond-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Nautilus-Netherite-Saddled', '/data/nautilus/2.6Nautilus-Netherite-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Nautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Lazy', '/data/panda/2Panda-Lazy.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Lazy', '/data/panda/2Panda-Lazy_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Aggressive', '/data/panda/3Panda-Aggressive.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Aggressive', '/data/panda/3Panda-Aggressive_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Worried', '/data/panda/4Panda-Worried.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Worried', '/data/panda/4Panda-Worried_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Playful', '/data/panda/5Panda-Playful.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Playful', '/data/panda/5Panda-Playful_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Weak', '/data/panda/6Panda-Weak.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Weak', '/data/panda/6Panda-Weak_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Brown', '/data/panda/7Panda-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Panda-Brown', '/data/panda/7Panda-Brown_A.png', '.', '.', id
FROM MOBS WHERE name = 'Panda' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot-Red', '/data/parrot/1Parrot-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Parrot' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot-Blue', '/data/parrot/2Parrot-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Parrot' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot-Green', '/data/parrot/3Parrot-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Parrot' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot-Cyan', '/data/parrot/4Parrot-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Parrot' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Parrot-Gray', '/data/parrot/5Parrot-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Parrot' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Temperate', '/data/pig/1.1Pig-Temperate.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Temperate', '/data/pig/1.1Pig-Temperate_A.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Temperate-Saddle', '/data/pig/1.2Pig-Temperate-Saddle.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Cold', '/data/pig/2.1Pig-Cold.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Cold', '/data/pig/2.1Pig-Cold_A.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Cold-Saddle', '/data/pig/2.2Pig-Cold-Saddle.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Warm', '/data/pig/3.1Pig-Warm.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Warm', '/data/pig/3.1Pig-Warm_A.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pig-Warm-Saddle', '/data/pig/3.2Pig-Warm-Saddle.png', '.', '.', id
FROM MOBS WHERE name = 'Pig' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin-Sword', '/data/piglin/1.1Piglin-Sword.gif', '.', '.', id
FROM MOBS WHERE name = 'Piglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin-Crossbow', '/data/piglin/1.2Piglin-Crossbow.gif', '.', '.', id
FROM MOBS WHERE name = 'Piglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Piglin-Spear', '/data/piglin/1.3Piglin-Spear.png', '.', '.', id
FROM MOBS WHERE name = 'Piglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager-NoCrossbow', '/data/pillager/1.2Pillager-NoCrossbow.png', '.', '.', id
FROM MOBS WHERE name = 'Pillager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager-Banner', '/data/pillager/1.3Pillager-Banner.png', '.', '.', id
FROM MOBS WHERE name = 'Pillager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Pillager-NoCrossbow-Banner', '/data/pillager/1.4Pillager-NoCrossbow-Banner_T.png', '.', '.', id
FROM MOBS WHERE name = 'Pillager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Brown', '/data/rabbit/1Rabbit-Brown.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Brown', '/data/rabbit/1Rabbit-Brown_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-White', '/data/rabbit/2Rabbit-White.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-White', '/data/rabbit/2Rabbit-White_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Black', '/data/rabbit/3Rabbit-Black.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Black', '/data/rabbit/3Rabbit-Black_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Gold', '/data/rabbit/4Rabbit-Gold.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Gold', '/data/rabbit/4Rabbit-Gold_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Salt', '/data/rabbit/5Rabbit-Salt.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Salt', '/data/rabbit/5Rabbit-Salt_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-WhiteSplotched', '/data/rabbit/6Rabbit-WhiteSplotched.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-WhiteSplotched', '/data/rabbit/6Rabbit-WhiteSplotched_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Toast', '/data/rabbit/7Rabbit-Toast.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Toast', '/data/rabbit/7Rabbit-Toast_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Killer_AU', '/data/rabbit/8Rabbit-Killer_AU.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Rabbit-Killer', '/data/rabbit/8Rabbit-Killer_U.gif', '.', '.', id
FROM MOBS WHERE name = 'Rabbit' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Pillager)', '/data/ravager/2.1Ravager-Jockey(Pillager)_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Pillager)-Banner', '/data/ravager/2.2Ravager-Jockey(Pillager)-Banner_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Vindicator)', '/data/ravager/3.1Ravager-Jockey(Vindicator)_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Vindicator)-Banner', '/data/ravager/3.2Ravager-Jockey(Vindicator)-Banner_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Evoker)', '/data/ravager/4.1Ravager-Jockey(Evoker)_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Ravager-Jockey(Evoker)-Banner', '/data/ravager/4.2Ravager-Jockey(Evoker)-Banner_J.png', '.', '.', id
FROM MOBS WHERE name = 'Ravager' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon-Normal', '/data/salmon/1.1Salmon-Normal.gif', '.', '.', id
FROM MOBS WHERE name = 'Salmon' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon-Small', '/data/salmon/1.2Salmon-Small.gif', '.', '.', id
FROM MOBS WHERE name = 'Salmon' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Salmon-Large', '/data/salmon/1.3Salmon-Large.gif', '.', '.', id
FROM MOBS WHERE name = 'Salmon' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Green', '/data/sheep/1.1.10Sheep-Green.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Green', '/data/sheep/1.1.10Sheep-Green_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Cyan', '/data/sheep/1.1.11Sheep-Cyan.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Cyan', '/data/sheep/1.1.11Sheep-Cyan_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Cyan', '/data/sheep/1.1.12Sheep-Cyan_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-LightBlue', '/data/sheep/1.1.12Sheep-LightBlue.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Blue', '/data/sheep/1.1.13Sheep-Blue.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Blue', '/data/sheep/1.1.13Sheep-Blue_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Purple', '/data/sheep/1.1.14Sheep-Purple.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Purple', '/data/sheep/1.1.14Sheep-Purple_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Magenta', '/data/sheep/1.1.15Sheep-Magenta.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Magenta', '/data/sheep/1.1.15Sheep-Magenta_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Pink', '/data/sheep/1.1.16Sheep-Pink.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Pink', '/data/sheep/1.1.16Sheep-Pink_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-jeb_', '/data/sheep/1.1.17Sheep-jeb_.webp', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-jeb_', '/data/sheep/1.1.17Sheep-jeb__A.webp', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-White', '/data/sheep/1.1.1Sheep-White.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-White', '/data/sheep/1.1.1Sheep-White_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-LightGray', '/data/sheep/1.1.2Sheep-LightGray.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-LightGray', '/data/sheep/1.1.2Sheep-LightGray_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Gray', '/data/sheep/1.1.3Sheep-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Gray', '/data/sheep/1.1.3Sheep-Gray_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Black', '/data/sheep/1.1.4Sheep-Black.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Black', '/data/sheep/1.1.4Sheep-Black_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Brown', '/data/sheep/1.1.5Sheep-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Brown', '/data/sheep/1.1.5Sheep-Brown_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Red', '/data/sheep/1.1.6Sheep-Red.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Red', '/data/sheep/1.1.6Sheep-Red_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Orange', '/data/sheep/1.1.7Sheep-Orange.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Orange', '/data/sheep/1.1.7Sheep-Orange_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Yellow', '/data/sheep/1.1.8Sheep-Yellow.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Yellow', '/data/sheep/1.1.8Sheep-Yellow_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Lime', '/data/sheep/1.1.9Sheep-Lime.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Lime', '/data/sheep/1.1.9Sheep-Lime_A.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Green-Sheared', '/data/sheep/1.2.10Sheep-Green-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Cyan-Sheared', '/data/sheep/1.2.11Sheep-Cyan-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-LightBlue-Sheared', '/data/sheep/1.2.12Sheep-LightBlue-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Blue-Sheared', '/data/sheep/1.2.13Sheep-Blue-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Purple-Sheared', '/data/sheep/1.2.14Sheep-Purple-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Magenta-Sheared', '/data/sheep/1.2.15Sheep-Magenta-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Pink-Sheared', '/data/sheep/1.2.16Sheep-Pink-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-jeb_-Sheared', '/data/sheep/1.2.17Sheep-jeb_-Sheared.webp', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-White-Sheared', '/data/sheep/1.2.1Sheep-White-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-LightGray-Sheared', '/data/sheep/1.2.2Sheep-LightGray-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Gray-Sheared', '/data/sheep/1.2.3Sheep-Gray-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Black-Sheared', '/data/sheep/1.2.4Sheep-Black-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Brown-Sheared', '/data/sheep/1.2.5Sheep-Brown-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Red-Sheared', '/data/sheep/1.2.6Sheep-Red-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Orange-Sheared', '/data/sheep/1.2.7Sheep-Orange-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Yellow-Sheared', '/data/sheep/1.2.8Sheep-Yellow-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Sheep-Lime-Sheared', '/data/sheep/1.2.9Sheep-Lime-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'Sheep' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SkeletonHorse-Saddled', '/data/skeleton horse/1.2SkeletonHorse-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'SkeletonHorse' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SkeletonHorse-man', '/data/skeleton horse/2.1SkeletonHorse-man_J.png', '.', '.', id
FROM MOBS WHERE name = 'SkeletonHorse' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SkeletonHorse-man-Stray', '/data/skeleton horse/2.2SkeletonHorse-man-Stray_J.png', '.', '.', id
FROM MOBS WHERE name = 'SkeletonHorse' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SkeletonHorse-man-WitherSkeleton_JU', '/data/skeleton horse/2.3SkeletonHorse-man-WitherSkeleton_JU.png', '.', '.', id
FROM MOBS WHERE name = 'SkeletonHorse' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime-Semi-large', '/data/slime/1Slime-Semi-large.gif', '.', '.', id
FROM MOBS WHERE name = 'Slime' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime-Big', '/data/slime/2Slime-Big.gif', '.', '.', id
FROM MOBS WHERE name = 'Slime' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime-Small', '/data/slime/3Slime-Small.gif', '.', '.', id
FROM MOBS WHERE name = 'Slime' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Slime-Medium', '/data/slime/4Slime-Medium.gif', '.', '.', id
FROM MOBS WHERE name = 'Slime' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SnowGolem-Sheared', '/data/snow golem/2SnowGolem-Sheared.png', '.', '.', id
FROM MOBS WHERE name = 'SnowGolem' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider-Speed', '/data/spider/1.2Spider-Speed.png', '.', '.', id
FROM MOBS WHERE name = 'Spider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider-Strength', '/data/spider/1.3Spider-Strength.png', '.', '.', id
FROM MOBS WHERE name = 'Spider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider-Regeneration', '/data/spider/1.4Spider-Regeneration.png', '.', '.', id
FROM MOBS WHERE name = 'Spider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Spider-Invisibility', '/data/spider/1.5Spider-Invisibility.png', '.', '.', id
FROM MOBS WHERE name = 'Spider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SpiderJockey-Skeleton', '/data/spider/1SpiderJockey-Skeleton_J.png', '.', '.', id
FROM MOBS WHERE name = 'SpiderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SpiderJockey-Stray', '/data/spider/2SpiderJockey-Stray_J.png', '.', '.', id
FROM MOBS WHERE name = 'SpiderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SpiderJockey-Bogged_UJ', '/data/spider/3.2SpiderJockey-Bogged_UJ.png', '.', '.', id
FROM MOBS WHERE name = 'SpiderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SpiderJockey-Parched_UJ', '/data/spider/4.2SpiderJockey-Parched_UJ.png', '.', '.', id
FROM MOBS WHERE name = 'SpiderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'SpiderJockey-WitherSkeleton_UJ', '/data/spider/5.2SpiderJockey-WitherSkeleton_UJ.png', '.', '.', id
FROM MOBS WHERE name = 'SpiderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider-Saddled', '/data/strider/1.2Strider-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Strider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-ZombifiedPiglin-New', '/data/strider/1.2StriderJockey-ZombifiedPiglin-New_J.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-ZombifiedPiglin-Shiver-New_TJ', '/data/strider/1.2StriderJockey-ZombifiedPiglin-Shiver-New_TJ.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-BabyStrider-2_TUJ', '/data/strider/1.3StriderJockey-BabyStrider-2_TUJ.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-BabyStrider', '/data/strider/1.3StriderJockey-BabyStrider_J.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-Shiver-BabyStrider-2_TUJ', '/data/strider/1.4StriderJockey-Shiver-BabyStrider-2_TUJ.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-Shiver-BabyStrider', '/data/strider/1.4StriderJockey-Shiver-BabyStrider_J.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-ZombifiedPiglin-Old_JU', '/data/strider/1.5StriderJockey-ZombifiedPiglin-Old_JU.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'StriderJockey-ZombifiedPiglin-Shiver-Old_TUJ', '/data/strider/1.5StriderJockey-ZombifiedPiglin-Shiver-Old_TUJ.png', '.', '.', id
FROM MOBS WHERE name = 'StriderJockey' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider-Shiver', '/data/strider/2.1Strider-Shiver.gif', '.', '.', id
FROM MOBS WHERE name = 'Strider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider-Shiver', '/data/strider/2.1Strider-Shiver_A.gif', '.', '.', id
FROM MOBS WHERE name = 'Strider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Strider-Shiver-Saddled', '/data/strider/2.2Strider-Shiver-Saddled.gif', '.', '.', id
FROM MOBS WHERE name = 'Strider' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Brown', '/data/trader llama/1.1TraderLlama-Brown.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Brown', '/data/trader llama/1.1TraderLlama-Brown_A.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Creamy', '/data/trader llama/1.2TraderLlama-Creamy.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Creamy', '/data/trader llama/1.2TraderLlama-Creamy_A.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Gray', '/data/trader llama/1.3TraderLlama-Gray.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-Gray', '/data/trader llama/1.3TraderLlama-Gray_A.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-White', '/data/trader llama/1.4TraderLlama-White.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'TraderLlama-White', '/data/trader llama/1.4TraderLlama-White_A.png', '.', '.', id
FROM MOBS WHERE name = 'TraderLlama' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator-Banner', '/data/vindicator/1.2Vindicator-Banner.png', '.', '.', id
FROM MOBS WHERE name = 'Vindicator' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator-Johnny', '/data/vindicator/1.3Vindicator-Johnny.png', '.', '.', id
FROM MOBS WHERE name = 'Vindicator' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'Vindicator-Banner-Johnny', '/data/vindicator/1.4Vindicator-Banner-Johnny.png', '.', '.', id
FROM MOBS WHERE name = 'Vindicator' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/1.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/1.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/1.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/1.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/1.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/2.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/2.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/2.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/2.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/2.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/3.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/3.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/3.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/3.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/3.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/4.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/4.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/4.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/4.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/4.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/5.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/5.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/5.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/5.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/5.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/6.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/6.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/6.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/6.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/6.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/7.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/7.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/7.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/7.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/7.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/8.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/8.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/8.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/8.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/8.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/9.1.1.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/9.1.1_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/9.2.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/9.2.14_A.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT '', '/data/wolf/9.3.14.png', '.', '.', id
FROM MOBS WHERE name = '' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Copper', '/data/zombie nautilus/1.2ZombieNautilus-Copper.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Jockey', '/data/zombie nautilus/1.2ZombieNautilus-Jockey_J.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Jockey', '/data/zombie nautilus/1.3ZombieNautilus-Coral-Jockey_J.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Iron', '/data/zombie nautilus/1.3ZombieNautilus-Iron.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Gold', '/data/zombie nautilus/1.4ZombieNautilus-Gold.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Diamond', '/data/zombie nautilus/1.5ZombieNautilus-Diamond.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Netherite', '/data/zombie nautilus/1.6ZombieNautilus-Netherite.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Saddled', '/data/zombie nautilus/2.1ZombieNautilus-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Copper-Saddled', '/data/zombie nautilus/2.2ZombieNautilus-Copper-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Iron-Saddled', '/data/zombie nautilus/2.3ZombieNautilus-Iron-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Gold-Saddled', '/data/zombie nautilus/2.4ZombieNautilus-Gold-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Diamond-Saddled', '/data/zombie nautilus/2.5ZombieNautilus-Diamond-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Netherite-Saddled', '/data/zombie nautilus/2.6ZombieNautilus-Netherite-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral', '/data/zombie nautilus/3.1ZombieNautilus-Coral.gif', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Copper', '/data/zombie nautilus/3.2ZombieNautilus-Coral-Copper.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Iron', '/data/zombie nautilus/3.3ZombieNautilus-Coral-Iron.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Gold', '/data/zombie nautilus/3.4ZombieNautilus-Coral-Gold.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Diamond', '/data/zombie nautilus/3.5ZombieNautilus-Coral-Diamond.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Netherite', '/data/zombie nautilus/3.6ZombieNautilus-Coral-Netherite.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Saddled', '/data/zombie nautilus/4.1ZombieNautilus-Coral-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Copper-Saddled', '/data/zombie nautilus/4.2ZombieNautilus-Coral-Copper-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Iron-Saddled', '/data/zombie nautilus/4.3ZombieNautilus-Coral-Iron-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Gold-Saddled', '/data/zombie nautilus/4.4ZombieNautilus-Coral-Gold-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Diamond-Saddled', '/data/zombie nautilus/4.5ZombieNautilus-Coral-Diamond-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombieNautilus-Coral-Netherite-Saddled', '/data/zombie nautilus/4.6ZombieNautilus-Coral-Netherite-Saddled.png', '.', '.', id
FROM MOBS WHERE name = 'ZombieNautilus' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombifiedPiglin-Crossbow', '/data/zombified piglin/1.2ZombifiedPiglin-Crossbow.png', '.', '.', id
FROM MOBS WHERE name = 'ZombifiedPiglin' LIMIT 1;

INSERT OR IGNORE INTO VARIANTS (name, img, link, description, mob_id)
SELECT 'ZombifiedPiglin-Axe', '/data/zombified piglin/1.3ZombifiedPiglin-Axe.gif', '.', '.', id
FROM MOBS WHERE name = 'ZombifiedPiglin' LIMIT 1;

-- Totale varianti: 659

COMMIT;

-- ============================================================
-- Fine importazione
-- ============================================================
