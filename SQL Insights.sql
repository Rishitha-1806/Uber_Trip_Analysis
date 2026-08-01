CREATE DATABASE uber_project;
USE uber_project;
CREATE TABLE uber_requests (
    request_id INT,
    pickup_point VARCHAR(50),
    driver_id INT,
    status VARCHAR(50),
    request_timestamp DATETIME,
    drop_timestamp DATETIME,
    Trip_by_hour INT,
    request_by_day VARCHAR(20)
);
SELECT *
FROM uber_requests
LIMIT 10;

/*Insight 1: Total Requests*/
SELECT COUNT(*) AS Total_Requests
FROM uber_requests;

/*Insight 2: Number of Trips by Status*/
SELECT
status,
COUNT(*) AS Total
FROM uber_requests
GROUP BY status;

/*Insight 3: Requests by Pickup Point*/
SELECT
pickup_point,
COUNT(*) AS Requests
FROM uber_requests
GROUP BY pickup_point;

/*Insight 4: Peak Request Hours*/
SELECT
    Trip_by_hour,
    COUNT(*) AS Total_Requests
FROM uber_requests
GROUP BY Trip_by_hour
ORDER BY Trip_by_hour;

/*Insight 5: Busiest Day*/
SELECT
request_by_day,
COUNT(*) AS Total_Trips
FROM uber_requests
GROUP BY request_by_day
ORDER BY Total_Trips DESC;

/*Insight 6: Completed Trips by Pickup Point*/
SELECT
pickup_point,
COUNT(*) AS Completed_Trips
FROM uber_requests
WHERE status='Trip Completed'
GROUP BY pickup_point;

/*Insight 7: Cancelled Trips by Pickup Point*/
SELECT
pickup_point,
COUNT(*) AS Cancelled
FROM uber_requests
WHERE status='Cancelled'
GROUP BY pickup_point;

/*Insight 8: No Cars Available by Pickup Point*/
SELECT
pickup_point,
COUNT(*) AS No_Cars
FROM uber_requests
WHERE status='No Cars Available'
GROUP BY pickup_point;

/*Insight 9: Top 10 Drivers by Trips*/
SELECT
driver_id,
COUNT(*) AS Trips
FROM uber_requests
WHERE driver_id IS NOT NULL
GROUP BY driver_id
ORDER BY Trips DESC
LIMIT 10;

/*Insight 10: Airport Requests*/
SELECT
COUNT(*) AS Airport_Trips
FROM uber_requests
WHERE pickup_point='Airport';

/*Insight 11: City Requests*/
SELECT
COUNT(*) AS City_Trips
FROM uber_requests
WHERE pickup_point='City';

/*Insight 12: Percentage of Completed Trips*/
SELECT
ROUND(
COUNT(CASE WHEN status='Trip Completed' THEN 1 END)
*100.0/COUNT(*),2)
AS Completion_Percentage
FROM uber_requests;

/*Insight 13: Cancellation Percentage*/
SELECT
ROUND(
COUNT(CASE WHEN status='Cancelled' THEN 1 END)
*100.0/COUNT(*),2)
AS Cancellation_Percentage
FROM uber_requests;

/*Insight 14: Requests During Peak Hours*/
SELECT
Trip_by_hour,
COUNT(*) AS Total
FROM uber_requests
WHERE Trip_by_hour BETWEEN 17 AND 21
GROUP BY trip_by_hour;

/*Insight 15: Trips During Early Morning*/
SELECT
Trip_by_hour,
COUNT(*) AS Total
FROM uber_requests
WHERE Trip_by_hour BETWEEN 0 AND 5
GROUP BY Trip_by_hour;

