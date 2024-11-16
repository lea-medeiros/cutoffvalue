#' Import data
#'
#' @param x A character vector that is the name of your data file
#'
#' @return A data table with any "NA" rows removed
#' @export
#'
#' @examples
#' x <- "examples.xlsx"
#' import_data(x)
import_data <- function(x) {
  rawdata=read_excel(x)
  data_na=na.omit(rawdata)
}
