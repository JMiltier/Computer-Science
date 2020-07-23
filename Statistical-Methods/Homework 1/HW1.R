# comment (no multi-line)

8+5 #basic math; press cmd/ctrl-enter to run

1:250 #prints numbers 1 to 250

print("Hello World!") #prints in console

#variables
x <- 1:5 #puts the numbers 1-5 in the variable x
x #displays the value in x

y <- c(6, 7, 8, 9, 10) #puts the numbers 6-10 in y
#"opt + -" to add <-

# clean up
rm(x) #remove an object from workspace
rm(a, b)
rm(list = ls()) # clear entire workspace

#see current packages
library() #brings up editor list of installed packages
search() #shows packages currently loaded


dataset <- read.table("hw1data.txt", header = T)
x
boxplot(hw1data.txt)

getwd()

x[r,c]  #row, column
x[1:5,]

hist(x[,1])
hist(dataset$data1) #x$data1 does not work
par(mfrow = c(3,3))

summary(x[,1])
mean()
sd()
quantile()
quantile(x[,1], probs = c(.1,.9))

#which command
y=21:30
which(y>25)
y[which(y>25)]

#histogram
hist(x[,1][which(x[,1] > 5)])
y>25 #only shows true or false

x
getOption("max.print")
length(y)

#how to adjust histogram, label x & y axis
hist(x[,2],main = "Second column of data", xlab = "data 2 values", freq = FALSE, breaks = 50)
seq(0,50, by=2)
lines(density(x[,2]),col='red') #can also use numbers for the colors
par(mfrow = c(1,2)) #sets the number of graphs on 1 page
hist(x[,1], xlim = c(0,25), ylim = c(0,1), breaks = -10:100, freq=FALSE)
hist(x[,2], xlim = c(0,25), ylim = c(0,.4), breaks = 0:50, freq=FALSE)

#boxplot
boxplot(x[,1])

#for stats of boxplot
boxplotnums = boxplot(x[,1])
boxplotnums  

table(x[,1])

seq(0,3,length.out = 5)
rep(1:5,5) #repeats number
rep(1:5,each=5)
rep(1:2, c(3,4))

sample(1:10, size=5)
sample(1:10, size=5, replace=TRUE)
sample(1:3, size=5, replace=TRUE, prob=c(.2,.5,.3))
mysample<-sample(1:3, size=100, replace=TRUE, prob=c(.2,.5,.3))
table(mysample) #shows number of times the number appears
table(mysample)/500 #turns into probability

#for #1 !!!!!!!!!!!!!!
(.2*.2)+(.4*.1)+(.1*.05)+(.3*.5) #a
1-(((.4*.1)*.4)/(.2*.2)+(.4*.1)+(.1*.05)+(.3*.5))#b
((.1*.05)*.1)/((.2*.2)+(.4*.1)+(.1*.05)+(.3*.5))#c
(.2*.2*.75)#d
1-((.3*.5*.6)/((.2*.2*.75)+(.4*.1*.5)+(.1*.05*.9)+(.3*.5*.6))) #e

#for #2 !!!!!!!!!!!!!!
boxplot(dataset)
boxplot(dataset[,1], col = "grey", ylab = "Percentage", xlab = "column 1 data", main = "Boxplot of column 1 data") #2a
hist(dataset[,1], breaks=50) #2b
boxplot(dataset[,2], col = "grey", ylab = "Percentage", xlab = "column 2 data", main = "Boxplot of column 2 data") #2c
hist(dataset[,2], breaks=50) #2c
#3d histograms or boxplots better? histograms to show the frequency of the data and can change the number of breaks


#for #3 !!!!!!!!!!!!!!
sample(1:4, size=500, replace=TRUE, prob=c(.01,.74,.1,.15))
# 1red(1), 74yellow(2), 10green(3), 15blue(4)
randomDraws<-sample(1:4, size=500, replace=TRUE, prob=c(.01,.74,.1,.15))
yellowDraws<-sample(0:1, size=500, replace=TRUE, prob=c(.26,.74))
table(randomDraws)
plot(randomDraws)


yellow.draw=NULL
sum.yellow.draw=0

for (i in 1:500){
  #'1' = yellow marble drawn, '0' = yellow marble not drawn
  yellowDraws<-sample(0:1, size=1, replace=TRUE, prob=c(.26,.74))
  sum.yellow.draw=sum.yellow.draw+yellowDraws
  yellow.draw=c(yellow.draw, sum.yellow.draw/i)
}

##plot results
plot(yellow.draw, ylim=c(.6,1), ylab="Cumlative fraction of yellow draws", xlab="Total number of draws", main="Freqency of yellow marbles drawn", type="l")
abline(h = 0.74, col = 'grey') 

red.draw=NULL
sum.red.draw=0

for (i in 1:500){
  #'1' = red marble drawn, '0' = red marble not drawn
  redDraws<-sample(0:1, size=1, replace=TRUE, prob=c(.99,.01))
  sum.red.draw=sum.red.draw+redDraws
  red.draw=c(red.draw, sum.red.draw/i)
}

##plot results
plot(red.draw, ylim=c(0,.2), ylab="Cumlative fraction of red draws", xlab="Total number of draws", main="Freqency of red marbles drawn")


plot(randomDraws,ylab="Cumlative fraction of yellow draws", xlab="Total number of draws")
plot(yellowDraws)
hist(randomDraws)


#sufficient information that sample size is good:
##all last points are within a certain amount of truth
##another way is to look at the variance