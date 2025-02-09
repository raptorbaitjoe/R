# Install packages (if necessary)
install.packages('ggplot2')
install.packages('car')

# Load necessary libraries
library(ggplot2)  # For visualization
library(car)      # For additional regression diagnostics

# 1. Check for linearity using a scatter plot
## Look for a roughly straight-line relationship. 
## If non-linear, options include transforming variable, polynomial regression or non-linear regression.
plot(data$x, data$y, main = "Scatter Plot of x vs y", xlab = "x", ylab = "y")
abline(lm(y ~ x, data = data), col = "red") 

# 2. Fit the linear regression model
model <- lm(y ~ x, data = data)

# 3. Check for normality of residuals
## Histogram needs a bell curve and residuals on the scatter plot to follow the line.
## Small deviations are okay in large samples. I\
## If severe, options are to transform the dependent variable (log/square root) or use robust regression.
par(mfrow = c(1, 2))  # Set plotting area to show two plots
hist(resid(model), main = "Histogram of Residuals", xlab = "Residuals", col = "lightblue")
qqnorm(resid(model))
qqline(resid(model), col = "red")  # Add a reference line

# 4. Check for homoscedasticity (constant variance)
## Good sign if residuals are randomly scattered around zero with no clear pattern.
## Bad sign if a funnel shape (residuals spread wider as fitted values increase).
## If bad, options are to transform the dependent variable (log/square root) or use robust regression.
plot(fitted(model), resid(model), main = "Residuals vs Fitted Values", xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# 5. Check for multicollinearity using Variance Inflation Factor (VIF)
## Multicollinearity occurs when two or more independent variables in a regression model are highly correlated.
## Only applies when multiple predictors are present (multiple regression).
vif_values <- vif(model)
print(vif_values)

# 6. Summary of the regression model
summary(model)

# 7. Results
## Coefficents: intercept shows starting y-value, estimate of dependent variable shows slope.
## Residuals: should be symmetrically distributed (Median close to 0). Large min/max values may indicate outliers.
## Residual Standard Error: shows how much actual y values deviate from predicted values. Lower RSE is better, but it depends on the scale of y.
## R-squared: a statistical measure that describes how well a regression line fits a set of data. Above 0.7 is strong; 0.5–0.7 is moderate.
## Adjusted R-squared: use Adjusted R-squared when comparing models with different numbers of predictors.
## F-Statistics: tests if the overall model is statistically significant.
