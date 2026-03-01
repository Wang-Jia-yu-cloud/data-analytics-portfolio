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
| Python (pandas, numpy) | Data cleaning |
| MySQL | Data storage, metric calculation & view creation |
| Tableau | Interactive dashboard connected to cleaned CSV |

---

## Workflow

### 1️⃣ Data Cleaning — Python
- Explored dataset structure, data types, and descriptive statistics
- Renamed columns to ensure clarity
- Converted datetime fields from string to datetime format
- Identified and removed invalid records (negative fares, zero distance, zero passengers)
- Exported cleaned data as CSV for Tableau and MySQL

### 2️⃣ Data Analysis — MySQL
- Manually created table schema and imported cleaned data
- Created a base view `vw_taxi_analysis` adding derived metrics: trip duration, revenue per mile, and tip rate
- Built additional views to answer each business question:
  - `vw_kpi_summary` — overall performance KPIs
  - `vw_hourly_demand` — trip volume by hour
  - `vw_payment_revenue` — revenue by payment type
  - `vw_top_pickup_zones` — top 10 busiest pickup zones

### 3️⃣ Visualization — Tableau
Interactive dashboard with filters for pickup hour, payment type, and month:

- KPI cards for a quick overview of overall performance
- Revenue and avg trip value trends to see how business performs across the year
- Trip distance distribution to understand what a typical trip looks like
- Hourly and daily trip volume to spot peak demand periods
- Tip rate vs. distance to see whether trip length affects tipping behavior
- Payment type breakdown to understand passenger preferences
- Top 10 pickup zones to identify where most trips originate

---

## Key Findings

- **Revenue remained stable throughout 2017** with no significant seasonal spikes, suggesting NYC taxi demand is driven by consistent daily commuting and urban travel patterns.
- **Peak demand is concentrated around 18:00–19:00**, with the lowest volume in early morning hours (2:00–5:00 AM).
- **Friday sees the highest avg daily trips at 65.1**, while Sunday and Monday are the slowest days.
- **Most trips are under 4 miles**, confirming the service is primarily used for short urban commutes rather than long-distance travel.
- **Tip rate shows no strong correlation with trip distance**, suggesting tipping behavior is more influenced by payment method than trip length.
- **Credit card dominates at 72.96%** of all trips, while cash accounts for 26.63% — since cash tips are not recorded in the dataset, actual tip rates are likely higher than what the data shows.

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
