set.seed(1234)
intercept <- 102.385888 # 切片
father_coef <- 0.316514 # coef...係数
mother_coef <- 0.021370
father <- rnorm(n=19, mean=166.84211, sd=5.90916)
mother <- rnorm(n=19, mean=155.94737, sd=4.63649)
residual <- rnorm(n=19, mean=0, sd=2.15664)
daughter <- intercept + father_coef * father + mother_coef * mother + residual
chap15data <- tibble(cbind(daughter, father, mother))
