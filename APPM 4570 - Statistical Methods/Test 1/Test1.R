sleepData <- read.table("sleepData.txt", header = T)

par(mfrow=c(1,1))
hist(sleepData[,2], breaks = 12, main ="Hours of sleep for College Student last night", xlab ="Hours")
boxplot(sleepData[,2], horizontal = TRUE, xlab="Number of hours selpt", main="Sleep time for College Students")
boxplot.stats(sleepData[,2])
summary(sleepData)

?hist
?boxplot


#Problem 2

#chance of having more than 325 vehicles per 30 min, during rush hour (7AM-10AM, 4PM-7PM)
#the average is 10/min, the chances of having more than 325 in a 30 minute period:
ppois((325/30), lambda = 10, lower=FALSE) 

#chance of having more than 325 vehicles per 30 min, during non-rush hour (10AM-4PM)
#the average is 3/min, the chances of having more than 325 in a 30 minute period
ppois((325/30), lambda = 3, lower=FALSE) 

#chance of having more than 325 vehicles per 30 min, during all other hours
#the average is 8/hr, the chances of having more than 325 in a 30 minute period
ppois((325/30), lambda = 8/60, lower=FALSE) 

tollPriceList<-0
VEHSUMAVE<-0
VHNRSUMAVE<-0

for(i in 1:10000){
  
#random number of vehicles in a 30 minutes window, during rush hours
VEH1 = sum(rpois(30, 10))
VEH2 = sum(rpois(30, 10))
VEH3 = sum(rpois(30, 10))
VEH4 = sum(rpois(30, 10))
VEH5 = sum(rpois(30, 10))
VEH6 = sum(rpois(30, 10))
VEH7 = sum(rpois(30, 10))
VEH8 = sum(rpois(30, 10))
VEH9 = sum(rpois(30, 10))
VEH10 = sum(rpois(30, 10))
VEH11 = sum(rpois(30, 10))
VEH12 = sum(rpois(30, 10))
VEHSUM = sum(VEH1+VEH2+VEH3+VEH4+VEH5+VEH6+VEH7+VEH8+VEH9+VEH10+VEH11+VEH12)

#random number of vehicles in a 30 minutes window, during non rush hours
VHNR1 = sum(rpois(30, 3))
VHNR2 = sum(rpois(30, 3))
VHNR3 = sum(rpois(30, 3))
VHNR4 = sum(rpois(30, 3))
VHNR5 = sum(rpois(30, 3))
VHNR6 = sum(rpois(30, 3))
VHNR7 = sum(rpois(30, 3))
VHNR8 = sum(rpois(30, 3))
VHNR9 = sum(rpois(30, 3))
VHNR10 = sum(rpois(30, 3))
VHNR11 = sum(rpois(30, 3))
VHNR12 = sum(rpois(30, 3))
VHNRSUM = sum(VHNR1+VHNR2+VHNR3+VHNR4+VHNR5+VHNR6+VHNR7+VHNR8+VHNR9+VHNR10+VHNR11+VHNR12)

#random number of vehicles in a 30 minutes window, during other hours outside 7AM to 7PM
VHELSE1 = sum(rpois(60, 8/60))
VHELSE2 = sum(rpois(60, 8/60))
VHELSE3 = sum(rpois(60, 8/60))
VHELSE4 = sum(rpois(60, 8/60))
VHELSE5 = sum(rpois(60, 8/60))
VHELSE6 = sum(rpois(60, 8/60))
VHELSE7 = sum(rpois(60, 8/60))
VHELSE8 = sum(rpois(60, 8/60))
VHELSE9 = sum(rpois(60, 8/60))
VHELSE10 = sum(rpois(60, 8/60))
VHELSE11 = sum(rpois(60, 8/60))
VHELSE12 = sum(rpois(60, 8/60))
VHOTHERSUM = sum(VHELSE1+VHELSE2+VHELSE3+VHELSE4+VHELSE5+VHELSE6+VHELSE7+VHELSE8+VHELSE9+VHELSE10+VHELSE11+VHELSE12)


#1-4wheels, 2-semi (more than 4 wheels)
fourWheelRushHour = sample(0:1, size=VEHSUM, replace=TRUE, prob=c(.25,.75))
sum(fourWheelRushHour)
semiTruckRushHour = VEHSUM - sum(fourWheelRushHour)

fourWheelNonRushHour = sample(0:1, size=VHNRSUM, replace=TRUE, prob=c(.25,.75))
sum(fourWheelNonRushHour)
semiTruckNonRushHour = VHNRSUM - sum(fourWheelNonRushHour)

fourWheelOtherHour = sample(0:1, size=VHOTHERSUM, replace=TRUE, prob=c(.25,.75))
sum(fourWheelOtherHour)
semiTruckOtherHour = VHOTHERSUM - sum(fourWheelOtherHour)

totalCars=sum(fourWheelRushHour)+
  semiTruckRushHour+
  sum(fourWheelNonRushHour)+
  semiTruckNonRushHour+
  sum(fourWheelOtherHour)+
  semiTruckOtherHour

totalTollPaid=(sum(fourWheelRushHour)*3*(1-.417))+(sum(fourWheelRushHour)*(3*1.25)*(.417))+
(sum(semiTruckRushHour)*5*(1-.417))+(sum(semiTruckRushHour)*(5*1.25)*(.417))+
(sum(fourWheelNonRushHour)*3*(1-.417))+(sum(fourWheelNonRushHour)*(3*1.25)*(.417))+
(sum(semiTruckNonRushHour)*5*(1-.0003))+(sum(semiTruckNonRushHour)*(5*1.25)*(.0003))+
(sum(fourWheelOtherHour)*3)+
(sum(semiTruckOtherHour)*5)

#average price
tollPriceList[i] = (totalTollPaid/totalCars)
VEHSUMAVE[i] = (VEHSUM)
VHNRSUMAVE[i] = (VHNRSUM)

}

mean(tollPriceList)
sd(tollPriceList)

mean(VEHSUMAVE)
mean(VHNRSUMAVE)

par(mfrow=c(1,1))
hist(tollPriceList, xlab="Toll Price")

#For rush hours
(ppois((350/30), lambda = 10))-(1-(ppois((325/30), lambda = 10, lower=FALSE)))
#For 10AM to 4PM
(ppois((350/30), lambda = 3))-(1-(ppois((325/30), lambda = 3, lower=FALSE)))
