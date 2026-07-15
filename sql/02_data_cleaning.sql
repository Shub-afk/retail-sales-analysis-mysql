-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 02_data_cleaning.sql
-- =====================================================

USE retail_sales_db;

-- Total Records
SELECT COUNT(*) AS total_records
FROM retail_sales_dataset;

-- Duplicate Transactions
SELECT
    `Transaction ID`,
    COUNT(*) AS duplicate_count
FROM retail_sales_dataset
GROUP BY `Transaction ID`
HAVING COUNT(*) > 1;

-- Missing Values
SELECT *
FROM retail_sales_dataset
WHERE
    `Transaction ID` IS NULL
    OR Date IS NULL
    OR `Customer ID` IS NULL
    OR Gender IS NULL
    OR Age IS NULL
    OR `Product Category` IS NULL
    OR Quantity IS NULL
    OR `Price per Unit` IS NULL
    OR `Total Amount` IS NULL;

-- Invalid Age
SELECT *
FROM retail_sales_dataset
WHERE Age < 0
   OR Age > 100;

-- Invalid Quantity
SELECT *
FROM retail_sales_dataset
WHERE Quantity <= 0;

-- Invalid Price
SELECT *
FROM retail_sales_dataset
WHERE `Price per Unit` <= 0;

-- Invalid Total Amount
SELECT *
FROM retail_sales_dataset
WHERE `Total Amount` <= 0;
