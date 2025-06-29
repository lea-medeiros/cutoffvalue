% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datamodel.R
\name{datamodel}
\alias{datamodel}
\title{Generate models for each mode of the dataset}
\usage{
datamodel(x = cutoffvalue:::exampledata)
}
\arguments{
\item{x}{Your data file; data should be organized in an Excel document as a single column of log- or natural log-transformed data without a
column header.}
}
\value{
Returns the model parameters and lower index value for the data set.
}
\description{
This function generates the normal mix EM model for the data set. As a matter of course, this function also runs the cleanData function for you, negating the need to run it separately.
}
\examples{
mcmodel <- datamodel(cutoffvalue:::exampledata)
}
