library(tidyverse)
library(modelr)
options(na.action = na.warn)

library(nycflights13)
library(lubridate)


diamonds_tmp <- diamonds
ggplot(diamonds, aes(cut, price)) + geom_boxplot()
ggplot(diamonds, aes(color, price)) + geom_boxplot()
ggplot(diamonds, aes(clarity, price)) + geom_boxplot()


install.packages("hexbin")
ggplot(diamonds, aes(carat, price)) +
  geom_hex(bins = 50)

diamonds2 <- diamonds %>%
  filter(carat <= 2.5) %>%
  mutate(lprice = log2(price), lcarat = log2(carat))
ggplot(diamonds2, aes(lcarat, lprice)) +
  geom_hex(bins = 50)

mod_diamond <- lm(lprice ~ lcarat, data =diamonds2)

grid <- diamonds2 %>%
  data_grid(carat = seq_range(carat, 20)) %>%
  mutate(lcarat = log2(carat)) %>%
  add_predictions(mod_diamond, "lprice") %>%
  mutate(price = 2 ^ lprice)

ggplot(diamonds2, aes(carat, price)) +
  geom_hex(bin = 50) +
  geom_line(data = grid, color = "red", size = 1)



diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond, "lresid")

ggplot(diamonds2, aes(lcarat, lresid)) +
  geom_hex(bins = 50)

# ---- デバッグ ----
# 「線形パターンの除去」の意味がわからないため
# 対数変換しなかった場合のモデル
mod_diamond_tmp <- lm(price ~ carat, data = diamonds2) 
diamonds2_tmp <- diamonds2 %>%
  add_residuals(mod_diamond_tmp, "resid")
ggplot(diamonds2_tmp, aes(carat, resid)) +
  geom_hex(bins = 50)
# ---- デバッグ終了 ----


ggplot(diamonds2, aes(cut, lresid)) + geom_boxplot()
ggplot(diamonds2, aes(color, lresid)) + geom_boxplot()
ggplot(diamonds2, aes(clarity, lresid)) + geom_boxplot()
