### Chi-Squared Test

# Requirements:
# Two Categorical variables
# Observations should be independent - only belonging to one category
# Expected Cell Count over 5 in at least 80% of cell (roughly)
# Large-enough sample size, >20-30 observations is best


####                            Setup and Libraries                                       ####

# Load necessary library

library(dplyr)
library(pheatmap)


# Create a practice dataset - purely for example use

set.seed(123)  # For reproducibility
energy_table <- data.frame(
  Age_Group = rep(c("Young", "Middle-aged", "Senior"), times = c(50, 30, 20)),  # Unequal distribution
  Energy_Preference = c(
    rep("Solar", 30), rep("Wind", 15), rep("Hydro", 5),  # Young prefer Solar the most
    rep("Solar", 5), rep("Wind", 10), rep("Hydro", 15),  # Middle-aged prefer Hydro the most
    rep("Solar", 2), rep("Wind", 5), rep("Hydro", 13)    # Seniors mostly prefer Hydro
  )
)

# View the first few rows

head(energy_table)


####                    Create Contingency Table and perform Chi-Squared Test             ####


# Create a Contingency Table (Chi-Squared formatted table)

contingency_table <- table(energy_table$Age_Group, energy_table$Energy_Preference)

print(contingency_table)

# Perform the Chi-Squared Test

chi_square_test <- chisq.test(contingency_table)

# View the results

print(chi_square_test)


## Chi-Squared Output

# X-squared = Chi-Square Statistic - discrepancy between the observed frequencies in the contingency table and the frequencies we would expect if there were no associations between the variables.
# df = Degrees of Freedom -  calculated as (number of row - 1) * (number of columns - 1).
# p-value = P-Value - reject the null hypothesis (no association) if p<0.05



####                  Extra information from the Chi-Squared Test                           ####

## Supplementary Statistics

# Observed counts - Observed number of variable interactions

observed_counts <- chi_square_test$observed

print(observed_counts)


# Expected counts - calculated under the assumption that there is no association between variables

expected_counts <- chi_square_test$expected
print(round(expected_counts, 2))


# Pearson residuals - help identify the largest discrepancies between observed and expected counts, indicating which cells contribute most to the chi-square statistic

pearson_residuals <- chi_square_test$residuals
print(round(pearson_residuals, 2))

# Positive residuals indicate that the observed count is higher than expected
# Negative residuals indicate that the observed count is lower than expected
# Large positive or negative residuals suggest a significant deviation from what was expected
# Small residuals (close to 0) suggest that the observed counts are close to the expected counts, indicating a weaker deviation


## Contribution Diagram

# Calculate each cell's contribution to chi-square statistic

contributions <- (observed_counts - expected_counts)^2 / expected_counts

# Calculate percentage contributions

total_chi_square <- chi_square_test$statistic
percentage_contributions <- 100 * contributions / total_chi_square

print("Percentage Contributions:")
print(round(percentage_contributions, 2))


# Create heatmap to visualise percentage contributions

pheatmap(percentage_contributions,
         display_numbers = TRUE,
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         main = "Percentage Contribution to Chi-Square Statistic")
