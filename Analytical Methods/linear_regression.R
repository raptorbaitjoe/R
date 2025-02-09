# Sample data
X <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 5, 4, 5)

# Fit the model 
model <- lm(y ~ X) 

# Print the summary of the regression 
summary(model)
