clear all
set more off

* Charger la base sauvegardée
use "C:/Users/Chiami/Desktop/base_education.dta", clear

* Redéclarer le panel
xtset id_pays annee

* RÉGRESSION 1 : MCO simple
regress scol_prim dep_edu

* RÉGRESSION 2 : MCO avec contrôles
regress scol_prim dep_edu alpha

* RÉGRESSION 3 : Effets fixes
xtreg scol_prim dep_edu, fe

* RÉGRESSION 4 : Effets aléatoires
xtreg scol_prim dep_edu, re

* TEST DE HAUSMAN
quietly xtreg scol_prim dep_edu, fe
estimates store fe

quietly xtreg scol_prim dep_edu, re
estimates store re

hausman fe re

* Exporter pour Power BI
export delimited "C:/Users/Chiami/Desktop/data_powerbi.csv", replace
