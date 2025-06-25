#' @title Determines the modality of the dataset
#' @description This function tests the dataset's modality. It uses the modetest function from the multimode package written by Ameijeiras-Alonso et al. (2019) to determine the excess mass test statistic and test the number of modes. As a matter of course, this function runs the importData function, negating the need to run it separately.
#'
#' @param mydata Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Returns the p-value and excess mass statistic to determine whether the dataset is unimodal.
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
#' rawdata <- "R/exampledata.xlsx"
#' modetest <- modes(rawdata)

modes <- function(rawdata = "R/exampledata.xlsx"){
  mydata <- importdata(rawdata)
  modes1 <- modetest(mydata$data)
  EMS_stats <- function(mydata){
    EMS_value <- modes1$statistic
    EMS_pvalue <- modes1$p.value
    cat('Modality Test Results\n\nP-value:', EMS_pvalue,'\nExcess Mass Statistic:', EMS_value, '\n')
    if(EMS_pvalue > 0.05) {
      cat('**Accept null hypothesis.** Distribution is most likely unimodal; proceed with caution.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test\n\n')
    }
    cat('**Reject null hypothesis** Distribution contains more than one mode; proceed with analyses.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test\n\n')
  }
  results <- function (x) {
    return(list(pvalue = modes1$p.value, EMS = modes1$statistic))
  }
  EMS_stats()
  results()
}
