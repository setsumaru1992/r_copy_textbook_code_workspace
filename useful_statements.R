# ワークスペース関連
getwd() # 現在のワークスペース取得([デフォルト]RStudioでのコンソール: プロジェクトルート ファイル実行時: ファイルの場所)
setwd("R言語ではじめるプログラミングデータ分析")

# if
money <- 12000
if(money < 10000){
  print("所持金は1万円未満です")
} else if(money >= 10000 & money < 20000){
  print("所持金は1~2万円です")
} else {
  print("所持金は2万円以上です")
}

succeed <- TRUE
ifelse(succeed, "OK", "以上")

## 複数条件指定時の記法(&&も使えるけど、tibbleのfilterとかで使えないからRは&1つに慣れとく)
TRUE & FALSE
FALSE | FALSE

# 繰り返し処理
for(i in 1:5){
  if(i >= 4) break()
  if(i %% 2 == 0) next()
  print(i)
}

## 単純なfor
for(i in 1:5){
  if(i >= 4) break()
  if(i %% 2 == 0) next()
  print(i)
}

## map
df <- tibble(a = rnorm(10), b = rnorm(10), c = rnorm(10), d = rnorm(10))
df %>% map_dbl(mean) # 0.43781598 -0.61746885  0.01358036  0.46859937

### 使う関数によって返り値が異なる
# map: list
# map_lgl: booleanベクトル
# map_int: integerベクトル
# map_dbl: doubleベクトル
# map_chr: stringベクトル

## reduce
vs <- list(
  c(1,3,5,6,10),
  c(1,2,3,7,8,10),
  c(1,2,3,4,8,9,10)
)
vs %>% 
  reduce(intersect) # 1  3 10 intersectは共通部分を出力する

### こんなアクロバティックなことも可能
dfs <- list(
  age = tibble(name = "John", age = 30),
  sex = tibble(name = c("John", "Mary"), sex = c("M", "F")),
  trt = tibble(name = "Mary", treatment = "A")
)
dfs %>% reduce(full_join)

## walk(他言語で言うところのeach。walk2,pwalkなど派生形あり)
list(1, "a", 3) %>% 
  walk(print)

## tips
tibble(iris) # 150 x 5
### keep(他言語で言うところのselect,filter)
tibble(iris) %>%
  keep(is.factor) # 150 x 1

### discard(他言語で言うところのdelete_if)
tibble(iris) %>%
  discard(is.factor) # 150 x 4

# ファイル入出力
## データとしてのCSV読み込み
height_csv <- read_csv(file = "reference_files/2-1-1-height.csv")
# library(tidyverse)
# read.csvで読み込むDataFrameよりもtidyverseのread_csvで読み込むtibbleのほうが速いし見やすい

## Rubyでいうrequire_relative的なファイル読み込み
source("hoge_print.R")
hoge_print()

## Rスクリプトファイルのターミナルからの実行
# $ Rscript hoge.R

## ファイル書き込み
tbl_crab <- tibble(
  sex = rep(c("male", "female"), each = 3),
  sell_width = c(13,14,14,6,7,6),
  scissors_width = c(2,3,3,1,2,2)
)
write_csv(tbl_crab, file = "crab-tbl.csv")

### 中間データの保存ならRDS形式もあり。型を保持した状態で復元できる。
write_rds(tbl_crab, file = "crab-tbl.rds")

# df_crab <- data.frame(
#   sex = rep(c("male", "female"), each = 3),
#   sell_width = c(13,14,14,6,7,6),
#   scissors_width = c(2,3,3,1,2,2)
# )
# write.csv(
#   x = df_crab, # 出力したいデータ
#   file = "2-7.csv",
#   quote = FALSE,
#   row.names = FALSE # 行番号有無
# )


# ライブラリ読み込み
## パッケージをインストールする(rubyでいうgem install)
install.packages("tidyverse")
## パッケージを読み込む(rubyでいうrequire。ターミナル開くたびに実行必要)
library(tidyverse)

# tidyverseは以下のようなライブラリを提供
# ggplot2: 可視化
# dplyr: データ操作(SQLのselectやwhereなど前処理)



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

## = と <- の違い(関数内では=使うみたい)
# https://qiita.com/tonhosshi/items/426edd9bbed802bd8c33

## ~(チルダ)
# https://rion778.hatenablog.com/entry/20091109/1257791351
# すごくおおざっぱな言い方をすると，チルダ"~"の左側の変数を右側の式で説明するモデルを作成する


# データ
## tibbleデータの操作(ANDのときなどは「&」1つ)
sales_meat <- read_csv("reference_files/2-9-4-sales-meat.csv")
sales_meat %>% 
  filter(category == "pork" & sales <= 40) %>% # where
  select(sales) # select

sales_meat %>% 
  arrange(category, desc(sales)) # order by 

sales_population <- read_csv("reference_files/2-9-3-sales-population.csv")
sales_population %>% 
  mutate(log_beef = log(beef)) # カラム作成

### 集計
sales_meat %>% 
  group_by(category) %>%
  summarise(sales_mean = mean(sales))

#### グループ化解除 ungroupはまだあまりわかってない
sales_meat %>% 
  group_by(category) %>%
  ungroup() %>%
  summarise(mean = mean(sales))

## データの結合
tbl_sales <- read_csv("reference_files/4-7-4-tbl-sales.csv")
tbl_product <- read_csv("reference_files/4-7-5-tbl-product.csv")

tbl_sales %>% 
  inner_join(tbl_product, by = c("product_id" = "id")) # ON tbl_product.product_id = tbl_sales.id



# ベクトル
temperatures <- c(20, 19, 23)
temperatures

length(temperatures) # 3

## 要素取得
temperatures[1] # 20
temperatures[temperatures >= 20] # 20     23 

## Rでいうリストは多言語の連想配列で、データフレームの基底クラス
list_college_member <- list(
  school_year = 2,
  member = c("taro", "hanako")
)


# データフレーム
df_crab <- data.frame(
  sex = rep(c("male", "female"), each = 3),
  sell_width = c(13,14,14,6,7,6),
  scissors_width = c(2,3,3,1,2,2)
)

df_crab$sex

## データフレームの読み出し
head(df_crab, n=2)
names(df_crab) # "sex"            "sell_width"     "scissors_width"
subset(df_crab, subset = df_crab$sex == "male")


# 基本文字列操作
str_length("123456789") # 9 文字列の長さ
str_c("x", "y", sep = ",") # x,y 文字列連結
str_c("prefix-", c("a", "b", "c"), "-suffix") # "prefix-a-suffix" "prefix-b-suffix" "prefix-c-suffix"

str_split("aaaaaabaaabaaaaaabaaaaaaaaaaaaabaa", "b") # 分割


## 正規表現
str_view(c("apple", "banana", "pear"), ".*e.*") # デバッグ的にヒットしてる部分を見る
### 他言語で言うところのtest
str_detect(c("apple", "banana", "pear"), ".*e.*") # TRUE FALSE  TRUE 第一引数は文字列でも可
### 他言語で言うところのmatch
str_extract_all("abaabaaab", "ab")
str_extract("abaabaaab", "ab")

### 置換
str_replace_all("abaabaaab", "ab", "xy")
str_replace("abaabaaab", "ab", "xy")



# 日付、日時
date_ymd <- ymd("20210408")
datetime_ymdhms <- ymd_hms("20210408214916")
make_date(year = 2021, month = 4, day = 8)

year(date_ymd)
date_ymd %>% year()

datetime_ymdhms # "2021-04-08 21:49:16 UTC"
month(datetime_ymdhms) <- 10
datetime_ymdhms # "2021-10-08 21:49:16 UTC"

## 日時を扱えるPOSIXct。POSIXltもあるが、POSIXctが主流
as.POSIXct("2019-02-03 10:20:05")


# ビジュアライズ
## 基本
sales_beef <- read_csv("reference_files/2-9-1-sales-beef.csv")
sales_beef %>% print(n=3)

ggplot(data = sales_beef) + # ggplotは場の用意で"+"で描画方法の指定
  geom_histogram( # ベースの描画手法は"geom_xxx"。xxxにhistogramやlineが入る
    mapping = aes(x = beef),
    bins = 3,
    alpha = 0.7,
    colour = "black"
  ) +
  labs(title = "titleeeee") +
  xlab("Xxxxxxx") +
  ylab("Yyyyyy")

## ファセット プロットを分割したもの。セルのような概念
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

### クロス集計
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

# 型
as.factor(5) # ファクター型 idやラベルのようなもの。男を1、女を2としたときに2*3=6ような計算をしないようにfactor型は1つの独立した要素であり、四則演算できない

## boolean
TRUE
FALSE

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