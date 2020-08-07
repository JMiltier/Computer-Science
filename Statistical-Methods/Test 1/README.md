Determining the hours of sleep for college students for one night
 - Removed three erroneous data points:
  	1. person: 101, hours: 70
  	2. person: 151, hours: 50
  	3. person: 250, hours: -5
- A total sample of 307 college students remains, instead of 310.

```R
sleepData <- read.table("sleepData.txt", header = T)

par(mfrow=c(2,1))
hist(sleepData[,2], breaks = 12, main ="Hours of sleep for College Student last night", xlab ="Hours")
boxplot(sleepData[,2], horizontal = TRUE, xlab="Number of hours selpt", main="Sleep time for College Students")
```

![sleep-diagrams](sleep-diagrams.png)

The histogram shows that a student typically slept 5 to 8 hours, with the highest percentage of the student receiving 7 hours of sleep. The histogram does not show the student which didn’t sleep at all. With the box-plot, it shows the zero hours slept as well as the median and mean (though they are very closely related). It also shows the “middle 50%” between the 1st and 3rd quartile range.

###### Summary of sleep data
  |         | person  | hours   |
  | :----   | :----   |:----    |
	| Min.    | 1.0   	| 0.000   |
	| 1st Qu. | 77.5  	|	5.000   |
 	| Median  | 155.0   |	7.000   |
 	| Mean    | 155.4   |	6.739   |
 	| 3rd Qu. | 232.5   | 8.000   |
 	| Max.    | 310.0   | 12.000  |

A value that initially sticks out immediately is the max value of 310, which is incorrect since there is only 307 data values after removing the 3 errors. Though the main information desired is the data based around the hours of sleep. The mean is more specific here as it was difficult to 	see on the box-plot. It also confirms the whole number values for which the box-plot portrayed. While the histogram showed the frequency “at-a-glance”, the box-plot provided more visual information which more mimics the summary information above.
