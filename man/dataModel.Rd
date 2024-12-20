% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datamodel.R
\name{dataModel}
\alias{dataModel}
\title{Generate Normal Mix EM Model for Data}
\usage{
dataModel(mydata = "inst/extdata/exampledata.xlsx")
}
\arguments{
\item{mydata}{Your data file; data should be organized in as a single column of log- or natural log-transformed data without a
column header}
}
\value{
Model parameters and lower index
}
\description{
Generate Normal Mix EM Model for Data
}
\examples{
model <- datamodel()
}
