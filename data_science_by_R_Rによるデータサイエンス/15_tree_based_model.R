library(rpart)

iris.rp <- rpart(Species~., data = iris)
print(iris.rp, digits=2)

plot(iris.rp, uniform=T, branch = 0.6, margin = 0.05)
text(iris.rp, use.n = T, all = T)

printcp(iris.rp)

# 何かわからなくなってきたから、使うときに調べる