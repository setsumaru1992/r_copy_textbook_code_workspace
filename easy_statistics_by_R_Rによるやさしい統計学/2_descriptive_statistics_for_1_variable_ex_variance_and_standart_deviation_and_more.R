test_a <- c(10, 13, 8, 15, 8)
mean_test_a <- mean(test_a)

# 分散(分散や標準偏差は散布度を測るために使用)
## 用意された関数を使わない愚直な書き方(標本分散: 分散計算時にデータ数で割る)
deviation_from_mean_test_a <- test_a - mean_test_a # 平均からの偏差
square_of_deviation_from_mean_test_a <- deviation_from_mean_test_a ^ 2
square_sum_of_deviation_from_mean_test_a <- sum(square_of_deviation_from_mean_test_a)

variance <- square_sum_of_deviation_from_mean_test_a / length(test_a)
variance # 7.76

## 用意された関数を使用(不偏分散: 分散計算時にデータ数 - 1で割る)
var(test_a) # 9.7

# 標準偏差
## 用意された関数を使わない愚直な書き方
standart_deviation <- sqrt(variance)
