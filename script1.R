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