################################################################################
# Semester Project
################################################################################
library(ggplot2)
#specify directory containing csv tables:
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/Project/"
#list all of the csv files in the dir:
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path:
fpaths = paste0(fdir, fnames)
#make table from the csv file:
tab = read.csv(fpaths, header = T)
#separate data into yearly chunks for plotting
attach(tab)

#border="blue", col=c("red", "green", "blue", "yellow", "brown", "cyan", "coral", "darkgreen", "darkviolet"), breaks=9)
color2 = c("red", "green", "blue", "yellow", "brown", "cyan", "coral", "darkgreen", "darkviolet")
#CHANGE THIS TO CHANGE SCHOOLV
fourteen_am = data.frame(tab[28:36,1:7])
#attach(fourteen_am)


#data1 = data.frame(fourteen_am$Ethnicity, rep("X2014", 9), fourteen_am$X2014)
#data2 = data.frame(fourteen_am$Ethnicity, rep("X2015", 9), fourteen_am$X2015)
#data1 <- setNames(data1, c("ethnicity","year","percent"))
#data2 <- setNames(data2, c("ethnicity","year","percent"))
#data <- rbind(data1,data2)
#Fourteen Fifteen Graph
#ggplot(data, aes(fill=year, y=percent, x=ethnicity)) + 
#  geom_bar(position="dodge", stat="identity")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))


#attach(fourteen_am)

#THIS IS HOW YOU STACK DATA IN NEW TABLE
data = data.frame()
year = 2014
for(i in 1:4){
  
  data1 = data.frame(fourteen_am$Ethnicity, rep(paste0("X", toString(year)), 9), fourteen_am[i+1])
  data2 = data.frame(fourteen_am$Ethnicity, rep(paste0("X", toString(year+1)), 9), fourteen_am[i+2])
  data1 <- setNames(data1, c("Ethnicity","Year","Percent"))
  data2 <- setNames(data2, c("Ethnicity","Year","Percent"))
  data <- rbind(data,data1,data2)
  #Fourteen Fifteen Graph
  #ggplot(data, aes(fill=year, y=percent, x=ethnicity)) + 
  #  geom_bar(position="dodge", stat="identity")+ theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
  year <- year+1
  
}



ggplot(data, aes(fill=Year, y=Percent, x=Ethnicity)) + 
  geom_bar(position="dodge", stat="identity")+ theme(axis.text.x = element_text(angle = 90, hjust = 1)) + ggtitle("STATE")




#eth = c("American Indian","Asian","Black","Hispanic","Native Hawaiian", "White", "Multiple", "Unknown", "International")
#xl = c(.75, 1.90, 3.10, 4.30, 5.45, 6.75, 7.90, 9.15, 10.2)
#yr = c(0, 2014, 2015, 2016, 2017, 2018)

#for(i in 2:6) {
#  barplot(fourteen_am[,i], main="A&M Ethnicity By Year", #horiz=TRUE,
#          names.arg=eth, ylim = c(0,70), col = color2, las=2, cex.names = .5)
#  text(x=xl,y=(fourteen_am[,i]+2),labels=as.character(fourteen_am[,i]))
#  text(x=10,y=60, toString(yr[i]), cex = 2)
#}




