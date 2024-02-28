###############################################################
##Practice for chapter 4: Multiple Regression Analysis: Estimation
##EC 311 (Dr. Jehu Mette )
###############################################################

library(stargazer)
library(wooldridge) # Load the data package
data("sleep75")       # Load the data

#Q24: Plot the relationship between $sleep$ on the y-axis and $totwrk$ on the x-axis.

plot(sleep75$totwrk, sleep75$sleep, xlab = "Total work (min)", ylab = "sleep(min)",
     main = "Relationship between total minutes worked and minutes slept") 

#Q26: Estimate this equation in R. If someone works five more hours per week,
#     by how many minutes is sleep predicted to fall? Is this a large tradeoff?

regression_1 <- lm(sleep~totwrk + educ + age , data=sleep75)
stargazer(regression_1, type="text")
