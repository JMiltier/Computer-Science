#THEORECTICAL
#Problem #6 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#a
xseq=seq(20,90,.01)
xl=seq(0,45,.01)
densities=dnorm(xseq,55,7)
y=dnorm(x,55,7)
yl=(dnorm(xl,55,7))
plot(xseq, densities, col="black",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
polygon(c(0,xl,45), c(0,yl,0),col='orange')
abline(v=c(55), lwd=3,lty=1, col='red')
pnorm(45,mean=55,sd=7)

#b
xseq=seq(20,90,.01)
xl=seq(50,55,.01)
xr=seq(55,75,.01)
densities=dnorm(xseq,55,7)
y=dnorm(x,55,7)
yl=(dnorm(xl,55,7))
yr=(dnorm(xr,55,7))
plot(xseq, densities, col="black",xlab="", ylab="Density", type="l",lwd=2, cex=2, main="PDF of Standard Normal", cex.axis=.8)
polygon(c(50,xl,55), c(0,yl,0),col='blue')
polygon(c(55,xr,75), c(0,yr,0),col='green')
abline(v=c(55), lwd=3,lty=1, col='red')
pnorm(75,mean=55,sd=7)-pnorm(50,mean=55,sd=7)

#c
pnorm(52.305,mean=55,sd=7)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

rnorm(10, mean=55, sd=7)
chisq.test(2, p=.385)
?chisq.test()

#Problem #1 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
groveData <- read.table("TreeData.txt", header=T)

#a
par(mfrow=c(1,2))
hist(groveData[,1], prob=TRUE, main ="Grove with Ladybugs", xlab = "Fruit Yield (lbs)", xlim=c(20,80))
x=seq(20,80,.01)
hx=2*x + rnorm(length(x),48,8.7)
curve(dnorm(x,mean(groveData[,1]),sd(groveData[,1])), add=TRUE,lwd=2,col="red")
hist(groveData[,2], prob=TRUE,main ="Grove with Pesticides", xlab = "Fruit Yield (lbs)", xlim=c(20,80))
x=seq(20,80,.01)
hx=2*x + rnorm(length(x),40,8.5)
curve(dnorm(x,mean(groveData[,2]),sd(groveData[,2])), add=TRUE,lwd=2,col="red")

summary(groveData)
sd()
?seq

#d
alpha = .05
x1=groveData[,1]
CIL = c(mean(x1)-qnorm(1-alpha/2)*sd(x1)/sqrt(length(x1)), mean(x1)+qnorm(1-alpha/2)*sd(x1)/sqrt(length(x1)))
CIL

mean(groveData[,1])
sd(groveData[,1])
rnorm(groveData[,1],mean=mean(groveData[,1]), sd=sd(groveData[,1]))

alpha = .05
x2=groveData[,2]
CIP = c(mean(x2)-qnorm(1-alpha/2)*sd(x2)/sqrt(length(x2)), mean(x2)+qnorm(1-alpha/2)*sd(x2)/sqrt(length(x2)))
CIP


var(groveData[,1])/(15)
var(groveData[,2])/(15)
sqrt(sd(groveData[,1]))-sqrt(sd(groveData[,2]))

sd(groveData[,2])
rnorm(groveData[,2],mean=mean(groveData[,2]), sd=sd(groveData[,2]))

?chisq.test

chisq.test(x1)
chisq.test(x2)
alpha=.05
pL=.07382
pP=.02726
CCIL=c(pL-qnorm(1-alpha/2)*sqrt((pL*(1-pL))/15), pL+qnorm(1-alpha/2)*sqrt((pL*(1-pL))/15))
CCIP=c(pP-qnorm(1-alpha/2)*sqrt((pP*(1-pP))/15), pP+qnorm(1-alpha/2)*sqrt((pP*(1-pP))/15))
CCIL
CCIP

CCIL=c(14*(sd(groveData[,1])^2)/26.11894805, (14*(sd(groveData[,1])^2)/5.62872610))
CCIP=c(14*(sd(groveData[,2])^2)/26.11894805, (14*(sd(groveData[,2])^2)/5.62872610))
CCIL
CCIP
sqrt(CCIL)
sqrt(CCIP)
var(groveData[,1])
mean(groveData[,1])

#use sample mean variance

#Problem #2 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
means.of.expSamples=NULL
expSample=NULL

for(i in 1:500){
 if(i==1){
   expSample = rexp(n=300, 2)
 }else{
   y=mean(rexp(n=300, 2))
   means.of.expSamples[i-1] = y
 } 
}

mean(expSample); sd(expSample)
mean(means.of.expSamples); sd(means.of.expSamples)
par(mfrow=c(1,2))
hist(expSample,xlab="Mean",main="Mean of 300 random samples")
hist(means.of.expSamples, xlab="Means of mean samples", main="Means of 300*499 random samples")

#Problem #3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#a
math=function(y,X){
  y=(5*X)+2
  return(y)
}

dataStuff=0;

for(i in 1:100000){
  X=rnorm(1, mean=3, sd=2)
  dataStuff[i]=(math(x,X))
}

mean(dataStuff)
var(dataStuff)
sd(dataStuff)

#b
pnorm(10,3,2)
pnorm(10,17,10)

#c
qnorm(.67,17,10)

#d
1-pnorm(.25,0,1)
qnorm(.25,3,2)

-.674*(2)+3 #review in notes for explanation

#Problem #4 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
numero8=function(u){
  z=(u^4)/16
  return(z)
}

hist(numero8(runif(1000,0,2)),main="Random sampling for 0<=x<=2", xlab="f(x) = x^4/16")
boxplot(numero8(runif(1000,0,2)),main="Random sampling for f(x)=x^4/16", xlab="0<=x<=2")
