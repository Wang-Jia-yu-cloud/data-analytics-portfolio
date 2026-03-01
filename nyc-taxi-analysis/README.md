# NYC Taxi Operational Performance Analysis

## Project Overview

This project explores 2017 NYC yellow taxi trip data to understand operational performance — when and where trips happen, how revenue is distributed, and what influences tipping behavior. The dataset comes from the NYC Taxi & Limousine Commission via NYC Open Data, with 408,294 trips and 18 fields covering fares, distances, payment types, and pickup zones.

---

## Dataset

- **Source:** NYC Open Data — 2017 Yellow Taxi Trip Data
- **Size:** 408,294 rows × 18 columns 
- **Granularity:** Individual trip level
- **Key fields:** Trip datetime, distance, fare, tip amount, payment type, pickup/dropoff zone

---

## Business Questions

- How does revenue trend across the year, and is there any seasonality?
- What does a typical trip look like in terms of distance, duration, and value?
- When are peak demand hours and days of the week?
- Is there a relationship between trip distance and tip behavior?
- Which pickup zones are the busiest?
- How do passengers prefer to pay, and how does it affect tip recording?

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| Python (pandas, numpy, matplotlib) | Data cleaning & EDA |
| MySQL | Data storage, metric calculation & view creation |
| Tableau | Interactive dashboard connected to cleaned CSV |

---

## Workflow

### 1️⃣ Data Cleaning — Python
- Explored dataset structure and checked data types
- Checked for missing values and duplicates
- Handled outliers in fare, distance, and tip fields
- Engineered time-based features: pickup hour, day of week, month
- Exported cleaned data as CSV for Tableau

### 2️⃣ Data Analysis — MySQL
- Manually created table schema and imported cleaned data
- Created a base view `vw_taxi_analysis` with all raw fields plus derived metrics: trip duration, revenue per mile, and tip rate
- Built dedicated analytical views:
  - `vw_kpi_summary` — overall KPIs: total trips, revenue, avg distance, avg trip value, avg tip rate
  - `vw_hourly_demand` — trip volume by hour of day
  - `vw_payment_revenue` — revenue breakdown by payment type
  - `vw_top_pickup_zones` — top 10 pickup zones by trip count

### 3️⃣ Visualization — Tableau
Interactive dashboard with filters for pickup hour, payment type, and month:

- KPI summary: Total Revenue · Total Trips · Avg Trip Value · Avg Distance · Avg Duration · Avg Tip Rate
- Monthly revenue and avg trip value trends to identify seasonal patterns
- Trip distance distribution to understand typical trip profile
- Trip volume by hour of day to identify peak demand periods
- Avg trips per day of week to understand weekly demand patterns
- Tip rate vs. distance relationship to explore tipping behavior
- Payment type breakdown
- Top 10 pickup zones by trip volume

---

## Key Findings

- **Revenue remained stable throughout 2017** with no significant seasonal spikes, suggesting steady demand driven by commuting patterns rather than promotional events.
- **Peak demand is concentrated around 18:00–19:00**, with the lowest volume in early morning hours (2:00–5:00 AM).
- **Friday sees the highest avg daily trips at 65.1**, while Sunday and Monday are the slowest days.
- **Most trips are under 4 miles**, confirming the service is primarily used for short urban commutes.
- **Tip rate shows no strong correlation with trip distance**, suggesting tipping behavior is more influenced by payment method than trip length.
- **Credit card dominates at 72.96%** of all trips, while cash accounts for 26.63% — cash tips are not captured in the dataset, meaning actual tip rates are likely higher than recorded.

---

## Dashboard Preview

🔗 [View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/NYCTaxiOperationalPeformanceAnalysis/TaxiBusinessPerformanceDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## Repository Structure
```
nyc-taxi-analysis/
├── nyc_taxi_cleaning.ipynb     # Data cleaning in Python
├── nyc_taxi_analysis.sql       # SQL queries & view creation
├── nyc_taxi_dashboard.twbx     # Tableau dashboard
└── README.md
```
