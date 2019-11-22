IIN <- read.table("isitnormal", header=T)

{
  par(mfrow=c(3,2))
  hist(IIN[,1], main="Calc I final scores", xlab="Test score") 
  hist(IIN[,2], main="Store: amount of people before first purchase", xlab="Number of people")
  hist(IIN[,3], main="Walked to work", xlab="Number of people") 
  hist(IIN[,4], main="Amount of time to finish first problem on test",xlab="Time (minutes)")
  hist(IIN[,5], main="Error measurements on a well calibrated device", xlab="Error amount (mm)")
  hist(IIN[,6], main="Rainfall in September", xlab="Amount of rainfall (inches)")
}

{
  par(mfrow=c(1,6))
  boxplot(IIN[,1], ylab="Calc I final scores - Test score") 
  boxplot(IIN[,2], ylab="Store: amount of people before first purchase - Number of people")
  boxplot(IIN[,3], ylab="Walked to work - Number of people") 
  boxplot(IIN[,4], ylab="Amount of time to finish first problem on test - Time (minutes)")
  boxplot(IIN[,5], ylab="Error measurements on a well calibrated device - Error amount (mm)")
  boxplot(IIN[,6], ylab="Rainfall in September - Amount of rainfall (inches)")
}

{
  par(mfrow=c(2,3))
  qqnorm(IIN[,1], main="Calc I final scores"); qqline(IIN[,1]); qqplot(IIN[,1], rt(300,df=25))
  qqnorm(IIN[,2], main="Store: amount of people before first purchase"); qqline(IIN[,2])
  qqnorm(IIN[,3], main="Walked to work"); qqline(IIN[,3])
  qqnorm(IIN[,4], main="Amount of time to finish first problem on test"); qqline(IIN[,4])
  qqnorm(IIN[,5], main="Error measurements on a well calibrated device"); qqline(IIN[,5])
  qqnorm(IIN[,6], main="Rainfall in September"); qqline(IIN[,6])
}
?qqnorm
?rt

shapiro.test(IIN[,1]);shapiro.test(IIN[,2]);shapiro.test(IIN[,3]);shapiro.test(IIN[,4]);shapiro.test(IIN[,5]);shapiro.test(IIN[,6])

ggplot() + qqnorm(IIN[,1])

qnorm(.90, 5, 5.69)

s=0;k=0;ks=0
for(i in 1:6){
  s[i]=skewness(IIN[,i])
  k[i]=kurtosis(IIN[,i])
  probplot(IIN[,i],qdist=qnorm)
}
s;k
 ks.test(IIN[,1],"pnorm",mean(IIN[,1]),sqrt(var(IIN[,1])))

library(nortest)
install.packages("nortest")


##################################COMP 2
ALD <- read.table("ALD Data", header=FALSE)
par(mfrow=c(1,3))
hist(ALD[,1], xlim=c(0,2), ylim=c(0,20),xlab="pixel dimensions", main="Medical Imaging of Kidneys")
hist(ALD[,1], xlim=c(0,2), ylim=c(0,2), xlab="pixel dimensions", main="Medical Imaging of Kidneys", freq=FALSE)
curve(dnorm(x,mean(ALD[,1]),sd(ALD[,1])), lwd=2,col="firebrick", add=TRUE)
qqnorm(ALD[,1], main="Medical Imaging of Kidneys"); qqline(ALD[,1], col="blueviolet", lwd=2)
ks.test(ALD[,1],"pnorm",mean(ALD[,1]),sqrt(var(ALD[,1])))

z_value=(mean(ALD[,1])-1)/(sd(ALD[,1])/(sqrt(length(ALD[,1]))))
z_value
ALD_LB <- qnorm(.025,mean(ALD[,1],sd(ALD[,1])))
ALD_UB <- qnorm(.975,mean(ALD[,1],sd(ALD[,1])))
ALD_LB
ALD_UB

p_value = 2*pnorm(-abs(z_value))
p_value

shapiro.test(ALD[,1])

?shapiro.test
?ks.test
##################################COMP 3
rad_dat <- scan("radon data")
par(mfrow=c(1,2))
hist(rad_dat, xlim=c(90,110), xlab="pCi/L of radon", main="Radon Detectors @ 100 pCi/L radon")
hist(rad_dat, xlim=c(80,120), ylim=c(0,.08), xlab="pCi/L of radon", main="Radon Detectors @ 100 pCi/L radon", freq=FALSE)
curve(dnorm(x,mean(rad_dat),sd(rad_dat)), lwd=2,col="blue", add=TRUE)

qt(c(.025,.975),df=11)
t_value=(mean(rad_dat)-100)/(sd(rad_dat)/(sqrt(12)))
t_value
p_value=2*pt(-abs(t_value), df=11)
p_value

qnorm(.025,mean(rad_dat), sd(rad_dat))
qnorm(.975,mean(rad_dat), sd(rad_dat))
qnorm(.025)

mean(rad_dat)

shapiro.test(rad_dat)
##################################COMP 4
cloud(rad_dat)
contour3d
?persp

?utilities.3d

#use a nested for loop
glueMatrixMean=matrix(c(5.2,5.4,5.6,5.8,6.0),nrow=1,ncol=5)
glueMatrixN=matrix((5:15)*10,nrow=11,ncol=1)
#glueMatrix = glueMatrixMean %*% glueMatrixN

n = seq(50,150,1)
length(n)
glueMeans = seq(5.2,6,.02)
length(glueMeans)
glueMeans
x_critical_.05 = (qnorm(.05) * (4/sqrt(n))) + 5
length(x_critical_.05)
x_critical_.01 = (qnorm(.01) * (4/sqrt(n))) + 5
x_critical_.1 = (qnorm(.1) * (4/sqrt(n))) + 5

type_II_.05=matrix(0,nrow=41,ncol=101)
type_II_.01=matrix(0,nrow=41,ncol=101)
type_II_.1=matrix(0,nrow=41,ncol=101)
for (i in 1:41){
  for (j in 1:101){
    type_II_.05[i,j] = ((x_critical_.05[j] - glueMeans[i]) / (4/sqrt(n[j])))
    type_II_.01[i,j] = ((x_critical_.01[j] - glueMeans[i]) / (4/sqrt(n[j])))
    type_II_.1[i,j] = ((x_critical_.1[j] - glueMeans[i]) / (4/sqrt(n[j])))
  }
}
dim(type_II_.05)
type_II_.05
getOption("max.print")
options(max.print = 10000)
pnorm(type_II_.05)

{
bg3d("white")
#mfrow3d(1,3)
persp3d(glueMeans,n,1-pnorm(type_II_.05),col="green3", xlab="Means", ylab="Sample Size", zlab="Power",specular="black", ambient="green3", lit=FALSE, alpha=.7);
persp3d(glueMeans,n,1-pnorm(type_II_.01),col="blue2", ambient="blue2", alpha=.7, lit=FALSE, add=TRUE)
persp3d(glueMeans,n,1-pnorm(type_II_.1),col="orange", ambient="orange", alpha=.7, lit=FALSE, add=TRUE)
grid3d(c("x+","y+","z+","x","y","z"), lty=3, lwd=.1, col="gray90")
#play3d(spin3d(axis = c(1, 0, 0:360), rpm = 10), duration = 10)
}
colors()

?t.test

?grid3d

{
tAngle=45
pAngle=5
par(mfrow=c(1,3))
persp3D(glueMeans,n,1-pnorm(type_II_.05), theta=tAngle, phi=pAngle, xlab="Mean", ylab="Sample Size", zlab="Power", axes=TRUE, alpha=.7,bty="b2",colkey = list(length = 0.3,shift=-.02,col.ticks="white", width=1.2),image=TRUE, ticktype="detailed")
text(0,.6,"3D Power Curve, α = .05")
persp3D(glueMeans,n,1-pnorm(type_II_.05), theta=tAngle+90, phi=pAngle, xlab="Mean", ylab="Sample Size", zlab="Power", axes=TRUE, alpha=.7,bty="b2",colkey = list(length = 0.3,shift=-.02,col.ticks="white", width=1.2, cex.clab=.8),image=TRUE,ticktype="detailed")
text(0,.6,"1st image rotated 90° left")
persp3D(glueMeans,n,1-pnorm(type_II_.05), theta=tAngle+270, phi=pAngle, xlab="Mean", ylab="Sample Size", zlab="Power", axes=TRUE, alpha=.7, bty="b2",colkey = list(length = 0.3,shift=-.02,col.ticks="white", width=1.2),image=TRUE,ticktype="detailed")
text(0,.6,"2nd image rotated 180°")
}

  persp3D(glueMeans,n,type_II_.01, theta=tAngle, phi=pAngle,col="blue3", axes=FALSE, box=FALSE,alpha=.2);par(new=TRUE)
persp3D(glueMeans,n,type_II_.1, theta=tAngle, phi=pAngle,axes=FALSE,box=FALSE,col="orange2",alpha=.2)



glueMatrixN

n = seq(50,150,10)
n
glueMeans = seq(5.2,6,.2)
glueMeans
x_critical = (qnorm(.05) * (4/sqrt(n))) + 5
type_II = ((x_critical - glueMeans) / (4/sqrt(n)))

x_critical = (qnorm(.05) * 4) + glueMeans
powers = 1 - pnorm(x_critical) 
powers

k = qbinom(.05,n,.3) - 1
power = pbinom(k, n, .2)
power
data = data.frame(n,k,power)
par(mfrow=c(1,1))
persp(k,n,power,theta=60,phi=15,col='green3')

par(mfrow=c(1,1))
?persp
persp(glueMatrixMean, glueMatrixN, glueMatrix, theta = 60, phi=15, col='green3')
install.packages("rgl")
library(rgl)
scatter3D()
plot3d

options("defaultpackages")=library("e1071")

#######################THEORETICAL 4
qnorm(.1)
pnorm(10.0366, 25, 5)
pnorm(13.4138, 25, 5) #using 19
pnorm(14.2687, 25, 5) #using 20
pnorm(20, 25, 5)

#for reverse to find c
qpois

#part b
  x_critical_.1 = (qnorm(.1) * (sqrt(20)) + 20)
  type_II_.10 = ((x_critical_.1 - 25) / (sqrt(20)));pnorm(type_II_.10)

#######################THEORETICAL 5

x_critical_.1 = (qnorm(.1) * (5.69/sqrt(40))) + 5
type_II_.10 = ((x_critical_.1 - 6) / (5.69));1-pnorm(type_II_.10)
x_critical_.1 = (qnorm(.1) * (5.69/sqrt(40))) + 5
type_II_.10 = ((x_critical_.1 - 7) / (5.69));1-pnorm(type_II_.10)
x_critical_.1 = (qnorm(.1) * (5.69/sqrt(40))) + 5
type_II_.10 = ((x_critical_.1 - 8) / (5.69));1-pnorm(type_II_.10)


qnorm(.9)
