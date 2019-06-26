path1 = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn3"
fnames = list.files(path = path1, pattern = ".csv")
#choose path for one of the files in fnames
fpath = paste0(path1, "/", fnames)
#add the file to a table
tab = read.csv(fpath[1], header = TRUE)
#order by id # so as to be in the same order as boxplot
tab[order(tab$group),]

#top 6 lines of the table:
head(tab)
#dimensions of the table:
dim(tab)
#go through each group and run a z test, make a function to do this
z.test <- function(mnS, mnP, sdS, nS, nP){
  Z = (mnS - mnP)/((sdS/sqrt(nS))*sqrt((nP - nS)/(nP - 1)))
  return(Z)
}

z.test1 <- function(mnS, mnP, sdP, nS, nP){
  Z = (mnS - mnP)/((sdS/sqrt(nS))*sqrt((nP - nS)/(nP - 1)))
  return(Z)
}





#get unique group values to use to assign seperate colors for each in rainbow function
unique(tab$group)
#plot data so we can get a view of it, use temp and group as parameters
#las rotates y int lables for ease of viewing
boxplot(tab$temp_C~tab$group, 
        ylab = "Temperature (C)", 
        col = rainbow(length(unique(tab$group))),
        las=2,)
#function to plot linear line, lty makes line dashed
abline(h = mean(tab$temp_C),
       col = 2,
       lty = 2)
#define the variables for the column values
groupIDs = unique(tab$group)
P = tab$temp_C
z.score = vector()
z.score1 = vector()
#for loop for every group
for(j in 1:length(groupIDs)){
  #set row index equal to k
  #goes through and find which rows match which Group IDS 
  k = which(tab$group == groupIDs[j])
  #put the temp values into a variable that correspond with the chosen group ID
  S = tab$temp_C[k]
  #now put data we have found into Z test, and put into z.score variable by creating vector
  z.score[j] = z.test(mnS = mean(S), mnP = mean(P), sdS = sd(S), nS = length(S), nP = length(P))
  z.score1[j] = z.test1(mnS = mean(S), mnP = mean(P), sdS = sd(S), nS = length(S), nP = length(P))
}

print(z.score)
#make table matrix of the two values:
cbind(groupIDs, z.score)

#can define boxplot as variable for the text function below:
#bp = boxplot(tab$temp_C~tab$group, 
# ylab = "Temperature (C)", 
# col = rainbow(length(unique(tab$group))),
# las=2,)

#plot text on a plot: (uses bp variable which has not yet been initialized)
text(x=c(1:length(groupIDs)),
     y=bp$stats[1,]-0.5,
     label = paste("Z = ", round(z.score, 1)),
     cex = 0.7)




