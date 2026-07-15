-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- Author: shubham negi
-- Description: Database setup and initial verification
-- =====================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS retail_sales_db;

-- Select Database
USE retail_sales_db;

-- Display all tables
SHOW TABLES;

-- View the dataset
SELECT *
FROM retail_sales_dataset
LIMIT 10;

-- Check table structure
DESCRIBE retail_sales_dataset;
