# E-Commerce Sales Analysis

![Python](https://img.shields.io/badge/Python-3.x-blue) ![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![Tableau](https://img.shields.io/badge/Tableau-Dashboard-lightblue)

## 📌 Project Overview

This project analyzes product-level sales data from an Alibaba e-commerce platform, covering 864,771 records across multiple warehouse regions in China. The goal was to understand sales performance, customer purchasing behavior, and traffic conversion patterns — presented through an interactive Tableau dashboard.

---

## 🗂 Dataset

- **Source:** Alibaba e-commerce competition dataset
- **Table:** `item_store_feature`
- **Period:** October 2014 – December 2015
- **Size:** 864,771 rows × 32 columns
- **Granularity:** Daily product-warehouse level behavioral and transaction data

---

## ❓ Business Questions

- How has revenue trended over time, and when did peak sales occur?
- Which warehouse regions and product categories drive the most revenue?
- Where do customers drop off in the purchase funnel?
- Which products are high-traffic but low-conversion, and which are hidden gems?

---

## 🛠 Tech Stack

| Tool | Purpose |
|------|---------|
| Python (pandas, matplotlib) | Data cleaning & EDA |
| MySQL | Data storage & metric calculation |
| Tableau | Interactive dashboard & visualization |

---

## 🔄 Workflow

### 1️⃣ Data Cleaning — Python
- Assigned column names to raw data (no header in source file)
- Converted `date` from integer format (e.g. `20151226`) to datetime
- Converted ID fields to appropriate data types
- Checked for missing values and duplicates — none found
- Visualized all numerical variables using boxplots to assess distribution
- Outliers retained as they reflect real business behavior (e.g. high-traffic hero products)

### 2️⃣ Data Storage & Analysis — MySQL
- Loaded cleaned data into MySQL via SQLAlchemy and `to_sql()`
- Computed derived metrics:
  - Conversion Rate (CVR) = unique buyers / page visitors
  - Cart-to-order rate
  - Average order value
  - Monthly and category-level revenue aggregations
- Classified products into performance quadrants: **Star Product · Hidden Gem · Needs Review · Long Tail**

### 3️⃣ Visualization — Tableau
Two-page interactive dashboard with filters for year/month, warehouse, and category:

**Page 1 — Sales Overview**
- KPI cards: Total Revenue · Avg Order Value · Orders · CVR
- Monthly revenue trend
- Revenue by warehouse region
- Revenue by category (treemap)
- Traffic source analysis by channel
- Purchase funnel

**Page 2 — Product Analysis**
- Product performance matrix (traffic vs. conversion rate)
- Revenue contribution by quadrant
- Top 10 products by revenue
- SKU distribution by category and quadrant

---

## 📊 Key Findings

- Revenue grew significantly from mid-2015, peaking in **November–December 2015**
- **WH-04** was the top warehouse region at ¥384.3M revenue
- **Cat_L13** was the highest revenue category at ¥302M
- **Search traffic** was the dominant acquisition channel throughout the period
- Overall CVR was only **1.25%**, indicating significant room to improve conversion
- **"Needs Review" products** generated the most revenue (¥993M) despite below-average conversion — optimizing these SKUs represents the biggest growth opportunity

---

## 📁 Repository Structure
```
ecommerce-sales-analysis/
├── data_preprocessing.ipynb   # Data cleaning in Python
├── ecommerce_analysis.sql     # SQL queries & metric calculation
├── ecommerce_sales_dashboard.twbx  # Tableau dashboard
└── README.md
```
