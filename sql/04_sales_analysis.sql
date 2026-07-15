-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 04_sales_analysis.sql
-- Purpose: Sales Performance Analysis
-- =====================================================

USE retail_sales_db;

-- =====================================================
-- 1. Total Revenue
-- =====================================================

SELECT
    SUM(`Total Amount`) AS Total_Revenue
FROM retail_sales_dataset;

-- =====================================================
-- 2. Revenue by Product Category
-- =====================================================

SELECT
    `Product Category`,
    SUM(`Total Amount`) AS Revenue
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Revenue DESC;

-- =====================================================
-- 3. Quantity Sold by Product Category
-- =====================================================

SELECT
    `Product Category`,
    SUM(Quantity) AS Total_Quantity_Sold
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Total_Quantity_Sold DESC;

-- =====================================================
-- 4. Average Selling Price by Category
-- =====================================================

SELECT
    `Product Category`,
    ROUND(AVG(`Price per Unit`),2) AS Average_Price
FROM retail_sales_dataset
GROUP BY `Product Category`
ORDER BY Average_Price DESC;

-- =====================================================
-- 5. Monthly Revenue Trend
-- =====================================================

SELECT
    MONTH(Date) AS Month_Number,
    MONTHNAME(Date) AS Month_Name,
    SUM(`Total Amount`) AS Revenue
FROM retail_sales_dataset
GROUP BY MONTH(Date), MONTHNAME(Date)
ORDER BY Month_Number;

-- =====================================================
-- 6. Top 10 Highest Value Transactions
-- =====================================================

SELECT *
FROM retail_sales_dataset
ORDER BY `Total Amount` DESC
LIMIT 10;

-- =====================================================
-- 7. Lowest Value Transactions
-- =====================================================

SELECT *
FROM retail_sales_dataset
ORDER BY `Total Amount`
LIMIT 10;

