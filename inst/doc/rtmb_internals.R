## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# code <- rtmb_code(
#   data = {
#     # Declare data names used by the model
#   },
#   setup = {
#     # Preprocess data
#   },
#   parameters = {
#     # Declare estimable parameters
#   },
#   transform = {
#     # Build linear predictors and derived quantities
#   },
#   model = {
#     # Write likelihood and prior distributions
#   },
#   generate = {
#     # Compute generated quantities after fitting
#   }
# )

## -----------------------------------------------------------------------------
# parameters = {
#   alpha <- Dim()
#   beta  <- Dim(P)
#   sigma <- Dim(lower = 0)
#   r     <- Dim(G, random = TRUE)
# }

## -----------------------------------------------------------------------------
# transform = {
#   mu <- alpha + X %*% beta
# }

## -----------------------------------------------------------------------------
# model = {
#   beta ~ normal(0, 10)
#   sigma ~ exponential(1)
#   Y ~ normal(mu, sigma)
# }

## -----------------------------------------------------------------------------
# Y ~ normal(mu, sigma)

## -----------------------------------------------------------------------------
# lp <- lp + normal_lpdf(Y, mu, sigma)

## -----------------------------------------------------------------------------
# generate = {
#   y_rep <- rnorm(length(Y), mu, sigma)
# }

## -----------------------------------------------------------------------------
# fit <- mdl$sample()

## -----------------------------------------------------------------------------
# fit <- mdl$optimize()

## -----------------------------------------------------------------------------
# fit <- mdl$variational()

## -----------------------------------------------------------------------------
# fit <- mdl$classic()

## -----------------------------------------------------------------------------
# parameters = {
#   alpha <- Dim()
#   tau   <- Dim(lower = 0)
#   r     <- Dim(G, random = TRUE)
# }

## -----------------------------------------------------------------------------
# fit <- mdl$optimize(marginal = c("mean", "delta"))

## -----------------------------------------------------------------------------
# # Avoid this pattern
# if (sigma > 1) {
#   lp <- lp + normal_lpdf(y, 0, sigma)
# } else {
#   lp <- lp + normal_lpdf(y, 0, 1)
# }

