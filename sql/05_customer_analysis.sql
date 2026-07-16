-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 05_customer_analysis.sql
-- Purpose: Customer Behavior Analysis
-- =====================================================

USE retail_sales_db;

-- =====================================================
-- 1. Gender Distribution
-- =====================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers
FROM retail_sales_dataset
GROUP BY Gender;

-- =====================================================
-- 2. Revenue by Gender
-- =====================================================

SELECT
    Gender,
    SUM(`Total Amount`) AS Revenue
FROM retail_sales_dataset
GROUP BY Gender
ORDER BY Revenue DESC;

-- =====================================================
-- 3. Average Age of Customers
-- =====================================================

SELECT
    ROUND(AVG(Age),2) AS Average_Age
FROM retail_sales_dataset;

-- =====================================================
-- 4. Customer Age Groups
-- =====================================================

SELECT
    CASE
        WHEN Age < 20 THEN 'Teen'
        WHEN Age BETWEEN 20 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group,

    COUNT(*) AS Total_Customers

FROM retail_sales_dataset

GROUP BY Age_Group

ORDER BY Total_Customers DESC;

-- =====================================================
-- 5. Top 10 Customers by Spending
-- =====================================================

SELECT
    `Customer ID`,
    SUM(`Total Amount`) AS Total_Spending
FROM retail_sales_dataset
GROUP BY `Customer ID`
ORDER BY Total_Spending DESC
LIMIT 10;

-- =====================================================
-- 6. Average Customer Spending
-- =====================================================

SELECT
    ROUND(AVG(Customer_Spending),2) AS Avg_Customer_Spending
FROM
(
    SELECT
        `Customer ID`,
        SUM(`Total Amount`) AS Customer_Spending
    FROM retail_sales_dataset
    GROUP BY `Customer ID`
) AS spending_summary;

-- =====================================================
-- 7. Weekend vs Weekday Revenue
-- =====================================================

SELECT

CASE
    WHEN DAYOFWEEK(Date) IN (1,7)
    THEN 'Weekend'
    ELSE 'Weekday'
END AS Day_Type,

SUM(`Total Amount`) AS Revenue

FROM retail_sales_dataset

GROUP BY Day_Type;
