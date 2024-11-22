#' Find Cutoff Value
#'
#' @param proba The probability value you want for the cutoff value to represent
#' @param i Determines the location, i.e., index of the (first) minimum of the model$mu
#'
#' @return the cutoff value for the indicated probability value
#' @export
#'
#' @examples
#' cutoff <- c(find.cutoff())
#' mydata.lower <- -2
#' mydata.upper <- 2
find.cutoff <- function(proba=0.5, i=index.lower) {
  ## Cutoff such that Pr[drawn from bad component] == proba
  f <- function(x) {
    proba - (model$lambda[i]*dnorm(x, model$mu[i], model$sigma[i]) /
               (model$lambda[1]*dnorm(x, model$mu[1], model$sigma[1]) +
                  model$lambda[2]*dnorm(x, model$mu[2], model$sigma[2])))
  }
  return(uniroot(f=f, lower=mydata.lower, upper=mydata.upper)$root)
}
