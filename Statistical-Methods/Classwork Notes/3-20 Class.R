#prob of type I error
#P(reject H0 but it's tue aka false rejection)

#simulate some data looking at type I error
#Xi ~ N(2,9)
TSs = pvalues = NULL
for(i in 1:1000){
  sample.x=rnorm(50, mean=2,sd=3)
  test.stat = (mean(sample.x)-2)/(3/sqrt(50))
  this.pval = 1-pnorm(abs(test.stat))
  TSs = c(TSs, this.pval)
  pvalues= c(pvalues,this.pval)
}

hist(pvalues)
length(which(pvalues<.05))/1000

length(which(test.stat>qnorm(.95)))
length(which(test.stat< -qnorm(.95)))/1000

qnorm(.95)
range(test.stat)
length(which(TSs>qnorm(.95)))/10000

#If fix alpha = .05
qnorm(.95)
#above is z_alpha = z_.05

#Type II Error
#P(Fail to reject H0 but you should have)

#H0: mu=2
#Ha: mu>2

TS_smalldiff =TS_bigdiff =NULL
for(i in 1:1000){
  x.smalldiff=rnorm(100,mean=2.5,sd=3)
  x.bigdiff=rnorm(100,mean=3.5,sd=3)
  
  ts.smalldiff=(mean(x.smalldiff)-2)/(3/sqrt(100))
  ts.bigdiff=(mean(x.bigdiff)-2)/(3/sqrt(100))
  TS_smalldiff = c(TS_smalldiff, ts.smalldiff)
  TS_bigdiff=c(TS_bigdiff, ts.bigdiff)
  
}

length(which(TS_smalldiff>qnorm(.95)))/1000
length(which(TS_bigdiff>qnorm(.95)))/1000

#P(TYPE II ERROR) = length(which(TS_smalldiff < qnorm(.95)))/1000
#Power (is kinda more imp) = length(which(TS_smalldiff > -qnorm(.95)))/1000
#three things to affect type II error:
####1. actual difference (mu_0, mu_a)
####2. n = sample size (does impact alpha)
####3. alpha
####4. variance (does not impact alpha)

#POWER = prob you reject when you should - "high is good"


#classwork
#H_0: mu = 35, H_a: mu > 35
#P(reject H_0|mu = 36) == 1 - P(fail to reject H_0 | mu = 36)
#                             P(Z < Z_.05| mu = 36)
#                       = P((x_bar - mu_0)/sigma/sqrt(n) < Z_.05 | mu=36)
#                       = P(x_bar < Z_.05 sigma/sqrt(n)) + mu_0 | mu=36)
#                       = P((x_bar - mu_0)/sigma/sqrt(n)) < (Z_.05 sigma/(sqrt(n)) + mu_0 - mu_a) / sigma/sqrt(n)
#                       = phi(1.645 + (35-36)/15/sqrt(50))
#                       = phi(1.179) = .88
#                 POWER = 1 - .88 = .12