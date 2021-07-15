# 18.1.1
library(tidyverse)

library(modelr)
options(na.action = na.warn)

# 18.2
ggplot(sim1, aes(x, y)) + 
  geom_point()




models <- tibble(
  a1 = runif(250, -20, 40),
  a2 = runif(250, -5, 5)
)

ggplot(sim1, aes(x, y)) + 
  geom_abline(
    aes(intercept = a1, slope = a2),
    data = models, alpha = 1/4
  ) +
  geom_point()






model1 <- function(a, data) {
  a[1] + data$x * a[2]
}
model1(c(7, 1.5), sim1)

measure_distance <- function(mod, data){
  diff <- data$y - model1(mod, data)
  sqrt(mean(diff ^ 2))
}
measure_distance(c(7, 1.5), sim1)





sim1_dist <- function(a1, a2) {
  measure_distance(c(a1, a2), sim1)
}

models <- models %>% 
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))
models

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "gray30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(models, rank(dist) <= 10)
  )

ggplot(models, aes(a1, a2)) + 
  geom_point(
    data = filter(models, rank(dist) <= 10),
    size = 4, color = "red"
  ) + 
  geom_point(aes(colour = -dist))

grid <- expand.grid(
  a1 = seq(-5, 20, length = 25),
  a2 = seq(1, 3, length = 25)
) %>%
  mutate(dist = purrr::map2_dbl(a1, a2, sim1_dist))

grid %>%
  ggplot(aes(a1, a2)) +
  geom_point(
    data = filter(grid, rank(dist) <= 10),
    size = 4, color = "red"
  ) + 
  geom_point(aes(colour = -dist))

ggplot(sim1, aes(x, y)) +
  geom_point(size = 2, color = "gray30") + 
  geom_abline(
    aes(intercept = a1, slope = a2, color = -dist),
    data = filter(grid, rank(dist) <= 10)
  )


best <- optim(c(0,0), measure_distance, data=sim1)
best$par

ggplot(sim1, aes(x, y)) + 
  geom_point(size = 2, color = "gray30") +
  geom_abline(intercept = best$par[1], slope = best$par[2])

sim1_mod <- lm(y ~ x, data = sim1)
coef(sim1_mod)




grid <- sim1 %>%
  data_grid(x)
grid

grid <- grid %>%
  add_predictions(sim1_mod)
grid

ggplot(sim1, aes(x)) + 
  geom_point(aes(y = y)) +
  geom_line(
    aes(y = pred),
    data = grid,
    colour = "red",
    size = 1
  )


# 残差
sim1 <- sim1 %>%
  add_residuals(sim1_mod)
sim1

ggplot(sim1, aes(resid)) + 
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1, aes(x, resid)) +
  geom_ref_line(h = 0) +
  geom_point()


# フォーミュラとモデルファミリー 
## Rがフォーミュラを関数化しているとき、裏でどのように値を扱っているか
df <- tribble( # tibbleじゃないんだ
  ~y, ~x1, ~x2,
  4,2,5,
  5,1,6
)

model_matrix(df, y ~ x1)
model_matrix(df, y ~ x1 + x2)

## カテゴリ変数
df <- tribble(
  ~sex, ~response,
  "male", 1,
  "female", 2,
  "male", 1
)

model_matrix(df, response ~ sex)

ggplot(sim2) +
  geom_point(aes(x,y))

sim2_tmp <- sim2

mod2 <- lm(y ~ x, data = sim2)
grid <- sim2 %>%
  data_grid(x) %>%
  add_predictions(mod2)
grid

ggplot(sim2, aes(x)) +
  geom_point(aes(y = y)) +
  geom_point(
    data = grid,
    aes(y = pred),
    color = "red",
    size = 4
  )

## 交互作用(連続 & カテゴリ)
sim3_tmp = sim3
ggplot(sim3, aes(x1, y)) +
  geom_point(aes(color = x2))

mod1 <- lm(y ~ x1 + x2, data = sim3)
mod2 <- lm(y ~ x1 * x2, data = sim3)

grid <- sim3 %>%
  data_grid(x1, x2) %>%
  gather_predictions(mod1, mod2)
grid

ggplot(sim3, aes(x1, y, color = x2)) +
  geom_point() +
  geom_line(data = grid, aes(y = pred)) +
  facet_wrap(~ model)

sim3 <- sim3 %>%
  gather_residuals(mod1, mod2)
ggplot(sim3, aes(x1, resid, color = x2)) +
  geom_point() +
  facet_grid(model ~ x2)

## 交互作用(連続 & 連続)
sim4_tmp = sim4
mod1 <- lm(y ~ x1 + x2, data = sim4)
mod2 <- lm(y ~ x1 * x2, data = sim4)

grid <- sim4 %>%
  data_grid(
    x1 = seq_range(x1, 5),
    x2 = seq_range(x2, 5)
  ) %>%
  gather_predictions(mod1, mod2)
grid

ggplot(grid, aes(x1, x2)) +
  geom_tile(aes(fill = pred)) +
  facet_wrap(~ model)

ggplot(grid, aes(x1, pred, color = x2, group = x2)) +
  geom_line() +
  facet_wrap(~ model)
ggplot(grid, aes(x2, pred, color = x1, group = x1)) +
  geom_line() +
  facet_wrap(~ model)

# 上やってほぼ写経でほぼ意味理解してなかったけど、使うようになったらまた理解しよう