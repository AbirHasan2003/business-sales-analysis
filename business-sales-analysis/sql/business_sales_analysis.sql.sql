-- =========================================================
-- BUSINESS SALES ANALYSIS
-- Database: business_analysis
-- Table: sales_data
-- =========================================================

USE business_analysis;

-- =========================================================
-- 1. CHECK TABLE
-- =========================================================

SHOW TABLES;

DESCRIBE sales_data;

-- =========================================================
-- 2. OVERALL SALES PERFORMANCE
-- =========================================================

SELECT
COUNT(*) AS total_records,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Cost), 2) AS total_cost,
ROUND(SUM(Profit), 2) AS total_profit
FROM sales_data;

-- =========================================================
-- 3. CUSTOMER PERFORMANCE
-- =========================================================

SELECT
Customer_ID,
Customer_Name,
COUNT(*) AS total_orders,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY total_sales DESC;

-- =========================================================
-- 4. SALES BY CATEGORY
-- =========================================================

SELECT
Category,
COUNT(*) AS total_orders,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Cost), 2) AS total_cost,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;

-- =========================================================
-- 5. SALES BY REGION
-- =========================================================

SELECT
Region,
COUNT(*) AS total_orders,
COUNT(DISTINCT Customer_ID) AS unique_customers,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Cost), 2) AS total_cost,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;

-- =========================================================
-- 6. SALES BY PAYMENT METHOD
-- =========================================================

SELECT
Payment_Method,
COUNT(*) AS total_orders,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(
(SUM(Sales) / (SELECT SUM(Sales) FROM sales_data)) * 100,
2
) AS sales_contribution_pct,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Payment_Method
ORDER BY total_sales DESC;

-- =========================================================
-- 7. YEARLY SALES PERFORMANCE
-- =========================================================

SELECT
YEAR(Order_Date) AS order_year,
COUNT(*) AS total_orders,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Cost), 2) AS total_cost,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY YEAR(Order_Date)
ORDER BY order_year;

-- =========================================================
-- 8. MONTHLY SALES PERFORMANCE
-- =========================================================

SELECT
YEAR(Order_Date) AS order_year,
MONTH(Order_Date) AS order_month,
COUNT(*) AS total_orders,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY order_year, order_month;

-- =========================================================
-- 9. YEAR-OVER-YEAR SALES GROWTH
-- =========================================================

WITH yearly_sales AS (
SELECT
YEAR(Order_Date) AS order_year,
SUM(Sales) AS total_sales
FROM sales_data
GROUP BY YEAR(Order_Date)
)
SELECT
order_year,
ROUND(total_sales, 2) AS total_sales,
ROUND(
(total_sales - LAG(total_sales) OVER (ORDER BY order_year))
/ LAG(total_sales) OVER (ORDER BY order_year) * 100,
2
) AS yoy_growth_pct
FROM yearly_sales
ORDER BY order_year;

-- =========================================================
-- 10. PRODUCT PERFORMANCE
-- =========================================================

SELECT
Category,
Product,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Cost), 2) AS total_cost,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Category, Product
ORDER BY Category, total_sales DESC;

-- =========================================================
-- 11. PRODUCT RANKING WITHIN EACH CATEGORY
-- =========================================================

WITH product_performance AS (
SELECT
Category,
Product,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Category, Product
)
SELECT
Category,
Product,
units_sold,
total_sales,
total_profit,
profit_margin,
RANK() OVER (
PARTITION BY Category
ORDER BY total_sales DESC
) AS sales_rank
FROM product_performance
ORDER BY Category, sales_rank;

-- =========================================================
-- 12. TOP 10 CUSTOMERS BY SALES
-- =========================================================

SELECT
Customer_ID,
Customer_Name,
COUNT(*) AS total_orders,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY total_sales DESC
LIMIT 10;

-- =========================================================
-- 13. TOP 10 PRODUCTS BY PROFIT
-- =========================================================

SELECT
Category,
Product,
SUM(Quantity) AS units_sold,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Category, Product
ORDER BY total_profit DESC
LIMIT 10;

-- =========================================================
-- 14. PRODUCTS WITH HIGH SALES BUT LOW PROFIT MARGIN
-- =========================================================

SELECT
Category,
Product,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Category, Product
HAVING SUM(Sales) > 5000
ORDER BY profit_margin ASC;

-- =========================================================
-- 15. CUSTOMER PROFIT MARGIN
-- =========================================================

SELECT
Customer_ID,
Customer_Name,
ROUND(SUM(Sales), 2) AS total_sales,
ROUND(SUM(Profit), 2) AS total_profit,
ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY profit_margin DESC;

-- =========================================================
-- END OF BUSINESS SALES ANALYSIS
-- =========================================================
