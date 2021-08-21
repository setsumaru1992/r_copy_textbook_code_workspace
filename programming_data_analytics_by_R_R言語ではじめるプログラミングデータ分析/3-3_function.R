# 関数(rubyと同様に最後の式の結果が返り値)
int_division <- function(x, y = 2) {
  if(y == 0) stop("割る数は0以外を指定してください。")
  x %/% y # %/%は整数商を出力する演算子
}
int_division(7,3) # 2
int_division(x = 7) # 3

a <- c(7,7,7,7)
b <- c(3,0,8,4)
for(i in 1:length(a)){
  tryCatch(
    expr = {
      print(int_division(a[i], b[i]))
    }, 
    error = function(e){
      message("エラー発生")
      message(e)
    },
    finally = {
      message("処理終了")
    }
  )
}