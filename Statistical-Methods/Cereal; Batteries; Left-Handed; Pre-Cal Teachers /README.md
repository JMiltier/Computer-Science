#### Long-lasting batteries (most-expensive) VS short-term batteries (least expensive)

- Long-lasting batteries lifetime follows an exponential distribution with a mean of 1000 hours.
- Short-term batteries lifetime follows a gamma distribution with a mean of 500 hours, and a variance of 200 hours.
- For every short-term battery produced, four long-lasting batteries are produced.

long-lasting batteries: X ~ Exponential(1000,1000^2)
short-term batteries: X ~ Gamma(500,200)
