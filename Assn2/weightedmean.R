tableg = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_grass.csv", header=T)
tables = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_sidewalk.csv", header=T)
tablel = read.csv("/Users/trejimmy5562/Desktop/GEOG312_2/Assn2/908647_lot19.csv", header=T)
print(tableg)
print(tables)
print(tablel)

#?rnorm
#extract coordinats from tables
lat_tableg1 = tableg[,2]
lon_tableg1 = tableg[,3]
lat_tables1 = tables[,2]
lon_tables1 = tables[,3]
lat_tablel1 = tablel[,2]
lon_tablel1 = tablel[,3]

#find mean center of each 
g_mean_lat = mean(lat_tableg1)
g_mean_lon = mean(lon_tableg1)
s_mean_lat = mean(lat_tables1)
s_mean_lon = mean(lon_tables1)
l_mean_lat = mean(lat_tablel1)
l_mean_lon = mean(lon_tablel1)

#print mean center
cat("grass mean center: ", g_mean_lon, ",", g_mean_lat)
cat("sidewalk mean center: ", s_mean_lon, s_mean_lat)
cat("lot19 mean center: ", l_mean_lon, l_mean_lat)

#extract temp data
temp_g = tableg[,4]
temp_s = tables[,4]
temp_l = tablel[,4]

#find weighted mean of each
g_weightedmean_lat = sum(lat_tableg1*temp_g)/sum(temp_g)
g_weightedmean_lon = sum(lon_tableg1*temp_g)/sum(temp_g)
s_weightedmean_lat = sum(lat_tables1*temp_s)/sum(temp_s)
s_weightedmean_lon = sum(lon_tables1*temp_s)/sum(temp_s)
l_weightedmean_lat = sum(lat_tablel1*temp_l)/sum(temp_l)
l_weightedmean_lon = sum(lon_tablel1*temp_l)/sum(temp_l)

#print weighted mean for each
cat("grass weighted mean center: ", g_weightedmean_lon, ",", g_weightedmean_lat)
cat("grass weighted mean center: ", s_weightedmean_lon, ",", s_weightedmean_lat)
cat("grass weighted mean center: ", l_weightedmean_lon, ",", l_weightedmean_lat)


plot(lon_tableg1, lat_tableg1, cex=2*temp_g/max(temp_g), pch=16, main="Grass Location Plot",
     xlab="Longitude", ylab="Latitude")
plot(lon_tables1, lat_tables1, cex=2*temp_s/max(temp_s), pch=16, main="Sidewalk Location Plot",
     xlab="Longitude", ylab="Latitude")
plot(lon_tablel1, lat_tablel1, cex=2*temp_l/max(temp_l), pch=16, main="Lot19 Location Plot",
     xlab="Longitude", ylab="Latitude")

plot(g_mean_lon, g_mean_lat, col="red", pch=16, cex=2, main="Grass Mean Center Plot",
     xlab="Longitude", ylab="Latitude")
plot(s_mean_lon, s_mean_lat, col="red", pch=16, cex=2, main="Sidewalk Mean Center Plot",
     xlab="Longitude", ylab="Latitude")
plot(l_mean_lon, l_mean_lat, col="red", pch=16, cex=2, main="Lot19 Mean Center Plot",
     xlab="Longitude", ylab="Latitude")

plot(g_weightedmean_lon, g_weightedmean_lat, col="blue", pch=16, cex=2, main="Grass Weighted Mean Center", xlab="Longitude", ylab="Latitude")
plot(s_weightedmean_lon, s_weightedmean_lat, col="blue", pch=16, cex=2, main="Sidewalk Weighted Mean Center", xlab="Longitude", ylab="Latitude")
plot(l_weightedmean_lon, l_weightedmean_lat, col="blue", pch=16, cex=2, main="Lot19 Weighted Mean Center", xlab="Longitude", ylab="Latitude")



