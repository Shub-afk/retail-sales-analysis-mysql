-- =====================================================
-- Project: Retail Sales Analysis Using MySQL
-- File: 01_database_setup.sql
-- Author: Shubham negi
-- Purpose: Database Setup & Verification
-- =====================================================

-- Create Database (if it doesn't already exist)
CREATE DATABASE IF NOT EXISTS retail_sales_db;

-- Select Database
USE retail_sales_db;

-- Show all tables
SHOW TABLES;

-- Preview the dataset
SELECT *
FROM retail_sales_dataset
LIMIT 10;

-- Display table structure
DESCRIBE retail_sales_dataset;

-- Count total records
SELECT COUNT(*) AS total_records
FROM retail_sales_dataset;
