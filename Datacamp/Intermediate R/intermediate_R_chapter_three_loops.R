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

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if (print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?
interpret_all <- function(views, return_sum = TRUE) {
  count <- 0

  for (v in views) {
    count <- count + interpret(v)
  }

  if (return_sum == TRUE) {
    return(count)
  } else {
    return (NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook
interpret_all(linkedin)
interpret_all(facebook)

# CRAN - Comprehensive R Archive Network
# require() - loads packages if not installed - similar to install.packages function
