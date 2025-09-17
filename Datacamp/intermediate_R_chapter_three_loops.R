# na.rm = FALSE means that by default, missing values will not be removed
# Setting as TRUE will remove missing values
# R will take default vlaue if not specificed otherwise

# args() - a function to learn about the arguments of a function without having to read through the entire documentation.

# Consult the documentation on the mean() function
?mean
# Inspect the arguments of the mean() function
args(mean)

# Create a function pow_two()
pow_two <- function(arg1) {
    y <- arg1*arg1
    return(y)
}

# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(arg1, arg2) {
    y <- abs(arg1) + abs(arg2)
    return(y)
}

# Use the function
sum_abs(-2, 3)

# Define the function hello()
hello <- function() {
    print("Hi there!")
    TRUE
}
