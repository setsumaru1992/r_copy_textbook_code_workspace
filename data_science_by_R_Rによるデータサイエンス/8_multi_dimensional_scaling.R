# 多次元尺度法(MDS...Multi-Dimentional Scaling)
## 計量MDS 古典的MDSであるclassical multidimensional scaling を使用
### 物理的距離に利用
eurodist
(eur.cmd <- cmdscale(eurodist))
plot(eur.cmd, type="n")
text(eur.cmd, rownames(eur.cmd))

### 物理的距離以外に使用
iris.dist <- dist(iris[, -5])
iris.cmd<-cmdscale(iris.dist)
plot(iris.cmd, type="n")
iris.labels <- factor(c(rep("S", 50), rep("C", 50), rep("V", 50)))
text(iris.cmd, labels=iris.labels, col=unclass(iris.labels))

## 非計量MDS
# install.packages("mlbench")
library(mlbench)
# install.packages("e1071")
set.seed(100)

p <- mlbench.corners(n=160)
labels <- as.numeric(p$classes)
x.dist <- dist(p$x)

library(MASS)
op <- par(mar = c(4.5, 4.5, 1, 1), mfrow = c(2,2))

plot(cmdscale(x.dist), pch = labels, col = labels)

plot(sammon(x.dist)$points, pch = labels, col = labels)

plot(isoMDS(x.dist)$points, pch = labels, col = labels)

# install.packages("vegan")
library(vegan)
x.dist2 <- as.matrix(x.dist)
plot(metaMDS(x.dist2)$point, pch = labels, col = labels)

par(op)

# 非計量MDSは何やってるかあんまよくわかんなかったな。