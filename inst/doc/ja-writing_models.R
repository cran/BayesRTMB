## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, eval = FALSE)

## -----------------------------------------------------------------------------
# library(BayesRTMB)
# 
# Trial <- 10
# Y <- 6
# 
# data_list <- list(
#   Trial = Trial,
#   Y = Y
# )

## -----------------------------------------------------------------------------
# code_binom <- rtmb_code(
#   parameters = {
#     theta <- Dim(lower = 0, upper = 1)
#   },
#   model = {
#     Y ~ binomial(Trial, theta)
#     theta ~ beta(1, 1)
#   }
# )

## -----------------------------------------------------------------------------
# mdl_binom <- rtmb_model(data = data_list, code = code_binom)

## -----------------------------------------------------------------------------
# fit_map  <- mdl_binom$optimize()
# fit_mcmc <- mdl_binom$sample()
# fit_vb   <- mdl_binom$variational()

## -----------------------------------------------------------------------------
# code <- rtmb_code(
#   setup = {
#     # データから定数や前処理済みオブジェクトを作る
#   },
#   parameters = {
#     # 推定するパラメータを宣言する
#   },
#   transform = {
#     # パラメータから派生量を作る
#   },
#   model = {
#     # 尤度と事前分布を書く
#   },
#   generate = {
#     # 推定後に計算したい量を書く
#   }
# )

## -----------------------------------------------------------------------------
# setup = {
#   N <- length(Y)
#   P <- ncol(X)
#   X_mean <- apply(X, 2, mean)
#   X_sd <- apply(X, 2, sd)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   alpha <- Dim()
#   beta <- Dim(P)
#   sigma <- Dim(lower = 0)
# }

## -----------------------------------------------------------------------------
# transform = {
#   mu <- alpha + X %*% beta
# }

## -----------------------------------------------------------------------------
# transform = {
#   eta <- alpha + X %*% beta
#   mu <- inv_logit(eta)
#   report(mu, beta)
# }

## -----------------------------------------------------------------------------
# model = {
#   Y ~ normal(mu, sigma)
#   alpha ~ normal(0, 10)
#   beta ~ normal(0, 2.5)
#   sigma ~ exponential(1)
# }

## -----------------------------------------------------------------------------
# model = {
#   lp <- lp + normal_lpdf(Y, mu, sigma)
#   lp <- lp + normal_lpdf(alpha, 0, 10)
#   lp <- lp + normal_lpdf(beta, 0, 2.5)
#   lp <- lp + exponential_lpdf(sigma, 1)
# }

## -----------------------------------------------------------------------------
# generate = {
#   Y_rep <- rnorm(length(Y), mu, sigma)
# }

## -----------------------------------------------------------------------------
# code_ppc <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#   },
#   parameters = {
#     alpha <- Dim()
#     beta <- Dim(P)
#     sigma <- Dim(lower = 0)
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
#     Y_rep <- rnorm(N, mu, sigma)
#     residual <- Y - mu
#   }
# )

## -----------------------------------------------------------------------------
# new_generate <- rtmb_code(
#   generate = {
#     abs_residual <- abs(Y - mu)
#   }
# )
# 
# fit_reg <- mdl_reg$optimize()
# fit_reg$generated_quantities(new_generate)

## -----------------------------------------------------------------------------
# data(debate)
# 
# Y <- debate$sat
# X_names <- c("talk", "perf", "skill")
# X <- as.matrix(debate[, X_names])
# 
# data_reg <- list(
#   Y = Y,
#   X = X
# )

## -----------------------------------------------------------------------------
# code_reg <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#   },
#   parameters = {
#     alpha <- Dim()
#     beta <- Dim(P)
#     sigma <- Dim(lower = 0)
#   },
#   transform = {
#     mu <- alpha + X %*% beta
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     alpha ~ normal(0, 10)
#     beta ~ normal(0, 2.5)
#     sigma ~ exponential(1)
#   }
# )

## -----------------------------------------------------------------------------
# mdl_reg <- rtmb_model(
#   data = data_reg,
#   code = code_reg,
#   par_names = list(beta = X_names)
# )
# 
# mdl_reg$optimize()

## -----------------------------------------------------------------------------
# data_reg2 <- list(
#   Y = debate$sat,
#   X = as.matrix(debate[, c("talk", "perf", "skill")])
# )
# 
# code_reg2 <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#     X_mean <- apply(X, 2, mean)
#     X_c <- X - rep(1, N) %*% t(X_mean)
#   },
#   parameters = {
#     alpha_c <- Dim()
#     beta <- Dim(P)
#     sigma <- Dim(lower = 0)
#   },
#   transform = {
#     alpha <- alpha_c - sum(X_mean * beta)
#     mu <- alpha_c + X_c %*% beta
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     alpha_c ~ normal(0, 10)
#     beta ~ normal(0, 2.5)
#     sigma ~ exponential(1)
#   },
#   generate = {
#     Y_rep <- rnorm(length(Y), mu, sigma)
#   }
# )

## -----------------------------------------------------------------------------
# alpha <- alpha_c - sum(X_mean * beta)

## -----------------------------------------------------------------------------
# model = {
#   Y ~ normal(mu, sigma)
#   alpha ~ normal(0, 10)
#   beta ~ normal(0, 2.5)
#   sigma ~ exponential(1)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   sigma <- Dim(lower = 0)
# }
# model = {
#   sigma ~ exponential(1)
# }

## -----------------------------------------------------------------------------
# parameters = {
#   cutpoints <- Dim(K - 1, type = "ordered")
# }

## -----------------------------------------------------------------------------
# parameters = {
#   theta <- Dim(K, type = "simplex")
# }

## -----------------------------------------------------------------------------
# Y <- debate$sat
# X_names <- c("talk", "perf", "skill")
# X <- as.matrix(debate[, X_names])
# group <- as.integer(as.factor(debate$group))
# G <- length(unique(group))
# 
# data_hlm <- list(
#   Y = Y,
#   X = X,
#   group = group,
#   G = G
# )

## -----------------------------------------------------------------------------
# code_hlm <- rtmb_code(
#   setup = {
#     N <- length(Y)
#     P <- ncol(X)
#   },
#   parameters = {
#     alpha <- Dim()
#     beta <- Dim(P)
#     tau <- Dim(lower = 0)
#     sigma <- Dim(lower = 0)
#     r <- Dim(G, random = TRUE)
#   },
#   transform = {
#     mu <- alpha + X %*% beta + tau * r[group]
#   },
#   model = {
#     Y ~ normal(mu, sigma)
#     r ~ normal(0, 1)
#     alpha ~ normal(0, 10)
#     beta ~ normal(0, 2.5)
#     tau ~ exponential(1)
#     sigma ~ exponential(1)
#   }
# )

## -----------------------------------------------------------------------------
# mdl_hlm <- rtmb_model(
#   data = data_hlm,
#   code = code_hlm,
#   par_names = list(beta = X_names)
# )
# 
# fit_hlm <- mdl_hlm$optimize()
# fit_hlm$random_effects

## -----------------------------------------------------------------------------
# Y <- as.integer(debate$sat)
# X <- as.matrix(debate[, c("talk", "perf", "skill")])
# K <- length(sort(unique(Y)))
# 
# data_ord <- list(
#   Y = Y,
#   X = X,
#   K = K
# )

## -----------------------------------------------------------------------------
# code_ord <- rtmb_code(
#   setup = {
#     P <- ncol(X)
#   },
#   parameters = {
#     beta <- Dim(P)
#     cutpoints <- Dim(K - 1, type = "ordered")
#   },
#   transform = {
#     eta <- X %*% beta
#   },
#   model = {
#     Y ~ ordered_logistic(eta, cutpoints)
#     beta ~ normal(0, 2.5)
#     cutpoints ~ normal(0, 5)
#   }
# )

## -----------------------------------------------------------------------------
# Y ~ bernoulli_logit(eta)
# Y ~ poisson(exp(eta))

## -----------------------------------------------------------------------------
# set.seed(123)
# N <- 300
# K <- 3
# 
# theta_true <- c(0.3, 0.2, 0.5)
# mu_true <- c(-3, 0, 4)
# sigma_true <- c(0.6, 1.0, 0.8)
# 
# z <- sample(seq_len(K), size = N, replace = TRUE, prob = theta_true)
# Y <- rnorm(N, mu_true[z], sigma_true[z])
# 
# data_mix <- list(
#   Y = Y,
#   K = K
# )

## -----------------------------------------------------------------------------
# code_mix <- rtmb_code(
#   parameters = {
#     theta <- Dim(K, type = "simplex")
#     mu <- Dim(K)
#     sigma <- Dim(K, lower = 0)
#   },
#   model = {
#     Y ~ normal_mixture(theta, mu, sigma)
#     mu ~ normal(0, 5)
#     sigma ~ exponential(1)
#   }
# )

## -----------------------------------------------------------------------------
# mdl_mix <- rtmb_model(data_mix, code_mix)
# fit_mix <- mdl_mix$optimize(num_estimate = 20)

## -----------------------------------------------------------------------------
# fit_mix_mcmc <- mdl_mix$sample(
#   init = fit_mix$estimate("parameters"),
#   init_jitter = 0.2
# )

## -----------------------------------------------------------------------------
# X <- as.matrix(debate[, c("talk", "perf", "skill")])

## -----------------------------------------------------------------------------
# if (theta > 0) ...

## -----------------------------------------------------------------------------
# init <- list(
#   alpha = mean(Y),
#   beta = rep(0, ncol(X)),
#   sigma = sd(Y)
# )
# 
# mdl <- rtmb_model(data_reg, code_reg, init = init)

## -----------------------------------------------------------------------------
# model = {
#   eta <- rtmb_vector(0, N)
#   for (i in seq_len(N)) {
#     eta[i] <- alpha + X[i, ] %*% beta
#   }
#   Y ~ normal(eta, sigma)
# }

## -----------------------------------------------------------------------------
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

## -----------------------------------------------------------------------------
# fit2 <- upgrade_fit(fit)

