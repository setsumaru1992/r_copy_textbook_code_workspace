money <- 8000
if(money < 10000){
  print("所持金は1万円未満です")
} else if(money >= 10000 && money < 20000){
  print("所持金は1~2万円です")
} else {
  print("所持金は2万円以上です")
}

succeed <- TRUE
ifelse(succeed, "OK", "以上")

for(i in 1:3){
  print(i)
}