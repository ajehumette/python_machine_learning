###############################################################
##Practice for chapter 2: The Basics of Statistics
##EC 311 (Dr. Jehu Mette )
###############################################################


rm(list=ls(all=TRUE)) #OPTIONAL. This command "cleans" the environment.

install.packages("wooldridge") #IF THIS PACKAGE IS ALREADY LOADED, YOU DO NOT NEED TO RELOAD IT EVERYTIME.
                               #This package contains most of the
                               #datasets used in this course.

library(wooldridge) # Load the data package
data("fertil2")       # Load the data
head(fertil2)         # Taking a quick look at the first 6 rows.
str(fertil2)          # Even more information


#Q16: Find the smallest and largest values of children in the sample. What is the average
#    of children?

summary(fertil2$children)

#Q17: What percentage of women have electricity in the home?

table(fertil2$electric) 
611/(3747+611)

#Q18. Compute the average of children for those without electricity and do the same for
#those with electricity. Comment on what you find.

without_electric_dataset <-subset(fertil2, electric==0) #We create a subset just the women who do not have electricity
                                                        #NOTE that here we used a double equal sign. This a relational operator
                                                        # not an algebra one.
summary(without_electric_dataset$children)


#Do the same for women with electricity (The condition is now, "electric==1").

###############################################################
