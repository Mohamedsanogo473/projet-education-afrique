-- ============================================================
-- PROJET : Impact des dépenses publiques en éducation en Afrique
-- SCRIPT  : 03 - Analyse et vue finale
-- AUTEUR  : Sanogo Mamadou
-- ============================================================

SELECT
    p.Region,
    COUNT(DISTINCT i.country_code) AS nb_pays,
    ROUND(AVG(i.depenses_edu_pib), 2) AS moy_depenses_edu,
    ROUND(AVG(i.taux_scolarisation_primaire), 2) AS moy_scol_primaire
FROM indicateurs i
JOIN pays p ON i.country_code = p.country_code
WHERE i.depenses_edu_pib IS NOT NULL
GROUP BY p.Region
ORDER BY moy_depenses_edu DESC;

CREATE VIEW IF NOT EXISTS analyse_finale AS
SELECT
    p.country_name,
    p.country_code,
    p.region,
    i.annee,
    i.depenses_edu_pib,
    i.taux_scolarisation_primaire,
    i.taux_scolarisation_secondaire,
    i.taux_alphabetisation,
    p.hdi_2023,
    p.esperance_vie_2023,
    p.gni_par_habitant
FROM indicateurs i
JOIN pays p ON i.country_code = p.country_code
ORDER BY p.country_name, i.annee;

SELECT COUNT(*) AS total FROM analyse_finale;