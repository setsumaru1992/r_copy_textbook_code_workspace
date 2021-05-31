library(tidyverse)
library(stringr)

# 基本文字列操作
str_length("123456789") # 9 文字列の長さ
str_c("x", "y", sep = ",") # x,y 文字列連結
str_c("prefix-", c("a", "b", "c"), "-suffix") # "prefix-a-suffix" "prefix-b-suffix" "prefix-c-suffix"

str_split("aaaaaabaaabaaaaaabaaaaaaaaaaaaabaa", "b") # 分割


## 正規表現
str_view(c("apple", "banana", "pear"), ".*e.*") # デバッグ的にヒットしてる部分を見る
### 他言語で言うところのtest
str_detect(c("apple", "banana", "pear"), ".*e.*") # TRUE FALSE  TRUE 第一引数は文字列でも可
### 他言語で言うところのmatch
str_extract_all("abaabaaab", "ab")
str_extract("abaabaaab", "ab")

### 置換
str_replace_all("abaabaaab", "ab", "xy")
str_replace("abaabaaab", "ab", "xy")

