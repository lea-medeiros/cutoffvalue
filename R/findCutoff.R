#' @title Determine a cutoff value between the upper and lower mode of a bimodal dataset
#' @description This function finds the cutoff value between the modes of bimodally distributed data at the indicated probability value. As a matter of course, this function runs the importData and datamodel functions for you, negating the need to run those separately.
#'
#' @param proba The probability value you want the cutoff value to represent
#' @param i Determines the location, i.e., index of the (first) minimum of the model$mydata$mu
#' @param mydata Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
#' column header.
#'
#' @return Determines and reports the cutoff value for the indicated probability value.
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' cutoff <- findcutoff()

findcutoff <- function(rawdata, proba=0.5, i=model$indexLower) {
  mydata <- importdata(rawdata)
  model <- datamodel(rawdata)
  ## Cutoff such that Pr[drawn from bad component] == proba
  f <- function(x, proba=0.5, i=model$indexLower) {
    proba - (model$mydata$lambda[i]*dnorm(x, model$mydata$mu[i], model$mydata$sigma[i]) /
               (model$mydata$lambda[1]*dnorm(x, model$mydata$mu[1], model$mydata$sigma[1]) +
                  model$mydata$lambda[2]*dnorm(x, model$mydata$mu[2], model$mydata$sigma[2])))
  }
  cutoffvalue_results <- function(x, proba=0.5){
    return(uniroot(f=f, lower=mydata$lower, upper=mydata$upper)$root)
  }
  cutoffvalues <- function(x, proba=0.5){
    cat('Cutoff Value:', cutoff)
    return(uniroot(f=f, lower=mydata$lower, upper=mydata$upper)$root)
  }
  cutoff <- cutoffvalue_results()
  cutoffvalues()
}
