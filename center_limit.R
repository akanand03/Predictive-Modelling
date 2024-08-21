# Set parameters
set.seed(123)  # For reproducibility
n <- 1000  # Sample size for each iteration
k <- 1000  # Number of iterations (simulations)
mean_population <- 5  # Mean of the population
sd_population <- 2  # Standard deviation of the population

# Initialize an empty vector to store sample means
sample_means <- numeric(k)

# Simulate k times
for (i in 1:k) {
  # Draw n random samples from an exponential distribution
  sample <- rexp(n, rate = 1/mean_population)  # Exponential distribution
  sample_means[i] <- mean(sample)  # Store the mean of each sample
}

# Plot histogram of sample means
hist(sample_means, probability = TRUE, col = "lightblue", main = "Central Limit Theorem",
     xlab = "Sample Means", border = "black")

# Add the theoretical normal distribution curve
curve(dnorm(x, mean = mean(sample_means), sd = sd(sample_means)),
      col = "red", lwd = 2, add = TRUE)

# Add labels
abline(v = mean_population, col = "blue", lwd = 2, lty = 2)  # Population mean
legend("topright", legend = c("Normal Distribution", "Population Mean"),
       col = c("red", "blue"), lwd = 2, lty = c(1, 2))
