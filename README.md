---
title: "Cutoff Value Determination & Graph"
author: "Lea R. Medeiros"
date: "2025-03-05"
output:
  html_document:
    keep_md: yes
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# cutoffvalue

Cutoffvalue is a simple R package that implements an updated version of
the method first developed and used in Medeiros et al. (2018). It can be
used to determine an objective cutoff value between a significantly
bimodal distribution of log-transformed data and plot a representative
graph of the results.

## Installation

You can install the development version of cutoffvalue from [GitHub](https://github.com/lea-medeiros/cutoffvalue.git) with:

``` r
# install.packages("devtools")
devtools::install_github("lea-medeiros/cutoffvalue")
```

## Example

This is a basic example which shows you how to use the cutoffvalue package.

### Setup RStudio
Load the packages that are used by this package.

``` r
library(cutoffvalue)
library(mixtools)
```

```
## mixtools package, version 2.0.0, Released 2022-12-04
## This package is based upon work supported by the National Science Foundation under Grant No. SES-0518772 and the Chan Zuckerberg Initiative: Essential Open Source Software for Science (Grant No. 2020-255193).
```

``` r
library(Hmisc)
```

```
## 
## Attaching package: 'Hmisc'
```

```
## The following objects are masked from 'package:base':
## 
##     format.pval, units
```

``` r
library(plyr)
```

```
## 
## Attaching package: 'plyr'
```

```
## The following objects are masked from 'package:Hmisc':
## 
##     is.discrete, summarize
```

``` r
library(multimode)
library(readxl)
```

### Define your raw dataset
Specify the data file to be used in the analyses and graph (if located in root folder of an R project, path information is not necessary). Reminder: data should be organized in as a single column of log- or natural log-transformed data without a column header.

``` r
rawdata <- "R/exampledata.xlsx"
```
_This step isn't necessary if you'd rather use the path name for your data._

### Import the raw dataset
Import data and remove rows containing NA data. This function also defines minimum and maximum values for the dataset.

``` r
mydata <- importdata()
```
_Alternatively, you could enter the path name of your data in the read_excel function_

### Determine modality
Determine if the data is not unimodal (e.g., bimodal). This function also returns the Excess Mass statistic and associated p-value. 

```
## Warning in modetest(mydata$data): A modification of the data was made in order
## to compute the excess mass or the dip statistic
```


```
## [1] "**Reject null hypothesis**, accept alternative hypothesis. Proceed with analyses."
```
_Returns excess mass statistic and p-value. If the p-value is less than 0.05, accept the alternative hypothesis and proceed with analysis. However, if the p-value is more than 0.05, the data is unimodal and the following analyses are not entirely valid._

### Fit a model to the data
Fit the two component mixture models to the data and plot a rough histogram with the fitted lines. Also, define the index.lower value to be used in the find.cutoff function.

```
## number of iterations= 22
```

<img src="cutoffvalue_figures/model_data-1.jpeg" style="display: block; margin: auto;" />
_Make sure things look right, but won’t actually use this graph as it plots on a density scale and may cause confusion. However, this should look pretty spot on (final graph will just be scaled up by a constant determined later on), so make sure that the point where the two curves intersect is where you are expecting the cutoff to be._

### Determine the cutoff value
Determine the cutoff value between the two populations that has an equal chance of being drawn from either mode. The default is 0.5, but the probability can be changed in the code.


```
## [1] 0.1124707
```
_The uniroot lower and upper values are determined using the range of "mydata" and will reflect the dataset being analyzed. If there are errors due to the uniroot, consider editing the custom values to something that more generally reflects the range of the data being analyzed._

### Basic histogram and parameters
The code below will produce basic histogram of data used for the parameters it produces; alter number of breaks to reflect what you would like to see in the final graph. Then, use various parameters to define variables for the final graph

```
## number of iterations= 19
```

<img src="cutoffvalue_figures/basic_histogram-1.jpeg" style="display: block; margin: auto;" /><img src="cutoffvalue_figures/basic_histogram-2.jpeg" style="display: block; margin: auto;" />

### Create curves
Determine x and y values to calculate the points for the curves to represent the generated models

```
## number of iterations= 18
```

<img src="cutoffvalue_figures/curves-1.jpeg" style="display: block; margin: auto;" />

```
## number of iterations= 17
```

<img src="cutoffvalue_figures/curves-2.jpeg" style="display: block; margin: auto;" /><img src="cutoffvalue_figures/curves-3.jpeg" style="display: block; margin: auto;" />
_Creates curves using model parameters_

### Plot the graph
Plot a pretty graph - SOME OF THE FOLLOWING WILL NEED TO BE TWEAKED TO FIT YOUR DATA/PREFERENCES!!! If nothing is specified in the plot function, then these are used.

#### Specify graph labels

``` r
title <- "Plasma 11-KT levels in age-2 male spring chinook"  # Graph title
xlab <- "Plasma [11-KT] (ng/mL)" # X-axis label
cutofflab <- "Minijack cutoff" # label for cutoff value on graph
cutoffunits <- "(ng/mL)" # units for cutoff value
```

#### Plot the graph

```
## number of iterations= 19
```

<img src="cutoffvalue_figures/pretty_graph-1.jpeg" style="display: block; margin: auto;" />

```
## number of iterations= 18
```

<img src="cutoffvalue_figures/pretty_graph-2.jpeg" style="display: block; margin: auto;" />

```
## number of iterations= 19
```

<img src="cutoffvalue_figures/pretty_graph-3.jpeg" style="display: block; margin: auto;" /><img src="cutoffvalue_figures/pretty_graph-4.jpeg" style="display: block; margin: auto;" />

```
## number of iterations= 20
```

<img src="cutoffvalue_figures/pretty_graph-5.jpeg" style="display: block; margin: auto;" />

```
## number of iterations= 19
```

<img src="cutoffvalue_figures/pretty_graph-6.jpeg" style="display: block; margin: auto;" /><img src="cutoffvalue_figures/pretty_graph-7.jpeg" style="display: block; margin: auto;" /><img src="cutoffvalue_figures/pretty_graph-8.jpeg" style="display: block; margin: auto;" />
_All figures can be found in the "cutoffvalue_figures" folder. They are exported as PDF, JPEG, and PNG at 300 dpi._
