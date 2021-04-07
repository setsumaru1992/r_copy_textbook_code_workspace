df_crab <- data.frame(
  sex = rep(c("male", "female"), each = 3),
  shell_width = c(13,14,14,6,7,6),
  scissors_width = c(2,3,3,1,2,2)
)

df_crab$sex <- as.factor(df_crab$sex)

# 要素の取得
df_crab$sex # male   male   male   female female female
## 二重角カッコ→列の取得
df_crab[["sex"]] # male   male   male   female female female
## 一重角カッコ→座標での取得
df_crab[,1] # male   male   male   female female female
df_crab[1,] # 1 male         13              2
df_crab[, c("sex", "shell_width")]
df_crab[1, "shell_width"] # 13

# データフレームの読み出し
head(df_crab, n=2)
names(df_crab) # "sex"            "sell_width"     "scissors_width"
subset(df_crab, subset = df_crab$sex == "male")
