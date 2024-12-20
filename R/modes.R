#' Test Data Modality
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns The p-value for whether or not the dataset is unimodal
#' @export
#'
#' @examples
#' modeTest <- modes()

library(readxl)
library(mixtools)
library(Hmisc)
library(plyr)
library(multimode)

modes <- function(mydata = "inst/extdata/exampledata.xlsx"){
  mydata <- importData(mydata)
  modes <- modetest(mydata$data)
  return(list(pvalue = modes$pValue, ExcessMassStatistic = modes$statistic))
}
