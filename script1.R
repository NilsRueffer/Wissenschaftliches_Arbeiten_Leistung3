# Skript 1
#1
statistics_for_metric_variables <- function(variables) {
  # TODO calculate and return the following : 
  # mean, median, variance/standard deviation, covariance-matrix, maximum, minimum, ...
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
  # TODO calculate and return the following : 
  # bincounts, max-count, min-count, ...
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
 
}

#5

#6