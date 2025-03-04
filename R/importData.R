#' Import Data
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @return A list of values from the Excel spreadsheet that has blanks removed
#'
#' @importFrom readxl read_excel
#' @import mixtools
#' @import Hmisc
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' mydata <- importData()

importData <- function(mydata = "extdata/exampledata.xlsx") {
  mydata <- here("extdata", "exampledata.xlsx")
  rawdata <- mydata
  rawdata <- read_excel(rawdata)
  data_na <- na.omit(rawdata)
  mydata <- data_na[[1]]
  mydataUpper <- max(mydata)
  mydataLower <- min(mydata)
  return(list(data = mydata, upper = mydataUpper, lower = mydataLower))
}
