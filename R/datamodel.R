#' Generate Normal Mix EM Model for Data
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Model parameters and lower index
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' Mcmodel <- datamodel()

datamodel <- function(mydata = "R/exampledata.xlsx"){
  mydata <- here("R", "exampledata.xlsx")
  mydata <- importdata(mydata)
  model <- normalmixEM(mydata$data)
  plot(model, whichplots=2)
  return(list(mydata = model, indexLower = which.min(model$mu)))
}
