[README.md](https://github.com/user-attachments/files/21536840/README.md)
# 🚲 Cyclistic Bike-Share Data Analysis

![Cyclistics Bikes](https://i.postimg.cc/R0zBX7Mv/Cyclistic-bikes-rides.png)

## 📌 Project Overview

This repository contains the full data analysis process for the **Cyclistic Bike-Share Case Study**, the capstone project for the Google Data Analytics Professional Certificate. The goal is to uncover actionable insights to help the marketing team convert more casual riders into annual members.

The analysis uses 12 months of Divvy bike-share trip data (August 2020 to August 2021), cleaned, transformed, and analyzed using **SQL (Microsoft SQL Server)**.

---

## 🧩 Business Task

> **How do annual members and casual riders use Cyclistic bikes differently?**

Cyclistic's marketing team wants to understand user behavior to inform targeted campaigns that increase membership conversion.

---

## 🧮 Tools & Technologies

- **SQL Server (MSSMS)** – Data cleaning, transformation, analysis
- **Power BI 
- **Git / GitHub** – Version control and project management
- **Divvy System Data** – [Divvy Bike-Share System Data](https://divvybikes.com/system-data)

---

## 📁 Folder Structure


📦 cyclistic-analysis/
│
├── data/
│ ├── raw/ # Raw CSV files (not uploaded to repo)
│ └── cleaned/ # Cleaned and processed data
│
├── scripts/
│ └── cyclistic_case_study_mssms.sql # Main SQL analysis script
│
├── insights/
│ └── cyclistic_case_study_insights.txt # Key findings & recommendations
│
├── figures/
│ └── charts/ # Visuals used for insights
│
└── README.md # You are here




---

## 🧼 Data Cleaning Summary

- Combined monthly CSVs into a unified trip table
- Removed entries with:
  - Missing or null timestamps, coordinates, or station names
  - Test values (e.g., stations like "Base Warehouse")
  - Invalid trip durations (0 or negative)
- Calculated new field: `trip_length_mins` for analysis

---

## 🔍 Key Insights

- **Trip Duration**: Casual riders take longer trips than members on average
- **Usage Timing**: Casual riders use bikes more on weekends; members dominate weekdays
- **Popular Stations**: Casual users favor tourist hotspots like *Streeter Dr & Grand Ave*
- **Behavior Patterns**: Members likely use bikes for commuting; casuals for recreation

See full documented insights in [`insights/cyclistic_case_study_insights.txt`](insights/cyclistic_case_study_insights.txt)

---

## 📊 Sample Queries

- Monthly ride counts by member type
- Day-of-week breakdown
- Top 30 popular station-to-station routes by user group
- Trip duration histograms

SQL script available: [`github.com/CtrlJil/cyclistic_case_study.sql`](cyclistic_case_study.sql)

---

## 🧠 Recommendations

- Promote membership upgrades at high-traffic stations
- Launch weekend promotions targeted at casual riders
- Optimize dock availability in recreational zones
- Use trip trends to improve bike redistribution logistics

---

## 📅 Timeline

- **Data Collection**: Public Divvy data, 12 months
- **Data Cleaning**: Performed using SQL scripts
- **Analysis & Insights**: Documented in this repo
- **Visualization**: Power BI 

---

## 🧾 License

This project is for educational and portfolio use. Divvy system data is provided under [Chicago Data License](https://www.chicago.gov/city/en/narr/foia/data_disclaimer.html).

---

## 🤝 Acknowledgments

- Google Data Analytics Professional Certificate
- Divvy and the City of Chicago for open data access

---

## 🔗 Connect

📧 jilokonma@gmail.com • 📍 Nigeria  
💼 [LinkedIn](https://www.linkedin.com/in/jil-okonma) • 💻 [Portfolio](https://jil-okonma.xyz)  

