#' Plot Histogram with Fit Lines
#'
#' @param maintitle Title for the graph, default is blank
#' @param xlabel Label for the x-axis, default is "Plasma 11-KT (ng/mL)"
#' @param cutofflabel Label for the cutoff value, default is "Minijack cutoff"
#' @param cutoffunits Label for the units, default is "ng/mL"
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Histogram with colored lines depicting upper and lower modes along with a cutoff line to delineate between the two modes
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' plottyMcplotty <- cutoffplot()
#' plottyMcplotty <- cutoffplot("Example Graph Title", "Example X-Axis", "Cutoff Label", "UNITS")

cutoffplot <- function (mydata = "R/exampledata.xlsx", maintitle = "Plasma 11-KT levels in age-2 male spring chinook", xlabel = "Plasma [11-KT] (ng/mL)", cutofflabel = "Minijack cutoff",
                        cutoffunits = "ng/mL"){
  mydata <- here("R", "exampledata.xlsx")
  mydata <- importdata(mydata)
  model <- datamodel()
  cutoff <- findcutoff()
  fitData <- fitparams()
  curves <- curves()
  xValues <- seq(fitData$xfitLower, fitData$xfitUpper, length=200)
  yFit1 <- model$mydata$lambda[1]*dnorm(xValues,mean=model$mydata$mu[1],sd=model$mydata$sigma[1])
  yFit2 <- model$mydata$lambda[2]*dnorm(xValues,mean=model$mydata$mu[2],sd=model$mydata$sigma[2])
  yValues1 <- yFit1*diff(fitData$h$mids[1:2])*length(mydata$data)
  yValues2 <- yFit2*diff(fitData$h$mids[1:2])*length(mydata$data)

  v1 = seq(fitData$v1Lower, fitData$v1Upper,length=11)
  v2 = signif(10^v1, digits=2)
   ## Converts log to actual concentration with only 2 significant digits

  par(mar=c(5,6,4,1)+.1)

  hist(mydata$data, breaks = 15, density = 10, col = "grey", xaxt="n", xlab = xlabel,
       ylim = c(0, fitData$ylimUpper), xlim = c(fitData$xlimLower, fitData$xlimUpper), main = maintitle,
       cex.main=2, cex.lab=1.5, cex.axis=1.25, family = "Times")
  lines(xValues, yValues1, col="red", lwd=2)
  lines(xValues, yValues2, col="purple", lwd=2)
  axis(side = 1, at = v1, labels = v2, cex.axis=1.5, family = "Times")
  ## Replaces log concentration x axis with calculations from v2 to display actual concentrations
  abline(v=cutoff, col="black", lty=2, lwd=2) # cutoff line
  text(cutoff+(fitData$step/2), fitData$ylimUpper-5, adj = c(0, 1), paste(cutofflabel, "\n =",round(10^(cutoff), 2), cutoffunits ), cex=1.5, family = "Times", font = 2)
  return(cutoff)
}
