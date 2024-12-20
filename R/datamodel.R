#' Generate Normal Mix EM Model for Data
#'
#' @param x Dataset
#'
#' @returns Model parameters and lower index
#' @export
#'
#' @examples
#' model <- datamodel()

dataModel <- function(mydata = "data/exampledata.xlsx"){
  mydata <- importData(mydata)
  model <- normalmixEM(mydata$data)
  plot(model, whichplots=2)
  return(list(mydata = model, indexLower = which.min(model$mu)))
}
