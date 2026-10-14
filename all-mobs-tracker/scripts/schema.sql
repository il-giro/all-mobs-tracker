-- ============================================================
-- AllMobs Database Schema
-- Crea le 5 tabelle principali del database
-- ============================================================

-- Tabella MOBS: Contiene i mob base
CREATE TABLE IF NOT EXISTS MOBS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    img TEXT,
    link TEXT,
    description TEXT
);

-- Tabella VARIANTS: Contiene le varianti dei mob
CREATE TABLE IF NOT EXISTS VARIANTS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    img TEXT,
    link TEXT,
    description TEXT,
    mob_id INTEGER,
    FOREIGN KEY (mob_id) REFERENCES MOBS(id)
);

-- Tabella CATEGORIES: Contiene le categorie
CREATE TABLE IF NOT EXISTS CATEGORIES (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    icon TEXT,
    color TEXT,
    link TEXT,
    description TEXT,
    priority INTEGER,
    variant TEXT
);

-- Tabella MOB_CATEGORIES: Relazioni molti-a-molti tra mob e categorie
CREATE TABLE IF NOT EXISTS MOB_CATEGORIES (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mob_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (mob_id) REFERENCES MOBS(id),
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(id),
    UNIQUE(mob_id, category_id)
);

-- Tabella VARIANT_CATEGORIES: Relazioni molti-a-molti tra varianti e categorie
CREATE TABLE IF NOT EXISTS VARIANT_CATEGORIES (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    variant_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    FOREIGN KEY (variant_id) REFERENCES VARIANTS(id),
    FOREIGN KEY (category_id) REFERENCES CATEGORIES(id),
    UNIQUE(variant_id, category_id)
);

-- Indici per migliorare le performance
CREATE INDEX IF NOT EXISTS idx_variants_mob_id ON VARIANTS(mob_id);
CREATE INDEX IF NOT EXISTS idx_mob_categories_mob ON MOB_CATEGORIES(mob_id);
CREATE INDEX IF NOT EXISTS idx_mob_categories_category ON MOB_CATEGORIES(category_id);
CREATE INDEX IF NOT EXISTS idx_variant_categories_variant ON VARIANT_CATEGORIES(variant_id);
CREATE INDEX IF NOT EXISTS idx_variant_categories_category ON VARIANT_CATEGORIES(category_id);
