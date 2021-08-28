tmp <- c(
  89,90,67,46,50,
  57,70,80,85,90,
  80,90,35,40,50,
  40,60,50,45,55,
  78,85,45,55,60,
  55,65,80,75,85,
  90,85,88,92,95
)
seiseki <- matrix(tmp, 7, 5, byrow = TRUE)
colnames(seiseki) <- c("算数", "理科", "国語", "英語", "社会")
rownames(seiseki) <- c("田中", "佐藤", "鈴木", "本田", "川端", "吉野", "斉藤")

# install.packages("psych")
library(psych)
fa.parallel(seiseki) # Parallel analysis suggests that the number of factors =  2  and the number of components =  2

# 因子分析
(seiseki.fac <- factanal(seiseki, factor = 2))

barplot(seiseki.fac$loadings[,1], col = "lightblue")
barplot(seiseki.fac$loadings[,2], col = "lightblue")
