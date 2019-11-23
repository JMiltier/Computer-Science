#linear models

?lm

cheesedat = read.table('https://www.colorado.edu/amath/sites/default/files/attached-files/cheesedata.txt',header=TRUE)
cheesedat = cheesedat[,c('Lactic','taste')]
cheesedat

# Scatter plot of Lactic and Taste
plot(cheesedat$Lactic, cheesedat$taste, main = 'Scatterplot: Lactic vs Taste',
     xlab = 'Lactic', ylab = 'Taste')
cor(cheesedat)

# Using lm() in R:
fit = lm(taste ~ Lactic, data = cheesedat)
fit
summary(fit) #estimate = B_0_hat, standard error = variability, t-value=H_0: B_j=0, H_A: B-j!=0 (t=B_j_hat / stan_error(B_j_hat))
output = summary(fit)
names(output) #functions to find specific data within summary function

# Model with a more logical intercept, E(Y) = #+#x'
range(cheesedat$Lactic)
cheesedat$Lactic0 = cheesedat$Lactic-min(cheesedat$Lactic)
fit0 = lm(taste ~ Lactic0, data = cheesedat)
summary(fit0)
range(cheesedat$Lactic0)

# Model with a more logical slope, E(Y) = #+#x''
cheesedat$Lactic0_10 = cheesedat$Lactic0*10
fit0_10 = lm(taste ~ Lactic0_10, data = cheesedat)
summary(fit0_10)

# Check assumptions
par(mfrow = c(2,2))
plot(cheesedat$taste, fit0_10$fitted, main = 'Fitted vs Observed', xlab = 'Observed', ylab = 'Fitted')
plot(fit0_10$fitted, fit0_10$resid, main = 'Fitted vs Residuals', xlab = 'Fitted', ylab = 'Residuals')
abline(h = 0, col = 'darkgrey')
hist(fit0_10$resid, main = 'Hist of Residuals')
qqnorm(fit0_10$resid, main = 'QQ plot of residuals')
qqline(fit0_10$resid)
