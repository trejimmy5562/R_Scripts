# for loops in R 

# conditionals: 
x = 5

if (x>3){ 
  print("x is greater than 3") 
}else{
  print("x is less than 3")
}


# for loops:
x = c(-1, 1, 3, 20)

for (i in 1:length(x)){
  print(i^2)
}

for (i in 1:length(x)){
  print(c(i, x[i]))
}

# save to a variable:
y = numeric(length(x))

for (i in 1:length(x)){
  y[i] = x[i]^2
}

print(y)


# if statement in a for loop:
for (i in 1:length(x)){
  if (x[i]>3){
    print("x is large")
  }else{
    print("x is small")
  }
}


# nested for loop:
for (i in 1:2){
  for (j in 2:3){
    print(i + j)
  }
}



####
# a little more complex: 
# use a for loop to concatenate student's temperature data into one big table: 

# download and unzip "sampleCSV.zip" from eCampus under today's lecture.

# define path to sampleCSVs folder:
path = "/Users/allenstandard/teaching/GEOG312/lectures/lecture10/sampleCSVs"

fnames = list.files(path = path, pattern = "_grass.csv")

fpath = paste0(path, "/", fnames[2])
tab = read.csv(fpath)

# strings that are used to search for the corresponding column names: 
searchNames = c("sample", "lat", "lon", "temp", "note")

for (i in 1:length(fnames)){
  
  # get path of csv file and read in csv 
  fpath = paste0(path, "/", fnames[i]) 
  tab = read.csv(fpath) 
  
  # rename tab column names to match the oTab column names: 
  colNames = names(tab)
  col = vector()
  for (j in 1:length(searchNames)){
    col[j] = grep(pattern = searchNames[j], colNames, ignore.case=T)
  }
  tab = tab[,col]
  names(tab) = c("sample", "lat_dd", "lon_dd", "temp_C", "notes")
  
  # add a "group ID" to the table:
  group = i
  tab = cbind(tab, group)
  
  # concatenate tab to oTab: 
  if (i == 1){
    oTab = tab
  }else{
    oTab = rbind(oTab, tab)
  }
}

