################################################################################
# Assignment 5
################################################################################

#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn5/assignment05_data/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)

#initialize variables
xc = vector()
yc = vector()

#read in data and do statz stuff
for (i in 1:length(fpaths)){
  tab = read.csv(fpaths[i], header = T)
  #assign columns to their own variables
  x = tab$lon_dd
  y = tab$lat_dd
  
  xc[i] = mean(x)
  yc[i] = mean(y)
  
}










