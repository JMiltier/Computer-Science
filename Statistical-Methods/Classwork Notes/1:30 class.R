sample(1:5, size=10, replace=T)

set.seed(10^6) #sets the output to the same to better data //have to be careful
sample(1:5, size=3, replace=F)

# Assume the probability of a package being delivered in the next day is 60%.
# Simulate 1000 packages being delivered by the next day
?sample
1:5
sample(1:5, size = 3)
sample(1:5, size = 3)
sample(1:5, size = 3)
sample(1:5, size = 10, replace = TRUE)
sample(1:5, size = 10, replace = TRUE)
sample(1:5, size = 10, replace = TRUE)

# CODE CONTRAST:
# Method 1: Looping
# Keep track of the deliveries in nextday.delivery
nextday.delivery = NULL
sum.nextday.deliver = 0
for(i in 1:1000){
  # '1' = delivered next day, '0' is delivered later
  delivered = sample(0:1, size = 1, prob = c(.4, .6))
  sum.nextday.deliver = sum.nextday.deliver+delivered
  nextday.delivery = c(nextday.delivery, sum.nextday.deliver/i)
}

# Method 2: Special R functions
delivered = sample(0:1, prob = c(.4, .6), size = 1000, replace = TRUE)
table(delivered)
nextday.delivery = cumsum(delivered)/1:1000

## Plot the results ##
plot(nextday.delivery)
plot(nextday.delivery, type = 'l')
plot(nextday.delivery, type = 'l', ylim = c(0,1))
plot(nextday.delivery, type = 'l', ylim = c(0,1), main = 'Package delivery probabilites',
     xlab = 'Number of packages', ylab = 'Observed probability')
abline(h = 0.6, col = 'grey') #draws line across plot

par(mfrow = c(1,2))
plot(nextday.delivery, type = 'l', ylim = c(0,1), main = 'Package delivery probabilites',
     xlab = 'Number of packages', ylab = 'Observed probability', xlim = c(0, 75))
plot(nextday.delivery, type = 'l', ylim = c(0,1), main = 'Package delivery')





#1 of computational, HW1 //simulate data
  #1st sample what comes from each machine 
  #then sample what's bad
  #then sample what can be sold

breadMade <- sample(1:4, size=1000000, replace=TRUE, prob=c(.2,.4,.1,.3))
table(breadMade)
badBreadMade <- sample(1:4, size=1000000, replace=TRUE, prob=c(.2,.1,.05,.5))
table(badBreadMade)

#Problem 1, Part a
#1 - bread good, 2 - bread bad 
badBread = sample(1:2, size=1000000, replace = T, prob=c(.765,.235))
table(badBread)




#Problem 1, Part b
#1 - bad bread from all but B, 2 - bad bread from B
totalBadBread = 0
sumBadBBread = 0
for(i in 1:1000000){
  overallBread = sample(1:4, size=1, replace = T, prob=c(.2,.4,.1,.3))
  if(overallBread==2){
    badBread=sample(1:4, size=1, replace = T, prob=c(.2,.1,.05,.5))
    totalBadBread=totalBadBread+1
    if(badBread==2){
       sumBadBBread=sumBadBBread+1
    }
  }
}
totalBadBread
sumBadBBread
40159/234910
  
#original #1, Part b
badBBread = sample(1:2, size=1000000, replace=T, prob=c(.195,.04))
table(badBBread)





#Problem 1, Part c
totalGoodBread = 0
sumGoodCBread = 0
for(i in 1:1000000){
  overallGoodBread = sample(1:2, size=1, replace = T, prob=c(.765,.235))
  if(overallGoodBread==1){
    goodBread=sample(1:4, size=1, replace = T, prob=c(.2,.4,.1,.3))
    totalGoodBread=totalGoodBread+1
    if(goodBread==3){
      sumGoodCBread=sumGoodCBread+1
    }
  }
}
totalGoodBread
sumGoodCBread

#original #1, Part c
#1 - good bread from all but C, 2 - good bread from C
goodCBread = sample(1:2, size=1000000, replace=T, prob=c(.9,.1))
table(goodCBread)




#Problem 1, Part d
totalABread = 0
sumBadABread = 0
sumHalfPricedABread = 0
for(i in 1:1000000){
  overallBread = sample(1:4, size=1, replace = T, prob=c(.2,.4,.1,.3))
  if(overallBread==1){
    badBread=sample(1:4, size=1, replace = T, prob=c(.2,.1,.05,.5))
    totalABread=totalABread+1
    if(badBread==1){
      sumBadABread=sumBadABread+1
      halfPricedABread = sample(1:2, size=1, replace=T, prob=c(.25,.75))
      if(halfPricedABread==2)
        sumHalfPricedABread=sumHalfPricedABread+1
    }
  }
}
totalABread
sumBadABread
sumHalfPricedABread

#Original problem 1, Part d
#1 - bread is good or is bad and cannot be sold at half price
#2 - produces bad bread than can be sold at half price
halfPricedABread = sample(1:2, size=1000000, replace=T, prob=c(.7,.3))
table(halfPricedABread)



#Problem 1, Part e

totalABread = 0;  totalBBread = 0;  totalCBread = 0;  totalDBread = 0
sumBadABread = 0; sumBadBBread = 0; sumBadCBread = 0; sumBadDBread = 0
sumHalfPricedABread = 0; sumHalfPricedBBread = 0
sumHalfPricedCBread = 0; sumHalfPricedDBread = 0
for(i in 1:1000000){
  overallBread = sample(1:4, size=1, replace = T, prob=c(.2,.4,.1,.3))
  if(overallBread==1){          #for A machine
    badBread=sample(1:2, size=1, replace = T, prob=c(.8,.2))
    totalABread=totalABread+1
    if(badBread==2){
      sumBadABread=sumBadABread+1
      halfPricedABread = sample(1:2, size=1, replace=T, prob=c(.25,.75))
      if(halfPricedABread==2)
        sumHalfPricedABread=sumHalfPricedABread+1
    }
  }else if(overallBread==2){    #for B machine
    badBread=sample(1:2, size=1, replace = T, prob=c(.9,.1))
    totalBBread=totalBBread+1
    if(badBread==2){
      sumBadBBread=sumBadBBread+1
      halfPricedBBread = sample(1:2, size=1, replace=T, prob=c(.5,.5))
      if(halfPricedBBread==2)
        sumHalfPricedBBread=sumHalfPricedBBread+1
    }
  }else if(overallBread==3){      #for C machine
    badBread=sample(1:2, size=1, replace = T, prob=c(.95,.05))
    totalCBread=totalCBread+1
    if(badBread==2){
      sumBadCBread=sumBadCBread+1
      halfPricedCBread = sample(1:2, size=1, replace=T, prob=c(.1,.9))
      if(halfPricedCBread==2)
        sumHalfPricedCBread=sumHalfPricedCBread+1
    }
  }else if(overallBread==4){      #for D machine
    badBread=sample(1:2, size=1, replace = T, prob=c(.5,.5))
    totalDBread=totalDBread+1
    if(badBread==2){
      sumBadDBread=sumBadDBread+1
      halfPricedDBread = sample(1:2, size=1, replace=T, prob=c(.4,.6))
      if(halfPricedDBread==2)
        sumHalfPricedDBread=sumHalfPricedDBread+1
    }
  }
}

{
message("\n\n***************************\nA MACHINE")
cat(totalABread,message("Total Bread")," % of total:",signif((totalABread/10000),3))
cat(sumBadABread,message("Total Bad Bread")," % of bad bread:",signif(sumBadABread/(sumBadABread+sumBadBBread+sumBadCBread+sumBadDBread)*100,3))
cat(sumHalfPricedABread,message("Total Half Price Bread"),"% of half priced:",signif(sumHalfPricedABread/(sumHalfPricedABread+sumHalfPricedBBread+sumHalfPricedCBread+sumHalfPricedDBread)*100,3))
message("***************************\nB MACHINE")
cat(totalBBread,message("Total Bread")," % of total:",signif((totalBBread/10000),3))
cat(sumBadBBread,message("Total Bad Bread")," % of bad bread:",signif(sumBadBBread/(sumBadABread+sumBadBBread+sumBadCBread+sumBadDBread)*100,3))
cat(sumHalfPricedBBread,message("Total Half Price Bread"),"% of half priced:",signif(sumHalfPricedBBread/(sumHalfPricedABread+sumHalfPricedBBread+sumHalfPricedCBread+sumHalfPricedDBread)*100,3))
message("***************************\nC MACHINE")
cat(totalCBread,message("Total Bread")," % of total:",signif((totalCBread/10000),3))
cat(sumBadCBread,message("Total Bad Bread")," % of bad bread:",signif(sumBadCBread/(sumBadABread+sumBadBBread+sumBadCBread+sumBadDBread)*100,3))
cat(sumHalfPricedCBread,message("Total Half Price Bread"),"% of half priced:",signif(sumHalfPricedCBread/(sumHalfPricedABread+sumHalfPricedBBread+sumHalfPricedCBread+sumHalfPricedDBread)*100,3))
message("***************************\nD MACHINE")
cat(totalDBread,message("Total Bread")," % of total:",signif((totalDBread/10000),3))
cat(sumBadDBread,message("Total Bad Bread")," % of bad bread:",signif(sumBadDBread/(sumBadABread+sumBadBBread+sumBadCBread+sumBadDBread)*100,3))
cat(sumHalfPricedDBread,message("Total Half Price Bread"),"% of half priced:",signif(sumHalfPricedDBread/(sumHalfPricedABread+sumHalfPricedBBread+sumHalfPricedCBread+sumHalfPricedDBread)*100,3))
message("***************************")
}


##Original problem #1, Part e
#1 - half priced bread from A
#2 - half priced bread from B
#3 - half priced bread from C
#4 - half priced bread from D
halfPricedFromD =  sample(1:4, size=1000000, replace=T, prob=c(.03, .02, .0045, .09))
table(halfPricedFromD)
#halfPricedFromD
#     1         2        3         4 
#207437    138833    30909    622821 





#halfPricedABread
#     1          2 
#700410     299590 


#for bad (example given in class)
sample(0:1, size=length(which(machine=='A')), replace=T, prob=c(.8,.2))


