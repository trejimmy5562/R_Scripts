x = 1

if(x > 3){
  print("x is greater than 3")
}else {
  print("x is less than 3")
}

y = c(-1, 1, 3, 20)
for(i in 1:length(y)){
  print(i)
}


for(i in 1:length(y)){
  print(y[i])
}

for(i in 1:length(y)){
  print(c(i, y[i]))
}

#set up vector to add values to with z with length the same as y
z = numeric(length(y))
for(i in 1:length(y)){
  z[i] = y[i]^2
}

for(i in 1:length(y)){
  if(y[i] > 3){
    print("x is big")
  }else {
    print("x is small")
  }
}





