## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample()
# fit_map  <- mdl$optimize()
# fit_vb   <- mdl$variational()
# fit_cl   <- mdl$classic()

## -----------------------------------------------------------------------------
# library(BayesRTMB)
# data(debate)
# 
# mdl <- rtmb_glmer(
#   sat ~ talk + perf + (1 | group),
#   data = debate,
#   family = "gaussian",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize()
# fit_map

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample(
#   sampling = 1000,
#   warmup = 1000,
#   chains = 4
# )
# 
# fit_mcmc$summary()

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(laplace = TRUE)

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(
#   method = "meanfield",
#   iter = 5000
# )

## -----------------------------------------------------------------------------
# mdl_flat <- rtmb_glmer(
#   sat ~ talk + perf + (1 | group),
#   data = debate,
#   family = "gaussian",
#   prior = prior_flat()
# )
# 
# fit_cl <- mdl_flat$classic()

## -----------------------------------------------------------------------------
# rtmb_glmer(y ~ x + (1 | id), data = dat, family = "gaussian")

## -----------------------------------------------------------------------------
# rtmb_glmer(y ~ x + (x | id), data = dat, family = "gaussian")

## -----------------------------------------------------------------------------
# rtmb_glmer(y ~ x + (1 | subject) + (1 | item),
#   data = dat,
#   family = "bernoulli"
# )

## -----------------------------------------------------------------------------
# mdl_int <- rtmb_glmer(
#   sat ~ talk * perf + (1 | group),
#   data = debate,
#   family = "gaussian",
#   prior = prior_normal()
# )
# 
# fit_int <- mdl_int$sample()
# 
# ce <- conditional_effects(fit_int, effect = "talk:perf")
# plot(ce)

## -----------------------------------------------------------------------------
# simple_effects(fit_int, effect = "talk:perf")

## -----------------------------------------------------------------------------
# mdl_bin <- rtmb_glmer(
#   y ~ x + (1 | id),
#   data = dat,
#   family = "bernoulli",
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
# mdl_fac <- rtmb_glmer(
#   y ~ cond * time + (1 | id),
#   data = dat,
#   family = "gaussian",
#   factors = c("cond", "time"),
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_cwc <- rtmb_glmer(
#   y ~ x + x_cwc + (1 | group),
#   data = dat,
#   family = "gaussian",
#   cwc = list(cluster = "group", pars = "x"),
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_flat <- rtmb_glmer(
#   y ~ x + (1 | id),
#   data = dat,
#   family = "gaussian",
#   prior = prior_flat()
# )

## -----------------------------------------------------------------------------
# mdl_norm <- rtmb_glmer(
#   y ~ x + (1 | id),
#   data = dat,
#   family = "gaussian",
#   prior = prior_normal()
# )

## -----------------------------------------------------------------------------
# mdl_weak <- rtmb_glmer(
#   y ~ x + (1 | id),
#   data = dat,
#   family = "gaussian",
#   prior = prior_weak(y_range = c(1, 5))
# )

## -----------------------------------------------------------------------------
# mdl_rhs <- rtmb_glmer(
#   y ~ x1 + x2 + x3 + (1 | id),
#   data = dat,
#   family = "gaussian",
#   prior = prior_rhs(y_range = c(1, 5))
# )

## -----------------------------------------------------------------------------
# mdl_jzs <- rtmb_ttest(
#   y ~ group,
#   data = dat,
#   prior = prior_jzs()
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
# mdl_aov <- rtmb_lmer(
#   y ~ cond * time + (1 | id),
#   data = dat,
#   prior = prior_flat()
# )
# 
# fit_aov <- mdl_aov$classic()
# anova(fit_aov)

## -----------------------------------------------------------------------------
# emm <- lsmeans(fit_aov, specs = "cond")
# emm
# plot(emm)

## -----------------------------------------------------------------------------
# mdl$print_code()

## -----------------------------------------------------------------------------
# fit_full <- mdl$sample()
# fit_full$bridgesampling()

## -----------------------------------------------------------------------------
# bf <- fit_full$bayes_factor(fixed = list("b[talk]" = 0))
# bf

