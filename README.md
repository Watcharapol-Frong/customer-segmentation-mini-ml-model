# Customer Segmentation & Mini ML Model
RFM Analysis and Decision Tree Modeling for Customer Segmentation.
Blog: [Customer Segmentation ML Model](https://frongwatcharapol.com/2025/04/29/customer-segmentation-ml-model/)

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

| Model | Accuracy | Key Characteristics |
|:--------|:--------|:--------|
| K-Nearest Neighbors | 95.4% | Simple, slow with large datasets |
| Decision Tree | 98.6% | Easy to interpret, risk of overfitting |
| Random Forest | 99.6% | High accuracy, less interpretable |

Although Random Forest achieved the highest accuracy, 
Decision Tree was selected for its high interpretability 
and practical application for business decision-making.

# 📈 Dashboard
Interactive dashboard created to explore customer segments and behaviors.

🔗 View Dashboard ([Looker Studio](https://lookerstudio.google.com/reporting/e3f177c7-548c-49c8-97cc-18c34a787ad9))

# 🧠 Customer Segments
- Loyal Customers: Frequent purchasers with moderate spending.
- At Risk Customers: Previously active but now declining.
- Best Customers: High spenders, highly active.
- Super VIP Customers: Top-tier, ultra-loyal, and high-spending customers.

# 📢 Campaign Recommendations
- Loyal Customers: Loyalty rewards, exclusive promotions.
- At Risk Customers: Re-engagement campaigns with special offers.
- Best Customers: VIP treatment, early access programs.
- Super VIP Customers: Personalized services, exclusive events.

# Report
View [Customer Segmentation & Mini ML Model](https://drive.google.com/file/d/1suNGfIxiOzB2C_SS0YbmFMCt8eVIcFmS/view?usp=sharing)

# 📂 Project Files
| File | Description |
|:--------|:--------|
| `Customer_Segmentation_Report_EN.pdf` | Full project report (English) |
| `data/data.txt` | Cleaned dataset link |
| `data/rfm_dashboard.xlsx` | RFM Segmentation Table |
| `dashboard/RFM_LookerStudio_Link.txt` | Link to the interactive dashboard |
| `models/decision_tree_model.png` | Visualization of Decision Tree Model |
| `notebooks/customer_segmentation_template.R` | RFM analysis and Decision Tree modeling code |

# 👨‍💻 Contact
Frong Watcharapol

📧 Email: frongbook@hotmail.com

🌐 Website: [frongwatcharapol.com](www.......com)

🔗 LinkedIn: [Watcharapol Charoensuk](www.linkedin.com/in/watcharapol-charoensuk-336b4a342)
