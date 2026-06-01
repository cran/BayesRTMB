## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ----eval=FALSE---------------------------------------------------------------
# fit_mcmc <- mdl$sample()
# fit_map <- mdl$optimize()
# fit_vb <- mdl$variational()
# fit_freq <- mdl$classic()

## ----eval=FALSE---------------------------------------------------------------
# data(debate)
# 
# mdl <- rtmb_lm(sat ~ talk + perf, data = debate)
# fit <- mdl$optimize()
# fit

## ----eval=FALSE---------------------------------------------------------------
# dat <- list(
#   Y = debate$sat,
#   X = data.matrix(debate[c("talk", "perf")])
# )
# 
# code <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#   },
#   parameters = {
#     alpha = Dim()
#     beta = Dim(P)
#     sigma = Dim(lower = 0)
#   },
#   transform = {
#     mu <- alpha + X %*% beta
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     alpha ~ normal(0, 10)
#     beta ~ normal(0, 10)
#     sigma ~ exponential(1)
#   }
# )
# 
# mdl <- rtmb_model(dat, code)

## ----eval=FALSE---------------------------------------------------------------
# Y ~ normal(mu, sigma)
# beta ~ normal(0, 10)
# sigma ~ exponential(1)

## ----eval=FALSE---------------------------------------------------------------
# data(debate)
# 
# mdl_lm <- rtmb_lm(
#   sat ~ talk + perf,
#   data = debate
# )

## ----eval=FALSE---------------------------------------------------------------
# fit_map <- mdl_lm$optimize()
# fit_map

## ----eval=FALSE---------------------------------------------------------------
# fit_freq <- mdl_lm$classic()
# fit_freq

## ----eval=FALSE---------------------------------------------------------------
# mdl_lm$print_code()

## ----eval=FALSE---------------------------------------------------------------
# dat <- list(
#   Y = as.numeric(debate$sat),
#   X = data.matrix(debate[c("talk", "perf", "skill")])
# )
# 
# code_reg <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#   },
#   parameters = {
#     alpha = Dim()
#     beta = Dim(P)
#     sigma = Dim(lower = 0)
#   },
#   transform = {
#     mu <- alpha + X %*% beta
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     alpha ~ normal(0, 10)
#     beta ~ normal(0, 2.5)
#     sigma ~ exponential(1)
#   },
#   generate = {
#     Y_rep <- rnorm(length(Y), mu, sigma)
#   }
# )
# 
# mdl_reg <- rtmb_model(dat, code_reg)

## ----eval=FALSE---------------------------------------------------------------
# set.seed(1)
# 
# fit_mcmc <- mdl_lm$sample()
# 
# fit_mcmc$summary()

## ----eval=FALSE---------------------------------------------------------------
# fit_map <- mdl_lm$optimize()
# fit_map$summary()

## ----eval=FALSE---------------------------------------------------------------
# fit_map <- mdl_lm$optimize(se_method = "sampling")

## ----eval=FALSE---------------------------------------------------------------
# fit_vb <- mdl_lm$variational(
#   method = "meanfield",
#   iter = 3000,
#   num_estimate = 4
# )

## ----eval=FALSE---------------------------------------------------------------
# fit_freq <- mdl_lm$classic()
# fit_freq$summary()

## ----eval=FALSE---------------------------------------------------------------
# Y <- debate$sat
# group <- as.integer(factor(debate$group))
# G <- length(unique(group))
# 
# dat_icc <- list(Y = Y, group = group, G = G)
# 
# code_icc <- rtmb_code(
#   parameters = {
#     mu = Dim()
#     sigma = Dim(lower = 0)
#     tau = Dim(lower = 0)
#     r = Dim(G, random = TRUE)
#   },
#   model = {
#     Y ~ normal(mu + r[group] * tau, sigma)
#     r ~ normal(0, 1)
#     tau ~ exponential(1)
#     sigma ~ exponential(1)
#   },
#   generate = {
#     icc <- tau^2 / (tau^2 + sigma^2)
#   }
# )
# 
# mdl_icc <- rtmb_model(dat_icc, code_icc)
# fit_icc <- mdl_icc$optimize(laplace = TRUE)

## ----eval=FALSE---------------------------------------------------------------
# mdl_hlm <- rtmb_glmer(
#   sat ~ talk + perf + (1 | group),
#   data = debate,
#   family = "gaussian"
# )
# 
# fit_hlm <- mdl_hlm$optimize()

## ----eval=FALSE---------------------------------------------------------------
# set.seed(1)
# 
# fit_mcmc$bridgesampling()

## ----eval=FALSE---------------------------------------------------------------
# bf <- fit_mcmc$bayes_factor(fixed = list("b[talk]" = 0))
# bf

## ----eval=FALSE---------------------------------------------------------------
#   generate = {
#     # Compute the pointwise log likelihood and assign it to log_lik (specify sum = FALSE)
#     log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   }

## ----eval=FALSE---------------------------------------------------------------
# mdl_lm <- rtmb_lm(sat ~ talk + perf, data = debate, WAIC = TRUE)
# fit_mcmc <- mdl_lm$sample()
# 
# # Compute WAIC
# fit_mcmc$WAIC()

