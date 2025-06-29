% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cleandata.R
\name{cleandata}
\alias{cleandata}
\title{Import your dataset}
\usage{
cleandata(x = cutoffvalue:::exampledata)
}
\arguments{
\item{x}{Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
column header.}
}
\value{
Returns a list of values from the raw data in your Excel spreadsheet that has blanks removed.
}
\description{
This function imports your dataset from an excel file, removes any blank rows, and determines the minimum and maximum values
}
\examples{
mydata <- cleandata(cutoffvalue:::exampledata)

}
