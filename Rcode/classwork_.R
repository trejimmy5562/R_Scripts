g1 = c(37, 34, 34, 64, 66, 83, 57)
g2 = c(66, 72, 46, 58, 58, 34, 45)

tab = data.frame(g1, g2)

boxplot(tab)

stacked = stack(tab)

wilcox.test(values-ind, data=stacked, exact=F)

