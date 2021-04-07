# ベクトル
## ベクトルとそれを使った計算
temperatures <- c(20, 19, 23)
temperatures
mean_temperature <- mean(temperatures)
print(mean_temperature, digits = 3)

names(temperatures) <- c("Osaka", "Tokyo", "Nagoya")
temperatures
# Osaka  Tokyo Nagoya 
# 20     19     23 

## 規則性を持つベクトル
1:5
class(1:3) # "integer" ベクトル関係のクラスじゃないんだ

rep(x=c(6,7), times= 4)

## ベクトル内の要素取得
vec_char <- c("A", "B", "C")
vec_char[c(TRUE, FALSE, TRUE)]

# 行列
mat_num <- matrix(
  data = c(1,2,3,4,5,6),
  ncol = 2
)
mat_num

## 要素取得
mat_num[2,1] # 2
mat_num[2,] # 2 5
mat_num[c(TRUE, TRUE, FALSE), c(FALSE, TRUE)] # 4 5

## 次元情報確認
ncol(mat_num) # 2
nrow(mat_num) # 3

