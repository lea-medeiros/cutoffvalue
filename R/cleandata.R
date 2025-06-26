#' @title Import your dataset
#' @description This function imports your dataset from an excel file, removes any blank rows, and determines the minimum and maximum values
#'
#' @param rawdata Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
#' column header.
#'
#' @return Returns a list of values from the raw data in your Excel spreadsheet that has blanks removed.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' mydata <- cleandata(rawdata)
#'
cleandata <- function(x = cutoffvalue:::rawdata) {
  mydata <- na.omit(x)
  mydataUpper <- max(mydata)
  mydataLower <- min(mydata)
  return(list(data = mydata, upper = mydataUpper, lower = mydataLower))
}
