
#**************COMP #1********************
steeldata = read.table("steeldata.txt",header=TRUE)

par(mfrow=c(1,1))
hist(steeldata[,1], main="Tank Temp Histogram", xlab="Tank Temperature") #TankTemp
hist(steeldata[,2], main="Efficiency Ratio Histogram", xlab="Efficiency Ratio") #EfficiencyRatio
mean(steeldata[,1])
cor(steeldata)
pairs(steeldata)

steel1=lm(EffRat~TankTemp, steeldata)

hist(rstandard(steel1), main="Histogram of Standardized Residuals", xlab="Residuals (standardized)")
plot(steeldata, main="Tank Temperature vs. Efficiency Ratio")
abline(steel1)
summary(steel1)
  plot(steel1)
qqnorm(steel1$residuals);qqline(steel1$residuals)
plot(steel1$fitted,rstandard(steel1), xlab="Fitted values", ylab="Standardized Residuals", main="Fitted values vs. Standardized Residuals")
?abline
#**************COMP #2********************
winedata = read.table("winedata.txt",header=TRUE)

wine1=lm(Astringency~Tannin,data=winedata)
summary(wine1)
pairs(winedata)
plot(winedata[,2],winedata[,1],main="Tannin vs. Astringency", xlab="Tannin", ylab="Astringency")
abline(wine1,col="red",lwd=2)
hist(rstandard(wine1), main="Histogram of Standardized Residuals", xlab="Standardized Residuals")
plot(wine1$fitted.values,rstandard(wine1),xlab="Fitted values", ylab="Standardized Residuals", main="Fitted values vs. Standardized Residuals")

coef(wine1)[["Tannin"]]

#part 2, c
c=coef(summary(wine1))
cbind(low=c[,1]-qt(p=.975,df=30)*c[,2],high=c[,1]+qt(p=.975, df=30)*c[,2])

#**************COMP #3********************
chlorine_flow=c(1.5,1.5,2.0,2.5,2.5,3.0,3.5,3.5,4.0)
etch_rate=c(23.0,24.5,25.0,30.0,33.5,40.0,40.5,47.0,49.0)
plasma=data.frame(chlorine_flow,etch_rate)
plasma_lm=lm(etch_rate~chlorine_flow,data=plasma)
plot(plasma,main="Etch Rate with Chlorine Flow",xlab="Chlorine Flow (SCCM)", ylab="Etch Rate (100 A/min)")
abline(plasma_lm,col="red")
hist(rstandard(plasma_lm), main="Histogram of Standardized Residuals", xlab="Standardized Residuals")
plot(plasma_lm$fitted,rstandard(plasma_lm),xlab="Fitted values", ylab="Standardized Residuals", main="Fitted values vs. Standardized Residuals")
summary(plasma_lm)
plot(plasma,main="Etch Rate with Chlorine Flow",xlab="Chlorine Flow (SCCM)", ylab="Etch Rate (100 A/min)")
abline(plasma_lm, col="red")
