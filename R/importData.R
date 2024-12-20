#' Import Data
#'
#' @param mydata
#'
#' @return A list of values from the Excel spreadsheet that has blanks removed
#' @export
#'
#' @examples
#' import.data(rawdata)
importData <- function(mydata = "data/exampledata.xlsx") {
  rawdata <- mydata
  rawdata <- read_excel(rawdata)
  data_na <- na.omit(rawdata)
  mydata <- data_na[[1]]
  mydataUpper <- max(mydata)
  mydataLower <- min(mydata)
  return(list(data = mydata, upper = mydataUpper, lower = mydataLower))
}
