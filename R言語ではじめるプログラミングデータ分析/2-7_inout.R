getwd() # 現在のワークスペース取得([デフォルト]RStudioでのコンソール: プロジェクトルート ファイル実行時: ファイルの場所)
setwd("R言語ではじめるプログラミングデータ分析")

# csv読み込み(今回は相対パスでの記述だが絶対パスでの記述も可能)
height_csv <- read.csv(file = "reference_files/2-1-1-height.csv")

# Rスクリプトファイルのターミナルからの実行
# $ Rscript hoge.R


df_crab <- data.frame(
  sex = rep(c("male", "female"), each = 3),
  sell_width = c(13,14,14,6,7,6),
  scissors_width = c(2,3,3,1,2,2)
)
write.csv(
  x = df_crab, # 出力したいデータ
  file = "2-7.csv",
  quote = FALSE,
  row.names = FALSE # 行番号
)
