path1 = "/Users/trejimmy5562/Desktop/GEOG312_2/Assn3"
#lists the files in the path and pattern determines which files out of the total
#are taken, and we assign these to fnames variable
fnames = list.files(path = path1, pattern = ".csv")
#concatenate the path with specific file names stored in fnames
fpath = paste0(path1, "/", fnames[1])
#use the newly created path to pull in a csv for a table
table1 = read.csv(fpath, header=T)
print(table1)

#-----------below this does not work yet-------------
#define variables for your loop
i = 1
col = vector()
#iterate through files and open them
for(i in 1:length(fnames)){
  fpath2 = paste0(path1, "/", fnames[i])
  tab = read.csv(fpath2)
  print(tab)
  #make sure their are the same number, 
  colNames = names(tab)
  oColNames = c("sample", "lat_dd", "lon_dd", "temp_C", "notes")
  for(j in 1:length(oColNames)){
    #looks for strings in other strings, sets equal to col
    col[j] = grep(pattern = oColNames[j], colNames)
  }
  
  #add all tables to an output table
  if(i == 1){
    outputtable = tab
  }else {
    #rbind adds them together
    outputtable = rbind(outputtable, tab)
  }
}
#------------above this does not work----------------










