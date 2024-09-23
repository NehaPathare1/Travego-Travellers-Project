-- Travego Travellers SQL Project
-- This repository demonstrates various SQL operations for a travel agency database. It includes table creation, data insertion, and query operations.

Table Creation

-- Create 'PASSENGER' table
CREATE TABLE PASSENGER (
   Passenger_id INT PRIMARY KEY,
   Passenger_name TEXT,
   Category TEXT,
   Gender TEXT,
   Boarding_City TEXT,
   Destination_City TEXT,
   Distance INT,
   Bus_Type TEXT
);

-- Create 'PRICE' table
CREATE TABLE PRICE (
   id INT PRIMARY KEY,
   Bus_Type TEXT,
   Distance INT,
   Price INT
);


Data Insertion

-- Insert data into 'PASSENGER' table
INSERT INTO PASSENGER (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES
(1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
(2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
(3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
(4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
(5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
(6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
(7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
(8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
(9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

-- Insert data into 'PRICE' table
INSERT INTO PRICE (id, Bus_Type, Distance, Price)
VALUES
(1, 'Sleeper', 350, 770),
(2, 'Sleeper', 500, 1100),
(3, 'Sleeper', 600, 1320),
(4, 'Sleeper', 700, 1540),
(5, 'Sleeper', 1000, 2200),
(6, 'Sleeper', 1200, 2640),
(7, 'Sleeper', 1500, 2700),
(8, 'Sitting', 500, 620),
(9, 'Sitting', 600, 744),
(10, 'Sitting', 700, 868),
(11, 'Sitting', 1000, 1240),
(12, 'Sitting', 1200, 1488),
(13, 'Sitting', 1500, 1860);


-- SQL Queries

-- 1. Count of Female Passengers Traveling a Minimum Distance

SELECT Gender, COUNT(*) AS count
FROM Passenger
WHERE Gender = 'F' AND Distance >= 600
GROUP BY Gender;

-- 2. Passenger Details for Long-Distance Sleeper Bus Travel

SELECT *
FROM PASSENGER
WHERE Bus_Type = 'Sleeper' AND Distance > 500;
 
-- 3. Select Passengers with Names Starting with 'S'

SELECT Passenger_name
FROM Passenger
WHERE Passenger_name LIKE 'S%'
ORDER BY Passenger_name;

-- 4. Calculate Price Charged for Each Passenger

SELECT Passenger_name, Boarding_City, Destination_City, Bus_Type, Price
FROM PASSENGER JOIN PRICE
USING (Bus_Type, Distance)
GROUP BY Passenger_name, Boarding_City, Destination_City, Bus_Type;


-- Data Modification

-- 1. Update Bus Category Based on Bus Type

UPDATE PASSENGER
SET Category = 'Non-AC'
WHERE Bus_Type = 'Sleeper';

-- 2. Delete Passenger from Database

BEGIN;
DELETE FROM PASSENGER
WHERE Passenger_name = 'Piyush';
COMMIT;

-- 3. Delete Table from Database

DROP TABLE PASSENGER;
