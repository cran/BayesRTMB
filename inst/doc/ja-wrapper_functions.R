## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
# library(BayesRTMB)
# data(debate)
# 
# mdl <- rtmb_lm(sat ~ talk * perf, data = debate)

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample()
# fit_map  <- mdl$optimize()
# fit_cl   <- mdl$classic()

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(sat ~ talk * perf, data = debate)
# fit <- mdl$sample()
# fit$summary()

## -----------------------------------------------------------------------------
# fit <- mdl$optimize()
# fit$summary()

## -----------------------------------------------------------------------------
# fit <- mdl$classic()
# fit$summary()

## -----------------------------------------------------------------------------
# rtmb_corr(cbind(sat, perf), data = debate)$classic()

## -----------------------------------------------------------------------------
# rtmb_corr(cbind(sat, perf),
#           data = debate,
#           covariates = ~ skill)$classic()

## -----------------------------------------------------------------------------
# rtmb_corr(cbind(sat, perf), data = debate, method = "spearman")$classic()
# rtmb_corr(cbind(sat, perf), data = debate, method = "reml")$classic()

## -----------------------------------------------------------------------------
# fit_tab <- rtmb_table(skill, cond, data = debate)$classic()
# anova(fit_tab)

## -----------------------------------------------------------------------------
# data(BigFive)
# 
# items <- BigFive[, 1:10]
# fit_fa1 <- rtmb_fa(items, nfactors = 1)$classic()
# fit_fa2 <- rtmb_fa(items, nfactors = 2)$classic()
# 
# anova(fit_fa1, fit_fa2)

## -----------------------------------------------------------------------------
# c(AIC_1 = AIC(fit_fa1),
#   AIC_2 = AIC(fit_fa2),
#   BIC_1 = BIC(fit_fa1),
#   BIC_2 = BIC(fit_fa2))

## -----------------------------------------------------------------------------
# mdl <- rtmb_ttest(sat ~ cond, data = debate)
# mdl$print_code()

