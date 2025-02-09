# 1. Check for linearity using a scatter plot
plot(data$x, data$y, main = "Scatter Plot of x vs y", xlab = "x", ylab = "y")
abline(lm(y ~ x, data = data), col = "red")  # Add regression line

# 2. Fit the linear regression model
model <- lm(y ~ x, data = data)

# 3. Check for normality of residuals
par(mfrow = c(1, 2))  # Set plotting area to show two plots
hist(resid(model), main = "Histogram of Residuals", xlab = "Residuals", col = "lightblue")
qqnorm(resid(model))
qqline(resid(model), col = "red")  # Add a reference line

# 4. Check for homoscedasticity (constant variance)
plot(fitted(model), resid(model), main = "Residuals vs Fitted Values", xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# 5. Check for multicollinearity using Variance Inflation Factor (VIF)
# Only applies when multiple predictors are present
vif_values <- vif(model)
print(vif_values)

# 6. Summary of the regression model
summary(model)
