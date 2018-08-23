#Class exercise 1.
# Amanda Arnold, 08/22/18, this program does the KM analysis and plot.

# Load the datasets, survival package which has function for KM analysis
require (datasets)
require (survival)

#Check your dataset
head(lung)

#make an object survData
survData <- lung

# Use Package survival
survObj <- Surv(time=survData$time, event=survData$status==2, type='right')

#dim(survData) dimensions of yourdata set, Intercept?

# Fit your plot to the intercept
fit <- survfit(survObj ~ 1)

# Plot the fit
plot(fit, main="KM plot for Lung cancer data", xlab="Time in days", ylab="Percent survival")

# Fit your plot to the sexes
fit <- survfit(survObj ~ survData$sex==1)

# Plot the new fit
plot(fit, main="KM plot for Lung cancer data in males and females", xlab="Time in days", ylab="Percent survival", col=c(1,2))

#x11 means keep both plots

#assigning labels
legend('topright', c("Male","Female"), lty=1, col=c(1,2))
#c allows you to include multiple numbers
