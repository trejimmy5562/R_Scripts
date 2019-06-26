################################################################################
# Assignment 7 practice - autocorrelation
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn7/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#separate variables
date = tab$date
q1 = tab$Q1
q2 = tab$Q2
#plot the variables
#
plot(date, q1, type="l", col=2, ylab = "Discharge Velocity ()", xlab = "Date (years)")
legend(x=1986, y=3800, legend = c("Station 1", "Station 2"), fill=c("red","blue"), col="black", bg="white")
lines(q2, col=4)


################################################################################
# Question 4
################################################################################

#regression
reg = lm(q1 ~ date)
#now onto autocorrelation
#lag autocorrelation
#we say day 1 data goes to day 2, 2 to 3, etc. 
#this will give us a degree of autocorrelation
#first case will be 1 week, then 2, all the way to 60 weeks lag
#k is a vector from 1 to 60
k = 1:500
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
acf(reg$residuals, lag.max = 500, main="Autocorrelation Graph")





