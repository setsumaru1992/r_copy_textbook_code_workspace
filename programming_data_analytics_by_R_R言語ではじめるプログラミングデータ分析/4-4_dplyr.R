library(magrittr)
library(readr)
library(dplyr)

sales_beef_region <- read_csv("reference_files/2-9-2-sales_beef_region.csv")

select(sales_beef_region, beef)
sales_beef_region %>% select(beef)

iris %>% 
  as_tibble() %>%
  select(Sepal.Length, Species)

sales_meat <- read_csv("reference_files/2-9-4-sales-meat.csv")
sales_meat %>% 
  filter(category == "pork" & sales >= 40) %>% 
  select(sales) %>%
  arrange(sales) %>%
  arrange(desc(sales))

sales_meat %>% 
  arrange(category, desc(sales))

sales_population <- read_csv("reference_files/2-9-3-sales-population.csv")
sales_population %>% 
  mutate(log_beef = log(beef)) # カラム作成

sales_meat %>% 
  group_by(category) %>%
  # summarise(sales_mean = mean(sales)) %>%
  ungroup() %>%
  summarise(mean = mean(sales))
