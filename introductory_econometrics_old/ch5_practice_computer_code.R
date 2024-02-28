###############################################################
## Practice for chapter 5: Multiple Regression: Inference
## EC 311 (Dr. Jehu Mette )
###############################################################


rm(list=ls(all=TRUE)) #OPTIONAL. This command "cleans" the environment.

library(stargazer)
library(wooldridge) # OPTIONAL. No need to do this again if the package is already loaded. Load the data package

data("rdchem")       # Load the data
head(rdchem)         # Taking a quick look at the first 6 rows.


# The original regression
reg1 <- lm(rdintens ~ lsales + profmarg , data=rdchem)
stargazer(reg1, type="text")
#Q25: Test the hypothesis that RD intensity does not change with sales against 
# the alternative that it does increase with sales. Do the test at the 5% and 10% levels.

# The idea is to calculate the t-stat on the sales coefficient and see whether it exceeds
# the rejection threshold. If the t-stat is greater than that threshold we would reject the null
# that beta_(sales)=0. In other words, sales do not really influence rdintensity.
# We can do this in two ways. Manually or with the computer. 
# Let us do it manually first to make sure we understand what we are doing.
# The 5% critical value obtain from the t-table in the case of a regression 
# with df=32-3=29 is 1.699. Is the t-stat beyond that? Let us see.

# Approach 1: Manually
# The t-stat in this case is simply: t= beta_(sales) / se_(sales)
# So manually using the stargazer output:
0.321/0.216
# So the t-stat is only 1.48. Not enough to reject the null. We did not find 
# definitive evidence that sales do affect rdintensity.
# BIG TRAP: Note that we have not proven that sales do not affect rdintensity.
# We just do not find evidence that it does at the 5% level. In every day language it is about the same thing
# but in econometrics there is a difference.

#Approach 2: With the software
summary(reg1)
# You can see that the t-values are automatically computed.
# At the 10% level however, the threshold is only 1.311.
# At this level, we see that 1.48>1.33 so we can reject the null.

#Q27: Interpret the coefficient on profmarg. Is it economically large?
summary(reg1)
#The t-stat for profmarg is very low 1.093<1.33. So even at the 10% level
# we do not reject the null. The effect is not statistically significant.

data("discrim")       # Load the data

#The origanl regression
?discrim            # Lear more about the dataset
reg2<- lm(psoda~ prpblck + lincome + prppov ,data=discrim)
stargazer(reg2, type="text")
# Q28: Is beta1 statistically different from zero at the 5% level against a two-sided
#alternative? What about at the 1% level?
summary(reg2)

# Q29: What is the correlation between log(income) and prppov (proportion in poverty)? 
# Is each variable statistically significant in any case?
cor.test(discrim$lincome, discrim$prppov)

#t_log(income)
0.141/0.028
#t_prpov
0.396/0.139


# Q30: To the regression in question (28), add the variable log(hseval) (log median housing value). 
# Interpret its coefficient and report the tstat H0 : beta log(hseval) = 0.
reg3<- lm(psoda~ prpblck + lincome + prppov + lhseval ,data=discrim)
stargazer(reg3, type="text")

#tstatt log(hseval)
0.126/0.019

summary(reg3)

# Q31: In the regression in question (30), what happens to the individual statistical significance of log(income) and
# prppov? Are these variables jointly significant? What do you make of your answers?

#Here we need to run an F-test 

#Unrestricted OLS regression 
reg.ur <- lm(psoda~ prpblck + lincome + prppov + lhseval ,data=discrim)
#Load package "car" which must be installed first.
library(car)
# F-test
myH0 <- c("lincome=0", "prppov=0")

linearHypothesis(reg.ur, myH0)
# Here the p-value is 0.030 which significant at the 5% level.
# We can thus conclude that they are JOINTLY significant althoug
# taken seperately it is not the case.

# Q31: Given the results of the previous regressions, which one would you report 
# as most reliable in determining whether the racial makeup of a zip code influences 
# local fast-food prices?
stargazer(reg2, reg3, type="text")

# Q33: Calculate the 95% confidence interval for the coefficient on log(hseval).
#Lower bound 
0.126 - 1.96*0.019
#Upper bound
0.126 + 1.96*0.019

confint(reg3, level=0.95)


###############################################################
