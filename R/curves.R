#' Fit curves to dataset
#'
#' @param x Dataset
#'
#' @returns Three sets of data used to plot curves for the lower and upper modes
#' @export
#'
#' @examples
#' curves <- curves()

curves <- function(mydata = "data/exampledata.xlsx"){
  mydata <- importData(mydata)
  model <- dataModel()
  fitData <- fitParams()
  xFit <- seq(fitData$xfitLower, fitData$xfitUpper, length=200)
  yFit1 <- model$mydata$lambda[1]*dnorm(xFit,mean=model$mydata$mu[1],sd=model$mydata$sigma[1])
  yFit2 <- model$mydata$lambda[2]*dnorm(xFit,mean=model$mydata$mu[2],sd=model$mydata$sigma[2])
  yFit1 <- yFit1*diff(fitData$h$mids[1:2])*length(mydata$data)
  yFit2 <- yFit2*diff(fitData$h$mids[1:2])*length(mydata$data)
  return(list(xValues = xFit, yFit1=yFit1, yFit2=yFit2))
}

