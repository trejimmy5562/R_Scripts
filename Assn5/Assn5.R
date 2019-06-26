################################################################################
# Assignment 5
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn5/assignment05_data/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
################################################################################
#This will export our PDF plots for Question 3
################################################################################
pdfnames = substr(fnames,1,nchar(fnames)-4)
pdfpath = paste0(fdir, paste0(pdfnames, ".pdf"))
pdf(pdfpath)

#initialize variables
xc = vector()
yc = vector()
st1 = vector()
################################################################################
#read in data and do spatial centers & Std Distance
################################################################################
for (i in 1:length(fpaths)){
  tab = read.csv(fpaths[i], header = T)
  #set columns equal to variables
  x = tab$lon_dd
  y = tab$lat_dd
  ################################################################################
  #plot it for question 3
  ################################################################################
  plot(x,y, pch = 3)
  #spatial centers
  xc[i] = mean(x)
  yc[i] = mean(y)
  points(xc[i],yc[i], pch=16)
  #standard distance
  st1[i] = sqrt(sum((x - xc[i])^2) + sum((y - yc[i])^2))
  #plot on top
  par(new=T)
  #plot the stand distance as a circle:
  symbols(xc[i], yc[i], circles = st1[i], xlim = range(x), ylim = range(y), xlab = "", ylab = "", main = fnames[i])
}

dev.off()
################################################################################
#Answer to Question 2
################################################################################
table2 = matrix(c(xc[1], xc[2], xc[3], xc[4], xc[5], st1[1], st1[2], st1[3], st1[4], st1[5]), ncol=2, nrow = 5)
rownames(table2) = c("covers", "lampsrackhydrants", "signs", "stairsbenches", "trash")
colnames(table2) = c("Spatial Center", "Standard Distance")
table2 = as.table(table2)
print(table2)
################################################################################
#Answer to question 3 gets exported to pdf file in same directory as original 5 files
################################################################################


################################################################################
# JB 3/26 #
################################################################################