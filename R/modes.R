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
#' modetest <- modes()

modes <- function(mydata = "R/exampledata.xlsx"){
  mydata <- here::here("R", "exampledata.xlsx")
  mydata <- importdata(mydata)
  modes1 <- modetest(mydata$data)
  EMS_stats <- function(mydata = "R/exampledata.xlsx"){
    EMS_value <- modes1$statistic
    EMS_pvalue <- modes1$p.value
    cat('Modality Test Results\n\nP-value:', EMS_pvalue,'\nExcess Mass Statistic:', EMS_value, '\n')
    if(EMS_pvalue > 0.05) {
      cat('**Accept null hypothesis.** Distribution is most likely unimodal; proceed with caution.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test')
    }
    cat('**Reject null hypothesis** Distribution contains more than one mode; proceed with analyses.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test')
  }
  results <- function (x) {
    return(list(pvalue = modes1$p.value, EMS = modes1$statistic))
  }
  EMS_stats()
  results()
}
