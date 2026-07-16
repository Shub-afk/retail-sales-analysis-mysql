-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 06_advanced_sql.sql
-- Purpose: Advanced SQL Analysis
-- =====================================================

USE retail_sales_db;

-- =====================================================
-- 1. Revenue Contribution by Product Category
-- =====================================================

SELECT
    `Product Category`,
    SUM(`Total Amount`) AS Revenue,

    ROUND(
        SUM(`Total Amount`) * 100 /
        (SELECT SUM(`Total Amount`) FROM retail_sales_dataset),
        2
    ) AS Revenue_Percentage

FROM retail_sales_dataset

GROUP BY `Product Category`

ORDER BY Revenue DESC;

-- =====================================================
-- 2. Rank Product Categories by Revenue
-- =====================================================

SELECT

    `Product Category`,

    SUM(`Total Amount`) AS Revenue,

    RANK() OVER(
        ORDER BY SUM(`Total Amount`) DESC
    ) AS Revenue_Rank

FROM retail_sales_dataset

GROUP BY `Product Category`;

-- =====================================================
-- 3. Dense Rank Product Categories
-- =====================================================

SELECT

    `Product Category`,

    SUM(`Total Amount`) AS Revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(`Total Amount`) DESC
    ) AS Dense_Rank

FROM retail_sales_dataset

GROUP BY `Product Category`;

-- =====================================================
-- 4. Running Total of Daily Revenue
-- =====================================================

SELECT

    Date,

    SUM(`Total Amount`) AS Daily_Revenue,

    SUM(SUM(`Total Amount`))
    OVER(
        ORDER BY Date
    ) AS Running_Total

FROM retail_sales_dataset

GROUP BY Date;

-- =====================================================
-- 5. Top 5 Highest Revenue Days
-- =====================================================

SELECT

    Date,

    SUM(`Total Amount`) AS Revenue

FROM retail_sales_dataset

GROUP BY Date

ORDER BY Revenue DESC

LIMIT 5;

-- =====================================================
-- 6. Top 3 Transactions from Each Product Category
-- =====================================================

SELECT *

FROM (

SELECT

    `Transaction ID`,
    `Product Category`,
    `Total Amount`,

    ROW_NUMBER() OVER(

        PARTITION BY `Product Category`

        ORDER BY `Total Amount` DESC

    ) AS Row_Num

FROM retail_sales_dataset

) ranked_transactions

WHERE Row_Num <= 3;
