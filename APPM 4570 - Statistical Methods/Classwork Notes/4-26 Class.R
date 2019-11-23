dataset = read.table("cheesedatat.txt", header=TRUE)

pairs(dataset[,2:5])
par(lwd=1, cex=20)
pairs(dataset[,2:5], cex=1)

#correlation between variables in data set (headers)
cor(dataset[,2:5])

#summary of dataset
summary(dataset)

par(mfrow=c(1,2))
hist(dataset$taste)
hist(log(dataset$taste))  

?lm

#formula = Y ~ X1 + X2...
#Model1: all my predictors
fit1=lm(taste~Acetic + H2S + Lactic, data=dataset)
fit1
summary(fit1) #Pr = p-values  #model: E(Y)_hat = -28.88 + 0.33X_acetic + 3.01X_H2S + 19.67X_lactic

#3 new variables all centered around mean
summary(dataset)
dataset$Acetic_mean = dataset$Acetic-5.5
dataset$H2S_mean = dataset$H2S-6
dataset$Lactic_mean = dataset$Lactic-1.4
#new values added to dataset (as new column)

fit2=lm(taste~ Acetic_mean + H2S_mean + Lactic_mean, data=dataset)
fit2
summary(fit2) #model: E(Y)_hat = 23.94 + 0.33X_acetic + 3.01X_H2S + 19.67X_lactic
#Average taste score is now 23.94 when acetic = 5.5, H2S = 6, and Lactice = 1.4 (their approx means)

#Lactic my tenths
dataset$Lactic_mean_10 = dataset$Lactic_mean*10
fit3=lm(taste~ Acetic_mean + H2S_mean + Lactic_mean_10, data=dataset)
summary(fit3)

#diagnostics
##QQplot of residuals
##fitted vs residuals
##fitted vs observed
par(mfrow=c(1,1))
best=fit3
qqnorm(best$residuals)
qqline(best$residuals, lwd=2)
plot(best$fitted, best$residuals)
abline(h=0,lwd=2)
plot(best$fitted, dataset$taste)

#is there strong collinearity between H2S and lactice
fit_noh2s=lm(taste~Acetic_mean+Lactic_mean_10,data=dataset)
summary(fit_noh2s)
pairs(dataset[,3:5])
fit_nolactic=lm(taste~Acetic_mean+H2S_mean,data=dataset)
summary(fit_nolactic)  #Collinearity happening

#combine H@s and lactic into one categorical variable
summary(dataset[,c('H2S','Lactic')])

#make 4 categories: 1)lower-half H2S and lower-half lactic 2)lower-half H2S and upper-half lactic 3)upper-half H2S and lower-half lactic 4)upper-half H2S and upper-half lactic 
dataset$H2S_lactic=0 #Group 0 (both below median)
dataset$H2S_lactic[dataset$H2S < 5.329 & dataset$Lactic >= 1.450] = 1 #Group 1
dataset$H2S_lactic[dataset$H2S >= 5.329 & dataset$Lactic < 1.450] = 2
dataset$H2S_lactic[dataset$H2S >= 5.329 & dataset$Lactic >= 1.450] = 3

table(dataset$H2S_lactic)
fit4=lm(taste~Acetic_mean + as.factor(H2S_lactic), data=dataset)
summary(fit4)
#^BASELINE: cheeses that have an acetic value equal to the average and lactic score below median and h2s score below median
#as.factor case 1: when h2s is below the median but lactic is above the median, taste scores increase 2.057 on average
#as.factor case 2: when h2s is above the median but lactic is below the median, taste scores increases 13.640 on average
#as.factor case 3: when h2s and lactic is above the median, taste scores increases 25.76 on average

#could combine case 0 and case 1


pt(1-.784,29)
