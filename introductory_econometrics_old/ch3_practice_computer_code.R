###############################################################
##Practice for chapter 3: The Simple Linear Regression
##EC 311 (Dr. Jehu Mette )
###############################################################


rm(list=ls(all=TRUE)) #OPTIONAL. This command "cleans" the environment.

install.packages("stargazer") #Today, we will need this new package called Stargazer.
library(stargazer)

# install.packages("wooldridge") 
#IF THIS PACKAGE IS ALREADY INSTALLED, YOU DO NOT NEED TO REINSTALL IT EVERYTIME.
#This package contains most of the
#datasets used in this course.

library(wooldridge) # Load the data package
data("k401k")       # Load the data



#Q23: Find the average participation rate and the average match rate in the sample of
#plans.

mean(k401k$prate)
mean(k401k$mrate)

#Q24: Make a plot of the participation rate as a function of the match rate. Make an histogram of prate.

?plot # This is an important basic skill. Putting a questiom mark before a command allows you to find more information
      # and examples on how it works. Here note that plot(x,y) asks for the variable on the x axis first.
      #  Reading the help file, you can find so much more information to customize your graph.
 
plot(k401k$mrate, k401k$prate) #Basic graph.
#More advance and nice version
plot(k401k$mrate, k401k$prate, xlab = "Matching rate", ylab = "Participation rate",
     main = "Relationship between 401K matching rate and participation rate") 

hist(k401k$prate, xlab= "prate", main = "Histogram of participation rate")


#Q25: Now, estimate the simple regression equation and 
#report the results along with the sample size and R-squared.
regression_1 <- lm(prate ~ mrate, data=k401k)
stargazer(regression_1, type="text")

#Q26: Interpret the intercept in your equation. Interpret the coefficient on mrate.

#Q27: Find the predicted prate when mrate = 3.5. Is this a reasonable prediction?
#Explain what is happening here.

#Q29: Level - level regression

data("wage2") 
?wage2

#Create a new log(education) variable and add it to the dataset.

wage2$leduc <- log(wage2$educ)

reg_level_level <- lm(wage ~ educ , data=wage2)
stargazer(reg_level_level, type="text")

#Q30: Log -level regression

reg_log_level <- lm(lwage ~ educ , data=wage2)
stargazer(reg_log_level, type="text")


#Q31: Level-Log regression

reg_level_log <- lm(wage ~ leduc , data=wage2)
stargazer(reg_level_log, type="text")


#Q32: Log-Log regression

reg_log_log <- lm(lwage ~ leduc , data=wage2)
stargazer(reg_log_log, type="text")


###################################################################






