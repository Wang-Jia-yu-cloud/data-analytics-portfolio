# E-Commerce Sales Analysis

![Python](https://img.shields.io/badge/Python-3.x-blue) ![MySQL](https://img.shields.io/badge/MySQL-8.0-orange) ![Tableau](https://img.shields.io/badge/Tableau-Dashboard-lightblue)

##  Project Overview

This project uses data from the Alibaba Cloud data competition to analyze e-commerce sales characteristics and extract actionable insights from raw transactional data. The dataset covers 963 products across multiple warehouse regions in China, spanning from October 2014 to December 2015, with a total of 864,771 sales records.

---

##  Dataset

- **Source:** Alibaba Cloud date competition dataset
- **Table:** `item_store_feature`
- **Period:** October 2014 – December 2015
- **Size:** 864,771 rows × 32 columns
- **Granularity:** Daily product-warehouse level behavioral and transaction data

---

##  Business Questions

- How has revenue trended over time, and when did peak sales occur?
- Which warehouse regions and product categories drive the most revenue?
- Where do customers drop off in the purchase funnel?
- Which products are high-traffic but low-conversion, and which are hidden gems?

---

##  Tech Stack

| Tool | Purpose |
|------|---------|
| Python (pandas, numpy, matplotlib, sqlalchemy, pymysql) | Data cleaning, EDA & loading data into MySQL |
| MySQL | Data storage, metric calculation, window functions, CTE, product segmentation |
| Tableau | Interactive dashboard & visualization |

---

##  Workflow

### 1️⃣ Data Cleaning — Python
- Imported raw data and assigned column names (no header in source file)
- Explored data structure, checked and converted data types (e.g. `date`)
- Checked for missing values and duplicates — none found
- Assessed variable distributions via boxplots — outliers retained as they reflect real e-commerce behavior
- Loaded cleaned data into MySQL via SQLAlchemy and pandas `to_sql()`

### 2️⃣ Data Analysis — MySQL
- Validated imported data and explored dataset dimensions (row count, distinct products, date range)
- Analyzed revenue and units sold by category to identify top-performing segments
- Ranked top 3 products within each category using `RANK()` with `PARTITION BY`
- Calculated month-over-month revenue growth using `LAG()` window function
- Segmented products into four performance quadrants (Star Product · Hidden Gem · Needs Review · Long Tail) using `PERCENT_RANK()` and CTE
- Built a full product scorecard combining revenue, conversion rate, average order value, and warehouse reach
- Created a reusable view `v_sales_dashboard` consolidating all metrics, time dimensions, traffic channels, and product quadrants to power Tableau


### 3️⃣ Visualization — Tableau
Two-page interactive dashboard with filters for year/month, warehouse, and category level:

**Page 1 — Sales Overview**
- Overall business performance at a glance via 6 KPI cards
- Revenue trend to identify growth patterns and seasonal peaks
- Warehouse and category breakdown to pinpoint top-performing segments
- Traffic source analysis to understand which channels drive visits
- Purchase funnel to identify where customers drop off


**Page 2 — Product Analysis**
- KPI summary: Total SKUs · Star Product · Hidden Gem · Needs Review · Long Tail · Avg CVR
- Product performance matrix to visually classify SKUs into four quadrants
- Revenue contribution by quadrant to quantify the business impact of each segment
- Top 10 products by revenue for quick identification of hero SKUs
- SKU distribution by category and quadrant to spot category-level patterns

---

##  Key Findings

- **Revenue peaked during major promotional events:** Monthly revenue trend shows two clear spikes aligning with China's 618 mid-year festival and Double 11 (11.11), with November 2015 reaching ¥314M — nearly double the previous month. This confirms that promotional campaigns are the primary revenue driver in this category.

- **Regional performance is uneven:** WH-04 led all warehouse regions at ¥384.3M, while WH-02 was the weakest at ¥200.5M. The gap suggests differences in regional demand, product availability, or fulfillment efficiency worth investigating.

- **Cat_L13 dominates category revenue at ¥302M**, followed by Cat_L11 (¥254M) and Cat_L5 (¥227M). Concentration in a few categories suggests the business is heavily dependent on a narrow product range.

- **Purchase funnel drop-off is steep:** 97.4M page visitors converted to only 1.15M orders — a CVR of 1.25%. The largest drop occurs between browsing and cart adds (4.01M), suggesting product pages are not compelling enough to drive purchase intent.

- **"Needs Review" products are the biggest revenue contributor yet most inefficient:** At ¥993M in revenue but below-median conversion, this quadrant represents the highest optimization potential. Improving CVR on even a fraction of these SKUs would meaningfully impact overall revenue.

- **Search is the dominant traffic channel throughout the entire period**, consistently outperforming paid (ZTC), affiliate (TBK), and group-buy (JHS) channels — even during promotional peaks, suggesting organic search is the most reliable acquisition channel for this product mix.
---

## 📁 Repository Structure
```
ecommerce-sales-analysis/
├── data_preprocessing.ipynb   # Data cleaning in Python
├── ecommerce_analysis.sql     # SQL queries & metric calculation
├── ecommerce_sales_dashboard.twbx  # Tableau dashboard
└── README.md
```
