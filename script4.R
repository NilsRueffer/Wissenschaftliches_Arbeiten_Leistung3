# script4.R 
# Analyse der Daten
# Version    Autor          Bemerkung
# 1.0        Uwe Dreßler    Init
source("script1.R")


# 
# Beispiel
statistics_between_metric_und_dichotomous_variables(data$Interesse.an.Mathe,
                                                    data$Mathe.LK, level = 2)

## [1] 0.05309925
# Es gibt eine schwache positive Korrelation zwischen die Variablen Interesse.an.Mathe
# und Mathe.LK