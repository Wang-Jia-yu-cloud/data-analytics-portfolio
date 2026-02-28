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

- **Revenue peaked during major promotional events:** Monthly revenue trend shows two clear spikes aligning with China's 618 mid-year festival and Double 11 (11.11), with November 2015 reaching ¥314M — nearly double the previous month. This confirms that promotional campaigns are the primary revenue driver in this category.

- **Regional performance is uneven:** WH-04 led all warehouse regions at ¥384.3M, while WH-02 was the weakest at ¥200.5M. The gap suggests differences in regional demand, product availability, or fulfillment efficiency worth investigating.

- **Cat_L13 dominates category revenue at ¥302M**, followed by Cat_L11 (¥254M) and Cat_L5 (¥227M). Concentration in a few categories suggests the business is heavily dependent on a narrow product range.

- **Purchase funnel drop-off is steep:** 97.4M page visitors converted to only 1.15M orders — a CVR of 1.25%. The largest drop occurs between browsing and cart adds (4.01M), suggesting product pages are not compelling enough to drive purchase intent.

- **"Needs Review" products are the biggest revenue contributor yet most inefficient:** At ¥993M in revenue but below-median conversion, this quadrant represents the highest optimization potential. Improving CVR on even a fraction of these SKUs would meaningfully impact overall revenue.

- **Search is the dominant traffic channel throughout the entire period**, consistently outperforming paid (ZTC), affiliate (TBK), and group-buy (JHS) channels. This held true even during promotional peaks, suggesting organic search is the most reliable and cost-efficient acquisition channel.

---

## 📁 Repository Structure
```
ecommerce-sales-analysis/
├── data_preprocessing.ipynb   # Data cleaning in Python
├── ecommerce_analysis.sql     # SQL queries & metric calculation
├── ecommerce_sales_dashboard.twbx  # Tableau dashboard
└── README.md
```
