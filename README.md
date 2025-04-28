# Customer Segmentation & Mini ML Model
RFM Analysis and Decision Tree Modeling for Customer Segmentation.

# 📖 Project Overview
This project focuses on segmenting customers based on RFM analysis (Recency, Frequency, Monetary) and developing a simple Decision Tree Machine Learning model to predict customer segments.

By understanding customer behaviors, businesses can design targeted marketing strategies, improve customer loyalty, and maximize revenue growth.

# 🎯 Objectives
- Perform RFM Analysis to cluster customers into meaningful groups.
- Build a Decision Tree model to classify customer segments.
- Create an interactive dashboard to explore customer behaviors.
- Provide actionable marketing recommendations based on data insights.

# 🛠 Dataset Information
- Source: Online Retail Dataset — UCI Machine Learning Repository
- Period: 01/12/2010 - 09/12/2011
- Country: United Kingdom
- Details: Transactional data from a non-store online retail business selling unique gifts.
 ## Fields used for analysis:
 - CustomerID
 - InvoiceDate
 - Quantity
 - UnitPrice
 - InvoiceNo
 - Country

# 🧹 Data Preparation
- Removed canceled transactions.
- Filtered only positive Quantity and UnitPrice records.
- Removed missing Customer IDs.
- Created RFM Table for customer segmentation.

# 🤖 Machine Learning Models

Model | Accuracy | Key Characteristics
K-Nearest Neighbors | 95.4% | Simple, slow with large datasets
Decision Tree | 98.6% | Easy to interpret, risk of overfitting
Random Forest | 99.6% | High accuracy, less interpretable

Although Random Forest achieved the highest accuracy, 
Decision Tree was selected for its high interpretability 
and practical application for business decision-making.

