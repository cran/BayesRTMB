## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## ----eval=FALSE---------------------------------------------------------------
# library(BayesRTMB)
# set.seed(123)
# 
# # Data generation (2 groups)
# y1 <- rnorm(30, mean = 0, sd = 1)
# y2 <- rnorm(30, mean = 1, sd = 1)
# 
# # Method passing vectors directly
# mdl_ttest <- rtmb_ttest(y1, y2)
# 
# # Method using formula format (when you have a dataframe)
# # df <- data.frame(Y = c(y1, y2), group = rep(c("A", "B"), each = 30))
# # mdl_ttest <- rtmb_ttest(Y ~ group, data = df)
# 
# # MCMC estimation
# fit_ttest <- mdl_ttest$sample()
# fit_ttest$summary()

## ----eval=FALSE---------------------------------------------------------------
# # Display the internally generated RTMB code
# mdl_ttest$print_code()

## ----eval=FALSE---------------------------------------------------------------
# # Compare with the model where effect size delta = 0
# bf <- fit_ttest$bayes_factor(fixed = list(delta = 0))
# bf

## ----eval=FALSE---------------------------------------------------------------
# data(debate)
# 
# # Model predicting sat using talk and skill
# mdl_lm <- rtmb_lm(sat ~ talk + skill, data = debate)
# 
# # Quick check via MAP estimation
# fit_lm <- mdl_lm$optimize()
# fit_lm$summary()

## ----eval=FALSE---------------------------------------------------------------
# # Create a model using weakly informative priors (assuming sat ranges from 1 to 5)
# mdl_lm_weak <- rtmb_lm(sat ~ talk + skill,
#   data = debate,
#   use_weak_info = TRUE,
#   y_range = c(1, 5)
# )
# mdl_lm_weak$print_code()

## ----eval=FALSE---------------------------------------------------------------
# # Logistic regression (family = "bernoulli")
# mdl_glm <- rtmb_glm(cond ~ sat + skill,
#   data = debate,
#   family = "bernoulli"
# )
# 
# fit_glm <- mdl_glm$sample()
# fit_glm$summary()

## ----eval=FALSE---------------------------------------------------------------
# # Random intercept model
# mdl_glmer <- rtmb_glmer(sat ~ talk + (1 | group),
#   data = debate
# )
# 
# # When including random effects, optimize() with Laplace approximation is fast
# opt_glmer <- mdl_glmer$optimize(laplace = TRUE)
# opt_glmer$summary()

## ----eval=FALSE---------------------------------------------------------------
# mdl_glmer <-
#   rtmb_glmer(
#     sat ~ talk + perf + skill + cond + (1 | group),
#     data = debate,
#     penalty = "ssp",
#     y_range = c(1, 5)
#   )
# 
# mcmc_glmer <- mdl_glmer$sample(parallel = TRUE)
# mcmc_glmer

## ----eval=FALSE---------------------------------------------------------------
# mcmc_glmer$draws("b[cond]") |> plot_dens()

## ----eval=FALSE---------------------------------------------------------------
# # Linear regression with interaction between talk and cond
# mdl_int <- rtmb_lm(sat ~ talk * perf, data = debate)
# fit_int <- mdl_int$sample()
# 
# # Visualize the interaction effect
# # For continuous moderators, it automatically shows Mean ± 1SD
# ce <- conditional_effects(fit_int, effect = "talk:perf")
# plot(ce)

## ----eval=FALSE---------------------------------------------------------------
# # Calculate simple slopes of 'talk' for each level of 'cond'
# se <- simple_effects(fit_int, effect = "talk:perf")
# print(se)

## ----eval=FALSE---------------------------------------------------------------
# data(BigFive)
# 
# # Correlation between BF1 and BF6
# mdl_corr2 <- rtmb_corr(BigFive[, c("BF1", "BF6")])
# mcmc_corr2 <- mdl_corr2$sample()
# mcmc_corr2$summary()

## ----eval=FALSE---------------------------------------------------------------
# # Compare against the zero-correlation model (fixed = list(corr = 0))
# bf_corr <- mcmc_corr2$bayes_factor(fixed = list(corr = 0))
# bf_corr

## ----eval=FALSE---------------------------------------------------------------
# # Estimate the correlation matrix of 5 variables
# mdl_corr_mat <- rtmb_corr(BigFive[, 1:5])
# opt_corr_mat <- mdl_corr_mat$optimize()
# opt_corr_mat$summary()

## ----eval=FALSE---------------------------------------------------------------
# # 3-factor model, specifying Promax rotation
# mdl_fa <- rtmb_fa(BigFive, nfactors = 5, rotate = "promax")
# 
# opt_fa <- mdl_fa$optimize(se_sampling = TRUE)
# 
# # Check the factor loadings (L), etc.
# opt_fa$summary()

## ----eval=FALSE---------------------------------------------------------------
# opt_fa$generate$L_promax |> sort_loadings()

## ----eval=FALSE---------------------------------------------------------------
# mdl_fa <- rtmb_fa(BigFive, nfactors = 5, rotate = "promax", score = TRUE)
# 
# opt_fa <- mdl_fa$optimize()
# 
# opt_fa$generate$score |> head()

## ----eval=FALSE---------------------------------------------------------------
# mdl_fa <- rtmb_fa(BigFive, nfactors = 5, rotate = "ssp")
# 
# vb_fa <- mdl_fa$variational(iter = 5000, parallel = TRUE)
# vb_fa

## ----eval=FALSE---------------------------------------------------------------
# vb_fa$MAP("L") |> sort_loadings()

## ----eval=FALSE---------------------------------------------------------------
# data(BigFive)
# # Select items 2, 7, 12, 17 (Agreeableness)
# dat_irt <- BigFive[, c("BF2", "BF7", "BF12", "BF17")]
# 
# # Fit a 2PL Graded Response Model (Ordered Logistic)
# mdl_irt <- rtmb_irt(dat_irt, model = "2PL", type = "ordered")
# 
# # Fast estimation using MAP with Laplace approximation for latent traits
# opt_irt <- mdl_irt$optimize(se_sampling = TRUE)
# opt_irt

## ----eval=FALSE---------------------------------------------------------------
# # Calculate item curves
# ic <- item_curve(opt_irt)
# 
# # Plot curves (shows category probabilities for each item)
# plot(ic)

## ----eval=FALSE---------------------------------------------------------------
# # Item Information Function: shows which items provide the most information
# ii <- item_info(opt_irt)
# plot(ii)
# 
# # Test Information Function: total information of the test/scale
# ti <- test_info(opt_irt)
# plot(ti)

