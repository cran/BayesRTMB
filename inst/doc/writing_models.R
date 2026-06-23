## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ----eval=FALSE---------------------------------------------------------------
# library(BayesRTMB)
# 
# code <- rtmb_code(
#   setup = {
#     # Data preprocessing and constant definitions
#   },
#   parameters = {
#     # Declaration of parameters to be estimated
#   },
#   transform = {
#     # Calculation of derived variables using parameters and data
#   },
#   model = {
#     # Definition of priors and likelihoods
#   },
#   generate = {
#     # Calculation of posterior predictions and generated quantities
#   }
# )

## ----eval=FALSE---------------------------------------------------------------
# parameters = {
#   # Scalar parameter (with lower bound of 0)
#   sigma = Dim(lower = 0)
# 
#   # Vector parameter (length N)
#   mu = Dim(N)
# 
#   # Matrix parameter (N rows, M columns)
#   X = Dim(c(N, M))
# 
#   # Array parameter (I x J x K)
#   A = Dim(c(I, J, K))
# }

## ----eval=FALSE---------------------------------------------------------------
# model = {
#   # Priors
#   mu ~ normal(0, 10)
#   sigma ~ exponential(1)
# 
#   # Likelihood
#   Y ~ normal(mu, sigma)
# }

## ----eval=FALSE---------------------------------------------------------------
# model = {
#   lp <- lp + normal_lpdf(mu, 0, 10)
#   lp <- lp + exponential_lpdf(sigma, 1)
#   lp <- lp + normal_lpdf(Y, mu, sigma)
# }

## ----eval=FALSE---------------------------------------------------------------
# setup = {
#   N <- length(Y)  # Get the sample size of the observed data
#   P <- ncol(X)    # Get the number of columns in the design matrix (number of predictors)
# }

## ----eval=FALSE---------------------------------------------------------------
# model = {
#   eta <- rtmb_vector(0, N)
#   for (i in seq_len(N)) {
#     eta[i] <- alpha + X[i, ] %*% beta
#   }
#   Y ~ normal(eta, sigma)
# }

## ----eval=FALSE---------------------------------------------------------------
# model = {
#   logit_x <- rtmb_array(0, dim = c(N_time, C, D))
#   for (t in seq_len(N_time)) {
#     for (c in seq_len(C)) {
#       for (d in seq_len(D)) {
#         logit_x[t, c, d] <- alpha[d] + beta[d] * X[t, c]
#       }
#     }
#   }
# }

## ----eval=FALSE---------------------------------------------------------------
# fit2 <- upgrade_fit(fit)

