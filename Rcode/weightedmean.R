lat = rnorm(30,32,0.01)
lon = rnorm(30,-50,0.01)
temp = rnorm(30,22,2)

lat_mean = mean(lat)
lon_mean = mean(lon)

lat_weightedmean = sum(lat*temp)/sum(temp)
lon_weightedmean = sum(lon*temp)/sum(temp)

plot(lon, lat, cex=2*temp/max(temp), pch=16)

plot(lon_mean, lat_mean, col="red", pch=16, cex=2)

plot(lon_weightedmean, lat_weightedmean, col="blue", pch=16, cex=2)



