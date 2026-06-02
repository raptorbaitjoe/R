# abs() - calculates absolute value of an array of numerical values
# round() - rounds the input
# sum() - calculates sum of input array
# mean() - calculates the mean of an array of numerical values
# seq() - generates a sequence of numbers i.e. seq(1, 10, by = 3) or seq(8, 2, by = -2)
# rep() - ability to replicate it's input 
# sort() - generic function for sorting an input vector - defualt ascending (change w/ decreasing = TRUE)
# str() - inspect structure of a list
# append() - add elements to vector or list
# rev() - reverse a list

## Mathematical Utilities

# The errors vector has already been defined for you
errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

# Sum of absolute rounded values of errors
sum(abs(round(errors)))

# Don't edit these two lines
vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)

# Fix the error
mean(c(abs(vec1), abs(vec2)))

## Data Utilities
# seq(): Generate sequences, by specifying the from, to, and by arguments.
# rep(): Replicate elements of vectors and lists.
# sort(): Sort a vector in ascending order. Works on numerics, but also on character strings and logicals.
# rev(): Reverse the elements in a data structures for which reversal is defined.
# str(): Display the structure of any R object.
# append(): Merge vectors or lists.
# is.*(): Check for the class of an R object.
# as.*(): Convert an R object from one class to another.
# unlist(): Flatten (possibly embedded) lists to produce a vector.

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- unlist(linkedin)
fb_vec <- unlist(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(social_vec)

social_vec

# Find the error (2)

# Fix me
rep(seq(1, 7, by = 2), times = 7)
