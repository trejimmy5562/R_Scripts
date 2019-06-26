#random numbers, same length makes it easier
a = c(2,5,3,8,4)
b = c(6,2,8,45,14)
c = c(12,7,24,144,3)
#combine data into a singular table with data.frame(cbind())
combined = data.frame(cbind(a,b,c))
print(combined)
#summary of the data with min, max, etc.
summary(combined)
#this combines into two columns, one with value and one with attribute
stacked = stack(combined)
print(stacked)
#this is to create anova table
anova = aov(values ~ ind, data = stacked)
print(anova)
#summary has more data on the anova variable as opposed to print
summary(anova)







