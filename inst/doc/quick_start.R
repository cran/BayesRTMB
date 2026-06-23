## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ----eval=FALSE---------------------------------------------------------------
# install.packages("BayesRTMB")

## ----eval=FALSE---------------------------------------------------------------
# install.packages("pak")
# pak::pak("norimune/BayesRTMB")

## ----eval=FALSE---------------------------------------------------------------
# install.packages("remotes")
# remotes::install_github("norimune/BayesRTMB")

## ----eval=FALSE---------------------------------------------------------------
# pkgbuild::check_build_tools(debug = TRUE)

## ----eval=FALSE---------------------------------------------------------------
# library(BayesRTMB)
# 
# Trial <- 10
# Y <- 6
# 
# dat <- list(Trial = Trial, Y = Y)
# 
# code <- rtmb_code(
#   parameters = {
#     theta <- Dim(lower = 0, upper = 1)
#   },
#   model = {
#     Y ~ binomial(Trial, theta)
#     theta ~ beta(1, 1)
#   }
# )

## ----eval=FALSE---------------------------------------------------------------
# mdl <- rtmb_model(dat, code)

## ----eval=FALSE---------------------------------------------------------------
# fit_map <- mdl$optimize()
# fit_map

## ----eval=FALSE---------------------------------------------------------------
# set.seed(1)
# 
# fit_mcmc <- mdl$sample(
#   sampling = 200,
#   warmup = 200,
#   chains = 2
# )
# 
# fit_mcmc$summary()

## ----eval=FALSE---------------------------------------------------------------
# install.packages("future")

## ----eval=FALSE---------------------------------------------------------------
# fit_mcmc <- mdl$sample(
#   sampling = 1000,
#   warmup = 1000,
#   chains = 4,
#   parallel = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# theta_draws <- fit_mcmc$draws("theta")
# 
# plot_dens(theta_draws)
# plot_trace(theta_draws)
# plot_acf(theta_draws)

## ----eval=FALSE---------------------------------------------------------------
# data(debate)
# 
# mdl_lm <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   gmc = "all",
#   prior = prior_normal()
# )
# 
# fit_lm <- mdl_lm$optimize(
#   se_method = "sampling",
#   num_samples = 1000,
#   seed = 1
# )
# fit_lm

## ----eval=FALSE---------------------------------------------------------------
# fit_lm$draws(c("b[talk]", "b[perf]", "b[talk:perf]")) |>
#   plot_forest(point_estimate = "MAP")

## ----eval=FALSE---------------------------------------------------------------
# ce <- conditional_effects(fit_lm, effect = "talk:perf")
# plot(ce)

## ----eval=FALSE---------------------------------------------------------------
# simple_effects(fit_lm, effect = "talk:perf")

## ----eval=FALSE---------------------------------------------------------------
# mdl_t <- rtmb_ttest(
#   sat ~ cond,
#   data = debate,
#   prior = prior_flat()
# )
# 
# fit_t_classic <- mdl_t$classic()
# fit_t_classic

## ----eval=FALSE---------------------------------------------------------------
# mdl_t_jzs <- rtmb_ttest(
#   sat ~ cond,
#   data = debate,
#   prior = prior_jzs()
# )
# 
# set.seed(2)
# 
# fit_t_jzs <- mdl_t_jzs$sample()
# 
# bf <- fit_t_jzs$bayes_factor(fixed = list(delta = 0))
# bf

