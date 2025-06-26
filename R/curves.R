#' @title Fit curves to each mode of the dataset
#' @description This function fits curves to the dataset. As a matter of course, this function runs the cleanData, datamodel, and fit functions for you, negating the need to run those separately.
#'
#' @param x Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
#' column header.
#'
#' @returns Returns three sets of values, which are used to plot curves for the lower and upper modes.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#' @import here
#'
#' @export
#'
#' @examples
#' curves <- curves(cutoffvalue:::exampledata)

curves <- function(x = cutoffvalue:::exampledata){
  mydata <- cleandata(x)
  model <- datamodel(x)
  fitData <- fitparams(x)
  xFit <- seq(fitData$xfitLower, fitData$xfitUpper, length=200)
  yFit1 <- model$mydata$lambda[1]*dnorm(xFit,mean=model$mydata$mu[1],sd=model$mydata$sigma[1])
  yFit2 <- model$mydata$lambda[2]*dnorm(xFit,mean=model$mydata$mu[2],sd=model$mydata$sigma[2])
  yFit1 <- yFit1*diff(fitData$h$mids[1:2])*length(mydata$data)
  yFit2 <- yFit2*diff(fitData$h$mids[1:2])*length(mydata$data)
  return(list(xValues = xFit, yFit1=yFit1, yFit2=yFit2))
}

