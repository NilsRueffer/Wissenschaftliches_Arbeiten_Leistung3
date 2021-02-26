# script4.R 
# Analyse der Daten
# Version    Autor          Bemerkung
# 1.0        Uwe Dreßler    Init
# 1.1        Uwe            Übername bisheriger Analyse
# 1.2        Uwe            Aufruf Funktion 6 mit zusaetzlichen plots
# 1.3        Uwe            Aufruf funktion 2 und 3 hinzugefuehgt
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
statistics_between_two_categorial_variables("Studienfach", "Interesse.an.Programmieren")
#                 1  2  3  4  5  6  7
#   Data Science  0  3  2 11  6  2 14
#   Informatik    0  2  5  5  3  0  7
#   Mathe         1  2  4  3  1  4  2
#   Statistik     2  5  2  4  4  3  3
# Die ueberwiegende Zahl der Studierenden, die Interesse an Programmieren hat 
# studiert Data Science


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
quantile_based_categorisation(data$Interesse.an.Mathe) 

myvar_mathe = quantile_based_categorisation(data$Interesse.an.Mathe)

myvar_mathe2 = c(length(myvar_mathe$categorization[myvar_mathe$categorization == "niedrig"]),
           length(myvar_mathe$categorization[myvar_mathe$categorization == "mittel"]),
           length(myvar_mathe$categorization[myvar_mathe$categorization == "hoch"]))
names(myvar_mathe2) = c("niedrig","mittel","hoch")
#niedrig  mittel    hoch 
#33      33      34 
barplot(myvar_mathe2)
#33% der Studenten hat "niedrig" Interesse an Mathe
#33% der Studenten hat "mittel" Interesse an Mathe
#34% der Studenten hat "hoch" Interesse an Mathe
#Die Interesse an Mathe ist fast gleich in jeder kadinale Kategorie
quantile_based_categorisation(data$Interesse.an.Programmieren) 
myvar_Programmieren = quantile_based_categorisation(data$Interesse.an.Programmieren)

myvar_Programmieren2 = c(length(myvar_Programmieren$categorization[myvar_Programmieren$categorization == "niedrig"]),
                 length(myvar_Programmieren$categorization[myvar_Programmieren$categorization == "mittel"]),
                 length(myvar_Programmieren$categorization[myvar_Programmieren$categorization == "hoch"]))
names(myvar_Programmieren2) = c("niedrig","mittel","hoch")
#niedrig  mittel    hoch 
#33      33      34 
#Visualisierung
barplot(myvar_Programmieren2)

#Das Ergibnis von der Intersse an Programmieren ist genau wie bei Mathe.
#Das bedeutet, das die Interesse an Programmieren ist auch fast gleich in jeder kadinale Kategorie
#Visualisierung
barplot(myvar_Programmieren2)


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
# data science ist etwa doppelt so haeufig vertreten wie jeweils Informatik und Statistik
# Informatik und Statistik etwas mehr als Mathematik

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
# Kreuztabelle Fuer die variablen Interesse an Mathematik und 
#Interesse an Programmieren
Kreztab <- xtabs(~ data$Interesse.an.Mathe + data$Interesse.an.Programmieren)
prop.table(Kreztab, 1)
#                                       Interesse Programmieren
#Interesse Mathe  1       2          3          4          5           6        7
#       1 0.16666667 0.00000000 0.00000000 0.16666667 0.16666667 0.16666667 0.33333333
#       2 0.00000000 0.08333333 0.08333333 0.00000000 0.33333333 0.08333333 0.41666667
#       3 0.05555556 0.00000000 0.05555556 0.38888889 0.11111111 0.16666667 0.22222222
#       4 0.00000000 0.30000000 0.00000000 0.30000000 0.10000000 0.10000000 0.20000000
#       5 0.00000000 0.10000000 0.20000000 0.30000000 0.15000000 0.00000000 0.25000000
#       6 0.07692308 0.23076923 0.23076923 0.07692308 0.07692308 0.00000000 0.30769231
#       7 0.00000000 0.14285714 0.19047619 0.23809524 0.09523810 0.14285714 7 0.19047619
# 33 % der Studierende, die ein sehr geringes Interesse an Mathe haben,
#haben eine sehr hoehes Interesse an Programmieren.
# Die Studierende, die ein sehr geringes Interesse an Programmieren haben,
# haben fast gar kein Interesse an Mathematik.
# 30 % der Studierende, deren Interesse an Mathematik gleich 6 ist, haben ein sehr
# hoehes Interesse an Programmieren.
# 26% der Studierende haben ein sehr hoehes Interesse an Programmieren.

# Korrelationskoeffizient
cor(data$Interesse.an.Mathe, data$Interesse.an.Programmieren)
# [1] -0.1726735
# Es gibt keinen signifikanten negativen Zusammenhang zwischen beide Variablen.


# zusammenfassung aller analysen
