# 繰り返し処理
## 単純なfor
df <- tibble(a = rnorm(10), b = rnorm(10), c = rnorm(10), d = rnorm(10))

## map
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
