################################################################################
# Assignment 7 practice - autocorrelation
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn7/lecture/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#separate variables
date = tab$date
ppm = tab$ppm
#make a plot of the data with a line (l) by each variable
plot(date, ppm, type="l")
#regression
reg = lm(ppm ~ date)
#this outputs intercept and then slope
################################################################################
#Coefficients:
#(Intercept)         date  
#-4385.908        2.375
################################################################################
#now plot regression using abline, with color red and weight of 2
abline(reg, col = 2, lwd = 2)
#take a look at the residuals:
print(reg$residuals)
#now lets plot said residuals in a line
plot(date, reg$residuals, type = 'l', ylab = 'residuals (ppm)')
#^there is more photosynthesis in summer absorbing CO2 than there is in summer^
#add a horizontal line across the middle:
abline(h=0, col=2, lwd=2)
#now onto autocorrelation
#lag autocorrelation
#we say day 1 data goes to day 2, 2 to 3, etc. 
#this will give us a degree of autocorrelation
#first case will be 1 week, then 2, all the way to 60 weeks lag
#k is a vector from 1 to 60
k = 1:60
notLagged = reg$residuals
#set lagged to initially be equal to residuals
lagged = reg$residuals
#create variable to store correlations
r = vector()
#we will now iterate and lag the values by 1 week to the beginning
for (i in 1:length(k)) {
  #add Na to front
  lagged = c(NA, lagged)
  #add na to end to maintain same size
  notLagged = c(notLagged, NA)
  #end parameter ignores NA values and finds correlation
  r[i] = cor(notLagged, lagged, use = "pairwise.complete.obs")
  
}
#plot your findings of autocorrelation:
plot(k, r)
#^top of graph is high correlation, bottom is low^
#this is a faster way to find autocorrelation function estimation
#it also plots it!:
acf(reg$residuals, lag.max = 60)
#

#

#