-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 03_exploratory_data_analysis.sql
-- Purpose: Explore and understand the dataset
-- =====================================================

USE retail_sales_db;

-- =====================================================
-- 1. Total Number of Transactions
-- =====================================================

SELECT COUNT(*) AS Total_Transactions
FROM retail_sales_dataset;

-- =====================================================
-- 2. Total Revenue
-- =====================================================

SELECT
    SUM(`Total Amount`) AS Total_Revenue
FROM retail_sales_dataset;

-- =====================================================
-- 3. Average Order Value
-- =====================================================

SELECT
    ROUND(AVG(`Total Amount`),2) AS Average_Order_Value
FROM retail_sales_dataset;

-- =====================================================
-- 4. Total Quantity Sold
-- =====================================================

SELECT
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales_dataset;

-- =====================================================
-- 5. Average Customer Age
-- =====================================================

SELECT
    ROUND(AVG(Age),2) AS Average_Age
FROM retail_sales_dataset;

-- =====================================================
-- 6. Gender Distribution
-- =====================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers
FROM retail_sales_dataset
GROUP BY Gender;

-- =====================================================
-- 7. Product Categories Available
-- =====================================================

SELECT DISTINCT
    `Product Category`
FROM retail_sales_dataset;

-- =====================================================
-- 8. Date Range of Dataset
-- =====================================================

SELECT
    MIN(Date) AS Start_Date,
    MAX(Date) AS End_Date
FROM retail_sales_dataset;
