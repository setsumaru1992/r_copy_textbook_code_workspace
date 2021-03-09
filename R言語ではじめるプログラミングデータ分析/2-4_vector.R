## ベクトル
### ベクトルとそれを使った計算
temperatures <- c(20, 19, 23)
temperatures
mean_temperature <- mean(temperatures)
print(mean_temperature, digits = 3)

names(temperatures) <- c("Osaka", "Tokyo", "Nagoya")
temperatures

# 規則性を持つベクトル
1:5
class(1:3) # "integer" ベクトル関係のクラスじゃないんだ

rep(x=c(6,7), times= 4)
