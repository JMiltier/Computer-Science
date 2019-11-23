#***********QUESTION 1***************
var_old_data=0
var_new_data=0
var_diff=0
for(i in 1:200000){
  old_machine_data=rnorm(200,75,20)
  new_machine_data=rnorm(200,45,20)

  var_old_data[i]=var(old_machine_data)
  var_new_data[i]=var(new_machine_data)
  var_diff[i]=var_old_data[i]-var_new_data[i]
}
mean(var_old_data)-mean(var_new_data)

y = qnorm(.95, mean(var_diff), sd(var_diff))
count = 0;
for(i in 1:200000){
  if ((var_diff[i]) > y){
    count <- count + 1
  }
}

count/200000

##UNSURE
qf(.95,df1=199,df2=199)
curve(df(x,df1=199,df2=199), from = .5, to =2)
x = seq(-30,150,.1)
old_machine_data[order(old_machine_data)]

#Type I Error Visual
densities1 = dnorm(x,75,20)
densities2 = dnorm(x,45,20)
plot(x, densities1, col="black",xlab="", ylab="", type="l",lwd=2)
par(new=TRUE)
plot(x, densities2, col="black", xlab="", ylab="", cex=NULL, type="l",lwd=2, cex.axis=.001)
abline(v=c(qnorm(.95,45,20)), lwd=1.2,lty=1, col='red1')
xl=seq(qnorm(.95,45,20),1000,.01)
yl=dnorm(xl,45,20)
polygon(c(qnorm(.95,45,20),xl,1000), c(0,yl,0),col='blue2')
text(99,.003,"Type I Error", col='blue3', cex=1.1)

par(mfrow=c(1,1))
hist(old_machine_data, freq=FALSE)
curve(dnorm(x,mean(old_machine_data),sd(old_machine_data)), lwd=2,col="blue", add=TRUE)
hist(new_machine_data,freq=FALSE)
curve(dnorm(x,mean(new_machine_data),sd(new_machine_data)), lwd=2,col="blue", add=TRUE)

#1 PART 2****************************************************************************************
old_machine_data=rnorm(200,75,20)
new_machine_data=rnorm(200,45,20)

length(var_diff)
sd_diff = sqrt(var_diff)
sd_diff

var_diff = seq(0,380,20)
x_critical_.05 = (qnorm(.95) * (20/sqrt(200))) + 75
x_critical_.05

type_II_.05=.05
for (i in 2:20){
    type_II_.05[i] = ((x_critical_.05 - 75) / sd_diff[i]/sqrt(200))
}

type_II_.05
1-pnorm(type_II_.05)

plot(var_diff,2*(1-(pnorm(type_II_.05))), ylim=c(.96,1),type="l", ylab="Power", xlab="Variance Difference", main="Power Curve for variance difference")

persp(old,1-pnorm(type_II_.05), z,zlim=c(0,2), xlab="Variances", ylab="Power", ticktype="detailed")

?persp



#1 PART 3***********)*****************************************************************************
power.t.test(delta=(75/45), sd=sqrt(380),power=.8,sig.level=.05)


?power.t.test
#***********QUESTION 2***************
balanceData=read.table('BalanceData.txt', header=TRUE)
balanceData

for (i in 1:120){
    elderly[i]=balanceData$BalanceMeasure[i]
}
for(i in 120:270){
    young[i-120]=balanceData$BalanceMeasure[i]
}

alpha=.01

CI_elderly = c(mean(elderly)-qnorm(1-alpha/2)*sd(elderly)/sqrt(length(elderly)), mean(elderly)+qnorm(1-alpha/2)*sd(elderly)/sqrt(length(elderly)))
CI_young = c(mean(young)-qnorm(1-alpha/2)*sd(young)/sqrt(length(young)), mean(young)+qnorm(1-alpha/2)*sd(young)/sqrt(length(young)))

CI_elderly; CI_young

CI_diff = c((mean(elderly)-mean(young))-qnorm(1-alpha/2)*sqrt((sd(elderly)^2/length(elderly)) + (sd(young)^2/length(young))), mean((mean(elderly)-mean(young)))+qnorm(1-alpha/2)*sqrt((sd(elderly)^2/length(elderly)) + (sd(young)^2/length(young))))
CI_diff

Claim: diff <= 7.5
Opp: diff > 7.5

t.test(elderly, young, conf.level=.99, alternative = c("less"), mu=7.5)
