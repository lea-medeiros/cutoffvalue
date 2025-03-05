#' Histogram for fitting curves
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Basic histogram of dataset along with various parameters used to fit curves
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' fit <- fit()

fitparams <- function(mydata = "cutoffvalue/extdata/exampledata.xlsx"){
  mydata <- here("cutoffvalue", "extdata", "exampledata.xlsx")
  mydata <- importdata(mydata)
  model <- datamodel()
  h <- hist(mydata$data, breaks=15)
  step <- abs(h$breaks[[1]]-h$breaks[[2]])
  return(list(h = h, xlimUpper = round(mydata$upper*2)/2, xlimLower = (round(mydata$lower*2)/2)-0.25,
              ylimUpper = round_any(max(h$counts), 5), step = abs(h$breaks[[1]]-h$breaks[[2]]),
              xfitLower = min(h$breaks)-step, xfitUpper = max(h$breaks)+step, v1Lower = min(h$mids),
              v1Upper = max(h$mids)))
}
