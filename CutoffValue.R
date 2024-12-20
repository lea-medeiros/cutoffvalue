

# Name your data file (if located in R project folder, path information is not necessary).
# Reminder: data should be organized in as a single column of log- or natural log-transformed data without a
# column header.
rawdata <- "data/exampledata.xlsx"

#Import data and remove rows containing NA data and define minimum and maximum values for the dataset
mydata <- importData(rawdata)

#mydata.upper <- max(mydata)
#mydata.lower <- min(mydata)
  ## mydata.lower and mydata.upper are used in the find.cutoff function

# Determine if the data is not unimodal (e.g., bimodal)
#modetest(mydata$data)
modetest <- modes()
  ## Returns excess mass statistic and p-value
  ## If P-value is less than 0.05, accept the alternative hypothesis and proceed with analysis

# Fit the two component mixture models to the data and plot a rough histogram with the fitted lines. Also,
# define the index.lower value to be used in the find.cutoff function.
model <- dataModel()
#mydata_model <- normalmixEM(mydata$data)
#plot(mydata_model, whichplots = 2)
#index.lower <- which.min(mydata_model$mu)
  ## Make sure things look right, but won’t actually use this graph as it plots on a density scale and may
  ## cause confusion. However, this should look pretty spot on (final graph will just be scaled up by a
  ## constant determined later on), so make sure that the point where the two curves intersect is where
  ## you are expecting the cutoff to be

# Determine the cutoff value between the two populations that has an equal chance of being drawn from either
# mode. The default is 0.5, but the probability can be changed; see findCutoff.R function.
cutoff <- findCutoff()
  ## The uniroot lower and upper values are determined using the range of "mydata" and will reflect the dataset
  ## being analyzed. If there are errors due to the uniroot, consider going into the findCutoff.R function and
  ## editing the custom values to something that more generally refelcts the range of the data being analyzed.

# Will produce basic histogram of data used for the parameters it produces; alter number of breaks to reflect
# what you would like to see in the final graph. Then, use various parameters to define variables for the final
# graph
myFitData <- fitparams()
#h <- hist(mydata$data, breaks=15)
#xlim.upper <- round(mydata$upper*2)/2
#xlim.lower <- (round(mydata$lower*2)/2)-0.25
#ylim.upper <- round_any(max(h$counts), 5)
#step <- abs(h$breaks[[1]]-h$breaks[[2]])
#xfit.lower <- min(h$breaks)-step
#xfit.upper <- max(h$breaks)+step
#v1.lower <- min(h$mids)
#v1.upper <- max(h$mids)

# Determine seq of x values to calculate the points for the models
curves <- curves()
#xfit <- seq(fit$xfit.lower, fit$xfit.upper, length=200)
  ## First number is the minimum bin for the dataset and the second number is the maximum bin, length is number
  ## of plots pointed (higher number = smoother curve… to a point)

# Define the curves to be used to calculate the points for plotting
#yfit1 <- mydata_model$lambda[1]*dnorm(xfit,mean=mydata_model$mu[1],sd=mydata_model$sigma[1])
#yfit2 <- mydata_model$lambda[2]*dnorm(xfit,mean=mydata_model$mu[2],sd=mydata_model$sigma[2])
#yfit1 <- yfit1*diff(h$mids[1:2])*length(mydata$data)
#yfit2 <- yfit2*diff(h$mids[1:2])*length(mydata$data)

# Plot a pretty graph - SOME OF THE FOLLOWING WILL NEED TO BE TWEAKED TO FIT YOUR DATA!!!
myDataPlot("Test Title", "test Axis", "test cutoff", "test units")
#v1 = seq(fitdata$v1.lower, fitdata$v1.upper,length=11)
#v2 = signif(10^v1, digits=2)
  ## Converts log to actual concentration with only 2 significant digits
#par(mar=c(5,6,4,1)+.1)
#hist(mydata$data, breaks = 15, density = 10, col = "grey", xaxt="n", xlab = "Plasma [11-KT] (ng/mL)",
     #ylim = c(0, fitdata$ylim.upper), xlim = c(fitdata$xlim.lower, fitdata$xlim.upper), main = " ",
     #cex.lab=2, cex.axis=1.5, family = "Times")
#lines(xvalues, yvalues1, col="red", lwd=2)
#lines(xvalues, yvalues2, col="purple", lwd=2)
#axis(side = 1, at = v1, labels = v2, cex.axis=1.5, family = "Times")
  ## Replaces log concentration x axis with calculations from v2 to display actual concentrations
#abline(v=cutoff, col="black", lty=2, lwd=2) # cutoff line
#text(cutoff+(fitdata$step/2), fitdata$ylim.upper-5, adj = c(0, 1), paste("Minijack cutoff", "\n =",
                                                                         #round(10^(cutoff), 2), "(ng/mL)" ),
     #cex=1.5, family = "Times", font = 2)

