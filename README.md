---
title: "Cutoff Value Determination & Graph"
author: "Lea R Medeiros"
date: "2025-06-25"
output:
  html_document:
    keep_md: true
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# cutoffvalue

`cutoffvalue` is a simple R package that implements an updated version of the method first developed and used in Medeiros et al. (2018)^[Medeiros LR, Galbreath PF, Knudsen CM, Stockton CA, Koch IJ, Bosch WJ, Narum SR, Nagler JJ, Pierce AL (2018) Plasma 11-Ketotestosterone in Individual Age-1 Spring Chinook Salmon Males Accurately Predicts Age-2 Maturation Status. Transactions of the American Fisheries Society 147 (6):1042-1051. doi:10.1002/tafs.10097]. It can be used to determine an objective cutoff value between a significantly bimodal distribution of log-transformed data and plot a representative graph of the results.

The overall goals of this package are to (1) determine a cutoff value between the upper and lower modes of the dataset and (2) produce a nice graph of the results that includes a histogram of the data, the two models fit to the upper and lower modes, and a line depicting the cutoff value. The functions are written to be run independently, so that only two functions need to be run to get the necessary information:

- modes() <- Determines modality of the dataset, which is an assumption for the remaining functions
- cutoffplot() <- Determines the cutoff value and produces a nice graph of the results

The functions in this package are written to utilize the example data set (an internal dataset object identified by "rawdata") and will use it by default if a dataset is not provided. Below are the instructions on how to install the `cutoffvalue` package, setup the R Studio environment, and suggestions on how to import your dataset. Please see the vignette for more information about each function.

## Installation

You can install the development version of cutoffvalue from [GitHub](https://github.com/lea-medeiros/cutoffvalue.git) with:


``` r
# devtools::install_github("lea-medeiros/cutoffvalue", dependencies = TRUE, build_vignettes = TRUE)
```


## Setup RStudio

Load the packages that are used by this package.


``` r
library(cutoffvalue)
library(mixtools)
library(Hmisc)
library(plyr)
library(multimode)
```


## Import your dataset

Import the data file to be used in the analyses and graph. The package includes a dataset for use as an example - this object is accessible as "rawdata" and will be used in the examples.

Import your dataset any way you prefer. However, keep in mind that data should be organized as a single column of log- or natural log-transformed data. I find that the easiest way to import data is to use the "Import Dataset" function built into R Studio, but you can also use code (an example is provided below).

``` r
library(readxl)
yourrawdata <- read_excel("/path/to/your/excel/data")
```

Each function in this package uses the provided dataset (whether it's the example dataset or one you provided) and cleans it up (via the `cleandata` function, see the vignette for more information) to remove any blank cells. This function then provides a list of objects: the data (`mydata$data`), the maximum value (`mydata$upper`), and the minimum value (`mydata$lower`), all of which are then used in subsequent calculations.
