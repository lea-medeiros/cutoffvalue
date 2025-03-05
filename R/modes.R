#' Test Data Modality
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns The p-value for whether or not the dataset is unimodal
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom multimode modetest
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' modeTest <- modes()

modes <- function(mydata = "cutoffvalue/extdata/exampledata.xlsx"){
  mydata <- here("cutoffvalue", "extdata", "exampledata.xlsx")
  mydata <- importdata(mydata)
  modes <- modetest(mydata$data)
  return(list(pvalue = modes$pValue, ExcessMassStatistic = modes$statistic))
}
