-- ============================================================
-- PROJET : Impact des dépenses publiques en éducation en Afrique
-- SCRIPT  : 01 - Création des tables
-- AUTEUR  : Sanogo Mamadou
-- ============================================================

DROP TABLE IF EXISTS indicateurs;
DROP TABLE IF EXISTS pays;

CREATE TABLE pays (
    country_code        TEXT PRIMARY KEY,
    country_name        TEXT NOT NULL,
    region              TEXT,
    hdi_2023            REAL,
    esperance_vie_2023  REAL,
    gni_par_habitant    REAL
);

CREATE TABLE indicateurs (
    country_code                  TEXT,
    annee                         INTEGER,
    depenses_edu_pib              REAL,
    taux_scolarisation_primaire   REAL,
    taux_scolarisation_secondaire REAL,
    taux_alphabetisation          REAL,
    PRIMARY KEY (country_code, annee),
    FOREIGN KEY (country_code) REFERENCES pays(country_code)
);

SELECT name FROM sqlite_master WHERE type = 'table';
