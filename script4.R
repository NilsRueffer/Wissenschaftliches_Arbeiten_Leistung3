# script4.R 
# Analyse der Daten
# Version    Autor          Bemerkung
# 1.0        Uwe Dreßler    Init
# 1.1        Uwe            Übername bisheriger Analyse
# 1.2        Uwe            Aufruf Funktion 6 mit zusätzlichen plots
source("script1.R")



# Funktionsaufrufe 1 bis 6 mit den angenommenen Analyseergebnissen

# Funktionsaufruf 1
metstat <- statistics_for_metric_variables ()
metstat
# Analyse
#Offensichtlich haben wir Studierende zwischen 17 und 30 Jahren mit einem Durchschnitt von ca. 25 Jahren 
#Und einer Varianz von ca. 2
#Sowhol das Interesse an Mathematik, als auch das an Programmieren sind eine Skala von 1 bis 7
#Mit Mittelwerten von ca. 4.5


# Funktionsaufruf 2
katstat <- statistics_for_categorial_variables () 
katstat
# Analyse
# $`Range Interesse an Mathe`
# [1] 1 7
# 
# $`Mean Interesse an Mathe `
# [1] 4.49
#
# $`Range Interesse an Programmieren`
# [1] 1 7
#
# $`Mean Interesse an Programmieren`
# [1] 4.64
#
# $`%Mathe LK`
# [1] 0.68
# 
# sowohl das interresse an programmierung als auch an mathematik sind ueberdurchschnittlich
# und fast gleich
# obwohl der für beide faelle das interesse die volle breite des interesses umfasst
# der ueberwiegende teil der studenten war im mathe lk

# Funktionsaufruf 3
# statistics_between_two_categorial_variables <- function(variables1, variables2) {

#Version  Autor             Bemerkung
#1.0      Mattias & Thao    Bitte variablen in Anf?hrungszeichen eingeben

#Funktion nimmt 2 kategoriale Variablen entgegen und gibt Abh?ngigkeitstabelle zur?ck.


statistics_between_two_categorial_variables("Studienfach", "Interesse.an.Mathe")
#               1  2  3  4  5  6  7
# Data Science  2  9  7  2 11  2  5
# Informatik    2  1  6  2  5  3  3
# Mathe         0  1  2  1  2  2  9
# Statistik     2  1  3  5  2  6  4
# analyse 
# Studenten die sehr großes interesse an mathematik haben studieren auch meistens mathematik
# studenten die mathematik studieren haben zu meist sehr grosses interesse an mathematik
# fuer die anderen studiengaenge gibt es keine auffaellige konzentration. 
# bei allen studiengaengen verteilt sich das Interesse von sehr gering bis sehr hoch


# Funktionsaufruf 4
## Punktbiseriale Korrelation
# statistics_between_metric_und_dichotomous_variables <- function(metricVariables
#                                                                 , dichotomousVariables, use = c("all.obs", "complete.obs"), level = 1) {


# #####
statistics_between_metric_und_dichotomous_variables(data$Interesse.an.Mathe,
                                                    data$Mathe.LK, level = 2)

# Analyse
## [1] 0.05309925
# Es gibt eine schwache positive Korrelation zwischen die Variablen Interesse.an.Mathe
# und Mathe.LK


# ###### 
# Funktionsaufruf 5

# quantile_based_categorisation - kategorisiert eine mindestens ordinal skalierte Variable 
#                                 quantilbasiert.
#
# Input: variable - Die zu kategorisierende Variable als numerisches Array oder ordered.
#
# Output: Ein data frame mit der Variable und der Kategorisierung.

#  quantile_based_categorisation <- function(variable)



# Funktionsaufruf 6
# #########
Visual_kategorial("Alter")
# Analyse
# annähernd normalverteilt 
#
# zusätzliche darstellung
data_in_df <- read_data_in_df()
boxplot(data_in_df$Alter)

# #########
Visual_kategorial("Studienfach") 
# Analyse
# data science ist überproportional vertreten
# Informatik und statistik annähernd gleich

# zusätzliche darstellung
data_in_df <- read_data_in_df()
Studienfach <- factor(data_in_df$Studienfach,labels = c("Science", "Infor.", "Mathe","Statistik"))
plot(Studienfach)


# ######
Visual_kategorial("Mathe")
# Analyse
# wellenförmig nach -> 7 steigende anzahl des Interesse
# annahme linear steigend mit überlagerung einer alternierenden funktion

Visual_kategorial("Programmieren")
# Analyse
# 1 - 6 normalverteilt aber markante häufung bei ausprägung 7

Visual_kategorial("LK")
# Analyse
# ca. zwei drittel der studenten hatten einen mathe LK


# ##########
# weitere analysen
# ##########


# zusammenfassung aller analysen