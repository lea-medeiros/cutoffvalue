#' @title Generate models for each mode of the dataset
#' @description This function generates the normal mix EM model for the data set. As a matter of course, this function also runs the cleanData function for you, negating the need to run it separately.
#'
#' @param x Your dataset specified as "DatasetName$ColumnName"; data should be a single column of log-transformed data with a column header.
#'
#' @returns Returns the model parameters and lower index value for the data set.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' mcmodel <- datamodel(cutoffvalue:::exampledata)

datamodel <- function(x = cutoffvalue:::exampledata){
  mydata <- cleandata(x)
  model <- normalmixEM(mydata$data)
  plot(model, whichplots=2)
  return(list(mydata = model, indexLower = which.min(model$mu)))
}
