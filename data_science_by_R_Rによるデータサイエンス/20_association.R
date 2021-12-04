library(arules)

# データ作成
transaction_lists <- list(
  c("パン", "牛乳", "ハム", "果物"),
  c("パン", "オムツ", "ビール", "ハム"),
  c("ソーセージ", "ビール", "オムツ"),
  c("弁当", "牛乳", "ビール", "オムツ"),
  c("弁当", "ビール", "ジュース", "果物")
)
transactions <- as(transaction_lists, "transactions")

# データ閲覧
as(transactions, "matrix")
itemFrequencyPlot(transactions, type = "absolute")

# バスケット分析
## 素の実行
association_result <- apriori(transactions)
inspect(sort(association_result, by = "support"), n = 6)

## オプション設定
association_result_with_option <- apriori(transactions, parameter = list(supp = 0.2, maxlen=3))
inspect(sort(association_result_with_option, by = "support"), n = 20)

## Income
# transactionに商品群の代わりにfeaturesを詰めている
# 商品例: {パン、牛乳、ハム、果物}
# feature例: {income=$40,000+, sex=male, marital status=married, age=35+, education=college graduate, occupation=homemaker, years in bay area=10+, dual incomes=no, number in household=2+, number of children=1+, householder status=own, type of home=house, ethnic classification=white, language in home=english} 
data("Income")
Income
op <- par(mar=c(4.5, 2, 1, 2), cex = 0.65, cex.axis = 0.7)
itemFrequencyPlot(Income, cex = 0.8, col = "lightblue")
par(op)

income_association_rules <- apriori(Income)
summary(income_association_rules)

income_association_rules2 <- subset(income_association_rules, subset = rhs %in% "income=$40,000+" & lift >2)
inspect(sort(income_association_rules2)[1:3])
# lhs                                     rhs                 support confidence  coverage     lift count
# [1] {occupation=professional/managerial,                                                                   
# householder status=own}             => {income=$40,000+} 0.1384526  0.8074640 0.1714660 2.138722   952
# [2] {occupation=professional/managerial,                                                                   
# householder status=own,                                                                               
# language in home=english}           => {income=$40,000+} 0.1336533  0.8075571 0.1655032 2.138969   919
# [3] {dual incomes=yes,                                                                                     
# householder status=own}             => {income=$40,000+} 0.1260908  0.8156162 0.1545957 2.160315   867