CREATE DATABASE e_sales;
USE e_sales;
SELECT count(*) FROM item_store_feature ;  # check the data we imported from python
SELECT * FROM item_store_feature limit 10; 
SELECT count(distinct item_id) FROM item_store_feature;
SELECT count(distinct store_code) FROM item_store_feature;
SELECT min(date) as start_date ,max(date) as end_date FROM item_store_feature;

-- Next I will do some exploring about this dataset.
-- 1. Which category generates the most revenue?
SELECT cate_id,
round(sum(amt_alipay_njhs)/1000000,2) as Revenue_M,
sum(qty_alipay_njhs) as Units_sold,
count(distinct item_id) as sku_count
FROM item_store_feature
GROUP BY cate_id
ORDER BY Revenue_M DESC;

-- 2. What are the top 3 products within each category?
-- RANK() with PARTITION BY resets ranking per category; WHERE filters to top 3
WITH product_revenue AS (
    SELECT 
        item_id,
        cate_id,
        SUM(amt_alipay_njhs) AS Revenue
    FROM item_store_feature
    GROUP BY item_id, cate_id
),
ranked AS (
    SELECT *,
        RANK() OVER (PARTITION BY cate_id ORDER BY Revenue DESC) AS rank_in_category 
    FROM product_revenue
)
SELECT * FROM ranked
WHERE rank_in_category <= 3;  

-- 3.Month-over-month revenue growth
-- Using LAG() window function to compare each month against the previous one
WITH monthly AS (
    SELECT 
        DATE_FORMAT(date, '%Y-%m') AS month,
        SUM(amt_alipay_njhs) AS Revenue
    FROM item_store_feature
    GROUP BY month
)
SELECT 
    month,
    Revenue,
    LAG(Revenue) OVER (ORDER BY month) AS last_month_revenue,
    ROUND(
        (Revenue - LAG(Revenue) OVER (ORDER BY month))
        / NULLIF(LAG(Revenue) OVER (ORDER BY month), 0) * 100
    , 2) AS mom_growth_pct
FROM monthly
ORDER BY month;

-- 4. Label each product into a quadrant (Percentile-based)

WITH summary AS (
    SELECT
        item_id,
        cate_id,
        SUM(pv_uv) AS traffic,
        SUM(amt_alipay_njhs) AS revenue,
        SUM(qty_alipay_njhs) / NULLIF(SUM(pv_uv),0) * 100 AS conversion_rate
    FROM item_store_feature
    GROUP BY item_id, cate_id
),

ranked AS (
    SELECT *,
        PERCENT_RANK() OVER (ORDER BY traffic) AS traffic_pct,
        PERCENT_RANK() OVER (ORDER BY conversion_rate) AS conv_pct
    FROM summary
)

SELECT
    *,
    CASE
        WHEN traffic_pct >= 0.5 AND conv_pct >= 0.5 THEN 'Star Product'
        WHEN traffic_pct <  0.5 AND conv_pct >= 0.5 THEN 'Hidden Gem'
        WHEN traffic_pct >= 0.5 AND conv_pct <  0.5 THEN 'Needs Review'
        ELSE 'Long Tail'
    END AS quadrant
FROM ranked
ORDER BY revenue DESC;

-- 5.Full product scorecard: revenue + conversion + warehouse spread
WITH product_base AS (
    SELECT
        item_id,
        cate_id,
        brand_id,
        SUM(amt_alipay_njhs)  AS revenue,
        SUM(qty_alipay_njhs)  AS units_sold,
        SUM(unum_alipay_njhs) AS unique_buyers,
        SUM(pv_uv)            AS traffic,
        COUNT(DISTINCT store_code) AS warehouse_reach
    FROM item_store_feature
    GROUP BY item_id, cate_id, brand_id
),
with_metrics AS (
    SELECT *,
        ROUND(units_sold / NULLIF(traffic,0) * 100, 2) AS conversion_rate,
        ROUND(revenue    / NULLIF(units_sold,0), 2)    AS avg_order_value
    FROM product_base
),
with_rank AS (
    SELECT *,
        RANK() OVER (ORDER BY revenue DESC)          AS revenue_rank,
        RANK() OVER (ORDER BY conversion_rate DESC)  AS conversion_rank
    FROM with_metrics
)
SELECT * FROM with_rank
ORDER BY revenue_rank
LIMIT 20;

-- Create a reusable view to power Tableau dashboards
-- Combines raw metrics, calculated KPIs, and traffic channel breakdown
DROP VIEW IF EXISTS v_sales_dashboard;

CREATE VIEW v_sales_dashboard AS

WITH product_summary AS (
    SELECT
        item_id,
        SUM(pv_uv) AS total_traffic,
        SUM(qty_alipay_njhs) / NULLIF(SUM(pv_uv),0) * 100 AS total_conversion
    FROM item_store_feature
    GROUP BY item_id
    HAVING SUM(pv_uv) > 1000
),

product_ranked AS (
    SELECT *,
        PERCENT_RANK() OVER (ORDER BY total_traffic) AS traffic_pct,
        PERCENT_RANK() OVER (ORDER BY total_conversion) AS conv_pct
    FROM product_summary
),

product_quadrant AS (
    SELECT
        item_id,
        CASE
            WHEN traffic_pct >= 0.5 AND conv_pct >= 0.5 THEN 'Star Product'
            WHEN traffic_pct <  0.5 AND conv_pct >= 0.5 THEN 'Hidden Gem'
            WHEN traffic_pct >= 0.5 AND conv_pct <  0.5 THEN 'Needs Review'
            ELSE 'Long Tail'
        END AS quadrant
    FROM product_ranked
)

SELECT
    -- Time Dimensions
    f.date,
    DATE_FORMAT(f.date, '%Y-%m')     AS `year_month`,
    YEAR(f.date)                    AS `year`,
    MONTH(f.date)                   AS month_num,
    WEEK(f.date, 1)                 AS week_num,
    WEEKDAY(f.date)                 AS weekday_num,
    CASE WEEKDAY(f.date)
        WHEN 0 THEN 'Mon' WHEN 1 THEN 'Tue'
        WHEN 2 THEN 'Wed' WHEN 3 THEN 'Thu'
        WHEN 4 THEN 'Fri' WHEN 5 THEN 'Sat'
        WHEN 6 THEN 'Sun'
    END                             AS weekday_label,

    -- Product Dimensions
    f.item_id,
    f.store_code,
    f.cate_id,
    f.cate_level_id,
    f.brand_id,
    f.supplier_id,

    -- Raw Metrics
    f.pv_uv                         AS traffic,
    f.cart_uv                       AS cart_adds,
    f.collect_uv                    AS favourites,
    f.amt_alipay_njhs               AS revenue,
    f.qty_alipay_njhs               AS units_sold,
    f.num_alipay_njhs               AS orders,
    f.unum_alipay_njhs              AS unique_buyers,

    -- Traffic Channels
    f.ss_pv_uv                      AS search_traffic,
    f.ztc_pv_uv                     AS paid_traffic,
    f.tbk_pv_uv                     AS affiliate_traffic,
    f.jhs_pv_uv                     AS groupbuy_traffic,

    -- Calculated Metrics
    ROUND(f.qty_alipay_njhs / NULLIF(f.pv_uv, 0) * 100, 2)    AS conversion_rate,
    ROUND(f.cart_uv / NULLIF(f.pv_uv, 0) * 100, 2)            AS cart_rate,
    ROUND(f.amt_alipay_njhs / NULLIF(f.num_alipay_njhs, 0), 2) AS avg_order_value,


    q.quadrant

FROM item_store_feature f
LEFT JOIN product_quadrant q
    ON f.item_id = q.item_id;