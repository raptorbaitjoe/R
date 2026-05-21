### lapply
# applied over list or vector
# function can return R objects of different classes
# list necessary to store heterogeneous content

# Example:

nyc <- list(pop = 8405837,
            boroughs = c("Manhatten", "Bronx", "Brooklyn", "Queens", "Staten Island"),
            capital = FALSE)

for(infor in nyc){
  print(class(info))
  }

lapply(nyc, class)

cities <- c("New York", "Paris", "London", "Tokyo", "Rio de Janeiro", "Cape Town")

num_chars <- c()
for(i in 1:length(cities)) {
  num_chars[i] <- nchar(cities[i])
  }

lapply(cities, nchar)

unlist(lapply(cities, nchar)) # turns list into a vector

oil_prices <- list(2.37, 2.49, 2.18, 2.22, 2.47, 2.32)

triple <- function(x) {
  3 * x
  }

result <- lapply(oil_prices, triple)

str(result)

multiply <- function(x, factor) {
  x * factor
  }

times3 <- lapply(oil_prices, multiply, factor = 3)
unlist (times3)

## Using lapply with a built-in R function

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

## Use lapply with your own function

# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x) {
  x[2]
}

# Apply select_second() over split_low: years
names <- lapply(split_low, select_second)

## lapply and anonymous functions

# Named function
triple <- function(x) { 3 * x }

# Anonymous function with same implementation
function(x) { 3 * x }

# Use anonymous function inside lapply()
lapply(list(1,2,3), function(x) { 3 * x })

# split_low has been created for you
split_low

# Transform: use anonymous function inside lapply
select_first <- function(x) {
  x[1]
}
names <- lapply(split_low, function(x) {x[1]})

# Transform: use anonymous function inside lapply
select_second <- function(x) {
  x[2]
}
years <- lapply(split_low, function(x) {x[2]})

## Use lapply with additional arguments

multiply <- function(x, factor) {
  x * factor
}
lapply(list(1,2,3), multiply, factor = 3)

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)


### sapply

# Short for "simplify apply"
# Results in named vector
# Same effect as lapply and unlist

## How to use sapply

# temp has already been defined in the workspace

# Use lapply() to find each day's minimum temperature
lapply(temp, min)

# Use sapply() to find each day's minimum temperature
sapply(temp, min)

# Use lapply() to find each day's maximum temperature
lapply(temp, max)

# Use sapply() to find each day's maximum temperature
sapply(temp, max)

## sapply with your own function

# temp is already defined in the workspace

# Finish function definition of extremes_avg
extremes_avg <- function(x) {
  ( min(x) + max(x) ) / 2
}

# Apply extremes_avg() over temp using sapply()
sapply(temp, extremes_avg)

# Apply extremes_avg() over temp using lapply()
lapply(temp, extremes_avg)

## sapply with function returning vector

# temp is already available in the workspace

# Create a function that returns min and max of a vector: extremes
extremes <- function(x) {
  c(min = min(x), max = max(x))
}

# Apply extremes() over temp with sapply()
sapply(temp, extremes)

# Apply extremes() over temp with lapply()
lapply(temp, extremes)

## sapply can't simplify, now what?

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- sapply(temp, below_zero)

# Are freezing_s and freezing_l identical?
identical(freezing_s, freezing_l)

### vapply
