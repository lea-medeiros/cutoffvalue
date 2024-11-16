#
#
#

# Name your data file (if located in R project folder, path information is not necessary).
# Reminder: data should be organized in as a single column of log- or natural log-transformed data with
#         column header.
rawdata <- "exampledata.xlsx"

#Import data and remove rows containing NA data
data <- import_data(rawdata)

# Determine if the data is not unimodal (e.g., bimodal)
modetest(data)
# Returns excess mass statistic and p-value
# If P-value is less than 0.05, accept the alternative hypothesis and proceed with analysis

model=normalmixEM(data)
plot(model, whichplots = 2)
index.lower <- which.min(model$mu)
# Make sure things look right, but won’t actually use this graph as it plots on a density scale and may
# cause confusion. However, this should look pretty spot on (final graph will just be scaled up by a
# constant determined later on), so make sure that the point where the two curves intersect is where
# you are expecting the cutoff to be

cutoff <- c(find.cutoff(proba=0.5))
