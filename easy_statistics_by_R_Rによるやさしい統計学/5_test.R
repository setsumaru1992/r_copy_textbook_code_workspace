# ここ触る前に4章読んだ。疲れた。また次やるとき忘れてるんだろうな。疲れた。

library(tidyverse)
shidoho_data <- tibble(read_csv("reference_files/shidoho_data.csv"))
psycho_score <- shidoho_data$psycho_score
statistics_score_1 <- shidoho_data$statistics_score_1
statistics_score_2 <- shidoho_data$statistics_score_2

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



# 無相関検定（相関係数の検定）帰無仮説に無相関を設定
## 用意された関数を使わない愚直な書き方
sample_correlation <- cor(statistics_score_1, statistics_score_2) # 標本相関係数

t_test_statistic_numerator <- sample_correlation * sqrt(length(psycho_score) - 2)
t_test_statistic_denominator <- sqrt(1 - sample_correlation ^ 2)
t_test_statistic <- t_test_statistic_numerator / t_test_statistic_denominator
t_test_statistic # 4.805707 # どこに母相関係数ρ = 0が表現されているかわからないけど、一旦スキップ。相関を計算するときにはそういうものとして受け入れる

degree_of_freedom <- length(psycho_score) - 2 # t検定で使う自由度
significance_level = 0.05 # 有意水準: 5%
lower_rejection_area <- qt(significance_level / 2, degree_of_freedom) # -2.100922
upper_rejection_area <- qt(significance_level / 2, degree_of_freedom, lower.tail = FALSE) # 2.100922
exist_in_rejection_area <- t_test_statistic < lower_rejection_area | upper_rejection_area < t_test_statistic
exist_in_rejection_area # TRUE

## 用意された関数を使用
cor.test(statistics_score_1, statistics_score_2) # alternative hypothesis: true correlation is not equal to 0
cor.test(statistics_score_1, psycho_score)# これでもtrue出たから、無相関でないことしかチェックできないんだと思う



# カイ二乗検定（独立性の検定）帰無仮説に独立（2変数に連関がないこと）を設定
## 用意された関数を使わない愚直な書き方
math <- shidoho_data$math
statistics <- shidoho_data$statistics
table(math, statistics)

expected_frequency_zero_zero <- 12 * 14 / 20
expected_frequency_one_zero <- 12 *6 / 20
expected_frequency_zero_one <- 8 * 14 / 20
expected_frequency_one_one <- 8 * 6 / 20
expected_frequencies <- c(expected_frequency_zero_zero, expected_frequency_one_zero, expected_frequency_zero_one, expected_frequency_one_one)

observation_frequencies <- c(10,2,4,4)
chi_square_elements <- (observation_frequencies - expected_frequencies)^2 / expected_frequencies 
chi_square <- sum(chi_square_elements) # 2.539683

upper_rejection_area <- qchisq(0.05, 1, lower.tail = FALSE)
exist_in_rejection_area <- upper_rejection_area < chi_square
exist_in_rejection_area # FALSE

## 用意された関数を使用
chisq.test(table(math, statistics), correct = FALSE)
