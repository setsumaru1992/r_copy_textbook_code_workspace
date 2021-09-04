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


# 階層的クラスター分析（not for 大量個体 大量個体には非階層クラスター）
seiseki.d <- dist(seiseki)
# round(seiseki.d)
(sei.hc <- hclust(seiseki.d))

summary(sei.hc)
sei.hc$merge
sei.hc$height
sei.hc$order
plot(sei.hc, hang = -1)

plot(hclust(selseki.d, "centroid"), hang = -1)
plot(hclust(dist(seiseki, "canberra"), "ward.D2"), hang = -1)

cutree(sei.hc, k=2)
cutree(sei.hc, k=3)

plot(sei.hc, hang = -1)
rect.hclust(sei.hc, k=2, border=c(2,4))

heatmap(seiseki)

cophenetic(sei.hc)

# 非階層的クラスター
## k-means法
(seiseki.km <- kmeans(seiseki, 2))
seiseki.km$cluster
