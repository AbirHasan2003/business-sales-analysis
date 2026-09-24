-- =========================================================
-- BUSINESS SALES ANALYSIS
-- DATABASE SETUP
-- =========================================================

-- Create database
CREATE DATABASE IF NOT EXISTS business_analysis;

-- Select database
USE business_analysis;

-- Create sales table
CREATE TABLE IF NOT EXISTS sales_data (
Order_ID INT,
Order_Date DATE,
Customer_ID VARCHAR(10),
Customer_Name VARCHAR(100),
Category VARCHAR(50),
Product VARCHAR(100),
Quantity INT,
Unit_Price DECIMAL(10,2),
Sales DECIMAL(10,2),
Cost DECIMAL(10,2),
Profit DECIMAL(10,2),
Region VARCHAR(50),
Payment_Method VARCHAR(50)
);

-- Check table
SHOW TABLES;

-- Check table structure
DESCRIBE sales_data;

-- Check number of records
SELECT COUNT(*) AS total_records
FROM sales_data;
