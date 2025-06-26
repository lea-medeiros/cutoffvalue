#' @title Plot a histogram of the dataset that includes the curves for each mode and the cutoff value
#' @description This function incorporates most of the other functions in this package to plot a histogram of the data that includes the fit lines for each mode and the cutoff value depicted as a line. As a matter of course, this function runs the cleanData, datamodel, fit, curves, and findCutoff functions for you, negating the need to run those separately.
#'
#' @param title Title for the graph, default is blank
#' @param xlab Label for the x-axis, default is "Plasma 11-KT (ng/mL)"
#' @param cutofflab Label for the cutoff value, default is "Minijack cutoff"
#' @param cutoffunits Label for the units, default is "ng/mL"
#' @param x Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Returns a histogram with colored lines depicting curves for upper and lower modes along with the determined cutoff line to delineate between the two modes. The cutoff value is also returned to the environment.

#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' plotty <- cutoffplot(cutoffvalue:::exampledata, "Example Graph Title", "Example X-Axis", "Cutoff Label", "UNITS")

cutoffplot <- function (x = cutoffvalue:::exampledata, title = "Plasma 11-KT levels in age-2 male spring chinook", xlab = "Plasma [11-KT] (ng/mL)", cutofflab = "Minijack cutoff",
                        cutoffunits = "ng/mL", LowerMode_col = "red", LowerMode_lty = 1, LowerMode_lwd = 2, UpperMode_col = "purple", UpperMode_lty = 1, UpperMode_lwd = 2,
                        cutoffvalue_col = "black", cutoffvalue_lty = 2, cutoffvalue_lwd = 2){
  mydata <- cleandata(x)
  model <- datamodel(x)
  cutoff <- findcutoff(x)
  fitData <- fitparams(x)
  curves <- curves(x)
  xValues <- seq(fitData$xfitLower, fitData$xfitUpper, length=200)
  yFit1 <- model$mydata$lambda[1]*dnorm(xValues,mean=model$mydata$mu[1],sd=model$mydata$sigma[1])
  yFit2 <- model$mydata$lambda[2]*dnorm(xValues,mean=model$mydata$mu[2],sd=model$mydata$sigma[2])
  yValues1 <- yFit1*diff(fitData$h$mids[1:2])*length(mydata$data)
  yValues2 <- yFit2*diff(fitData$h$mids[1:2])*length(mydata$data)

  v1 = seq(fitData$v1Lower, fitData$v1Upper,length=11)
  v2 = signif(10^v1, digits=2)
     ## Converts log to actual concentration with only 2 significant digits

  par(mar=c(5,6,4,1)+.1)

  hist(mydata$data, breaks = 15, density = 10, col = "grey", xaxt="n", xlab = xlab,
       ylim = c(0, fitData$ylimUpper), xlim = c(fitData$xlimLower, fitData$xlimUpper), main = title,
       cex.main=2, cex.lab=1.5, cex.axis=1.25, family = "Times")
  lines(xValues, yValues1, col=LowerMode_col, lty=LowerMode_lty, lwd=LowerMode_lwd)
  lines(xValues, yValues2, col=UpperMode_col, lty=UpperMode_lty, lwd=UpperMode_lwd)
  axis(side = 1, at = v1, labels = v2, cex.axis=1.25, family = "Times")
  ## Replaces log concentration x axis with calculations from v2 to display actual concentrations
  abline(v=cutoff, col=cutoffvalue_col, lty=cutoffvalue_lty, lwd=cutoffvalue_lwd) # cutoff line
  text(cutoff+(fitData$step/2), fitData$ylimUpper-5, adj = c(0, 1), paste(cutofflab, "\n =",round(10^(cutoff), 2), cutoffunits), cex=1.25, family = "Times", font = 2)
  return(cutoff)
}
