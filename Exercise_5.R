# Task

Prepare a R Markdown-based *.html containing documented R code on a problem where you learn via Bayes
'Rule the mean rate of events from a set of data containing counts of these events. 
Plot the prior, likelihood, and posterior. We can use Dave?s telephone calls as an example,
but we are free to generate our own example of an application to natural hazards. 
Please upload your commented script to the GitHub repository.


# Example

For this exercise we choose an for earthquakes in chile. At first, we define a vector **earth**, which give us over ten 
indepentend years a number of earthquakes over the course of one year. 
We define also the prior. For this example, we have two priors. **prior_lambda** is a number between 1 to 200 in average.
This range include all numbers, because they are between 10 to 190 earthquakes per year.
**prior_prob** is the probability that a number have.
All numbers of earthquakes have the same probability, which gives us 200 possibilities with a probability of {1}{200}

# Define a vector with number of earthquakes per year

earth <- c(20, 188, 10, 75, 102, 66, 93, 12, 161, 124)

# Define the prior, the probability and lambda

prior_lambda <- 1:200
prior_prb <- rep(1 / length(prior_lambda), length(prior_lambda))

The plot shows the probabilitiy of events we have no knowledge about. 

plot(prior_prb, type = "h", lwd = 4.0, col = "blue", 
     xlab = "Number of earthquakes", ylab = "probability")

# Now we define the likelihood for an event.
At first, we have to define our **likeli**, which have to the length of our vector **prior_lambda*, in this example 200.
We like to calculate the likelihood for each number which have the amount of earthquakes per year.

likeli <- dpois(earth, prior_lambda[1:2])
plot(likeli, type = "h", lwd = 2, col = "blue")
likeli <- rep(NA, length(prior_lambda))
for (i in seq_along(prior_lambda)) {
likeli[i] <- prod(dpois(earth, i))
}

# After those calculations we can plot the likelihood agains the amount of earthquakes.

likeli <- dpois(earth, prior_lambda[1:2])
plot(likeli, type = "h", lwd = 2, col = "blue",
      xlab = "Amount of earthquakes ", ylab = "Likelihood")

# Now we like to calcute the posterior for. This we do with the following code. 

bayesnum <- likeli * prior_prb
bayesnum <- bayesnum / sum(bayesnum)
plot(bayesnum, type = "h", lwd = 2, xlab = "Index", ylab = "bayersnum", col = "blue")

