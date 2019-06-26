################################################################################
# Assignment 5
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn5/assignment05_data/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)

#initialize variables:
#i = 1


#read in tables and do statz stuff:
for (i in 1:length(fnames)){
  tab1 = read.csv(fpaths[i], header = T)
  x1 = tab1$lon_dd
  y1 = tab1$lat_dd
  
}

allData = list()



for (i in 1:length(fnames)) {
  #read in tables
  tab1 = read.csv(fpaths[i], header = T)
  datalist[[i]] <- tab1 # add it to your list
}
allData = do.call(rbind, datalist)



cbdMC = data.frame(cbind(xc, yc))





























#table2 = matrix(c(omg, oms, oml, m1, m2, m3, ssg, sss, ssl, Zg, Zs, Zl, "no", "no", "no", "no", "no", "no", "no", "no", "no"), ncol=2, nrow = 5)
#rownames(table2) = c("covers", "lampsrackhydrants", "signs", "stairsbenches", "trash")
#colnames(table2) = c("Spatial Center", "Standard Distance")
#table2 = as.table(table2)
#print(table2)

################################################################################
# JB 3/26
################################################################################