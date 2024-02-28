###############################################################
##Practice for chapter 10: Basics of time series analysis
##EC 311 (Dr. Jehu Mette )
###############################################################
rm(list=ls(all=TRUE))


library(stargazer)
library(wooldridge) # Load the data package
data("intdef") 
?intdef

#Create a dummy for for after 1979

intdef$post79 <- ifelse(intdef$year >= 1979, 1, 0 )

ts.intdef<- ts(intdef, start=c(1948,1), frequency=1)

plot(ts.intdef[,"i3"], lwd = 2, xlab = "Year", ylab = "Interest rate", 
     main = "Interest rates on 3 month treasury bills", col=2)


plot(ts.intdef[,"inf"], lwd = 2, xlab = "Year", ylab = "Inflation rate", 
     main = "Inflation rate", col=3)

#Q15: Create a dummy variable  to see if the change of monetary
# policy initiated by the Fed had a significant impact

reg <- lm( i3 ~ inf + def + post79, data= ts.intdef)
stargazer(reg, type="text")

data("ezanders") 
?ezanders