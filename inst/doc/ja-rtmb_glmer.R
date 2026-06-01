## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## -----------------------------------------------------------------------------
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   family = "gaussian"
# )

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample()
# fit_map  <- mdl$optimize(laplace = TRUE)
# fit_vb   <- mdl$variational()
# fit_cl   <- mdl$classic()

## -----------------------------------------------------------------------------
# mdl$print_code()

## -----------------------------------------------------------------------------
# library(BayesRTMB)
# 
# dat <- data.frame(
#   y = rnorm(120),
#   x = rnorm(120),
#   group = factor(rep(1:20, each = 6))
# )
# 
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   family = "gaussian",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# fit <- mdl$sample(
#   sampling = 1000,
#   warmup = 1000,
#   chains = 4
# )
# 
# fit$summary()

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(laplace = TRUE)
# fit_map$summary()
# fit_map$random_effects

## -----------------------------------------------------------------------------
# mdl_int <- rtmb_glmer(
#   y ~ x1 * x2 + (1 | group),
#   data = dat,
#   family = "gaussian",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_centered <- rtmb_glmer(
#   y ~ x + (x | group),
#   data = dat,
#   gmc = "x"
# )

## -----------------------------------------------------------------------------
# mdl_cwc <- rtmb_glmer(
#   y ~ x + (x | group),
#   data = dat,
#   cwc = list(cluster = "group", pars = "x"),
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_wide <- rtmb_glmer(
#   cbind(y_t1, y_t2, y_t3) ~ cond + (1 | id),
#   data = dat_wide,
#   family = "gaussian",
#   within = list(time = c("t1", "t2", "t3")),
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_factor <- rtmb_glmer(
#   y ~ cond + time + (1 | id),
#   data = dat,
#   family = "gaussian",
#   factors = c("cond", "time"),
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# fit_int <- mdl_int$sample()
# 
# ce <- conditional_effects(fit_int, effect = "x1:x2")
# plot(ce)
# summary(ce)

## -----------------------------------------------------------------------------
# simple_effects(fit_int, effect = "x1:x2")

## -----------------------------------------------------------------------------
# plot_forest(fit_int, pars = "b")
# plot_dens(fit_int, pars = "b")

## -----------------------------------------------------------------------------
# mdl_bin <- rtmb_glmer(
#   y_bin ~ x + (1 | group),
#   data = dat,
#   family = "bernoulli",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_count <- rtmb_glmer(
#   count ~ x + (1 | group),
#   data = dat,
#   family = "neg_binomial",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample(
#   sampling = 1000,
#   warmup = 1000,
#   chains = 4
# )

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(laplace = TRUE)

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational()

## -----------------------------------------------------------------------------
# fit_cl <- mdl$classic()

## -----------------------------------------------------------------------------
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   prior = prior_flat()
# )

## -----------------------------------------------------------------------------
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   prior = prior_normal(
#     mu_sd = 10,
#     b_sd = 2,
#     sigma_rate = 1,
#     tau_rate = 1
#   )
# )

## -----------------------------------------------------------------------------
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   prior = prior_weak(),
#   y_range = c(1, 5)
# )

## -----------------------------------------------------------------------------
# mdl <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   y_range = c(1, 5)
# )

## -----------------------------------------------------------------------------
# mdl_rhs <- rtmb_glmer(
#   y ~ . + (1 | group),
#   data = dat,
#   prior = prior_rhs(),
#   y_range = c(1, 5)
# )
# 
# mdl_ssp <- rtmb_glmer(
#   y ~ . + (1 | group),
#   data = dat,
#   prior = prior_ssp(),
#   y_range = c(1, 5)
# )

## -----------------------------------------------------------------------------
# mdl_jzs <- rtmb_glmer(
#   y ~ x + (1 | group),
#   data = dat,
#   prior = prior_jzs()
# )

## -----------------------------------------------------------------------------
# mdl_ord <- rtmb_glmer(
#   rating ~ x + (1 | group),
#   data = dat,
#   family = "ordered",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_seq <- rtmb_glmer(
#   rating ~ x + (1 | group),
#   data = dat,
#   family = "sequential",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_sigma <- rtmb_glmer(
#   y ~ cond + (1 | id),
#   data = dat,
#   family = "gaussian",
#   sigma_by = "cond",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_ar1 <- rtmb_glmer(
#   y ~ time + cond,
#   data = dat,
#   family = "gaussian",
#   resid_corr = "ar1",
#   resid_time = "time",
#   resid_group = "id",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl$print_code()

## -----------------------------------------------------------------------------
# Y ~ normal(eta, sigma)
# r_re ~ normal(0, 1)

