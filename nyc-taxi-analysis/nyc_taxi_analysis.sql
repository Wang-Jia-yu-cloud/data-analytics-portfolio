
CREATE DATABASE nyc_taxi_db;
USE nyc_taxi_db;
CREATE TABLE taxi_2017 (

trip_id INT PRIMARY KEY,

VendorID INT,
tpep_pickup_datetime DATETIME,
tpep_dropoff_datetime DATETIME,
passenger_count INT,
trip_distance FLOAT,
RatecodeID INT,
store_and_fwd_flag CHAR(1),
PULocationID INT,
DOLocationID INT,
payment_type INT,
fare_amount FLOAT,
extra FLOAT,
mta_tax FLOAT,
tip_amount FLOAT,
tolls_amount FLOAT,
improvement_surcharge FLOAT,
total_amount FLOAT

);

CREATE OR REPLACE VIEW vw_taxi_analysis AS
SELECT
    trip_id,
    VendorID,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    passenger_count,
    trip_distance,
    RatecodeID,
    store_and_fwd_flag,
    PULocationID,
    DOLocationID,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,

    -- 时间字段（Tableau用）
    DATE(tpep_pickup_datetime) AS pickup_date,
    HOUR(tpep_pickup_datetime) AS pickup_hour,
    DAYOFWEEK(tpep_pickup_datetime) AS pickup_dow,
    MONTH(tpep_pickup_datetime) AS pickup_month,

    -- KPI变量
    TIMESTAMPDIFF(MINUTE, tpep_pickup_datetime, tpep_dropoff_datetime) AS trip_duration_min,
    total_amount / NULLIF(trip_distance, 0) AS revenue_per_mile,
    tip_amount / NULLIF(fare_amount, 0) AS tip_rate

FROM taxi_2017;

CREATE OR REPLACE VIEW vw_kpi_summary AS
SELECT
    COUNT(*) AS total_trips,
    SUM(total_amount) AS total_revenue,
    AVG(trip_distance) AS avg_trip_distance,
    AVG(total_amount) AS avg_trip_value,
    AVG(tip_rate) AS avg_tip_rate,
    AVG(trip_duration_min) AS avg_trip_duration_min
FROM vw_taxi_analysis;

CREATE OR REPLACE VIEW vw_hourly_demand AS
SELECT
    pickup_hour,
    COUNT(*) AS trip_count
FROM vw_taxi_analysis
GROUP BY pickup_hour
ORDER BY pickup_hour;

CREATE OR REPLACE VIEW vw_payment_revenue AS
SELECT
    payment_type,
    SUM(total_amount) AS total_revenue
FROM vw_taxi_analysis
GROUP BY payment_type
ORDER BY total_revenue DESC;

CREATE OR REPLACE VIEW vw_top_pickup_zones AS
SELECT
    PULocationID,
    COUNT(*) AS pickup_count
FROM vw_taxi_analysis
GROUP BY PULocationID
ORDER BY pickup_count DESC
LIMIT 10;


select * from vw_taxi_analysis;












