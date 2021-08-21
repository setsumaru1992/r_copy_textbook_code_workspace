# 主成分分析(principal component analysis)
# https://mjin.doshisha.ac.jp/R/Chap_24/24.html
# 用途は次元圧縮？
tmp<-c( 
  50, 57, 74, 94, 112, 128, 140, 147, 150, 147, 140, 128, 112, 94, 74, 57, 
  57, 50, 57, 74, 94, 112, 128, 140, 147, 150, 147, 140, 128, 112, 94, 74, 
  74, 57, 50, 57, 74, 94, 112, 128, 140, 147, 150, 147, 140, 128, 112, 94, 
  94, 74, 57, 50, 57, 74, 94, 112, 128, 140, 147, 150, 147, 140, 128, 112, 
  112, 94, 74, 57, 50, 57, 74, 94, 112, 128, 140, 147, 150, 147, 140, 128
)

okamoto <- matrix(tmp, 16, 5, byrow=F)
colnames(okamoto) <- c("A", "B", "C", "D", "E")

okamoto_pc_result <- princomp(okamoto)
summary(okamoto_pc_result)

okamoto_pc_result$loadings
plot(okamoto_pc_result$loadings[, 1:2], type="n")
text(okamoto_pc_result$loadings, colnames(okamoto))
# 得られたものは元のABCDEの相対位置 ← 点1~16～ABCDEへの距離(5x16)がABCDEの相対距離(5x2)に変換された

# ここ以降はメリットを得られる場面になってから進もう