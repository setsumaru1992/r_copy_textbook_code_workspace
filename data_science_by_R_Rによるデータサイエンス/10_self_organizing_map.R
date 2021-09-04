# install.packages("kohonen")

## kohonen::sum
library(kohonen)
set.seed(10)

gr <- somgrid(topo = "hexagonal", xdim = 10, ydim = 7)
iris.som <- som(as.matrix(iris[, 1:4]), gr, rlen = 200)

plot(iris.som, type="codes")
label.cod <- as.numeric(iris[, 5])
plot(iris.som, type = "mapping", labels = label.cod, col = label.cod)

detach("package:kohonen")

## sum::sum
# install.packages("som")
library(som)
set.seed(80)

iris1 <- normalize(iris[,1:4])
iris.som2 <- som(iris1, xdim = 6, ydim = 5)
plot(iris.som2)
