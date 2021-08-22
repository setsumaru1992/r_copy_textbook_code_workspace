# ここ触る前に4章読んだ。疲れた。また次やるとき忘れてるんだろうな。疲れた。

library(tidyverse)
shidoho_data <- tibble(read_csv("reference_files/shidoho_data.csv"))
psycho_score <- shidoho_data$psycho_score

# 標準正規分布を用いた検定
population_mean_of_null_hypothesis <- 12 # 帰無仮説で使う母平均 (帰無仮説: 母平均 = 12, 対立仮説: 母平均 ≠ 12　今回は母平均=12という帰無仮説の値を使用)
test_statistic_numerator <- mean(psycho_score) - population_mean_of_null_hypothesis # 統計量を求めるための分子
test_statistic_denominator <- sqrt(10/length(psycho_score)) # 統計量を求めるための分母
test_statistic <- test_statistic_numerator / test_statistic_denominator # 検定統計量 # -2.828427

significance_level = 0.05 # 有意水準: 5%
lower_rejection_area <- qnorm(significance_level / 2) # 下側確率が0.025となるZの確率 # -1.959964
upper_rejection_area <- qnorm(1 - (significance_level / 2)) # 下側確率が0.975となるZの確率 # 1.959964
exist_in_rejection_area <- test_statistic < lower_rejection_area | upper_rejection_area < test_statistic
exist_in_rejection_area # TRUE = 帰無仮説を元にした検定統計量が棄却域に入る = 帰無仮説が棄却される（対立仮説は5%水準で有意であった）



# t検定(t分布を用いた検定)
## 用意された関数を使わない愚直な書き方
population_mean_of_null_hypothesis <- 12 # 帰無仮説で使う母平均 (帰無仮説: 母平均 = 12, 対立仮説: 母平均 ≠ 12　今回は母平均=12という帰無仮説の値を使用)
t_test_statistic_numerator <- mean(psycho_score) - population_mean_of_null_hypothesis # 統計量を求めるための分子
t_test_statistic_denominator <- sqrt(var(psycho_score)/length(psycho_score)) # 統計量を求めるための分母
t_test_statistic <- t_test_statistic_numerator / t_test_statistic_denominator # 検定統計量 # -2.616648

degree_of_freedom <- length(psycho_score) - 1 # t検定で使う自由度
significance_level = 0.05 # 有意水準: 5%
lower_rejection_area <- qt(significance_level / 2, degree_of_freedom) # -2.093024
upper_rejection_area <- qt(significance_level / 2, degree_of_freedom, lower.tail = FALSE) # 2.093024
exist_in_rejection_area <- t_test_statistic < lower_rejection_area | upper_rejection_area < t_test_statistic
exist_in_rejection_area # TRUE

## 用意された関数を使用
t.test(psycho_score, mu=12)
