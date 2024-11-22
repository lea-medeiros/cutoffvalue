
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cutoffvalue

<!-- badges: start -->
<!-- badges: end -->

Cutoffvalue is a simple R package that implements an updated version of
the method first developed and used in Medeiros et al. (2018). It can be
used to determine an objective cutoff value between a significantly
bimodal distribution of log-transformed data and plot a representative
graph of the results.

## Installation

You can install the development version of cutoffvalue from
[GitHub](https://github.com/lea-medeiros/cutoffvalue.git) with:

``` r
# install.packages("devtools")
devtools::install_github("lea-medeiros/cutoffvalue")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(cutoffvalue)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
