## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
# library(BayesRTMB)
# 
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal()
# )
# 
# fit_mcmc <- mdl$sample()
# fit_map  <- mdl$optimize()
# fit_vb   <- mdl$variational()

## -----------------------------------------------------------------------------
# df <- debate
# 
# code <- rtmb_code(
#   setup = {
#     Y <- sat
#     X <- talk
# 
#     center <- function(x) x - mean(x)
#     X_c <- center(X)
#   },
#   parameters = {
#     Intercept <- Dim()
#     b <- Dim()
#     sigma <- Dim(lower = 0)
#   },
#   transform = {
#     mu <- Intercept + b * X_c
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     Intercept ~ normal(0, 10)
#     b ~ normal(0, 10)
#     sigma ~ exponential(1)
#   }
# )
# 
# mdl <- rtmb_model(
#   data = df,
#   code = code
# )

## -----------------------------------------------------------------------------
# fit_mcmc$summary()
# fit_mcmc$diagnose()
# fit_mcmc$EAP(pars = "parameters")
# fit_mcmc$MAP(pars = "parameters")

## -----------------------------------------------------------------------------
# fit$estimate(pars = "parameters")
# fit$estimate(pars = "transform")
# fit$estimate(pars = "generate")
# fit$estimate(pars = "all")

## -----------------------------------------------------------------------------
# est <- fit$estimate(pars = "parameters", drop = FALSE)

## -----------------------------------------------------------------------------
# b_eap <- fit$EAP("b")
# b_eap_list <- fit$EAP("b", drop = FALSE)

## -----------------------------------------------------------------------------
# fit$EAP(pars = "parameters")
# fit$MAP(pars = "parameters")
# fit$MAP(pars = "parameters", type = "joint")

## -----------------------------------------------------------------------------
# fit$estimate(pars = c("b", "sigma"))
# fit$estimate(component = "transform")
# fit$estimate(component = "generate")
# fit$estimate(pars = "-theta")

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample(
#   chains = 4,
#   warmup = 1000,
#   sampling = 1000,
#   metric = "auto",
#   nuts_variant = "multinomial"
# )

## -----------------------------------------------------------------------------
# fit_mcmc$draws()
# fit_mcmc$draws(pars = "b")
# fit_mcmc$draws(include_random = TRUE)
# fit_mcmc$draws(include_transform = FALSE, include_generate = FALSE)

## -----------------------------------------------------------------------------
# fit_mcmc$summary()
# fit_mcmc$diagnose()
# fit_mcmc$rhat_summary()

## -----------------------------------------------------------------------------
# fit_mcmc$transformed_draws()
# fit_mcmc$generated_quantities()

## -----------------------------------------------------------------------------
# fit_full <- mdl_full$sample()
# fit_null <- mdl_null$sample()
# 
# fit_full$bayes_factor(fit_null)

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   WAIC = TRUE
# )
# 
# fit <- mdl$sample()
# fit$WAIC()

## -----------------------------------------------------------------------------
# generate = {
#   log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   report(log_lik)
# }

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 10)

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 20)
# fit_map$diagnose()

## -----------------------------------------------------------------------------
# init <- fit_map$estimate(pars = "parameters", drop = FALSE)
# fit_mcmc <- mdl$sample(init = init)

## -----------------------------------------------------------------------------
# est <- fit_map$estimate(pars = "parameters", drop = FALSE)
# mdl_fixed <- mdl$fixed_model(fixed = list(b = est$b))

## -----------------------------------------------------------------------------
# fit_map$profile(pars = "b")

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(iter = 3000)

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(num_estimate = 10)
# fit_vb$plot_elbo()

## -----------------------------------------------------------------------------
# fit_vb$EAP()
# fit_vb$EAP(chains = 1)
# fit_vb$EAP(best_chains = 2)

## -----------------------------------------------------------------------------
# fit_vb$plot_elbo()
# fit_vb$diagnose()

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(sat ~ talk * perf, data = debate)
# fit_classic <- mdl$classic()
# fit_classic$summary()

## -----------------------------------------------------------------------------
# fit1 <- rtmb_lm(sat ~ talk, data = debate)$classic()
# fit2 <- rtmb_lm(sat ~ talk * perf, data = debate)$classic()
# 
# anova(fit1, fit2)

## -----------------------------------------------------------------------------
# AIC(fit_classic)
# BIC(fit_classic)
# logLik(fit_classic)

## -----------------------------------------------------------------------------
# fit_robust <- fit_classic$robust_se(type = "HC3")
# fit_cluster <- fit_classic$robust_se(cluster = debate$group)

## -----------------------------------------------------------------------------
# fit_classic$robust_se(type = "HC3", update = TRUE)

## -----------------------------------------------------------------------------
# fit_classic$lsmeans(~ talk)
# fit_classic$lsmeans(~ talk | perf)

## -----------------------------------------------------------------------------
# bf <- fit_full$bayes_factor(fit_null)
# bf

## -----------------------------------------------------------------------------
# mdl <- rtmb_glm(y ~ x, data = dat, family = "bernoulli", WAIC = TRUE)
# fit <- mdl$sample()
# fit$WAIC()

## -----------------------------------------------------------------------------
# AIC(fit_classic)
# BIC(fit_classic)

## -----------------------------------------------------------------------------
# fit_vb$plot_elbo()
# fit_vb$diagnose()

## -----------------------------------------------------------------------------
# mdl_fixed <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   fixed = list(b = c(0, 0))
# )
# 
# mdl_fixed2 <- mdl$fixed_model(
#   fixed = list(sigma = 1)
# )

## -----------------------------------------------------------------------------
# fit$summary()
# fit$estimate(pars = "parameters", drop = FALSE)
# fit_mcmc$draws(pars = "parameters")
# mdl$print_code()

## -----------------------------------------------------------------------------
# parameters = {
#   mean_common <- Dim()
# }
# transform = {
#   mean0 <- mean_common
#   mean1 <- mean_common
# }

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 10)
# est <- fit_map$estimate(pars = "parameters", drop = FALSE)
# 
# mdl_fixed <- mdl$fixed_model(
#   fixed = list(b = est$b)
# )

## -----------------------------------------------------------------------------
# eap <- fit_mcmc$EAP(pars = "parameters", drop = FALSE)
# mdl_fixed <- mdl$fixed_model(fixed = list(b = eap$b))

## -----------------------------------------------------------------------------
# code <- rtmb_code(
#   setup = {
#     N <- length(Y)
#   },
#   parameters = {
#     mu <- Dim()
#     sigma <- Dim(lower = 0)
#   },
#   transform = {
#     z <- (Y - mu) / sigma
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#   },
#   generate = {
#     log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#     report(log_lik)
#   }
# )

## -----------------------------------------------------------------------------
# setup = {
#   N <- nrow(df)
#   X <- model.matrix(~ x1 + x2, df)
#   K <- ncol(X)
# }

## -----------------------------------------------------------------------------
# transform = {
#   eta <- Intercept + X %*% b
#   p <- inv_logit(eta)
#   report(p)
# }

## -----------------------------------------------------------------------------
# generate = {
#   y_rep_mean <- mu
#   log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   report(y_rep_mean, log_lik)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   alpha <- Dim()
#   b <- Dim(K)
#   L <- Dim(c(P, P), type = "CF_corr")
#   sigma <- Dim(lower = 0)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   u <- Dim(J, random = TRUE)
#   tau <- Dim(lower = 0)
# }

## -----------------------------------------------------------------------------
# Y ~ normal(mu, sigma)
# lp <- lp + normal_lpdf(Y, mu, sigma)

## -----------------------------------------------------------------------------
# y ~ bernoulli_logit(eta)
# y ~ poisson(lambda)
# y ~ ordered_logistic(eta, cutpoints)

## -----------------------------------------------------------------------------
# Y ~ multi_normal_CF(mean = mu, sd = sigma, CF_Omega = L_corr)
# L_corr ~ lkj_CF_corr(1)

## -----------------------------------------------------------------------------
# log_dens_mat <- matrix(mu[1] * 0, N, K)
# for (k in 1:K) {
#   log_dens_mat[, k] <- normal_lpdf(Y, mu[k], sigma[k], sum = FALSE)
# }
# lp <- lp + sum(log_sum_exp(t(t(log_dens_mat) + log(theta))))

## -----------------------------------------------------------------------------
# log_pi <- log_softmax(c(0, eta))
# pi <- softmax(c(0, eta))

## -----------------------------------------------------------------------------
# setup = {
#   X <- model.matrix(~ x1 + x2, df)
# }

## -----------------------------------------------------------------------------
# mu <- Intercept + X %*% b
# Y ~ normal(mu, sigma)

## -----------------------------------------------------------------------------
# # Good: branch decided by data/setup
# if (family == "gaussian") {
#   Y ~ normal(mu, sigma)
# }

## -----------------------------------------------------------------------------
# log_lik <- rtmb_vector(0, N)
# for (i in 1:N) {
#   log_lik[i] <- normal_lpdf(Y[i], mu[i], sigma)
# }

## -----------------------------------------------------------------------------
# A <- rtmb_array(0, dim = c(N, K))
# for (k in 1:K) {
#   A[, k] <- normal_lpdf(Y, mu[k], sigma[k], sum = FALSE)
# }

## -----------------------------------------------------------------------------
# fit <- mdl$sample()
# fit$EAP(pars = "parameters")
# fit$MAP(pars = "parameters")

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 20)
# init <- fit_map$estimate(pars = "parameters", drop = FALSE)
# fit_mcmc <- mdl$sample(init = init)

## -----------------------------------------------------------------------------
# fit$estimate(pars = "generate")
# fit_mcmc$generated_quantities()

## -----------------------------------------------------------------------------
# fit_mcmc$draws(include_random = TRUE)

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(num_estimate = 5)
# fit_vb$plot_elbo()
# fit_vb$diagnose()

## -----------------------------------------------------------------------------
# fit1 <- rtmb_lm(y ~ x1, data = dat)$classic()
# fit2 <- rtmb_lm(y ~ x1 + x2, data = dat)$classic()
# 
# anova(fit1, fit2)
# AIC(fit1, fit2)
# BIC(fit1, fit2)

## -----------------------------------------------------------------------------
# mdl_full <- rtmb_lm(y ~ x1 + x2, data = dat, prior = prior_normal())
# mdl_null <- rtmb_lm(y ~ x1, data = dat, prior = prior_normal())
# 
# fit_full <- mdl_full$sample()
# fit_null <- mdl_null$sample()
# 
# fit_full$bayes_factor(fit_null)

## -----------------------------------------------------------------------------
# mdl_fixed <- mdl$fixed_model(
#   fixed = list(b = c(0, 0))
# )

## -----------------------------------------------------------------------------
# fit <- readRDS("old-fit.rds")
# fit <- upgrade_fit(fit)

## -----------------------------------------------------------------------------
# fit <- upgrade_fit(fit, model = TRUE)

## -----------------------------------------------------------------------------
# fit <- mdl$sample(
#   chains = 4,
#   parallel = TRUE,
#   sampling = 1000,
#   warmup = 1000
# )

