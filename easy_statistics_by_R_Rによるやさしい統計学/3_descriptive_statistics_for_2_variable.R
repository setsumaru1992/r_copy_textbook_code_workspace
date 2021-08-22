library(tidyverse)
shidoho_data <- tibble(read_csv("reference_files/shidoho_data.csv"))
psycho_score <- shidoho_data$psycho_score
statistics_score_1 <- shidoho_data$statistics_score_1
statistics_score_2 <- shidoho_data$statistics_score_2

# 共分散(偏差の積の合計)
## 用意された関数を使わない愚直な書き方(標本分散: 分散計算時にデータ数で割る)
covariance <- sum((statistics_score_1 - mean(statistics_score_1)) * (statistics_score_2 - mean(statistics_score_2))) / length(statistics_score_1)
covariance # 7.55

## 用意された関数を使用(不偏分散: 分散計算時にデータ数 - 1で割る)
cov(statistics_score_1, statistics_score_2) # 7.95
