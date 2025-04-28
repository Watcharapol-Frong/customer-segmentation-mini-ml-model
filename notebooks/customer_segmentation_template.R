# ----------------------------------------------------
# Project: Customer Segmentation & Mini ML Model
# Tool: R
# Author: [Watcharapol Charoensuk]
# ----------------------------------------------------

# 1. Load Libraries
library(dplyr)
library(readr)
library(caret)
library(rpart)
library(rpart.plot)


# 2. Load Data
# - Check data 
online_retail <- read.csv("online_retail.csv")

# Check data 
dim(online_retail)
glimpse(online_retail)
colSums(is.na(online_retail))
colSums(is.na(online_retail)) / nrow(online_retail) * 100  # % NA ต่อ column

# 3. Clean Data
# - Remove canceled orders
# - Remove missing customerID
# - Filter positive Quantity and unitPrice

online_retail_clean <- online_retail %>%
  filter(!grepl("^C", InvoiceNo)) %>% #Filter Credit Note Receipt
  filter(!is.na(CustomerID)) %>% #Delete NA without CustomerID
  filter(Quantity > 0, UnitPrice > 0) %>% #Filter data unreasonable
  mutate(TotalPrice = Quantity * UnitPrice) #Calculate total sales

online_retail_clean <- online_retail_clean %>%
  mutate(CustomerID = as.character(CustomerID))

# 4. Feature Engineering
# - Create RFM Table
# - Clustering
cutoff_date <- as.Date(max(online_retail_clean$InvoiceDate)) + 1

rfm_table <- online_retail_clean %>%
  mutate(InvoiceDate = as.Date(InvoiceDate)) %>%
  group_by(CustomerID) %>%
  summarise(
    Recency = as.numeric(difftime(cutoff_date, max(InvoiceDate), units = "days")),
    Frequency = n_distinct(InvoiceNo),
    Monetary = sum(TotalPrice)
  )

# Clustering
rfm_scaled <- scale(rfm_table[, -1])  # remove CustomerID before scaling
set.seed(30)
kmeans_result <- kmeans(rfm_scaled, centers = 4, nstart = 25)
# Add Cluster into RFM table
rfm_table <- rfm_table %>%
  mutate(Cluster = as.factor(kmeans_result$cluster))

# 5. Split data train & test
split_data <- function(data) {
  set.seed(30)
  n <- nrow(data)
  id <- sample(1:n, size = 0.7*n)
  train_df <- data[id, ]
  test_df <- data[-id, ]
  return( list(train = train_df,
              test = test_df) )
}

prep_df <- split_data(rfm_table)

# 6. Mini ML Model (Decision Tree)
set.seed(30)
ctrl <- trainControl(method = "cv",
                     number = 5)
tree_model <- train(Cluster ~ Recency + Frequency + Monetary,
                    data = prep_df$train,
                    method = 'rpart', # decision tree
                    metric = "Accuracy",
                    trControl = ctrl)

knn_model <- train(Cluster ~ Recency + Frequency + Monetary,
                   data = prep_df$train,
                   method = "knn",
                   metric = "Accuracy",
                   trControl = ctrl)

forest_model <- train(Cluster ~ Recency + Frequency + Monetary,
                      data = prep_df$train,
                      method = 'rf',
                      metric = 'Accuracy',
                      trControl = ctrl)

# score and evaluate
p <- predict(tree_model, newdata = prep_df$test)
p_knn <- predict(knn_model, newdata = prep_df$test)
p_forest <- predict(forest_model, newdata = prep_df$test)

acc <- mean(p == prep_df$test$Cluster)
acc_knn <- mean(p_knn == prep_df$test$Cluster)
acc_forest <- mean(p_forest == prep_df$test$Cluster)

rpart.plot(tree_model$finalModel)

# 7. Prepare Data for Dashboard
rfm_table$PredictedCluster <- predict(tree_model, newdata = rfm_table)

dashboard_data <- rfm_table %>%
  mutate(CustomerID = as.character(CustomerID),
         Cluster = as.character(Cluster),
         PredictedCluster = as.character(PredictedCluster)) %>%
  select(CustomerID, Recency, Frequency, Monetary, Cluster, PredictedCluster)
  
write.csv(dashboard_data, "rfm_dashboard.csv", row.names = FALSE)
write.csv(online_retail_clean, "online_retail_clean.csv",row.names = FALSE)

# 8. Save Outputs
saveRDS(tree_model, "decision_tree_model.rds")
saveRDS(knn_model, "knn_model.rds")
saveRDS(forest_model, "forest_model.rds")