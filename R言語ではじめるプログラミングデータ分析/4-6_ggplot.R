library(readr)
library(dplyr)
library(ggplot2)

sales_beef <- read_csv("reference_files/2-9-1-sales-beef.csv")
sales_beef %>% print(n=3)

ggplot(data = sales_beef) + 
  geom_histogram(
    mapping = aes(x = beef),
    bins = 3,
    alpha = 0.7,
    colour = "black"
  ) +
  labs(title = "titleeeee") +
  xlab("Xxxxxxx") +
  ylab("Yyyyyy")
