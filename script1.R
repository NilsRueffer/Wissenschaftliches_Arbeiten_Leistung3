# Skript 1
#1
statistics_for_metric_variables <- function(variables) {
  # TODO calculate and return the following : 
  # mean, median, variance/standard deviation, covariance-matrix, maximum, minimum, ...
}

#2
statistics_for_categorial_variables <- function(variables) {
  # TODO calculate and return the following : 
  # bincounts, max-count, min-count, ...
}

#3
statistics_between_two_categorial_variables <- function(variables1, variables2) {
  # TODO calculate and return the following : 
   
}

#4
## Punktbiseriale Korrelation
sd.pop <- function(metricVariables){sd(metricVariables)*sqrt((length(metricVariables)-1)
                                                             /length(metricVariables))}

statistics_between_metric_und_dichotomous_variables <- function(metricVariables
                                                                , dichotomousVariables, use = c("all.obs", "complete.obs"), level = 1) {
  
  if (!is.numeric(metricVariables)) 
    stop("Es muss eine numerische Variable sein.\n")
  dichotomousVariables <- as.factor(dichotomousVariables)
  if (length(levs <- levels(dichotomousVariables)) > 2) 
    stop("Es muss eine dichotome Variable sein.\n")
  if (length(metricVariables) != length(dichotomousVariables)) 
    stop("'metricVariables' und 'dichotomousVariables' haben nicht die gleiche Länge")
  use <- match.arg(use)
  if (use == "complete.obs") {
    cc.ind <- complete.cases(metricVariables, dichotomousVariables)
    metricVariables <- metricVariables[cc.ind]
    dichotomousVariables <- dichotomousVariables[cc.ind]
  }
  ind <- dichotomousVariables == levs[level]
  diff.mu <- mean(metricVariables[ind]) - mean(metricVariables[!ind])
  prob <- mean(ind)
  diff.mu * sqrt(prob * (1 - prob))/sd.pop(metricVariables)
  
}  

statistics_between_metric_und_dichotomous_variables(data$Interesse.an.Mathe,
                                                    data$Mathe.LK, level = 2)
                                                    
## [1] 0.05309925
# Es gibt eine positive Korrelation zwischen die Variablen Interesse.an.Mathe
# und Mathe.LK


#5

#6