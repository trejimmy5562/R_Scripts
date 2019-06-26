path1 = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn3"
fnames = list.files(path = path1, pattern = ".csv")
fpath = paste0(path1, "/", fnames[1])
table1 = read.csv(fpath, header=T)
print(table1)
fpath2 = paste0(path1, "/", fnames[2])
tab = read.csv(fpath2)
print(tab)
fpath3 = paste0(path1, "/", fnames[3])
tab3 = read.csv(fpath3)
print(tab3)

outputtab1 = rbind(table1, tab)
print(outputtab1)
outputtab2 = rbind(outputtab1, tab3)
print(outputtab2)


tableg = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_grass.csv", header=T)
tables = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_sidewalk.csv", header=T)
tablel = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_lot19.csv", header=T)
omg = mean(tableg[,4])
oms = mean(tables[,4])
oml = mean(tablel[,4])

totmean = mean(outputtab2[,4])

m1 = mean(table1[,4])
m2 = mean(tab[,4])
m3 = mean(tab3[,4])

s1 = sd(table1[,4])
s2 = sd(tab[,4])
s3 = sd(tab3[,4])

ssg = sd(tableg[,4])
sss = sd(tables[,4])
ssl = sd(tablel[,4])

n2 = nrow(table1)
Zg = (omg - m1)/((ssg/sqrt(30))*sqrt((n2 - 30)/(n2 - 1)))
n2 = nrow(tab)
Zs = (omg - m1)/((sss/sqrt(30))*sqrt((n2 - 30)/(n2 - 1)))
n2 = nrow(tab3)
Zl = (omg - m1)/((ssl/sqrt(30))*sqrt((n2 - 30)/(n2 - 1)))




table2 = matrix(c(omg, oms, oml, m1, m2, m3, ssg, sss, ssl, Zg, Zs, Zl, "no", "no", "no", "no", "no", "no", "no", "no", "no"), ncol=7, nrow = 3)
rownames(table2) = c("grass", "sidewalk", "parking lot")
colnames(table2) = c("Xbar", "Mu", "s", "Z", "90%", "95%", "99%")
table2 = as.table(table2)
print(table2)

x = tableg[,4]
y = tables[,4]
z = tablel[,4]
a = table1[,4]
b = tab[,4]
c = tab3[,4]
hist(x,y,z,a,b,c, main="Our Temperature Data vs. Total Class data", xlab="Number of each Temperature Observed", ylab="Frequency", border="blue", col=c("red", "green"), breaks=6)

boxplot(x,y,z,a,b,c, main="Temp. data of our group vs. class data", names = c("our grass", "our sidewalk", "our lot 19", "class grass", "class sidewalk", "our lot19"),ylab = "Temperature (C)", col=c("orange", "red"), notch=TRUE)



