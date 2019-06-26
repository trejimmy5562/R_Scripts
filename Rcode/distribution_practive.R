?rnorm
grades = rnorm(100,70,20)

print(grades)
plot(grades)
hist(grades)
boxplot(grades)

grades[grades>100] - 100
hist(grades)


#what is the probability of getting an a if an a is a grade greater than 90

length(grades[grades > 90])/length(grades) # = 0.14

# create a function of the probability of getting and A:

goodGrade = function(gradeInput, leastGradePossible){
  probability = length(gradeInput[gradeInput > leastGradePossible])/length(gradeInput)
  return(probability)
  
}
goodGrade(grades, 90) # = 0.14 or 14%

# qnorm is the quantile function for a normal distribution
qnorm(p=0.9,mean=70,sd=20)
length(grades[grades>qnorm(p=0.95, mean=70, sd=20)])

#-----------------------------------------------------#
?distributions







