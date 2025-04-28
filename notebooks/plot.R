library(dplyr)
library(readr)
library(tidyverse)

rfm_df <- read.csv("rfm_dashboard.csv")

set.seed(30)
rfm_split <- rfm_df %>%
  sample_frac(size = 0.3)

ggplot(rfm_split, aes(Recency, Monetary, color = Segment)) +
  geom_point(size = 3, alpha = 0.7) +
  theme_minimal() +
  labs(title = "Customer Segmentation Scatter Plot",
       x = "Recency (Days Since Last Purchase)",
       y = "Monetary (Total Spend)",
       caption = "source: Online Retail from UCI")
