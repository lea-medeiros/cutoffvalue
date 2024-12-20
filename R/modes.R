#' Test Data Modality
#'
#' @param x The data
#'
#' @returns The p-value for whether or not the dataset is unimodal
#' @export
#'
#' @examples
#' mode.pvalue <- modes()
modes <- function(mydata = "data/exampledata.xlsx"){
  mydata <- importData(mydata)
  modes <- modetest(mydata$data)
  return(list(pvalue = modes$pValue, ExcessMassStatistic = modes$statistic))
}
