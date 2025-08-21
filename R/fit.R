#' @title Generate a histogram, with associated parameters, from the dataset
#' @description This function produces a histogram of the data that will be used for fitting curves. As a matter of course, this function runs the cleanData and datamodel functions for you, negating the need to run those separately.
#'
#' @param x Your dataset specified as "DatasetName$ColumnName"; data should be a single column of log-transformed data with a column header.
#'
#' @returns Returns a basic histogram for the data set along with various parameters used to generate curves for the final plot.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' fit <- fitparams(cutoffvalue:::exampledata)

fitparams <- function(x = cutoffvalue:::exampledata, breaks = 15){
  mydata <- cleandata(x)
  model <- datamodel(x)
  h <- hist(mydata$data, breaks = breaks)
  step <- abs(h$breaks[[1]]-h$breaks[[2]])
  return(list(h = h, step = abs(h$breaks[[1]]-h$breaks[[2]]), xlimUpper = max(h$breaks)+step, xlimLower = min(h$breaks)-step,
              ylimUpper = plyr::round_any(max(h$counts), 5, ceiling), xfitLower = min(h$breaks)-step, xfitUpper = max(h$breaks)+step,
              v1Lower = min(h$mids), v1Upper = max(h$mids)))
}
