################################################################################
#tre barnett, 3/21/19
################################################################################
#in class code
################################################################################
#summary: example code to automate calculation of spatial center, std dist, graphic output
#input: csv files from ecampus
#output: three pdf plots

paste(rep("#", 80), collapse = "")
################################################################################
#hard coded values
################################################################################

#specify directory containing csv tables
fdir = "/Users/trejimmy5562/Desktop/GEOG312_2/"
#list all of the csv files in the dir
fnames = list.files(fdir, pattern = ".csv")
#paste name on the end of the path
fpaths = paste0(fdir, fnames)



pdfpath = paste0(fdir, paste0(fnames, ".pdf"))
pdf(pdfpath)


#import/cycle through all the files
for (i in 1:length(fpaths)){
  
  tab = read.csv(fpaths[i], header = T)
  X = tab$X
  Y = tab$Y
  #plot
  plot(X, Y)
  #find mean of both
  xc = mean(X)
  yc = mean(Y)
  points(xc,yc, pch=16)
  #standard distance:
  st1 = sqrt(sum((X - xc)^2) + sum((Y - yc)^2))
  #this plots on top of the existing plot:
  par(new=T)
  #plot the stand distance as a circle:
  symbols(xc, yc, circles = st1, xlim = range(X), ylim = range(Y), xlab = "", ylab = "", main = fnames[i])
  
  
}
#turn off/close pdf

dev.off()

















