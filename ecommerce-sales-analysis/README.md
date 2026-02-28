E-Commerce Sales Analysis
Tools: Python · MySQL · Tableau
Data Period: October 2014 – December 2015

Project Overview
This project analyzes product-level sales data from an Alibaba e-commerce platform, covering 864,771 records across multiple warehouse regions in China. The goal was to understand sales performance, customer purchasing behavior, and traffic conversion patterns — and present findings through an interactive Tableau dashboard.
The dataset includes daily metrics per product per warehouse, such as page views, cart adds, orders, and revenue, broken down by traffic source (search, paid ads, affiliate, group-buy).

Business Questions

How has revenue trended over time, and when did peak sales occur?
Which warehouse regions and product categories drive the most revenue?
What does the purchase funnel look like — where do customers drop off?
Which products are high-traffic but low-conversion, and which are hidden gems?


Workflow
1. Data Cleaning — Python

Assigned column names to raw data (no header in source file)
Converted date from integer format (e.g. 20151226) to datetime
Converted ID fields (store_code, item_id, etc.) to appropriate data types
Checked for missing values and duplicates — none found
Visualized distributions of all numerical variables using boxplots to identify skewness and outliers
Outliers were retained as they reflect real business behavior (e.g. high-traffic hero products)

2. Data Storage & Analysis — MySQL

Loaded cleaned data into MySQL using SQLAlchemy and pandas to_sql()
Computed derived metrics in SQL:

Conversion Rate (CVR) = unique buyers / page visitors
Cart-to-order rate
Average order value
Monthly and category-level revenue aggregations


Classified products into performance quadrants: Star Product, Hidden Gem, Needs Review, Long Tail

3. Visualization — Tableau
Built a two-page interactive dashboard with filters for year/month, warehouse, and category:
Page 1 — Sales Overview

KPI summary: Total Revenue ¥1.42B · Avg Order Value ¥1.48K · Orders 1.15M · CVR 1.25%
Monthly revenue trend (2014–2015)
Revenue by warehouse region
Revenue by product category (treemap)
Traffic source analysis by channel over time
Purchase funnel: Page Visitors → Cart Adds → Orders → Unique Customers

Page 2 — Product Analysis

Product performance matrix: traffic vs. conversion rate, colored by quadrant
Revenue contribution by quadrant
Top 10 products ranked by revenue
SKU distribution by category and quadrant (highlight table)


Key Findings

Revenue grew significantly from mid-2015, peaking in November–December 2015
Warehouse WH-04 contributed the highest regional revenue at ¥384.3M
Cat_L13 was the top revenue-generating category at ¥302M
Search traffic was the dominant acquisition channel throughout the period
Only 1.25% of page visitors converted to buyers, suggesting significant room to improve product pages and targeting
"Needs Review" products accounted for the largest revenue share (¥993M) despite below-average conversion — optimizing these SKUs represents the biggest opportunity


Data Source
Alibaba e-commerce competition dataset — item_store_feature
Contains daily product-warehouse level behavioral and transaction data from October 2014 to December 2015.
