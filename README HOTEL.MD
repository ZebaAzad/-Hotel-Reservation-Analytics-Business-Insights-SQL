# Hotel-Reservation-Analytics-Business-Insights-SQL

## Project Overview
**Project Title**: Hotel-Reservation-Analytics

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze hotel-reservation data. The project involves setting up a hotel-reservation database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives
1. **Set up a hotel-resevation database**: Create a hotel-reservation database with the provided hotel data.
2. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
3. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the hotel data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `continental_crown`.
- **Table Creation**: A table named `booking_data` is created to store the hotel data. The table structure includes columns for Reservation_ID, Guest_ID, First_Name, Last_Name, Gender, Email, Phone, Nationality, Birthdate, Address, City, Postal_Code, Country, Check_in_Date, Check_out_Date, Room_Number, Floor_Number, Room_Type, Adults, Children, Total_Nights, Total_Amount, Payment_Status, Special_Requests, Reservation_Source, Booking_Date, Check_in_Time, Check_out_Time, Breakfast_Included, Spa_Package_Included, Airport_Pickup_Included and Room_Type_Rate.

```sql
CREATE DATABASE continental_crown;

CREATE TABLE Booking_data
(
    Reservation_ID INT PRIMARY KEY,
    Guest_ID INT, 
    First_Name VARCHAR(50), 
    Last_Name VARCHAR(50), 
    Gender VARCHAR(10) , 
    Email VARCHAR(50), 
    Phone INT, 
    Nationality VARCHAR(20), 
    Birthdate DATE, 
    Address VARCHAR(100), 
    City VARCHAR(20), 
    Postal_Code INT, 
    Country VARCHAR(50), 
    Check_in_Date DATE, 
    Check_out_Date DATE, 
    Room_Number INT, 
    Floor_Number INT, 
    Room_Type VARCHAR(20), 
    Adults INT, 
    Children INT, 
    Total_Nights INT, 
    Total_Amount FLOAT, 
    Payment_Status VARCHAR(20), 
    Special_Requests VARCHAR(100), 
    Reservation_Source VARCHAR(50), 
    Booking_Date DATE, 
    Check_in_Time TIME, 
    Check_out_Time TIME, 
    Breakfast_Included VARCHAR(10), 
    Spa_Package_Included VARCHAR(10), 
    Airport_Pickup_Included VARCHAR(10),
    Room_Type_Rate FLOAT
);
```

## Key Findings & Insights

- **A. Reservation & Booking Trends**
A total of 870 reservations were recorded during the Jan 2022 to Dec 2022.
Booking activity shows clear seasonality, with the highest number of bookings occurring in [Peak_Months - July,september,October].
The top 10 peak check-in dates include:
'2022-08-01',
'2022-12-10'.
These dates recorded the highest number of guest arrivals, indicating peak operational demand.


- **B. Guest Demographics & Geography**
The customer base consists of repeat and unique guests, showing sustained demand.

Gender, Total_Booking, Total_Revenue, Avg_revenue
'Male', '212', '79331', '374.2'
'Female', '235', '99551', '423.62'
Bookings are distributed across multiple genders, with revenue per booking differing slightly by gender.

Guests come from a diverse range of countries,United States are top in the list with '78 bookings'.
 
- **C. Room & Property Performance
Most frequently booked room type: DELUXE type with 301 booking
Highest revenue-generating room type: Suite type of room generated highest revenue


- **D.Revenue & Payment Performance
Paid bookings generate the majority of revenue, but unpaid (pending) bookings represent a revenue risk.
Total paid revenue generated: $[17882]
Average revenue per paid booking: $[409.62]
Total unpaid bookings:[423]
Total unpaid revenue: $[177488]


- **E. Services & Add-Ons Analysis
A significant number of guests opt for breakfast and spa packages.
Bookings that include add-ons consistently show higher average total amounts.


- **F. Booking Source / Channel Analysis
Top booking sources by volume:
Website - 226 Reservation
Walk-in - 221 Reservation

Top revenue-generating sources:
Booking Platform - $92872
Walk-in - $91010


## Conclusion
This hotel booking analysis highlights that revenue performance is driven by countries like United states,Romania,Norway, room types - Deluxe and Suite, floors 1st and 3rd, and booking channels like website rather than booking volume alone. Guests from United states, staying in DELUXE on 1st or 3rd Floor, and purchasing add-on services such as breakfast and spa packages contribute the highest revenue.

By focusing on:
High-value countries and genders
Premium rooms and floors
Profitable services
Low-risk booking channels
the hotel can increase revenue, reduce unpaid exposure, and improve operational efficiency.