# Skript 1
#1
statistics_for_metric_variables <- function(variables) {
  # Version    Autor          Bemerkung
  # 1.0        Mattias Keppke Init
  # 2.0        Uwe Dreßler    Aufnahme Aufruf Dateneinlesen
  
  # Description
  # TODO calculate and return the following : 
  # mean, median, variance/standard deviation, covariance-matrix, maximum, minimum, ...
  data <- read_data_in_df()
  metstat = list("Range Alter" = range(data$Alter),
                 "Mean Alter" = mean(data$Alter),
                 "Var Alter" = sd(data$Alter),
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
  katstat = list("Range Interesse an Mathe" = range(data$Interesse.an.Mathe),
                 "Mean Interesse an Mathe " = mean(data$Interesse.an.Mathe),
                 "Range Interesse an Programmieren" = range(data$Interesse.an.Programmieren),
                 "Mean Interesse an Programmieren" = mean(data$Interesse.an.Programmieren),
                 "%Mathe LK" = mean(data$Mahte.LK))
  return(katstat)
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

#6