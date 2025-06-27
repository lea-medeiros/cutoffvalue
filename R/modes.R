#' @title Determines the modality of the dataset
#' @description This function tests the dataset's modality. It uses the modetest function from the multimode package written by Ameijeiras-Alonso et al. (2019) to determine the excess mass test statistic and test the number of modes. As a matter of course, this function runs the cleanData function, negating the need to run it separately.
#'
#' @param x Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
#' column header
#'
#' @returns Returns the p-value and excess mass statistic to determine whether the dataset is unimodal.
#'
#' @import mixtools
#' @import Hmisc
#' @importFrom multimode modetest
#' @importFrom plyr round_any
#'
#' @export
#'
#' @examples
#' modetest <- modes(cutoffvalue:::exampledata)

modes <- function(x = cutoffvalue:::exampledata){
  mydata <- cleandata(x)
  output <- capture.output(multimode::modetest(mydata$data))
  results <- unlist(strsplit(output[5], ", "))
  EMS_value <- results[1]
  EMS_pvalue <- results[2]
  modes1 <- multimode::modetest(mydata$data)
  EMS_stats <- function(mydata){
    cat('Modality Test Results:\n', '-', EMS_value, '\n', '-', EMS_pvalue,'\n')
    if(modes1$p.value > 0.05) {
      cat('**Accept null hypothesis** Distribution is most likely unimodal; proceed with caution.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test\n\n')
    } else if (modes1$p.value < 0.05) {
        cat('**Reject null hypothesis** Distribution contains more than one mode; proceed with analyses.\n\nTest Credit: Ameijeiras-Alonso et al. (2019) excess mass test\n\n')
    }
  }
  results <- function (x) {
    return(list(EMS_pvalue, EMS_value))
  }
  EMS_stats()
  results()
}
