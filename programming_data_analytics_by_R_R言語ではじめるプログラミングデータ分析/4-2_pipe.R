library(magrittr)

temperature <- c(20, 19, 23)
temperature %>% mean()

# %>%はパイプ演算子
favorite_food <- read.csv("reference_files/2-9-6-favorite-food.csv")
target_data <- favorite_food$favorite_food
target_data %>% table() %>% prop.table()

# %T>%はティー演算子。この演算子以下は直後の出力が使用されなくなる（変数に入れる値を一旦ビジュアライズするときとか便利）
hoge <- target_data %>% 
  table() %T>%
  barplot()
hoge