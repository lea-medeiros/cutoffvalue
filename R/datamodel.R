#' @title Generate models for each mode of the dataset
#' @description This function generates the normal mix EM model for the data set. As a matter of course, this function also runs the importData function for you, negating the need to run it separately.
#'
#' @param rawdata Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
#' column header.
#'
#' @returns Returns the model parameters and lower index value for the data set.
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' rawdata <- "R/exampledata.xlsx"
#' mcmodel <- datamodel(rawdata)

datamodel <- function(rawdata = "R/exampledata.xlsx"){
  mydata <- importdata(rawdata)
  model <- normalmixEM(mydata$data)
  plot(model, whichplots=2)
  return(list(mydata = model, indexLower = which.min(model$mu)))
}
