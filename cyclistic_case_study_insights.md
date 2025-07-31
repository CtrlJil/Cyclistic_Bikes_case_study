
Cyclistic Case Study - Insights Summary
=======================================

Project: Google Data Analytics Capstone
Database Platform: Microsoft SQL Server (MSSMS)
Dataset Source: Divvy Bikes (https://www.divvybikes.com/system-data)
Time Range: August 2020 – August 2021

---------------------------------------
## KEY INSIGHTS FROM DATA ANALYSIS
---------------------------------------

#### 1. Trip Volume by Membership Type
----------------------------------
- The dataset was split into two customer segments: 'member' (subscribers) and 'casual' (one-time riders).
- Trip counts were aggregated monthly.
- Early insights show a consistently higher volume of trips by members compared to casual users, indicating strong engagement from subscribers.

#### 2. Duration of Trips
------------------------------------------
- Trip durations were calculated in minutes using the difference between end and start times.
- Casual users exhibited longer average trip durations, suggesting recreational or exploratory usage.
- Members had shorter trips, aligning with potential commuting behavior.

#### 3. Day of the Week Behavior
----------------------------
- Members made more trips during weekdays, especially during commuting hours.
- Casual riders showed more activity on weekends, likely linked to leisure usage.
- This distinction supports the assumption of different use cases between user types.

#### 4. Anomalies and Data Cleaning
-------------------------------
- Over 5% of the records were excluded due to:
  - Null values in start/end times, station names, or coordinates.
  - Zero or negative trip durations.
  - Obvious test values (e.g., station names containing 'Base' or 'Warehouse').

#### 5. Route Popularity
---------------------
- The top 30 most popular routes were calculated for both user types.
- Members frequently used routes connected to transit hubs and downtown locations.
- Casual users preferred routes around recreational areas and tourist attractions.

#### 6. Station Popularity and Coordinates
--------------------------------------
- The most used station was 'Streeter Dr & Grand Ave', especially among casual users.
- Geo-coordinates of popular stations help visualize trip origins and destinations for mapping or clustering.

#### 7. Trip Duration Distribution
------------------------------
- Most trips lasted between 5 to 20 minutes.
- A minority of trips exceeded 60 minutes, mostly among casual users.

---------------------------------------
## RECOMMENDATIONS
---------------------------------------

- Marketing campaigns should target casual users with promotions during weekends and at popular tourist areas.
- Increase bike and dock availability at high-demand stations, especially 'Streeter Dr & Grand Ave'.
- Consider loyalty rewards for casual users with frequent weekend usage to promote membership conversion.
- Use geospatial analysis and clustering to optimize station placement and resource allocation.

---------------------------------------
### NEXT STEPS
---------------------------------------
- Integrate weather and event data to correlate external factors with trip patterns.
- Run cohort analysis to evaluate member retention over time.
- Develop predictive models for peak demand and dynamic rebalancing of bikes.

