
-- Cyclistic Case Study - SQL Script (Microsoft SQL Server Version)
-- Project: Google Data Analytics Capstone Project
-- Author: Jil
-- Date: 26/06/2023
-- Database: CyclisticDB

-- ============================================
-- STEP 1: CREATE DATABASE AND SCHEMA SETUP
-- ============================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'CyclisticDB')
BEGIN
    CREATE DATABASE CyclisticDB;
END;
GO

USE CyclisticDB;


-- ============================================
-- STEP 2: CREATE STAGING TABLES FOR RAW DATA
-- ============================================

-- Replace these with individual tables imported from CSVs for each month
-- Sample table schema (modify as needed to match real CSV structure)
-- This section assumes all monthly tables have the same schema

-- Example: CREATE TABLE [staging].[divvy_tripdata_202008] (...);

-- ============================================
-- STEP 3: COMBINE MONTHLY TABLES INTO ONE
-- ============================================

IF OBJECT_ID('dbo.divvy_tripdata', 'U') IS NOT NULL
    DROP TABLE dbo.divvy_tripdata;


SELECT * INTO dbo.divvy_tripdata
FROM (
    SELECT * FROM dbo.divvy_tripdata_202008
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202009
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202010
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202011
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202012
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202101
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202102
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202103
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202104
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202105
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202106
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202107
    UNION ALL
    SELECT * FROM dbo.divvy_tripdata_202108
) AS AllTrips;


-- ============================================
-- STEP 4: DATA CLEANING AND FEATURE ENGINEERING
-- ============================================

-- Add trip_length_mins column
ALTER TABLE dbo.divvy_tripdata
ADD trip_length_mins INT;


-- Populate trip_length_mins
UPDATE dbo.divvy_tripdata
SET trip_length_mins = DATEDIFF(MINUTE, started_at, ended_at);


-- Add exclude column for filtering invalid records
ALTER TABLE dbo.divvy_tripdata
ADD exclude CHAR(1);


-- Exclude records with invalid timestamps
UPDATE dbo.divvy_tripdata
SET exclude = 'Y'
WHERE started_at IS NULL OR ended_at IS NULL
   OR started_at >= ended_at
   OR trip_length_mins <= 0;


-- Exclude records with missing critical fields
UPDATE dbo.divvy_tripdata
SET exclude = 'Y'
WHERE start_lat IS NULL OR start_lng IS NULL
   OR end_lat IS NULL OR end_lng IS NULL
   OR start_station_name IS NULL OR end_station_name IS NULL
   OR member_casual IS NULL OR rideable_type IS NULL;


-- Exclude records containing keywords indicating test or base locations
UPDATE dbo.divvy_tripdata
SET exclude = 'Y'
WHERE UPPER(start_station_name) LIKE '%BASE%WAREHOUSE%'
   OR UPPER(end_station_name) LIKE '%BASE%WAREHOUSE%';


-- ============================================
-- STEP 5: EXPLORATORY ANALYSIS / VISUALIZATION DATASETS
-- ============================================

-- Count of usable records
SELECT COUNT(*) AS ValidTrips
FROM dbo.divvy_tripdata
WHERE exclude IS NULL;


-- Monthly trip counts by user type
SELECT member_casual,
       FORMAT(started_at, 'yyyy-MM') AS trip_month,
       COUNT(*) AS trip_count
FROM dbo.divvy_tripdata
WHERE exclude IS NULL
GROUP BY member_casual, FORMAT(started_at, 'yyyy-MM');


-- Trip duration distribution
SELECT trip_length_mins, COUNT(*) AS num_trips
FROM dbo.divvy_tripdata
WHERE exclude IS NULL
GROUP BY trip_length_mins
ORDER BY trip_length_mins;


-- Top 30 routes by member type
WITH RouteSummary AS (
    SELECT member_casual,
           start_station_name,
           end_station_name,
           COUNT(*) AS route_count,
           RANK() OVER (PARTITION BY member_casual ORDER BY COUNT(*) DESC) AS route_rank
    FROM dbo.divvy_tripdata
    WHERE exclude IS NULL
    GROUP BY member_casual, start_station_name, end_station_name
)
SELECT *
FROM RouteSummary
WHERE route_rank <= 30;


-- Average trip time by day of week
SELECT member_casual,
       DATENAME(WEEKDAY, started_at) AS weekday,
       AVG(trip_length_mins) AS avg_duration_mins,
       COUNT(*) AS total_trips
FROM dbo.divvy_tripdata
WHERE exclude IS NULL
GROUP BY member_casual, DATENAME(WEEKDAY, started_at)
ORDER BY weekday;

