# Exercise 1 from last session:

# We simulate a time series of 1,000 years. For each year, we
# determine independently with a random number generator whether
# a 1,000-year tornado was observed or not:
  
# Generate 1,000 years of random uniform numbers
  
y <- runif(1000)

# Count only those numbers >=0.999 (or <0.001)
(obs <- sum(y >= 0.999))