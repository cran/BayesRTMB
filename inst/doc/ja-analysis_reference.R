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
#     # data frameの列を、モデル内で使う変数名に結び付ける
#     Y <- sat
#     X <- talk
# 
#     # setupでは、AD対象外の前処理や補助関数の定義もできる
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
# # primary parametersだけを取り出す
# fit$estimate(pars = "parameters")
# 
# # transformブロックで作った量を取り出す
# fit$estimate(pars = "transform")
# 
# # generateブロックで作った量を取り出す
# fit$estimate(pars = "generate")
# 
# # すべて取り出す
# fit$estimate(pars = "all")

## -----------------------------------------------------------------------------
# est <- fit$estimate(pars = "parameters", drop = FALSE)

## -----------------------------------------------------------------------------
# # bだけならベクトルで返る
# b_eap <- fit$EAP("b")
# 
# # bだけでもlistとして返る
# b_eap_list <- fit$EAP("b", drop = FALSE)

## -----------------------------------------------------------------------------
# fit$EAP(pars = "parameters")
# fit$MAP(pars = "parameters")
# fit$MAP(pars = "parameters", type = "joint")

## -----------------------------------------------------------------------------
# # bとsigmaだけ
# fit$estimate(pars = c("b", "sigma"))
# 
# # transformだけ
# fit$estimate(component = "transform")
# 
# # generateだけ
# fit$estimate(component = "generate")
# 
# # theta以外
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
# # 全ての固定パラメータ、transform、generateを取得
# draws_all <- fit_mcmc$draws()
# 
# # bだけ取得
# draws_b <- fit_mcmc$draws("b")
# 
# # random effectsも含める
# draws_with_random <- fit_mcmc$draws(inc_random = TRUE)
# 
# # transformやgenerateを含めない
# draws_par <- fit_mcmc$draws(
#   inc_transform = FALSE,
#   inc_generate = FALSE
# )

## -----------------------------------------------------------------------------
# dim(draws_b)
# dimnames(draws_b)[[3]]

## -----------------------------------------------------------------------------
# fit_mcmc$summary()
# fit_mcmc$summary("b")
# fit_mcmc$diagnose()

## -----------------------------------------------------------------------------
# d <- fit_mcmc$diagnose()
# print(d)

## -----------------------------------------------------------------------------
# fit_mcmc$transformed_draws()
# 
# fit_mcmc$generated_quantities({
#   y_rep <- rnorm(length(Y), mu, sigma)
# })

## -----------------------------------------------------------------------------
# gq_code <- rtmb_code(
#   generate = {
#     log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   }
# )
# 
# fit_mcmc$generated_quantities(gq_code)
# fit_mcmc$WAIC()

## -----------------------------------------------------------------------------
# fit_mcmc$generated_quantities(gq_code, progress = "message")

## -----------------------------------------------------------------------------
# logml <- fit_mcmc$bridgesampling(
#   method = "normal",
#   use_neff = TRUE
# )
# 
# logml
# attr(logml, "error")
# attr(logml, "ess")

## -----------------------------------------------------------------------------
# bf <- fit_mcmc$bayes_factor(
#   fixed = list("b[talk]" = 0),
#   sampling = 4000,
#   chains = 4
# )
# 
# print(bf)

## -----------------------------------------------------------------------------
# mdl_null <- fit_mcmc$model$fixed_model(
#   fixed = list("b[talk]" = 0)
# )
# fit_null <- mdl_null$sample(chains = 4, sampling = 4000)
# 
# bf <- fit_mcmc$bayes_factor(
#   comparison_fit = fit_null
# )

## -----------------------------------------------------------------------------
# df <- debate
# 
# code <- rtmb_code(
#   setup = {
#     Y <- sat
#   },
#   parameters = {
#     mu <- Dim()
#     sigma <- Dim(lower = 0)
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#   },
#   generate = {
#     log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   }
# )
# 
# fit <- rtmb_model(data = df, code = code)$sample()
# fit$WAIC()

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal(),
#   WAIC = TRUE
# )
# 
# fit <- mdl$sample()
# fit$WAIC()

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(
#   num_estimate = 4,
#   laplace = TRUE
# )

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 8)
# fit_map$opt_history
# fit_map$diagnose()

## -----------------------------------------------------------------------------
# fit_mix <- mdl_mix$optimize(num_estimate = 20)
# fit_mix$opt_history

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 4)
# 
# fit_mcmc <- mdl$sample(
#   init = fit_map$estimate(pars = "parameters", drop = FALSE)
# )

## -----------------------------------------------------------------------------
# est <- fit_map$estimate(pars = "parameters", drop = FALSE)
# 
# mdl_fixed <- mdl$fixed_model(
#   fixed = list(
#     sigma = est$sigma
#   )
# )
# 
# fit_fixed <- mdl_fixed$optimize()

## -----------------------------------------------------------------------------
# mdl_null <- mdl$fixed_model(
#   fixed = list("b[talk]" = 0)
# )
# 
# fit_null <- mdl_null$optimize()

## -----------------------------------------------------------------------------
# prof <- fit_map$profile(
#   pars = c("b[talk]", "sigma"),
#   level = 0.95
# )

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal(),
#   WAIC = TRUE
# )
# 
# fit_map <- mdl$optimize(se_method = "sampling")
# fit_map$WAIC()

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(
#   iter = 5000,
#   num_estimate = 4
# )

## -----------------------------------------------------------------------------
# fit_vb$best_chain
# fit_vb$ELBO
# fit_vb$rel_obj_vals
# 
# # デフォルトではbest estimateのEAP
# fit_vb$EAP(pars = "parameters")
# 
# # 特定のestimateを指定
# fit_vb$EAP(pars = "parameters", chains = 2)
# 
# # ELBO上位2つを使う
# fit_vb$EAP(pars = "parameters", best_chains = 2)

## -----------------------------------------------------------------------------
# fit_vb$plot_elbo()
# fit_vb$plot_elbo(tail_n = 1000)
# fit_vb$plot_elbo(ests = "best", tail_n = 1000)

## -----------------------------------------------------------------------------
# fit_vb$diagnose()

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal(),
#   WAIC = TRUE
# )
# 
# fit_vb <- mdl$variational()
# fit_vb$WAIC()

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_flat()
# )
# 
# fit_classic <- mdl$classic()

## -----------------------------------------------------------------------------
# fit_classic$estimate()
# fit_classic$summary()
# fit_classic$diagnose()

## -----------------------------------------------------------------------------
# fit_classic$anova()
# anova(fit_classic)

## -----------------------------------------------------------------------------
# fit0 <- rtmb_lm(sat ~ 1, data = debate, prior = prior_flat())$classic()
# fit1 <- rtmb_lm(sat ~ talk + perf, data = debate, prior = prior_flat())$classic()
# 
# anova(fit0, fit1)

## -----------------------------------------------------------------------------
# fit_classic$logLik()
# fit_classic$AIC()
# fit_classic$BIC()
# 
# AIC(fit0, fit1)
# BIC(fit0, fit1)

## -----------------------------------------------------------------------------
# # 元のfitを変更せず、robust SE版のコピーを返す
# fit_robust <- fit_classic$robust_se(type = "HC3")
# 
# # cluster-robust
# fit_cluster <- fit_classic$robust_se(
#   cluster = "group_id",
#   type = "CR1"
# )
# 
# # fit自体を更新
# fit_classic$robust_se(type = "HC3", inplace = TRUE)

## -----------------------------------------------------------------------------
# fit_classic$lsmeans("group")
# fit_classic$lsmeans("group", pairwise = TRUE)
# fit_classic$lsmeans(c("group", "condition"), pairwise = TRUE)

## -----------------------------------------------------------------------------
# conditional_effects(fit_classic, effect = "talk:perf")
# simple_effects(fit_classic, effect = "talk:perf")

## -----------------------------------------------------------------------------
# fit_full <- mdl_full$sample(chains = 4, sampling = 4000)
# 
# bf <- fit_full$bayes_factor(
#   fixed = list("b[talk]" = 0),
#   chains = 4,
#   sampling = 4000
# )

## -----------------------------------------------------------------------------
# logml <- fit_full$bridgesampling()
# 
# attr(logml, "error")
# attr(logml, "ess")

## -----------------------------------------------------------------------------
# bf <- fit_full$bayes_factor(
#   fixed = list("b[talk]" = 0),
#   chains = 4,
#   sampling = 8000,
#   error_threshold = 0.05
# )

## -----------------------------------------------------------------------------
# mdl <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal(),
#   WAIC = TRUE
# )
# 
# fit1 <- mdl$sample()
# fit1$WAIC()

## -----------------------------------------------------------------------------
# generate = {
#   log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
# }

## -----------------------------------------------------------------------------
# fit0 <- mdl0$classic()
# fit1 <- mdl1$classic()
# 
# AIC(fit0, fit1)
# BIC(fit0, fit1)
# anova(fit0, fit1)

## -----------------------------------------------------------------------------
# fit_vb$ELBO
# fit_vb$plot_elbo(tail_n = 1000)

## -----------------------------------------------------------------------------
# mdl_null <- mdl$fixed_model(
#   fixed = list("b[talk]" = 0)
# )
# 
# fit_null <- mdl_null$sample()

## -----------------------------------------------------------------------------
# mdl_null <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal(),
#   fixed = list("b[talk]" = 0)
# )
# 
# fit_null <- mdl_null$sample()

## -----------------------------------------------------------------------------
# fit_null <- mdl$sample(
#   fixed = list("b[talk]" = 0)
# )
# 
# fit_null_map <- mdl$optimize(
#   fixed = list("b[talk]" = 0)
# )

## -----------------------------------------------------------------------------
# # summaryに表示される名前を見る
# fit_mcmc$summary()
# 
# # primary parametersの名前を見る
# names(fit_mcmc$EAP(pars = "parameters", drop = FALSE))
# 
# # MCMC drawの展開名を見る
# dimnames(fit_mcmc$draws())[[3]]
# 
# # wrapperが作ったモデルコードを見る
# print_code(mdl)

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 4)
# 
# est <- fit_map$estimate(
#   pars = "parameters",
#   drop = FALSE
# )
# 
# mdl_fixed <- mdl$fixed_model(
#   fixed = list(
#     sigma = est$sigma
#   )
# )
# 
# fit_fixed <- mdl_fixed$optimize()

## -----------------------------------------------------------------------------
# mdl_fixed <- mdl$fixed_model(
#   fixed = list(
#     "b[talk]" = 0,
#     "b[perf]" = 0
#   )
# )

## -----------------------------------------------------------------------------
# fit_mcmc <- mdl$sample()
# 
# eap <- fit_mcmc$EAP(
#   pars = "parameters",
#   drop = FALSE
# )
# 
# mdl_fixed <- fit_mcmc$model$fixed_model(
#   fixed = list(
#     sigma = eap$sigma
#   )
# )
# 
# fit_fixed <- mdl_fixed$sample()

## -----------------------------------------------------------------------------
# eap <- fit_mcmc$EAP(pars = "parameters", drop = FALSE)
# 
# mdl_b_fixed <- fit_mcmc$model$fixed_model(
#   fixed = list(
#     b = eap$b
#   )
# )

## -----------------------------------------------------------------------------
# mdl_one_fixed <- fit_mcmc$model$fixed_model(
#   fixed = list(
#     "b[talk]" = 0
#   )
# )

## -----------------------------------------------------------------------------
# bf <- fit_mcmc$bayes_factor(
#   fixed = list("b[talk]" = 0),
#   chains = 4,
#   sampling = 4000
# )

## -----------------------------------------------------------------------------
# mdl_null <- fit_mcmc$model$fixed_model(
#   fixed = list("b[talk]" = 0)
# )
# 
# fit_null <- mdl_null$sample(
#   chains = 4,
#   sampling = 4000
# )
# 
# bf <- fit_mcmc$bayes_factor(
#   comparison_fit = fit_null
# )

## -----------------------------------------------------------------------------
# df <- debate
# 
# code <- rtmb_code(
#   setup = {
#     Y <- sat
#     X <- talk
#     N <- length(Y)
#   },
#   parameters = {
#     Intercept <- Dim()
#     b <- Dim()
#     sigma <- Dim(lower = 0)
#   },
#   transform = {
#     mu <- Intercept + b * X
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     Intercept ~ normal(0, 10)
#     b ~ normal(0, 10)
#     sigma ~ exponential(1)
#   },
#   generate = {
#     log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)
#   }
# )
# 
# mdl <- rtmb_model(data = df, code = code)

## -----------------------------------------------------------------------------
# setup = {
#   Y <- response
#   X <- model.matrix(~ group + score)
# 
#   obs <- which(!is.na(Y), arr.ind = TRUE)
#   person_idx <- as.integer(obs[, "row"])
#   item_idx <- as.integer(obs[, "col"])
#   Y_obs <- Y[obs]
#   N_obs <- length(Y_obs)
# 
#   center <- function(x) x - mean(x)
# }

## -----------------------------------------------------------------------------
# transform = {
#   eta <- X %*% b + Intercept
#   mu <- inv_logit(eta)
# }

## -----------------------------------------------------------------------------
# fit$transformed_draws()
# fit$estimate(pars = "transform")

## -----------------------------------------------------------------------------
# transform = {
#   eta <- X %*% b + Intercept
#   mu <- inv_logit(eta)
#   report(mu)
# }

## -----------------------------------------------------------------------------
# generate = {
#   log_lik <- normal_lpdf(Y, eta, sigma, sum = FALSE)
#   y_rep <- rnorm(length(Y), eta, sigma)
#   report(log_lik, y_rep)
# }

## -----------------------------------------------------------------------------
# gq_code <- rtmb_code(
#   generate = {
#     log_lik <- normal_lpdf(Y, eta, sigma, sum = FALSE)
#   }
# )
# 
# fit$generated_quantities(gq_code)
# fit$estimate(pars = "generate")
# fit$draws(pars = "log_lik")

## -----------------------------------------------------------------------------
# parameters = {
#   # scalar
#   alpha <- Dim()
# 
#   # vector
#   b <- Dim(P)
# 
#   # matrix
#   L <- Dim(c(J, D))
# 
#   # array
#   A <- Dim(c(I, J, K))
# 
#   # positive scalar
#   sigma <- Dim(lower = 0)
# 
#   # random effect
#   theta <- Dim(N, random = TRUE)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   theta <- Dim(N_persons, random = TRUE)
#   b <- Dim(N_items)
# }

## -----------------------------------------------------------------------------
# Y ~ normal(mu, sigma)
# theta ~ normal(0, 1)

## -----------------------------------------------------------------------------
# lp <- lp + normal_lpdf(Y, mu, sigma)

## -----------------------------------------------------------------------------
# Y ~ normal(mu, sigma)

## -----------------------------------------------------------------------------
# log_lik <- normal_lpdf(Y, mu, sigma, sum = FALSE)

## -----------------------------------------------------------------------------
# setup = {
#   obs <- which(!is.na(Y), arr.ind = TRUE)
#   person_idx <- as.integer(obs[, "row"])
#   item_idx <- as.integer(obs[, "col"])
#   Y_obs <- Y[obs]
# }

## -----------------------------------------------------------------------------
# transform = {
#   eta <- X %*% b + Intercept
# }
# 
# model = {
#   Y ~ normal(eta, sigma)
# }

## -----------------------------------------------------------------------------
# model = {
#   for (i in 1:N_obs) {
#     eta_i <- a[item_idx[i]] * (theta[person_idx[i]] - b[item_idx[i]])
#     Y_obs[i] ~ bernoulli_logit(eta_i)
#   }
# }

## -----------------------------------------------------------------------------
# model = {
#   if (theta > 0) {
#     y ~ normal(theta, 1)
#   } else {
#     y ~ normal(0, 1)
#   }
# }

## -----------------------------------------------------------------------------
# transform = {
#   eta <- rtmb_vector(0, length = N_obs)
#   for (i in 1:N_obs) {
#     eta[i] <- X[i, ] %*% b
#   }
# }

## -----------------------------------------------------------------------------
# transform = {
#   logit_x <- rtmb_array(0, dim = c(T, C, D))
#   for (t in 1:T) {
#     for (c in 1:C) {
#       for (d in 1:D) {
#         logit_x[t, c, d] <- alpha[d] + beta[c, d] * time[t]
#       }
#     }
#   }
# }

## -----------------------------------------------------------------------------
# fit <- mdl$sample()
# 
# fit$EAP(pars = "parameters")
# fit$MAP(pars = "parameters")
# fit$estimate(pars = "parameters", type = "EAP")

## -----------------------------------------------------------------------------
# fit_map <- mdl$optimize(num_estimate = 4)
# 
# fit_mcmc <- mdl$sample(
#   init = fit_map$estimate(pars = "parameters")
# )

## -----------------------------------------------------------------------------
# fit$generated_quantities({
#   pred <- rnorm(length(Y), mu, sigma)
# })
# 
# fit$estimate(pars = "generate")
# fit$draws(pars = "pred")

## -----------------------------------------------------------------------------
# draws_re <- fit$draws(
#   inc_random = TRUE,
#   inc_transform = FALSE,
#   inc_generate = FALSE
# )

## -----------------------------------------------------------------------------
# fit_vb <- mdl$variational(iter = 10000, num_estimate = 4)
# 
# fit_vb$plot_elbo(tail_n = 1000)
# fit_vb$diagnose()

## -----------------------------------------------------------------------------
# fit0 <- rtmb_lm(sat ~ 1, data = debate, prior = prior_flat())$classic()
# fit1 <- rtmb_lm(sat ~ talk + perf, data = debate, prior = prior_flat())$classic()
# 
# anova(fit0, fit1)
# AIC(fit0, fit1)
# BIC(fit0, fit1)

## -----------------------------------------------------------------------------
# fit <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal()
# )$sample()
# 
# bf <- fit$bayes_factor(
#   fixed = list("b[talk:perf]" = 0),
#   chains = 4,
#   sampling = 4000
# )

## -----------------------------------------------------------------------------
# mdl_full <- rtmb_lm(
#   sat ~ talk * perf,
#   data = debate,
#   prior = prior_normal()
# )
# 
# mdl_null <- mdl_full$fixed_model(
#   fixed = list("b[talk:perf]" = 0)
# )
# 
# fit_full <- mdl_full$sample()
# fit_null <- mdl_null$sample()

## -----------------------------------------------------------------------------
# fit_new <- upgrade_fit(fit_old)

## -----------------------------------------------------------------------------
# fit <- mdl$sample(
#   parallel = TRUE,
#   chains = 4,
#   progress = "message"
# )

## -----------------------------------------------------------------------------
# fit <- mdl$sample(
#   parallel = TRUE,
#   globals = TRUE
# )

