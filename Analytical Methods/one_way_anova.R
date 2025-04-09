### One-Way Analysis of Variance (ANOVA)

# Requirements:
# Independence of Observations: Each observation should be independent of the others.Typically ensured through proper experimental design (e.g. no repeated measurements or nested data).
# Normality of Residuals: The residuals should be approximately normally distributed. Confirmed with Shapiro-Wilk tes or Q-Q plot.
# Homogeneity of variances (a.k.a. homoscedasticity): All groups should have similar variances.
# Dependent Varibale must be continuous.
# Independent variable must be categorical.
# If normality or equal variances are seriously violated, use a non-parametric alternative like the Kruskal-Wallis test.


####                            Setup and Libraries                             ####

# Sample data
data <- data.frame(
  group = factor(c(rep("A", 5), rep("B", 5), rep("C", 5))),
  value = c(7, 9, 6, 8, 7, 12, 11, 13, 12, 14, 5, 6, 4, 5, 6))

####                             Perform One-Way ANOVA                          ####


anova_result <- stats::aov(value ~ group, data = data)                          # Run the One-Way ANOVA

ggplot(data, aes(x = group, y = value)) +                                       # Box plot of value by group
  geom_boxplot() +
  labs(x = "group",
       y = "value") +
  theme_minimal()

summary(anova_result)                                                           # View One-Way ANOVA summary

## One-Way ANOVA Output

# Df (Degrees of Freedom): group = k-1 (number of groups - 1)   residuals = (total observations - group DF)
# Sum Sq (Sum of Squares): Measures variability
# Mean Sq (Mean Square): Average variability per degree of freedom
# F vlaue: Ratio of the variance between groups to the variance within groups. A higher F value suggests a more statistically significant difference between groups.
# Pr (>F) (p-value): The probability of observing this F-value (or more extreme) under the null hypothesis (that all group means are equal). p < 0.05 means at least one group mean is significantly different from the others.


####                               Post-hoc analysis                            ####

stats::TukeyHSD(anova_result)                                                   # Runs the Tukey's Honestly Significant Difference test
plot(TukeyHSD(anova_result))                                                    # Plots the Tukey's Honestly Significant Difference test

# Comparing one group mean vs another
# diff (Difference): Difference in group means
# lwr & upr (95% Confidence interval): If either are zero, it means that there's no statistically significant difference between the two group means.
# p adj (Adjusted p-value): p < 0.05 means group means are significantly different


####                               One-Way ANOVA Checks                         ####  

# Normality check of residuals
stats::shapiro.test(residuals(anova_result))                                    # p>0.05 for normality (enough for a One-Way ANOVA). 
                                                                                # For large samples, the normality assumption becomes less critical due to the Central Limit Theorem.

# Q-Q plot of residuals
stats::qqnorm(residuals(anova_result))                                          # If the points roughly follow the line, the normality assumption is likely met, and ANOVA results should be reliable.
stats::qqline(residuals(anova_result), col = "red")                             # If the points deviate significantly from the line, consider using a non-parametric alternative (like the Kruskal-Wallis test) or transforming the data to make it more normal (log, square root, etc.).

# Check homogeneity of variances using Levene's Test
car::leveneTest(value ~ group, data = data)                                     # p>0.05 for equal group variances (suitable for a One-Way ANOVA). 
