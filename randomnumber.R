##This script is a random number generator. It will randomly select numbers from a certain range. The example below selects ten numbers from the range of numbers from 1 - 100.

# Specify the range of numbers to select from
range <- 1:100

# Randomly select 10 numbers from the range without replacement
random_numbers <- sample(range, size = 10, replace = FALSE)

# Print the random numbers
print(random_numbers)
