source("reference_files/15_回帰分析/gen_data.R")
# lm(daughter ~ father + mother)
regression_result <- lm(daughter ~ father + mother)
summary(regression_result)
