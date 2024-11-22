import.data <- function(x) {
  rawdata <- read_excel(x)
  data_na <- na.omit(rawdata)
  mydata <- data_na[[1]]
}
