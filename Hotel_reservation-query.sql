use continental_crown;

-- Data Exproration

-- 1. Reservation / Booking Information
-- How many total reservations were made?
Select count(Reservation_ID) from booking_data;

-- How many bookings are created per day/week/month?
Select day(Booking_date), count(Reservation_ID) From booking_data
Group by day(booking_date)
order by day(Booking_date);

Select monthname(Booking_Date), Count(Reservation_ID) from booking_data
group by monthname(Booking_Date)
order by Count(Reservation_ID) desc;

Select Year(Booking_Date), Count(Reservation_ID) from booking_data
group by year(Booking_Date)
order by year(Booking_date);

-- What are the peak check-in dates?
Select Check_in_Date,count(reservation_id) from booking_data
group by Check_in_Date
order by count(Reservation_id) desc
limit 10;

-- Which months have the highest arrivals?
Select monthname(Check_in_Date),count(Reservation_id) from booking_data
group by monthname(Check_in_Date)
order by count(Reservation_id) desc;

-- 2.Guest Information

-- How many unique guests exist?
Select distinct count(Guest_ID) from booking_data;

-- What is the guest distribution by gender?
Select Gender, count(reservation_id) from booking_data
group by Gender;

-- What is the average revenue per booking by gender?
select Gender, count(Reservation_ID) as Total_Booking,
Sum(Total_Amount) as Total_Revenue,
round(Sum(total_amount)/count(Reservation_ID),2 ) as Avg_revenue from booking_data
Where Payment_Status = 'Paid' and Gender is not null
group by Gender;

-- How many bookings come from each country?
Select Nationality,count(Reservation_ID) from Booking_data
group by Nationality
order by count(Reservation_ID) desc;

-- Which countries generate the highest revenue?
select Nationality,
Sum(Total_Amount) as Total_Revenue from booking_data
Where 
payment_status = 'paid' and Nationality is not null
group by Nationality 
order by Sum(total_amount) desc;

-- 3. Room & Property Analysis
-- Which rooms are booked most frequently?
Select room_type, count(Reservation_ID) from booking_data
group by room_type
order by Count(Reservation_ID) desc;

-- Which rooms generate the highest total revenue?
select room_type,sum(total_amount) as Total_revenue from booking_data
Group by room_type
order by sum(total_amount);

-- What is the ADR per room
select
room_number,COUNT(Total_Nights),
sum(total_amount) as total_revenue,
round((sum(total_amount)/ COUNT(Total_Nights)),2) as ADR FROM booking_data
WHERE
Payment_status = 'paid'
and Check_out_Date > check_in_date
group by room_number
order by ADR desc;

-- What is the total revenue per floor?
select floor_Number, sum(total_amount) as Total_revenue from booking_data
where payment_status ='paid' and floor_number is not null
group by floor_number
order by floor_number;

-- 4. Pricing & Revenue
-- What is the total revenue generated?
select sum(total_amount) as total_revenue from booking_data
where payment_status ='paid';

-- What is the average revenue per booking?
Select 
count(reservation_id),
round(avg(total_amount),2) as average_revenue from booking_data;

-- How many unpaid bookings exist?
Select count(*) from booking_data
Where payment_status = 'pending';

-- What is the total unpaid revenue amount?
Select sum(total_amount) as unpaid_revenue from booking_data
Where payment_status = 'Pending';

-- Which room types have the highest unpaid rate?
Select room_type,sum(total_amount) as unpaid_revenue from booking_data
Where payment_status = 'pending'
group by room_type
order by unpaid_revenue desc;

-- Services & Add-ons
-- How many bookings include breakfast?
Select Breakfast_Included ,count(Reservation_ID) from booking_data
Where Breakfast_Included = 'Yes';

-- What is the average total amount with vs without breakfast?
Select Breakfast_Included, round(avg(total_amount),2) as Avg_total_Amount from booking_data
Group by breakfast_Included;

-- How many guests purchased spa packages?
Select Spa_Package_Included, count(Reservation_ID) from booking_data
Where Spa_Package_Included = 'Yes';

--  What is the average total amount with vs without spa packages?
select  Spa_Package_Included, sum(total_amount) from booking_data
group by Spa_Package_Included;

-- How many bookings include airport pickup?
Select Airport_Pickup_Included, count(Reservation_ID) from booking_data
Where Airport_Pickup_Included = 'Yes';

-- Booking Source / Channel
-- How many bookings come from each source?
Select Reservation_Source, count(Reservation_ID) from booking_data
Group by Reservation_Source ;

-- Which booking source generates the highest revenue?
Select Reservation_Source, count(Reservation_ID) as total_booking , sum(total_amount) as total_revenue from booking_data
Group by Reservation_Source 
order by total_revenue desc;

-- Which source has the highest unpaid booking percentage?
Select Reservation_Source , 
sum(total_amount) as unpaid_payments,
(sum(total_amount) * 100 / sum(total_amount)) as Unpaid_booking_percentage from booking_data
Where payment_status ='pending'
group by reservation_source;
