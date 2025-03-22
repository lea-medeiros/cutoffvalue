#' @title Generate a histogram, with associated parameters, from the dataset
#' @description This function produces a histogram of the data that will be used for fitting curves. As a matter of course, this function runs the importData and datamodel functions for you, negating the need to run those separately.
#'
#' @param mydata Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
#' column header.
#'
#' @returns Returns a basic histogram for the data set along with various parameters used to generate curves for the final plot.
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' fit <- fitparams()

fitparams <- function(mydata = "R/exampledata.xlsx", breaks = 15){
  mydata <- here::here("R", "exampledata.xlsx")
  mydata <- importdata(mydata)
  model <- datamodel()
  h <- hist(mydata$data, breaks = breaks)
  step <- abs(h$breaks[[1]]-h$breaks[[2]])
  return(list(h = h, xlimUpper = round(mydata$upper*2)/2, xlimLower = (round(mydata$lower*2)/2)-0.25,
              ylimUpper = round_any(max(h$counts), 5), step = abs(h$breaks[[1]]-h$breaks[[2]]),
              xfitLower = min(h$breaks)-step, xfitUpper = max(h$breaks)+step, v1Lower = min(h$mids),
              v1Upper = max(h$mids)))
}
