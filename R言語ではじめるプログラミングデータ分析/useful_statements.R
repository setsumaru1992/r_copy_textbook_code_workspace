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

# for
for(i in 1:5){
  if(i >= 4) break()
  if(i %% 2 == 0) next()
  print(i)
}

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

# = と <- の違い(関数内では=使うみたい)
# https://qiita.com/tonhosshi/items/426edd9bbed802bd8c33


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