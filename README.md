# **Hospitality Revenue & Guest Behavior Dashboard**  
*A two page Power BI project built using SQL, Power Query, data modeling, and DAX.*

---

## **Project Summary**

A complete hospitality analytics dashboard that connects **revenue performance** with **guest booking behavior**. Built end to end using SQL Server, Power BI, and DAX, this project turns raw hotel booking data into clear, actionable insights for revenue managers, operations teams, and hotel leadership.

---

## **📸 Dashboard Preview**

<img width="1776" height="999" alt="Page1" src="https://github.com/user-attachments/assets/74b2090f-36e6-4445-9784-9848c04e38f2" />

<img width="1774" height="996" alt="Page2" src="https://github.com/user-attachments/assets/2330f1a5-8e86-43b9-85e3-2e47b1095b84" />

---

## How to Use This Dashboard

1. Download the Power BI file:
   - **Hospitality-Revenue-Insight.pbix**
   - **(Hospitality-Revenue-Insight.pbix)**

2. Open it in **Power BI Desktop**.

3. Use the slicers at the top of each page to filter by:
   - Year
   - Month
   - Hotel type
   - Market segment
   - Distribution channel

4. Navigate between the two report pages:
   - **Revenue & Performance Overview**  
     View total bookings, nights, revenue, ADR trends, cancellation behavior, and hotel level performance.

   - **Guest Behavior & Booking Patterns**  
     Explore lead time, length of stay, booking patterns, and guest behavior metrics.

5. Hover over visuals to see detailed tooltips and breakdowns.

6. Use the Reset Filters button to return to the default view.

---

## **1. Overview**

This project started with a simple idea: take a raw hotel booking dataset and turn it into something a real hotel manager could use, not just a pretty dashboard, but a tool that actually answers business questions.

I walked through the full BI workflow:

- Exploring and cleaning data in SQL  
- Shaping it in Power Query  
- Building a clean data model  
- Writing DAX that makes sense  
- Designing visuals that tell a story  

The final result is a two‑page Power BI report that shows **how the hotel is performing** and **why it’s performing that way**.

---

## **2. Purpose of the Dashboard**

The dashboard answers two core questions:

### **1. How are we performing financially?**  
Revenue, ADR, cancellations, nights, seasonality, hotel comparison.

### **2. What are guests actually doing?**  
Lead time, length of stay, segment behavior, channel cancellations.

These insights support decisions around:

- Pricing  
- Forecasting  
- Staffing  
- Overbooking strategy  
- Revenue optimization  

---

## **3. What Stakeholders Can Decide With This Dashboard**

This dashboard helps leadership:

- Understand revenue trends and seasonality  
- Identify high value and low value segments  
- Spot cancellation risk by channel  
- See how far in advance guests book  
- Understand how long guests stay  
- Compare performance between hotels  
- Improve forecasting accuracy  

It turns raw booking data into **clear, practical insight**.

---

## **4. Tools & Technologies**

- **SQL Server Management Studio (SSMS)** – data exploration and cleaning  
- **Power BI Desktop** – modeling, DAX, visualization  
- **Power Query** – shaping and transforming data  
- **DAX** – custom measures for revenue, ADR, cancellations, LOS, and lead time  

---

## **5. Data Preparation**

### **SQL Exploration & Cleaning**

I started by loading the dataset into SQL Server to understand its structure and quality.

Tasks included:

- Checking for missing or inconsistent values  
- Standardizing text fields  
- Removing invalid rows (negative ADR, zero nights)  
- Validating date ranges and booking statuses  

**Example SQL snippet**

```sql
SELECT *
FROM bookings
WHERE adr < 0
   OR (stays_in_week_nights + stays_in_weekend_nights) = 0;
```

### **Power Query Transformations**

Once imported into Power BI:

- Set correct data types  
- Cleaned column names  
- Created a Date table  
- Built Lead Time and LOS buckets
  
### **Example Power Query (M) snippet**

```m
= Table.AddColumn(Source, "LOS Bucket", each 
    if [LOS] = 1 then "1 night" 
    else if [LOS] = 2 then "2 nights"
    else if [LOS] = 3 then "3 nights"
    else if [LOS] = 4 then "4 nights"
    else if [LOS] <= 7 then "5-7 nights"
    else if [LOS] <= 14 then "8-14 nights"
    else "15+ nights")
```

---

## **6. Data Modeling**

The model follows a simple star schema:

- **Fact Table:** Bookings / Stays  
- **Dimensions:** Date, Market Segment, Distribution Channel, Hotel  

Relationships were created on arrival date, segment, channel, and hotel.  
The Date table was marked as the official date table.

---

## **7. Core DAX Measures**

These measures drive the dashboard:

```DAX
Total Bookings = COUNTROWS('FactBookings')
```

```DAX
Total Nights = SUM('FactBookings'[TotalNights])
```

```DAX
Total Revenue = SUM('FactBookings'[Revenue])
```

```DAX
ADR = DIVIDE([Total Revenue], [Total Nights])
```

```DAX
Cancellation Rate = DIVIDE([Cancelled Bookings], [Total Bookings])
```

```DAX
Avg Lead Time = AVERAGE('FactBookings'[LeadTime])
```

```DAX
Avg LOS = DIVIDE([Total Nights], [Total Bookings])
```

---

## **8. Page 1:  Revenue & Performance Overview**

**Title:** Revenue & Performance Overview  
**Subtitle:** Revenue trends, booking volume, nights, and cancellation performance.

### **KPIs**

- Total Bookings  
- Total Nights  
- Total Revenue  
- Cancellation Rate  
- ADR  

### **Visuals**

- ADR Trend  
- Cancellation Rate by Segment  
- Nights by Month  
- Revenue by Hotel  

### **How to Read This Page**

- ADR Trend shows pricing performance and seasonality  
- Cancellation by Segment highlights revenue leakage  
- Nights by Month reveals demand patterns  
- Revenue by Hotel compares City vs Resort performance  

---

## **9. Page 2: Guest Behavior & Booking Patterns**

**Title:** Guest Behavior & Booking Patterns  
**Subtitle:** Behavioral patterns based on all available booking data.

### **KPIs**

- Avg Lead Time  
- ADR  
- Avg LOS  
- Cancellation Rate  

### **Visuals**

- Avg Lead Time Distribution  
- Length of Stay Distribution  
- ADR by Market Segment  
- Cancellation Rate by Channel  

### **How to Read This Page**

- Lead Time shows predictability and booking behavior  
- LOS distribution reveals core stay patterns  
- ADR by Segment highlights high‑value segments  
- Cancellation by Channel shows where risk comes from  

---

### 📁 Download the Power BI Dashboard  

[📥 Download the Power BI File](Hospitality-Revenue-Insight.pbix)




---

## **10. Key Insights**

- Guests tend to book either **very early** or **very close to arrival**.  
- Most stays are **2–3 nights**, typical for leisure hotels.  
- **Online TA** and **Direct** segments deliver the highest ADR.  
- Cancellation risk is highest in **TA/TO** and **Undefined** channels.  
- Revenue peaks mid‑year, showing clear seasonality.  
- The **City Hotel** outperforms the **Resort Hotel** in total revenue.  

---

## **11. Challenges & Iteration**

Throughout the build, I refined:

- Sorting issues  
- DAX logic  
- Category labels  
- Visual titles  
- Color consistency  
- Layout spacing  

Small, iterative improvements made the dashboard feel polished and professional.

---

## **12. Repository Structure**

```text
Hospitality-Revenue-Guest-Behavior-Dashboard
│
├── README.md
├── HospitalityDashboard.pbix
│
├── /images
│     ├── page1.png
│     └── page2.png
│
├── /sql
│     └── data_cleaning.sql
│
├── /dax
│     └── measures.txt
│
└── /powerquery
      └── transformations.txt
```

---

## **13. About Me**

My name is **Jaime Echegaray**, and I come from an operations and property management background where data wasn’t just numbers, it was the difference between guessing and making the right call. Over time, I realized I was spending more energy building spreadsheets, tracking KPIs, and fixing processes than anything else. That curiosity eventually pushed me into Business Intelligence.

I recently completed my **Business Intelligence Data Analysis and Reporting diploma at SAIT**, and since then I’ve been focused on building real, end‑to‑end analytics projects that reflect how data is actually used in the real world. I enjoy the full workflow: exploring data in SQL, shaping it in Power Query, building clean data models, writing DAX that makes sense, and designing dashboards that feel intuitive for non‑technical users.

My goal is simple: **turn raw data into something people can understand and act on.**
