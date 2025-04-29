library(dplyr)
library(readr)
library(tidyverse)
library(rpart)
library(rpart.plot)
library(scales)

rfm_df <- read.csv("rfm_dashboard.csv")

rfm_df %>%
  group_by(Segment) %>%
  summarise(
    Avg_Recency = mean(Recency),
    SD_Recency = sd(Recency),
    Avg_Frequency = mean(Frequency),
    SD_Frequency = sd(Frequency),
    Avg_Monetary = mean(Monetary),
    SD_Monetary = sd(Monetary)
  )


tree_model <- rpart(Segment ~ Recency + Frequency + Monetary, data = rfm_df, method = "class")
tree_model$variable.importance

set.seed(30)
rfm_split <- rfm_df %>%
  sample_frac(size = 0.3)

avg_recency <- mean(rfm_split$Recency)
avg_frequency <- mean(rfm_split$Frequency)

ggplot(rfm_split, aes(Recency, Frequency, color = Segment, size = Monetary)) +
  geom_point(alpha = 0.7) +
  geom_vline(xintercept = avg_recency, linetype = "dashed", color = "grey50") +
  geom_hline(yintercept = avg_frequency, linetype = "dashed", color = "grey50") +
  scale_size(labels = label_number(scale_cut = cut_short_scale())) +
  labs(title = "Customer Segmentation Scatter Plot",
       x = "Recency (Days Since Last Purchase)",
       y = "Frequency (Number of Purchases)",
       size = "Monetary (Total Spend)",
       caption = "source: Online Retail from UCI") +
  theme_minimal()
