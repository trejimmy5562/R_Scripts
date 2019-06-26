################################################################################
# R^2 and Linear Regression
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Lecture20/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#make a plot of the data (by column)
plot(tab$Time, tab$Counts)

#this makes each variable their own, exemplified by the print statements below
attach(tab)
print(tab$Time)
print(Time)

#linear regression model
linear.model = lm(Counts ~ Time)
#see if it worked:
print(linear.model)

summary(linear.model)
abline(linear.model)
#residual analysis
plot(Time, linear.model$residuals)
abline(h = 0)

TimeSq = Time^2
#quadratic model of dataset
quadratic.model = lm(Counts ~ Time + TimeSq)
#print the stats on it
print(quadratic.model)
#combine this in binary plot to show quadratic relationship
timeValues = seq(0, 30, 0.1)
?predict
#reads in x and predicts y value
#specify model for prediction, type of variable (list), 
predictedValues = predict(quadratic.model, list(Time = timeValues, TimeSq = timeValues^2))
#plot them to get quadratic regression over plotted values:
plot(Time, Counts)
lines(timeValues, predictedValues)
#2nd order quadratic fit 







