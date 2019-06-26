#Nearest Neighbor Calculations

#specify directory containing csv tables
#fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/"
#list all of the csv files in the dir
#fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path
#fpaths = paste0(fdir, fnames)





#so that they do not get overriden in the for loop
#nnInd = vector()
#nnDist = vector()

#for (j in 1:length(site)){
  
  #calculate distance between A and all of the points:
  #dist = sqrt((x[j] - x)^2 + (y[j] - y)^2)
  # plot out each segment from A
  #segments(x[j], y[j], x, y, col = col)
  
  
  #sort the vector
  #exclude 'A' to 'A' and take the second element in the ordered list
  #this returns second element in ordered vector, AKA 5th element
  #it is the index of the nearest neighbor
  #nn = order(dist)[2]
  
  #nnInd[j] = nn
  
  #this sets variable equal to our '5th' element
  #it is the distance to the nearest neighbor
#  nnDist[j] = dist[nn]
#}


#plot nearest neighbors:
#color code for visual clarity
#create color bar with number of plot points in the table
#col = rainbow(length(site))
#type in makes it plotted but with no dots, which we can replace with corresponding letters
#plot(x, y, type = "n")
#text(x, y, site, col = col)
#segments representing nearest neighbor
#segments(x, y, x[nnInd], y[nnInd], col = col)
#
#text((x=x[nnInd])/2, (y-y[nnInd])/2, round(nnDist, 2), col = col, pos = 4)

#for homework NND:
#NND = mean(nnDist)

for (i in 1:length(fpaths)){
  tab = read.csv(fpaths[i], header = T)
  #assign columns to their own variables
  x = tab$X
  y = tab$Y
  
  site = as.vector(tab$Site)
  
  #so that they do not get overriden in the for loop
  nnInd = vector()
  nnDist = vector()
  
  for (j in 1:length(site)){
    
    #calculate distance between A and all of the points:
    dist = sqrt((x[j] - x)^2 + (y[j] - y)^2)
    # plot out each segment from A
    #segments(x[j], y[j], x, y, col = col)
    
    
    #sort the vector
    #exclude 'A' to 'A' and take the second element in the ordered list
    #this returns second element in ordered vector, AKA 5th element
    #it is the index of the nearest neighbor
    nn = order(dist)[2]
    
    nnInd[j] = nn
    
    #this sets variable equal to our '5th' element
    #it is the distance to the nearest neighbor
    nnDist[j] = dist[nn]
  }
  
  
  #plot nearest neighbors:
  #color code for visual clarity
  #create color bar with number of plot points in the table
  col = rainbow(length(site))
  #type in makes it plotted but with no dots, which we can replace with corresponding letters
  plot(x, y, type = "n")
  text(x, y, site, col = col)
  #segments representing nearest neighbor
  segments(x, y, x[nnInd], y[nnInd], col = col)
  #im not sure what the 
  text((x=x[nnInd])/2, (y=y[nnInd])/2, round(nnDist, 2), col = col, pos = 4)
  
  #for homework NND:
  #average distance to nearest neighbors
  NND = mean(nnDist)
  
  
  print(NND)
}






#tab = read.csv(fpaths[1], header = T)
#assign columns to their own variables
#x = tab$X
#y = tab$Y
#site = as.vector(tab$Site)

#plot the two variables we just pulled out
#plot(x, y)
#color code for visual clarity
#create color bar with number of plot points in the table
#col = rainbow(length(site))
#type in makes it plotted but with no dots, which we can replace with corresponding letters
#plot(x, y, type = "n")
#text(x, y, site, col = col)

#calculate distance between A and B
#use distance formula: sqrt((Ax - Bx)^2 + (Ay - By)^2)
#sqrt((x[1] - x[2])^2 + (y[1] - y[2])^2)
#draw line from A (x[1], y[1]) to B (x[2], y[2]) to another
#segments(x[1], y[1], x[2], y[2], col = col[1])

#calculate distance between A and all of the points:
#dist = sqrt((x[1] - x)^2 + (y[1] - y)^2)
# plot out each segment from A
#segments(x[1], y[1], x, y, col = col)


#sort the vector
#exclude 'A' to 'A' and take the second element in the ordered list
#this returns second element in ordered vector, AKA 5th element
#it is the index of the nearest neighbor
#nnInd = order(dist)[2]
#this sets variable equal to our 5th element
#it is the distance to the nearest neighbor
#nnDist = dist[nnInd]




?text






