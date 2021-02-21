# Skript 1
<<<<<<< Updated upstream

# Setting work directory to file location and sourcing helper-functions
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("script2.R")

#1
statistics_for_metric_variables <- function(variables) {
  # Version    Autor          Bemerkung
  # 1.0        Mattias Keppke Init
  # 2.0        Uwe Dreßler    Aufnahme Aufruf Dateneinlesen
  # 2.1        Uwe Dreßler    StdAbw und Varianz Alter getrennt ausgegeben
  
  # Description
  # TODO calculate and return the following : 
  # mean, median, variance/standard deviation, covariance-matrix, maximum, minimum, ...
  data <- read_data_in_df()
  metstat = list("Range Alter" = range(data$Alter),
                 "Mean Alter" = mean(data$Alter),
                 "StdAbw Alter" = sd(data$Alter),
                 "Var Alter" = var(data$Alter),
                 "Range Interesse an Mathe" = range(data$Interesse.an.Mathe),
                 "Mean Interesse an Mathe " = mean(data$Interesse.an.Mathe),
                 "Range Interesse an Programmieren" = range(data$Interesse.an.Programmieren),
                 "Mean Interesse an Programmieren" = mean(data$Interesse.an.Programmieren))
  return(metstat)
}

#2
statistics_for_categorial_variables <- function(variables) {
  # Version    Autor          Bemerkung
  # 1.0        Mattias Keppke Init
  # 2.0        Uwe Dreßler    Aufnahme Aufruf Dateneinlesen
  
  # Description
  # TODO calculate and return the following : 
  # bincounts, max-count, min-count, ...
  data <- read_data_in_df()
=======
#Importiere zun�chst Helferfunktion(en) aus Script2. R
source("script2.R")
#Speichere nun unseren Datensatz in Dataframe

data = read_data_in_df()

#1
statistics_for_metric_variables <- function() {
  # TODO calculate and return the following : 
  # mean, median, variance/standard deviation, covariance-matrix, maximum, minimum, ...
    
  
    metstat = list("Range Alter" = range(data$Alter),
                   "Mean Alter" = mean(data$Alter),
                   "Var Alter" = var(data$Alter),
                   "Range Interesse an Mathe" = range(data$Interesse.an.Mathe),
                   "Mean Interesse an Mathe " = mean(data$Interesse.an.Mathe),
                   "Range Interesse an Programmieren" = range(data$Interesse.an.Programmieren),
                   "Mean Interesse an Programmieren" = mean(data$Interesse.an.Programmieren))
    return(metstat)
  
  
  #Offensichtlich haben wir Studierende zwischen 17 und 30 Jahren mit einem Durchschnitt von ca. 25 Jahren 
  #Und einer Varianz von ca. 2
  #Sowhol das Interesse an Mathematik, als auch das an Programmieren sind eine Skala von 1 bis 7
  #Mit Mittelwerten von ca. 4.5
  
}

#2
statistics_for_categorial_variables <- function() {
  # TODO calculate and return the following : 
  # bincounts, max-count, min-count, ...
  
>>>>>>> Stashed changes
  katstat = list("Range Interesse an Mathe" = range(data$Interesse.an.Mathe),
                 "Mean Interesse an Mathe " = mean(data$Interesse.an.Mathe),
                 "Range Interesse an Programmieren" = range(data$Interesse.an.Programmieren),
                 "Mean Interesse an Programmieren" = mean(data$Interesse.an.Programmieren),
<<<<<<< Updated upstream
                 "%Mathe LK" = mean(data$Mathe.LK))
  return(katstat)
=======
                 "%Mathe LK" = mean(data$Mahte.LK))
  return(katstat)

>>>>>>> Stashed changes
}

#3
statistics_between_two_categorial_variables <- function(variables1, variables2) {
  # TODO calculate and return the following : 
   
}

#4
statistics_between_metric_und_dichotomous_variables <- function(metricVariables, dichotomousVariables) {
  # TODO calculate and return the following : 
## Punktbiseriale Korrelation
sd.pop <- function(x){sd(x)*sqrt((length(x)-1)/length(x))}
  
biserial.cor.new <- function (x, y, use = c("all.obs", "complete.obs"), level = 1) 
  {
    if (!is.numeric(x)) 
      stop("'x' muss eine numerische Variable sein.\n")
    y <- as.factor(y)
    if (length(levs <- levels(y)) > 2) 
      stop("'y' muss eine dichotome Variable sein.\n")
    if (length(x) != length(y)) 
      stop("'x' und 'y' haben nicht die gleiche Länge")
    use <- match.arg(use)
    if (use == "complete.obs") {
      cc.ind <- complete.cases(x, y)
      x <- x[cc.ind]
      y <- y[cc.ind]
    }
    ind <- y == levs[level]
    diff.mu <- mean(x[ind]) - mean(x[!ind])
    prob <- mean(ind)
    diff.mu * sqrt(prob * (1 - prob))/sd.pop(x)
    
  }  
 
}

#5

# quantile_based_categorisation - kategorisiert eine mindestens ordinal skalierte Variable 
#                                 quantilbasiert.
#
# Input: variable - Die zu kategorisierende Variable als numerisches Array oder ordered.
#
# Output: Ein data frame mit der Variable und der Kategorisierung.

quantile_based_categorisation <- function(variable){
  stopifnot(length(variable) > 3L, is.ordered(variable) || is.numeric(variable))
  
  positions <- (c(0.33, 0.66) * length(variable))
  quantiles <- c(rep("niedrig", positions[1]), rep("mittel", (positions[2] - positions[1])), 
                 rep("hoch",(length(variable) - positions[2])))
  variable <- sort(variable)
  quantiles <- ordered(quantiles, levels = c("niedrig", "mittel", "hoch"))
  
  categorization <- quantiles
  
  res <- data.frame(variable, categorization)
  return(res)
}


#6

Visual_kategorial <- function(variable){
  # Version    Autor          Bemerkung
  # 1.0        Uwe Dreßler    Initial
  
  # Description
  # Visualisierung Von Alter,
  # 
  data_in_df <- read_data_in_df()
  
  stopifnot(variable == "Alter"  || variable == "Studienfach" || variable == "Mathe" || variable == "Programmieren" || variable == "LK")
  if (variable == "Alter") {
    Alter <- factor(data_in_df$Alter)
    plot(Alter)
  }
  if (variable == "Studienfach") {
    Studienfach <- factor(data_in_df$Studienfach)
    plot(Studienfach)
  }
  if (variable == "Mathe") {
    Mathe <- factor(data_in_df$Interesse.an.Mathe)
    plot(Mathe)
  }
  if (variable == "Programmieren") {
    Programmieren <- factor(data_in_df$Interesse.an.Programmieren)
    plot(Programmieren)
  }
  if (variable == "LK") {
    Lk <- factor(data_in_df$Mathe.LK)
    plot(Lk)
  }
  

}
