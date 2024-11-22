#' Import Data
#'
#' @param x An Excel spreadsheet with headerless, log-transformed data in the first column
#'
#' @return A list of values from the Excel spreadsheet that has blanks removed
#' @export
#'
#' @examples
#' rawdata <- "exampledata.xlsx"
#' import.data(rawdata)
import.data <- function(x) {
  rawdata <- read_excel(x)
  data_na <- na.omit(rawdata)
  mydata <- data_na[[1]]
}
