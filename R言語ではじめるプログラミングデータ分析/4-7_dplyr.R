library(readr)
library(ggplot2)
library(tidyr)
library(dplyr)

tidy_1 <- read_csv("reference_files/4-7-1-tidy-data-1.csv")
messy_1 <- read_csv("reference_files/4-7-2-messy-data-1.csv")

ggplot(data = tidy_1) + 
  geom_line(aes(x = time, y = sales, colour = product)) +
  ylim(0, 40) + 
  scale_x_date(date_labels = "%m月%d")

tbl_sales <- read_csv("reference_files/4-7-4-tbl-sales.csv")
tbl_product <- read_csv("reference_files/4-7-5-tbl-product.csv")

tbl_sales %>% 
  inner_join(tbl_product, by = c("product_id" = "id")) # ON tbl_product.product_id = tbl_sales.id
