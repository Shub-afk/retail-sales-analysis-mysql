-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 02_data_cleaning.sql
-- Purpose: Data Quality Assessment
-- =====================================================

USE retail_sales_db;

-- =====================================================
-- 1. Total Records
-- =====================================================

SELECT COUNT(*) AS total_records
FROM retail_sales_dataset;

-- =====================================================
-- 2. Check for Duplicate Transactions
-- =====================================================

SELECT
    Transaction_ID,
    COUNT(*) AS duplicate_count
FROM retail_sales_dataset
GROUP BY Transaction_ID
HAVING COUNT(*) > 1;

-- =====================================================
-- 3. Check for Missing Values
-- =====================================================

SELECT *
FROM retail_sales_dataset
WHERE
    Transaction_ID IS NULL
    OR Date IS NULL
    OR Customer_ID IS NULL
    OR Gender IS NULL
    OR Age IS NULL
    OR Product_Category IS NULL
    OR Quantity IS NULL
    OR Price_per_Unit IS NULL
    OR Total_Amount IS NULL;

-- =====================================================
-- 4. Check for Invalid Age
-- =====================================================

SELECT *
FROM retail_sales_dataset
WHERE Age < 0
   OR Age > 100;

-- =====================================================
-- 5. Check for Invalid Quantity
-- =====================================================

SELECT *
FROM retail_sales_dataset
WHERE Quantity <= 0;

-- =====================================================
-- 6. Check for Negative Price
-- =====================================================

SELECT *
FROM retail_sales_dataset
WHERE Price_per_Unit <= 0;

-- =====================================================
-- 7. Check for Negative Total Amount
-- =====================================================

SELECT *
FROM retail_sales_dataset
WHERE Total_Amount <= 0;
