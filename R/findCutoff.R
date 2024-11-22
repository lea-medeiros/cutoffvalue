find.cutoff <- function(proba=0.5, i=index.lower) {
  ## Cutoff such that Pr[drawn from bad component] == proba
  f <- function(x) {
    proba - (model$lambda[i]*dnorm(x, model$mu[i], model$sigma[i]) /
               (model$lambda[1]*dnorm(x, model$mu[1], model$sigma[1]) +
                  model$lambda[2]*dnorm(x, model$mu[2], model$sigma[2])))
  }
  return(uniroot(f=f, lower=mydata.lower, upper=mydata.upper)$root)
}
# Careful with division by zero if changing lower and upper
# The uniroot lower and upper generally work well at -2 to 2, but if an error is returned adjust to
# reflect the range of the data
