# 🛒 Zepto E-commerce SQL Data Analysis

Welcome to **Krithi Sheregar’s Data Analysis Project**, inspired by real-world e-commerce inventory analytics!  
This project is based on a dataset scraped from **Zepto**, one of India’s fastest-growing quick-commerce startups.  
It replicates an end-to-end data analyst workflow — from **data exploration** and **cleaning** to **SQL-based business insights**.

---

## 📌 Project Overview

This project simulates how real-world data analysts in **retail and e-commerce** use SQL to generate actionable insights.  

**Objectives:**
- ✅ Create and clean an e-commerce inventory database  
- ✅ Perform **Exploratory Data Analysis (EDA)** to understand product categories, pricing, and availability  
- ✅ Apply **data cleaning** to handle nulls, invalid entries, and inconsistent units  
- ✅ Write **business-focused SQL queries** to extract insights on pricing, revenue, and stock levels  

---

## 📁 Dataset Overview

The dataset used in this project was sourced from [Kaggle - Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv).

Each record represents a unique SKU (Stock Keeping Unit) for a product.  
Duplicate names exist since the same product can appear under multiple package sizes, weights, or discount schemes — reflecting real-world catalog structures.

### **Columns:**
| Column Name | Description |
|--------------|-------------|
| **sku_id** | Unique identifier for each product entry |
| **name** | Product name as listed on Zepto |
| **category** | Product category such as Fruits, Snacks, Beverages, etc. |
| **mrp** | Maximum Retail Price (in ₹, converted from paise) |
| **discountPercent** | Discount applied on MRP |
| **discountedSellingPrice** | Final selling price after discount (in ₹) |
| **availableQuantity** | Units available in inventory |
| **weightInGms** | Product weight in grams |
| **outOfStock** | Boolean flag indicating stock availability |
| **quantity** | Number of units per package (sometimes mixed with grams) |

---

## 🔧 Project Workflow

### **1️⃣ Database & Table Creation**

We start by defining a SQL table schema that accurately represents the dataset structure:

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
2️⃣ Data Import
Use pgAdmin’s Import Tool or run the command below:

sql
Copy code
\copy zepto(category, name, mrp, discountPercent, availableQuantity,
            discountedSellingPrice, weightInGms, outOfStock, quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
⚙️ Note: If you face encoding issues, re-save your CSV file as CSV UTF-8.

3️⃣ Exploratory Data Analysis (EDA)
Performed EDA to understand data structure and quality:

Counted total records

Displayed dataset samples

Checked for NULL values

Analyzed unique product categories

Compared in-stock vs out-of-stock products

Identified products listed multiple times (duplicate SKUs)

4️⃣ Data Cleaning
Removed records where MRP or discounted price = 0

Converted prices from paise to rupees

Standardized inconsistent category names

Ensured numeric consistency in weights and quantities

5️⃣ Business Insights
Key analytical SQL queries include:

🏷️ Top 10 Best-Value Products (based on discount %)

🚫 High-MRP Out-of-Stock Products

💰 Potential Revenue per Product Category

🧾 Expensive Products (MRP > ₹500) with Minimal Discount

📦 Top 5 Categories with Highest Average Discounts

⚖️ Price per Gram Analysis — to identify value-for-money items

🧺 Weight-Based Product Segmentation (Low, Medium, Bulk)

⚖️ Total Inventory Weight by Category

💻 How to Use This Project
Clone the Repository

bash
Copy code
git clone https://github.com/<your-github-username>/zepto-sql-data-analysis.git
cd zepto-sql-data-analysis
Open the SQL File

bash
Copy code
zepto_SQL_data_analysis.sql
This file contains:

Table creation scripts

EDA and data cleaning SQL

Business analysis queries

Load the Dataset

Open pgAdmin or any PostgreSQL client

Create a new database (e.g., zepto_db)

Run the SQL file

Import the dataset (ensure UTF-8 encoding)

🧠 Learnings & Takeaways
Through this project, I practiced:

Writing efficient SQL queries

Handling real-world messy data

Performing data-driven business analysis

Deriving insightful KPIs for inventory optimization

Presenting findings as part of a data analytics portfolio

👩‍💻 About the Author
Hi, I’m Krithi Sheregar — a passionate Data Analyst skilled in SQL, Power BI, and automation tools like Power Automate and Python scripting.
I enjoy solving business problems through data and building dashboards that tell impactful stories.

Let’s connect and grow together!

🌐 LinkedIn: Krithi Sheregar

📧 Email: krithi.sheregar@gmail.com


💬 Acknowledgement
Dataset Source: Kaggle - Zepto Inventory Dataset
