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
