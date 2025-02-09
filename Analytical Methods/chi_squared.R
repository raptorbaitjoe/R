# Load necessary library
library(ggplot2)  # For visualization

# Generate example categorical data
set.seed(123)  # Set seed for reproducibility
data <- data.frame(
  Category1 = sample(c("A", "B", "C"), 100, replace = TRUE),
  Category2 = sample(c("X", "Y"), 100, replace = TRUE)
)

# Create a contingency table
table_data <- table(data$Category1, data$Category2)
print(table_data)

# 1. Check assumptions
# Expected frequencies should be >= 5
expected_freq <- chisq.test(table_data)$expected
print(expected_freq)  # Ensure no expected frequency is too low

# 2. Perform the chi-squared test
chi_sq_test <- chisq.test(table_data)

# 3. Output results
print(chi_sq_test)

# 4. Visualize the data
barplot(table_data, beside = TRUE, col = c("blue", "red", "green"), legend = rownames(table_data),
        main = "Chi-Squared Test: Category1 vs Category2")
