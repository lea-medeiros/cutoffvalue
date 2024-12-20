#' Find Cutoff Value
#'
#' @param proba The probability value you want for the cutoff value to represent
#' @param i Determines the location, i.e., index of the (first) minimum of the model$mydata$mu
#'
#' @return the cutoff value for the indicated probability value
#' @export
#'
#' @examples
#' cutoff <- find.cutoff()

findCutoff <- function(mydata = "data/exampledata.xlsx", proba=0.5, i=model$indexLower) {
  mydata <- importData(mydata)
  model <- dataModel()
  ## Cutoff such that Pr[drawn from bad component] == proba
  f <- function(x) {
    proba - (model$mydata$lambda[i]*dnorm(x, model$mydata$mu[i], model$mydata$sigma[i]) /
               (model$mydata$lambda[1]*dnorm(x, model$mydata$mu[1], model$mydata$sigma[1]) +
                  model$mydata$lambda[2]*dnorm(x, model$mydata$mu[2], model$mydata$sigma[2])))
  }
  return(uniroot(f=f, lower=mydata$lower, upper=mydata$upper)$root)
}
