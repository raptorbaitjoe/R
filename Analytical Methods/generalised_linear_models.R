####                     Generalised Linear Models                              ####

# If y is not continuous or normally distributed, use glm() with the appropriate family

####                            Libraries                                       ####

# Load necessary libraries

library(ggplot2)
library(car)

####                     Create example dataset                                 ####

# Set seed for reproducibility

set.seed(123)

# Generate a dataset with 100 observations

dataset <- data.frame(
  age = rnorm(100, mean = 35, sd = 10),      # Age (normally distributed)
  income = rnorm(100, mean = 50000, sd = 15000),  # Income (normally distributed)
  purchase = rbinom(100, 1, prob = 0.5)      # Purchase (Binary: 0 or 1)
)


####                      Determine required GLM                                ####

# If dependent variable is normally distributed, use regular linear regression

# Normality check (Shapiro-Wilk Test):
shapiro.test(dataset$income) # If p<0.05, variable is not normally distributed


# Normality check (Q-Q Plot)
qqnorm(dataset$age)
qqline(dataset$age, col = "red", lwd = 2)  # Should follow the line if normally distributed


# If dependent variable is not normally distributed and binary, use Binomial

# If dependent variable is not normally distributed and count data, use Poisson


####                        Run required GLM                                    ####

# glm(independent ~ dependent + dependent, dataset, glm family)

### Gaussian - Continuous, but not normal

model <- glm(purchase ~ age + income, data = dataset, family = gaussian(link = "identity"))


### Binomial - Binary (0/1, Yes/No, Success/Fail)

model <- glm(purchase ~ age + income, data = dataset, family = binomial(link = "logit"))

### Poisson - Count Data (0,1,2,3… Events per Time Unit)

model <- glm(purchase ~ age + income, data = dataset, family = poisson(link = "log"))

### Quasi-Poisson - Overdispersed Count Data	 

model <- glm(purchase ~ age + income, data = dataset, family = quasipoisson(link = "log"))

### Gamma - Skewed Positive Continuous Data (Time, Cost)

model <- glm(purchase ~ age + income, data = dataset, family = Gamma(link = "inverse"))


####                  View and interpret model summary                          ####


# Key Points to Focus On:
#  Statistical significance of predictors: Look for p-values below 0.05 to identify significant variables.
#  Model fit: Check the difference between null and residual deviance to understand how well your model fits the data.
#  AIC: Compare AIC values across different models to see which fits best.
#  Residuals: Ensure residuals are evenly spread around zero and check for any patterns that suggest model problems.

# Retrieve model summary

summary(model)

# Intercept: when independents are zero
# Estimate: difference in dependent following an idependent unit change of one
# t-values: ratio of the coefficient estimate to the standard error. A higher t-value suggests the predictor is more likely to have a significant effect.
# p-value: tests the null hypothesis that the coefficient is zero (no effect). A p-value less than 0.05 typically indicates that the predictor is statistically significant.
# Null deviance: the deviance of the model with just the intercept (no predictors).
# Residual deviance: deviance of the fitted model with predictors included.
# AIC: AIC is a measure that balances model fit and complexity. Lower AIC values indicate a better-fitting model.


# Plot residuals
plot(model$residuals)

# Residuals: If residuals have a non-random pattern, it suggests model misfit (for example, non-linearity, heteroscedasticity, or omitted variables).
# Ideally, residuals should be scattered randomly around zero without any systematic patterns. If there’s a clear pattern (e.g., a curve or a trend), it suggests that the model is not properly capturing the relationship.
# The residuals should be symmetrically distributed around zero. If they are skewed, it could indicate that the model's assumptions (e.g., normality) are violated.
