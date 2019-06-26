#Assignment 4
#read in the files
path1 = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn4"
fnames = list.files(path = path1, pattern = ".csv")
fpath = paste0(path1, "/", fnames)
#take grass data:
tab = read.csv(fpath[1], header = TRUE)
#order the table by group:
tab[order(tab$group),]
#set variable that holds each unique group id (theres 13)
groupIDs = unique(tab$group)


#rownames(tablef) = c(groupIDs)

mP = mean(tab$temp_C)
Ni = (30) - 1
mS = vector()
Si = vector()
Si2 = vector()
Ni2 = vector()

for(j in 1:length(groupIDs)){
  #set row index equal to k
  #goes through and find which ~ROWS~ match which Group IDS 
  k = which(tab$group == groupIDs[j])
  #put the temp values corresponding to each row into a variable that correspond with the chosen group ID
  S = tab$temp_C[k]
  mS[j] = mean(S)
  Si[j] = sd(S)
  Si2[j] = (Si[j])*(Si[j])
  Ni2[j] = (Si2[j])*Ni
  
}
#THIS IS THE ANSWER TO #1
tableg = data.frame(groupIDs, mS, mP, Si, Si2, Ni2)
colnames(tableg) = c("GroupIDs", "Xbar", "Mu", "Si", "Si^2", "(Ni - 1)Si")
print(tableg)
#------------------------------------------------------------#
k = 6
SSw = sum(tableg$`(Ni - 1)Si`)
MSw = (SSw)/((length(tab$temp_C)) - 6)

SSb1 = vector()
for(i in 1:length(groupIDs)){
  SSb1[i] = 30 * (mS[i] - mP)
  
}
SSb = sum(SSb1)
MSb = (SSb)/(6 - 1)
F1 =(MSb)/(MSw)

#THIS IS THE ANSWER TO #2
table2 = data.frame("k=6", SSw, MSw, SSb, MSb, F1)
colnames(table2) = c("Group Samples", "SSw", "MSw", "SSb", "MSb", "F")
print(table2)




