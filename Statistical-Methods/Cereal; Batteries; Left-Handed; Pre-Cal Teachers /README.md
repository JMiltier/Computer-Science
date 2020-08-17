## Long-lasting batteries (most-expensive) VS short-term batteries (least expensive)
- Long-lasting batteries lifetime follows an exponential distribution with a mean of 1000 hours.
- Short-term batteries lifetime follows a gamma distribution with a mean of 500 hours, and a variance of 200 hours.
- For every short-term battery produced, four long-lasting batteries are produced.

#### Long-lasting batteries:  
  X ~ Exponential(1000,1000^2)  
  β = 1000  

#### Short-term batteries:  
  X ~ Gamma(500,200)  
  Standard deviation (σ) is 14.1421  
  The scale parameter is 200/500 (or 0.4), with a rate of 2.5  
  The shape parameter is 500/0.4 (mean divided by the scale parameter)  

#### Probability that a battery (picked from random) lasts at least 490 hours.  
*Long-lasting Batteries:* Probability that the batteries last at least 490 is a right-tailed test  
P(X ≥ 490) = e-490/1000 = 0.612626… => 61.26%  
*Short-term Batteries:* Gamma distribution (below)     
![short-term integral](battery-short-term-integral.png)  
The integral for the short-term batteries equates to 0.758795.. => 75.88%  
*Probability that the battery lasts at least 490 hours:*   
![490 hour battery](battery-490-hours.png) = ~64.18%  

#### Probability that a battery (picked from random) lasts at least 490 hours AND is a short-term battery.  
Knowing that picking a short-term battery is 75.88%, a 1-in-5 (20%) chance of picking a short-term batteries estimates a (0.2 * 0.7588) 15.18% chance.  
Then factoring in that a short-term battery lasted at least 490 hours: 15.18% / 64.18% = 23.65%
This was approached using Bayes Theorem.

## Are more than 80% of Americans right handed?
Sample size: 500 (419 of those were right-handed)
#### Hypothesis:  
H<sub>0</sub>: p = 80%  H<sub>1</sub>: p > 80%  
#### P-value for test:
The sample size is greater than 30, and using a significant level of .05, the z-score test statistic is:  
![z-score](right-hand-z-score.png)  
The p-value is = P (Z > 2.12) = 1 - .9830 = 0.017
<sup>(used the Z-table from http://www.stat.ufl.edu/~athienit/Tables/Ztable.pdf)</sup>
#### Conclusion:
Since the p-value is less than or equal to the significant level (α) of .05, H<sub>0</sub> is rejected.
There is significant evidence to support that more than 80% of Americans are right-handed, with a significant level of 0.05.

## Linear Regression for cereal health rankings (from 77 different cereals)
*manufacturer:* cereal manufacturer (G: General Mills, K: Kelloggs, N: Nabisco, O: Other)  
*calories:* calories per serving  
*protein:* grams of protein per serving  
*fat:* grams of fat per serving  
*sodium:* mg of sodium per serving  
*fiber:* grams of dietary fiber per serving  
*carbohydrates:* grams of complex carbohydrates per serving  
*sugars:* grams of sugar per serving  
*potassium:* mg of potassium per serving  
*vitamins:* percentage of total daily vitamins and minerals recommended by the FDA  
*shelf:* display shelf of the cereal (levels range from 1 to 3, counting up from the floor)  
*rating:* rating of the cereal by the FDA.  

#### Histograms/log-transformed histograms (using R and cereal data from txt file)
![cereal histograms](cereal-histograms.png)  
#### Correlating data using different predictor values (using R and cereal data from txt file)
![cereal scatterplots](cereal-scatterplot.png)  
**The following predictor variables look to be correlated based on the scatterplots above:**  
- *Potassium & fiber:* linear  
- *Calories & rating:* linear  
- *Calories & sugar:* somewhat linear  
- *Carbs & sugar:* slightly linear  
- *Sodium & carbs:* slightly linear  
- *Sugars & calories:* slightly linear  
- *Carbs & potassium:* slightly linear  
- *Calories & carbs:* slightly linear  
#### Matrix notation for the first and last 5 observations (using R and cereal data from txt file)  
![cereal matrix](cereal-matrix-updated.png)  
#### Fitting the model, using `lm()` in R.  
![model fit](cereal-full-model-fit.png)  
