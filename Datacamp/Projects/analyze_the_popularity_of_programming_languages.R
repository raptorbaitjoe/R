# What was the percentage of R questions for 2020? Save the result in a data frame, r_2020, containing five columns: year, 
# tag, num_questions, year_total, and percentage.
# Identify the five programming language tags with the highest total number of questions asked between 2015 and 2020 (inclusive). 
# Save the tag names as highest_tags. This variable can be a character vector, tibble, or data frame (if the latter, please use 
# the column name tag).

# Column	Description
# year	The year the question was asked (2008-2020)
# tag	A word or phrase that describes the topic of the question, such as the programming language
# num_questions	The number of questions with a certain tag in that year
# year_total	The total number of questions asked in that year

# Load necessary packages
library(readr)
library(dplyr)
library(ggplot2)

# Load the dataset
data <- read_csv("stack_overflow_data.csv")

# Find values for 2020
data_2020 <- data %>%
			filter(year == "2020")

# View the dataset
head(data_2020)

# Find the unique values
unique(data_2020$tag)

# Find the r questions
r_2020 <- data_2020 %>%
				filter(tag == "r")

# View the dataset
head(r_2020)

# create r_2020
r_2020 %>%
	mutate(percentage = (num_questions/year_total)*100)

# Filter to 2015-2020
data1520 <- data %>%
             filter(year %in% c("2015","2016","2017","2018","2019","2020")) %>%
            select(tag, num_questions)

# View the dataset
head(data1520)

# Calculate most popular tags
data1520b <- data1520 %>%
  group_by(tag) %>%
  summarise(total_questions = sum(num_questions, na.rm = TRUE)) %>%
  arrange(desc(total_questions))

# View the dataset
head(data1520b)

# Find the highest tags
highest_tags <- data1520b %>%
		select(tag) %>%
		head(n = 5)	

# View the dataset
head(highest_tags)
