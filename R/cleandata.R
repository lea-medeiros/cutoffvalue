#' @title Clean up your dataset.
#' @description This function cleans up your dataset after it has been added to the Global Environment. It will remove any blank rows and determine the minimum and maximum values of the dataset.
#'
#' @param x Your dataset specified as "DatasetName$ColumnName"; data should be a single column of log-transformed data with a column header.
#'
#' @return Returns your cleaned dataset along with the minimum and maximum values from that dataset.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' mydata <- cleandata(cutoffvalue:::exampledata)
#'
cleandata <- function(x = cutoffvalue:::exampledata) {
  mydata <- na.omit(x)
  mydataUpper <- max(mydata)
  mydataLower <- min(mydata)
  return(list(data = mydata, upper = mydataUpper, lower = mydataLower))
}
