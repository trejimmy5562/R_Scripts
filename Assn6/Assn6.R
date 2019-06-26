################################################################################
# Assignment 6
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn6/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#make a plot of the data (by column)
plot(tab$elev_m, tab$temp_C)
#allow columns to be separated
attach(tab)
#take linear regression
reg = lm(temp_C ~ elev_m)
#plot
summary(reg)
abline(reg, col="green")
#find the slope and intercept
a = reg$coefficients[1][[1]]
b = reg$coefficients[2][[1]]


#find sigma Xi and sigma Yi
Xi = sum(elev_m)
Yi = sum(temp_C)
#
X2 = vector()
#find the sum of XiYi
xy = vector()
for(i in 1:length(elev_m)){
  xy[i] = (elev_m[i]*temp_C[i])
  X2[i] = (elev_m[i]*elev_m[i])
}
XiYi = sum(xy)
#find sum X^2
Xi2 = sum(X2)
#number of data points
n = length(elev_m)


#table with answers
table2 = matrix(c(Xi, Yi, XiYi, b, a), ncol=5, nrow = 1)
rownames(table2) = c("Answers:")
colnames(table2) = c("SUM(Xi)", "SUM(Yi)", "SUM(XiYi)", "Slope", "Intercept")
table2 = as.table(table2)
print(table2)
################################################################################
#JB 4/8
################################################################################