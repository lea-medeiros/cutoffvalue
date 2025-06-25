## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  echo = TRUE,
  comment = "#>"
)

## ----load-packages, message=FALSE---------------------------------------------
library(cutoffvalue)

## ----modetest, warning=FALSE, echo=1------------------------------------------
modetest <- modes("R/exampledata.xlsx")

## ----graph-parameters, echo=TRUE----------------------------------------------
title <- "Plasma 11-KT levels in age-2 male spring chinook"  # Graph title
xlab <- "Plasma [11-KT] (ng/mL)" # X-axis label
cutofflab <- "Minijack cutoff" # label for cutoff value on graph
cutoffunits <- "(ng/mL)" # units for cutoff value
LowerMode_col <- "red" # line color for the lower mode
LowerMode_lty <- 1 # line type for the lower mode
LowerMode_lwd <- 2 # line width for the lower mode
UpperMode_col <- "purple" # line color for the upper mode
UpperMode_lty <- 1 # line type for the upper mode
UpperMode_lwd <- 2 # line width for the upper mode
cutoffvalue_col <- "black" # line color for the cutoff value
cutoffvalue_lty <- 2 # line type for the cutoff value
cutoffvalue_lwd <- 2 # line width for the cutoff value

## ----graph, results='hide', fig.keep='last', fig.align='center', dpi=150, fig.dim=c(9, 5), out.width=700, out.height=390----
plottyMcplotty <- cutoffplot(rawdata, title, xlab, cutofflab, cutoffunits, LowerMode_col, LowerMode_lty, LowerMode_lwd, UpperMode_col, UpperMode_lty, UpperMode_lwd, cutoffvalue_col, cutoffvalue_lty, cutoffvalue_lwd)

## ----importdata---------------------------------------------------------------
mydata <- importdata("R/exampledata.xlsx")

## ----model-data, results='hide', fig.keep='last', fig.align='center', dpi=150, fig.dim=c(9, 5), out.width=700, out.height=390----
model <- datamodel("R/exampledata.xlsx")

## ----find-cutoff, fig.show='hide'---------------------------------------------
cutoff <- findcutoff("R/exampledata.xlsx", proba=0.5)

## ----basic-histogram, results='hide', fig.keep='last', fig.align='center', dpi=150, fig.dim=c(9, 5), out.width=700, out.height=390----
fit <- fitparams("R/exampledata.xlsx", breaks = 15)

## ----curves, results='hide', fig.show='hide'----------------------------------
curves <- curves("R/exampledata.xlsx")

