###############################################################
## Practice for chapter 7: Heteroskedasticity
## EC 311 (Dr. Jehu Mette )
###############################################################

rm(list=ls(all=TRUE)) #OPTIONAL. This command "cleans" the environment.

install.packages("car") # This package will be used for the F-test.
install.packages("skedastic")


library(lmtest)
library(skedastic)
library(wooldridge) # OPTIONAL. Load the data package
library(stargazer)

###################### Problem 1 #############################
data("wage1")     # Load the data
?wage1


#Q16: Plot the linear relation between lwage and education
regr1 <- lm(lwage ~ educ, data=wage1)
plot(wage1$educ, wage1$lwage)
abline(regr1, col="magenta")

#Q17: Plot the linear relation between lwage and experience
regr2 <- lm(lwage ~ exper, data=wage1)
plot(wage1$exper, wage1$lwage)
abline(regr2, col="magenta")

#Q18: Plot the linear relation between lwage and experience
regr3 <- lm(lwage ~ tenure, data=wage1)
plot(wage1$tenure, wage1$lwage)
abline(regr3, col="magenta")

#Q19: Estimate this regression
model_tested <- lm(lwage ~ educ + exper + tenure , data=wage1)
stargazer(model_tested, type="text")


#Q20: Run the regression on the residuals and do white test too.
residuals <- resid(model_tested)
resid_reg <- lm(residuals ~ educ + exper + tenure , data=wage1)
stargazer(resid_reg, type="text")

residuals_sq <- residuals^2
resid_sq_reg <- lm(residuals_sq ~ educ + exper + tenure , data=wage1)
stargazer(resid_sq_reg, type="text")

white_lm(model_tested)


###################### Problem 2 ##############################

# Q22: Use the data in 'sleep75' to estimate the parameters of the model for 
# heteroskedasticity. (You have to estimate the sleep equation by OLS, first, 
#to obtain the OLS residuals.) Is the estimated variance of u higher for men or
# for women?


data("sleep75")     # Load the data
?sleep75

reg2 <- lm( sleep ~ totwrk + educ + age + agesq + yngkid + male ,data=sleep75)
stargazer(reg2, type="text")

sleep75$fitted_values <- fitted(reg2) # These are the predicted sleep times based on our model.

sleep75$residuals <- sleep75$sleep - sleep75$fitted # This difference is the error from the model

sleep75$u_sq <- (sleep75$residuals)^2 # Squaring them to obtain a measure of variance.


#Q23: Is the variance of `u' statistically different for men and for women?

reg3 <- lm (u_sq ~male, data=sleep75)
stargazer(reg3, type="text")
summary(reg3)

#The variance is not statistically different for men and women. 

###############################################################