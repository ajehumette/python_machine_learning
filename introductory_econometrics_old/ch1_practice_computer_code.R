###############################################################
##Practice for chapter 1: The Nature and Scope of Econometrics
##EC 311 (Dr. Jehu Mette )
###############################################################


rm(list=ls(all=TRUE)) #OPTIONAL. This command "cleans" the environment.

install.packages("wooldridge") #This package contains most of the
                               #datasets used in this course.

library(wooldridge) # Load the data package
data("wage1")       # Load the data
head(wage1)         # Taking a quick look at the first 6 rows.
str(wage1)          # Even more information


#Q2: Find the average education level in the sample. 
#What are the lowest and highest years of education?

mean(wage1$educ) 
summary(wage1$educ)

#Q3: Find the average hourly wage in the sample. Does it seem high or low?

summary(wage1$wage) 

#Q4. The wage data are reported in 1976 dollars. Using the Internet or a printed source,
#find the Consumer Price Index (CPI) for the years 1976 and 2013.

#CPI was 56.9 in 1976 
#CPI was 233 in 2013


#Q5. Use the CPI values from question 4 to find the average hourly wage in 2013 dollars. 
#Now does the average hourly wage seem reasonable?

average_wage_1976 <- 5.896
cpi_1976 <- 56.9
cpi_2013 <- 233

average_wage_2013 <- average_wage_1976*(cpi_2013/cpi_1976)

#Q6: How many women are in the sample? How many men?

table(wage1$female)

#Now, we load the second dataset for question 10-12

data("bwght")       # Load the data
head(bwght)          # Taking a quick look at the first 6 rows.
str(bwght)           # Even more information

#Q10: How many women are in the sample, 
#     and how many report smoking during pregnancy?

table(bwght$cigs)
smoking_mothers <-1388-1176

#Q11: What is the average number of cigarettes smoked per day?
#     Is the average a good measure of the "typical" woman in this case? Explain.

summary(bwght$cigs)

#Q12: Among women who smoked during pregnancy, what is the average number
#     of cigarettes smoked per day? How does this compare with your previous answer?

smoking_moms_dataset <-subset(bwght, cigs>0) #We create a subset just with the smokers
                                              # and then we compute their mean.
summary(smoking_moms_dataset$cigs)

###############################################################
























