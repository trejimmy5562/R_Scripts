table1 = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assignment1.csv", header=T)
print(table1)

DBH = table1[,3]
print(DBH)

hist(DBH, main="Histogram of Tree DBH by Systematic Sampling", xlab="Diameter of Trees in Inches", ylab="Frequency", border="blue", col="red", xlim=c(0,40), breaks=6)

legend(border = "blue", "topright", c("Freq. of Trees per Diameter"), fill=c("red"), text.width = 12, cex=0.59, pt.cex = 1)

library(e1071)
m2 = mean(DBH)
s2 = sd(DBH)
sk2 = skewness(DBH)
k2 = kurtosis(DBH)
mx2 = max(DBH)
mn2 = min(DBH)
rg2 = range(DBH)
table2 = matrix(c( m2, s2, sk2, k2, mx2, mn2, rg2), ncol=1)
colnames(table2) = c("Statistics")
rownames(table2) = c("mean", "std dev", "skewness", "kurtosis", "max", "min", "min", "range")
table2 = as.table(table2)
print(table2)
