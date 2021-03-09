# 型
## 型変換
class(5) # "numeric"
class(as.character(5)) # "character"
class(as.numeric("5")) # "numeric"
class(as.integer(5.5)) # "integer"
class(as.logical(-1)) # "logical"
class(as.factor(5)) # "factor"

## 型チェック
is.character("5") # TRUE
is.numeric(5) # TRUE
is.factor(factor(3)) # TRUE
is.na()
is.null()
is.nan()
is.infinite()

# ベクトル
temperatures <- c(20, 19, 23)
temperatures

