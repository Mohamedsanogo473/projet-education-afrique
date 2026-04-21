* ============================================================
* PROJET : Dépenses éducation et scolarisation en Afrique
* SCRIPT : 01 - Import et exploration
* AUTEUR : Sanogo Mamadou
* ============================================================

clear all
set more off

* Importer le fichier CSV depuis le Bureau
import delimited "C:/Users/Chiami/Desktop/analyse_finale.csv", ///
    clear varnames(1) encoding(UTF-8)

* Vérifier l'import
describe
summarize

* Renommer les variables
rename country_name     pays
rename country_code     code_pays
rename annee            annee
rename depenses_edu_pib dep_edu
rename taux_scolarisation_primaire   scol_prim
rename taux_scolarisation_secondaire scol_sec
rename taux_alphabetisation          alpha
rename hdi_2023         hdi
rename esperance_vie_2023 esp_vie
rename gni_par_habitant gni

* Déclarer le panel
encode code_pays, gen(id_pays)
xtset id_pays annee

* Statistiques descriptives
summarize dep_edu scol_prim scol_sec alpha hdi

* Sauvegarder en format Stata
save "C:/Users/Chiami/Desktop/base_education.dta", replace
