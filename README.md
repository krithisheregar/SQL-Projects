
# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/0/0f/Zepto_logo.png" alt="Zepto Logo" width="150">
</p>

Welcome to **Krithi Sheregar’s Data Analyst Portfolio Project**, inspired by real-world **e-commerce inventory analytics**!  
This project is based on a dataset scraped from **Zepto**, one of India’s fastest-growing quick-commerce startups.  
It replicates an end-to-end data analyst workflow — from **data exploration** and **cleaning** to **SQL-driven business insights**.

---

## 💜 Project Overview

This project simulates how real-world **data analysts in retail and e-commerce** use SQL to generate actionable insights.  

### **Objectives**
- ✅ Create and clean an e-commerce inventory database  
- ✅ Perform **Exploratory Data Analysis (EDA)** to understand product categories, pricing, and availability  
- ✅ Handle **data cleaning** for nulls, invalid entries, and inconsistent units  
- ✅ Write **business-focused SQL queries** to extract insights on pricing, revenue, and stock levels  

---

## 📁 Dataset Overview

The dataset comes from [Kaggle - Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv).  

Each record represents a **unique SKU (Stock Keeping Unit)**. Duplicate names exist since products may appear in multiple package sizes, weights, or discounts — mirroring real-world catalog structures.

### **Columns**
| Column | Description |
|--------|-------------|
| **sku_id** | Unique identifier for each product |
| **name** | Product name listed on Zepto |
| **category** | Product category (Fruits, Snacks, Beverages, etc.) |
| **mrp** | Maximum Retail Price (₹) |
| **discountPercent** | Discount applied on MRP |
| **discountedSellingPrice** | Final selling price after discount (₹) |
| **availableQuantity** | Units available in inventory |
| **weightInGms** | Product weight (grams) |
| **outOfStock** | Boolean flag indicating stock availability |
| **quantity** | Number of units per package |

---

## 🔧 Project Workflow

### **1️⃣ Database & Table Creation**
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
````

### **2️⃣ Data Import**

Use **pgAdmin’s Import Tool** or run:

```sql
\copy zepto(category, name, mrp, discountPercent, availableQuantity,
            discountedSellingPrice, weightInGms, outOfStock, quantity)
FROM 'data/zepto_v2.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
```

⚙️ *Tip: If encoding issues occur, re-save CSV as UTF-8.*

---

### **3️⃣ Exploratory Data Analysis (EDA)**

* Counted total records
* Sampled dataset for preview
* Checked for NULLs
* Analyzed unique product categories
* Compared **in-stock vs out-of-stock**
* Identified **duplicate SKUs**

---

### **4️⃣ Data Cleaning**

* Removed records with MRP or discounted price = 0
* Converted prices from **paise → rupees**
* Standardized category names
* Ensured numeric consistency in **weights and quantities**

---

### **5️⃣ Business Insights (SQL Queries)**

* 🏷️ **Top 10 Best-Value Products** (highest discount %)
* 🚫 **High-MRP Out-of-Stock Products**
* 💰 **Potential Revenue per Product Category**
* 🧾 **Expensive Products (MRP > ₹500) with Minimal Discount**
* 📦 **Top 5 Categories with Highest Average Discounts**
* ⚖️ **Price per Gram Analysis**
* 🧺 **Weight-Based Product Segmentation** (Low, Medium, Bulk)
* ⚖️ **Total Inventory Weight by Category**

---

## 💻 How to Use This Project

1. **Clone the Repository**

```bash
git clone https://github.com/<your-github-username>/zepto-sql-data-analysis.git
cd zepto-sql-data-analysis
```

2. **Open the SQL File**

```bash
zepto_SQL_data_analysis.sql
```

Contains:

* Table creation scripts
* EDA & data cleaning SQL
* Business analysis queries

3. **Load the Dataset**

* Open **pgAdmin** or any PostgreSQL client
* Create a new database (e.g., `zepto_db`)
* Run the SQL file
* Import dataset (ensure **UTF-8 encoding**)

---

## 🧠 Learnings & Takeaways

Through this project, I practiced:

* Writing **efficient SQL queries**
* Handling **real-world messy data**
* Performing **data-driven business analysis**
* Deriving **KPIs for inventory optimization**
* Presenting **insights for a data analytics portfolio**

---

## 👩‍💻 About the Author

Hi, I’m **Krithi Sheregar** — a passionate Data Analyst skilled in SQL, Power BI, and automation tools like Power Automate & Python.
I enjoy solving **business problems through data** and building **dashboards that tell impactful stories**.

🌐 [LinkedIn](https://www.linkedin.com/in/krithi-sheregar) | 📧 [krithi.sheregar@gmail.com](mailto:krithi.sheregar@gmail.com)

---

## 💬 Acknowledgements

Dataset Source: [Kaggle - Zepto Inventory Dataset](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset/data?select=zepto_v2.csv)
