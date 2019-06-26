################################################################################
# Semester Project
################################################################################
#library(ggplot2)
#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Project/plots/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#separate data into yearly chunks for plotting
#attach(tab)


#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Project/new/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab2 = read.csv(fpaths, header = T)
#separate data into yearly chunks for plotting
attach(tab2)


#set columns equal to variables
x = tab$lon
y = tab$lat
################################################################################
#plot it for mean center/std. dist
################################################################################
#plot(x,y, pch = 3)
#spatial centers
xc = mean(x)
yc = mean(y)
#points(xc,yc, pch=16)
#standard distance
#st1 = sqrt(sum((x - xc)^2) + sum((y - yc)^2))
#plot on top
#par(new=T)
#plot the stand distance as a circle:
#symbols(xc, yc, circles = st1, xlim = range(x), ylim = range(y), xlab = "", ylab = "", main = fnames)

ff = names(tab2)
f1 = ff[4:12]
lat_weightedmean = vector()
lon_weightedmean = vector()
colr = c("lavender", "green", "blue", "yellow", "brown", "cyan", "coral", "darkgreen", "darkviolet")

plot(tab2$Lon, tab2$Lat, cex=1, pch=16, main = "Spatial Weighted Mean Center", xlab = "Longitude", ylab = "Latitude")
am_lon = tab2$Lon[1]
texas_lon = tab2$Lon[6]
tech_lon = tab2$Lon[11]
state_lon = tab2$Lon[16]
am_lat = tab2$Lat[1]
texas_lat = tab2$Lat[6]
tech_lat = tab2$Lat[11]
state_lat = tab2$Lat[16]


text(am_lon,am_lat,labels="A&M", adj = 1.25, cex = .75)
text(texas_lon,texas_lat,labels="UT", adj = 1.25, cex = .75)
text(tech_lon,tech_lat,labels="Tech", adj = -.5, cex = .75)
text(state_lon,state_lat,labels="TxSt", adj = 1.25, cex = .75)

points(xc, yc, col="red", pch=16, cex=1)

for(j in 4:12){
  lat_weightedmean[j] = sum(tab2$Lat*tab2[,j])/sum(tab2[,j])
  lon_weightedmean[j] = sum(tab2$Lon*tab2[,j])/sum(tab2[,j])
  points(lon_weightedmean[j], lat_weightedmean[j], col=colr[j-3], pch=16, cex=1)
}
legend(x=-102, y=33, legend = f1, fill = colr)




