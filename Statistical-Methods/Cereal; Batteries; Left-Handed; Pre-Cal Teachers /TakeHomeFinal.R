#************************THEORETICAL #1************************
par(mfrow=c(1,1))
hist(rexp(1000000, rate=1/1000), breaks=1000, border="orange", freq=FALSE)
hist(rgamma(100000, rate=1/500), alpha=2)

########################################COMPUTATIONAL #1#####################################################
cerealData=read.table("cerealdata.txt", header=TRUE)
cerealData
cD_lm=lm(rating~mfr+calories+protein+fat+sodium+fiber+carbo+sugars+potass+vitamins+as.factor(shelf), data=cerealData)
summary(cD_lm)
mean(cerealData$rating)

#************************COMPUTATIONAL #1, Part a************************
  par(mfrow=c(1,2))
summary(log(cerealData$rating))

hist(cerealData$rating, main="FDA rating histogram", xlab="FDA rating", ylim=c(0,25),xlim=c(0,100))
hist(log(cerealData$rating), main="log(FDA rating) histogram", xlab="log of FDA rating", ylim=c(0,25),xlim=c(2.5,5))

hist(cerealData$rating, main="FDA rating histogram", xlab="FDA rating", ylim=c(0,.04),xlim=c(0,100), breaks=20, freq = FALSE)
curve(dnorm(x,mean(cerealData$rating),sd(cerealData$rating)),add=TRUE,col="red",lwd=2)

hist(log(cerealData$rating), main="log(FDA rating) histogram", xlab="log of FDA rating", ylim=c(0,1.4),xlim=c(2.5,5), breaks=20, freq=FALSE)
curve(dnorm(x,mean(log(cerealData$rating)),sd(log(cerealData$rating))),add=TRUE,col="red",lwd=2)

#log data looks more idea for the linear model since it fits a better normal distribution curve

cD_lm_logRating=lm(log(rating)~mfr+calories+protein+fat+sodium+fiber+carbo+sugars+potass+vitamins+as.factor(shelf), data=cerealData)
summary(cD_lm_logRating)
#************************COMPUTATIONAL #1, Part b************************
pairs(cerealData[,1:12], lwd=.8, cex=.7)

  ?pairs
#Potassium & fiber linear
#Sodium & carbs slightly linear
#Sugars & calories slightly linear

#************************COMPUTATIONAL #1, Part c************************

#************************COMPUTATIONAL #1, Part d************************
#*******Part d.i.*********

#*******Part d.ii.*********
summary(cD_lm_logRating)
summary(cerealData$shelf) #1 to 3 for shelf value
#average rating for low shelf life

#THIS IS THE WRONG METHOD
cerealData$Rating_Brand_Shelf = 0
cerealData$Rating_Brand_Shelf[cerealData$mfr=="G" & cerealData$shelf==1 & cerealData[,6]!="NA" & cerealData[,7]!="NA" & cerealData[,8]!="NA"] =1
cerealData
cereal_fit1=lm(rating~as.factor(Rating_Brand_Shelf), data=cerealData)
summary(cereal_fit1)

##CORRECTED MODEL
summary(cD_lm)

#*******Part d.iii.*********
cereal_fit2=lm(log(rating)~as.factor(cerealData$mfr), data=cerealData)
cereal_fit2.1=lm(log(rating)~calories+protein, data=cerealData)
summary(cereal_fit2)

data32=0
for(i in 1:9){
  data32[i-2]=min(cerealData[i])
}

summary(cD_lm_logRating)$coef[1,1]+
  summary(cD_lm_logRating)$coef[5,1]*min(cerealData$calories, na.rm=remove)+
  summary(cD_lm_logRating)$coef[6,1]*min(cerealData$protein, na.rm=remove)+
  summary(cD_lm_logRating)$coef[7,1]*min(cerealData$fat, na.rm=remove)+
  summary(cD_lm_logRating)$coef[8,1]*min(cerealData$sodium, na.rm=remove)+
  summary(cD_lm_logRating)$coef[9,1]*min(cerealData$fiber, na.rm=remove)+
  summary(cD_lm_logRating)$coef[10,1]*min(cerealData$carbo, na.rm=remove)+
  summary(cD_lm_logRating)$coef[11,1]*min(cerealData$sugars, na.rm=remove)+
  summary(cD_lm_logRating)$coef[12,1]*min(cerealData$potass, na.rm=remove)+
  summary(cD_lm_logRating)$coef[13,1]*min(cerealData$vitamins, na.rm=remove)

summary(cD_smaller_fitted)$coef[1,1]+
  summary(cD_smaller_fitted)$coef[2,1]*min(cerealData$calories, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[3,1]*min(cerealData$protein, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[4,1]*min(cerealData$fat, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[5,1]*min(cerealData$sodium, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[6,1]*min(cerealData$fiber, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[7,1]*min(cerealData$carbo, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[8,1]*min(cerealData$sugars, na.rm=remove)+
  summary(cD_smaller_fitted)$coef[9,1]*min(cerealData$vitamins, na.rm=remove)
max(cerealData$rating, na.rm=remove)+
data32

#*******Part d.iv.*********
cereal_fit3=lm(log(rating)~as.factor(cerealData$shelf), data=cerealData)
summary(cereal_fit3)

#************************COMPUTATIONAL #1, Part e************************
#*******Part e.i.*********
cD_smaller_fitted=lm(log(rating)~calories+protein+fat+sodium+fiber+carbo+sugars+vitamins, data=cerealData)
summary(cD_smaller_fitted)
#*******Part e.ii.*********
cD_smaller_fitted_fit2=lm(log(rating)~calories+protein, data=cerealData)
summary(cD_smaller_fitted_fit2)
#*******Part e.iii.*********

#*******Part e.iv.*********

#************************COMPUTATIONAL #1, Part f************************
cD_smaller_fitted_fit10=lm(log(rating)~calories+protein+fat+sodium+fiber+carbo+sugars+vitamins, data=cerealData)
anova(cD_lm_logRating)$'Pr(>F)'[1] #for the p-value
mean((summary(cD_lm_logRating)$coefficients[,4]))
summary(cD_smaller_fitted_fit10)

mean(coef(summary(cD_smaller_fitted_fit10))[, "Pr(>|t|)"])
glance(cD_lm_logRating)
install.packages("broom")#^^
library(broom)
#************************COMPUTATIONAL #1, Part g************************

#************************COMPUTATIONAL #1, Part h************************
par(mfrow=c(1,1))
q1 = qqnorm(cD_smaller_fitted$residuals, plot.it = FALSE)
q2 = qqnorm(cD_lm_logRating$residuals, plot.it = FALSE)
plot(range(q1$x, q2$x), range(q1$y, q2$y), main="Normal Q-Q Plot", type = "n",xlab="Theoretical Quantiles", ylab="Sample Quantiles")
points(q1, col="blue");qqline(cD_smaller_fitted$residuals, col="lightblue")
points(q2, col = "red", pch=3);qqline(cD_lm_logRating$residuals, col="lightpink1")
help(package=colorspace)
qqnorm(cD_smaller_fitted$residuals)

par(mfrow=c(1,2))
plot(cD_lm_logRating$fitted, cD_lm_logRating$residuals, main="Large model", xlab="Fitted", ylab="Residuals", xlim=c(3,5), ylim=c(-.2,.1), col="blue")
#par(new=TRUE)
plot(cD_smaller_fitted$fitted, cD_smaller_fitted$residuals, main="Smaller model",xlab="Fitted", ylab="Residuals",xlim=c(3,5), ylim=c(-.2,.1), col="red")

log(cerealData[,2:10]+1)
cerealData_logT=log(cerealData[,2:10]+1)

cerealData_logT_lm=lm
summary(cerealData_logT_lm)

########################################COMPUTATIONAL #2#####################################################
#************************COMPUTATIONAL #2, Part c************************
n=100
studentMatrix=matrix(1, nrow=n, ncol=3)

sumPreCal=0;sumNoPreCal=0;sumGroup=0
for(i in 1:n){
  studentMatrix[i,2]=sample(0:1, size=1, prob=c(.25,.75))
  
  #if(studentMatrix[i,2]==1) sumPreCal=sumPreCal+1
  #else sumNoPreCal=sumNoPreCal+1
  
  if(sumGroup<(n/2)){
    if(sumNoPreCal<(n/4) && studentMatrix[i,2]==0){ #0 is didn't have pre-cal in HS
      studentMatrix[i,3]=1  #1 is representing no HS Pre-cal class and select for active group work
      sumNoPreCal=sumNoPreCal+1
      sumGroup=sumGroup+1
    }else if(sumPreCal<sumNoPreCal && studentMatrix[i,2]==1){ #1 is had pre-cal in HS
      studentMatrix[i,3]=2 #2 is representing HS Pre-cal class and select for active group work
      sumPreCal=sumPreCal+1
      sumGroup=sumGroup+1
    }else
      studentMatrix[i,3]=0 #0 - don't select this student for active group work 
  }else if(sumNoPreCal!=sumPreCal && sumGroup<(n/2)){
    if(sumPreCal>=sumNoPreCal && studentMatrix[i,2]==0){ #0 is didn't have pre-cal in HS
      studentMatrix[i,3]=1  #1 is representing no HS Pre-cal class and select for active group work
      sumNoPreCal=sumNoPreCal+1
      sumGroup=sumGroup+1
    }else if(sumPreCal<=sumNoPreCal && studentMatrix[i,2]==1){ #1 is had pre-cal in HS
      studentMatrix[i,3]=2 #2 is representing HS Pre-cal class and select for active group work
      sumPreCal=sumPreCal+1
      sumGroup=sumGroup+1
    }
  }else
    studentMatrix[i,3]=0 #0 - don't select this student for active group work 
}
studentMatrix
summary(studentMatrix[,2])
as.data.frame(table(studentMatrix[,2]))
as.data.frame(table(studentMatrix[,3]))
sumNoPreCal;sumPreCal;sumGroup

  for(i in 1:n){
  if(studentMatrix[i,3]!=0)studentMatrix[i,3]=1
}

x_critical_.05=matrix(0,nrow=n,ncol=1)
type_II_.05=matrix(0,nrow=n,ncol=1)
for(i in 1:n){
  x_critical_.05[i]=(qnorm(.05)*(20/sqrt(n)))+(60+((studentMatrix[i,2])*20)+(studentMatrix[i,3]*10))
  type_II_.05[i]=(x_critical_.05-(60+((studentMatrix[i,2])*20)+(studentMatrix[i,3]*10)))/(20/sqrt(n))
}
type_II_.05
x_critical_.05

1-mean(pnorm(type_II_.05))

pwr.2p.test(mean(studentMatrix[,3]),sig.level=.05,n=n,alternative = "two.sided")

