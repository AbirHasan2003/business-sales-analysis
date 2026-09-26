# 📊 Business Sales Analysis Using MySQL

A practical SQL-based business data analysis project focused on understanding **sales performance, profitability, customer behavior, product performance, regional performance, payment methods, and sales trends** using MySQL.

The project was developed as a personal portfolio project to strengthen practical skills in **SQL, database management, business analysis, and data-driven decision-making**.

---

## 📌 Project Overview

Businesses generate large amounts of transactional data, but raw data alone does not provide useful business value.

This project demonstrates how structured sales data can be stored in a relational database and analyzed using SQL to answer practical business questions.

The analysis focuses on transforming transactional sales data into meaningful business information that can support:

* Sales performance monitoring
* Profitability analysis
* Customer analysis
* Product performance analysis
* Regional comparison
* Payment-method analysis
* Time-based sales analysis
* Business KPI reporting

---

## 🎯 Project Objectives

The main objectives of this project are to:

1. Build a structured sales database using MySQL.
2. Store business transaction data in a relational table.
3. Validate and explore the dataset.
4. Use SQL to calculate business KPIs.
5. Analyze sales and profitability.
6. Identify product and category performance.
7. Analyze customer and regional performance.
8. Examine payment-method usage.
9. Analyze sales trends over time.
10. Convert raw transactional data into business-oriented insights.

---

## 🛠️ Technologies Used

| Technology          | Purpose                                                      |
| ------------------- | ------------------------------------------------------------ |
| **MySQL**           | Database management and SQL analysis                         |
| **SQL**             | Data querying, aggregation, filtering, and business analysis |
| **Microsoft Excel** | Source dataset and initial data preparation                  |
| **GitHub**          | Version control and project documentation                    |

---

## 📂 Dataset

The project uses a structured sales dataset containing transactional business information.

### Dataset Fields

| Column           | Description                           |
| ---------------- | ------------------------------------- |
| `Order_ID`       | Unique identifier for an order        |
| `Order_Date`     | Date when the order was placed        |
| `Customer_ID`    | Unique customer identifier            |
| `Customer_Name`  | Customer name                         |
| `Category`       | Product category                      |
| `Product`        | Product name                          |
| `Quantity`       | Number of units sold                  |
| `Unit_Price`     | Price per unit                        |
| `Sales`          | Total sales value                     |
| `Cost`           | Cost associated with the transaction  |
| `Profit`         | Profit generated from the transaction |
| `Region`         | Sales region                          |
| `Payment_Method` | Method used for payment               |

---

## 🗄️ Database Structure

The project uses a MySQL database named:

```sql
business_analysis
```

The main table is:

```sql
sales_data
```

### Table Schema

```sql
CREATE TABLE sales_data (
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
```

---

## 🔎 Data Analysis Areas

### 1. Overall Sales Performance

The project analyzes overall business performance using metrics such as:

* Total Orders
* Total Customers
* Total Quantity Sold
* Total Sales
* Total Cost
* Total Profit
* Profit Margin

Example:

```sql
SELECT
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    COUNT(DISTINCT Customer_ID) AS Total_Customers,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales_data;
```

---

### 2. Category Analysis

Category-level analysis is used to understand how different product categories contribute to sales and profitability.

```sql
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;
```

---

### 3. Product Performance

Product-level analysis identifies products based on sales volume and financial contribution.

```sql
SELECT
    Product,
    SUM(Quantity) AS Total_Quantity,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC;
```

---

### 4. Customer Analysis

Customer analysis examines order activity, sales contribution, and profitability.

```sql
SELECT
    Customer_ID,
    Customer_Name,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC;
```

---

### 5. Regional Analysis

Regional analysis helps compare sales and profitability across different business regions.

```sql
SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS Profit_Margin
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;
```

---

### 6. Payment Method Analysis

The project also examines business transactions by payment method.

```sql
SELECT
    Payment_Method,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Payment_Method
ORDER BY Total_Sales DESC;
```

---

### 7. Sales Trend Analysis

Time-based analysis is used to examine changes in sales and profitability.

```sql
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;
```

---

## 📈 Key Business Questions

This project is designed to answer questions such as:

* What are the overall sales and profit levels?
* What is the overall profit margin?
* Which product categories generate the most sales?
* Which products contribute the most revenue?
* Which products generate the most profit?
* Which customers contribute the most sales?
* How does performance vary by region?
* Which payment methods are most frequently used?
* How do sales and profit change over time?
* Which areas of the business require further investigation?

---

## 🧹 Data Validation

Before analysis, the dataset can be checked for common data-quality issues, including:

* Missing values
* Duplicate records
* Invalid dates
* Incorrect quantities
* Inconsistent sales calculations
* Inconsistent profit calculations

Example profit validation:

```sql
SELECT *
FROM sales_data
WHERE Profit <> Sales - Cost;
```

Example sales validation:

```sql
SELECT *
FROM sales_data
WHERE Sales <> Quantity * Unit_Price;
```

---

## 💼 Business Analysis Perspective

The purpose of this project goes beyond practicing SQL syntax.

The analysis follows a basic business-analysis workflow:

```text
Raw Business Data
       ↓
Data Validation
       ↓
Database Storage
       ↓
SQL Analysis
       ↓
Business KPIs
       ↓
Performance Analysis
       ↓
Business Insights
       ↓
Data-Driven Decision Support
```

This approach demonstrates how technical skills can be applied to business problems.

---

## 📁 Recommended Project Structure

```text
business-sales-analysis/
│
├── README.md
│
├── data/
│   └── SalesData.xlsx
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_validation.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_category_analysis.sql
│   ├── 05_product_analysis.sql
│   ├── 06_customer_analysis.sql
│   ├── 07_region_analysis.sql
│   ├── 08_payment_analysis.sql
│   └── 09_sales_trends.sql
│
└── screenshots/
    └── analysis-results.png
```

> The folder structure above represents the recommended organization for the project. Add the folders/files to the repository as the project develops.

---

## 🚀 How to Run the Project

### 1. Install MySQL

Install **MySQL Server** and **MySQL Workbench**.

### 2. Create the database

```sql
CREATE DATABASE business_analysis;
```

### 3. Select the database

```sql
USE business_analysis;
```

### 4. Create the table

Run the table creation script provided in the project.

### 5. Import the dataset

Import the sales dataset into the `sales_data` table.

### 6. Run validation queries

Check:

* Record count
* Missing values
* Duplicate records
* Date range
* Numeric values
* Sales calculations
* Profit calculations

### 7. Run analysis queries

Execute the SQL analysis scripts to generate business KPIs and performance analysis.

---

## 📊 Future Improvements

Possible extensions of this project include:

* Power BI dashboard integration
* Advanced SQL analysis using CTEs
* Window functions
* Customer segmentation
* Product profitability analysis
* Year-over-year analysis
* Monthly growth analysis
* Automated reporting
* Business forecasting
* Integration with Python for advanced analytics

---

## 🎓 Skills Demonstrated

This project demonstrates practical experience with:

**Technical Skills**

* MySQL
* SQL
* Relational databases
* Data validation
* Data aggregation
* Data filtering
* Business KPI calculations
* Analytical SQL

**Business & Analytical Skills**

* Business performance analysis
* Sales analysis
* Profitability analysis
* Customer analysis
* Product analysis
* Regional analysis
* Business problem solving
* Data-driven decision making

---

## 👤 Author

### G.M. Abir Hasan

Computer Science & Engineering Student
United International University, Bangladesh

**Career Interests**

* Business Analysis
* Business Process Automation
* Data Analysis
* Business Systems
* Digital Transformation

### Connect With Me

* **GitHub:** [AbirHasan2003](https://github.com/AbirHasan2003)
* **LinkedIn:** [G.M. Abir Hasan](https://www.linkedin.com/in/gmabirhasan/)

---

## 📌 Project Status

**Status:** Completed Personal Portfolio Project

This project represents a practical step in developing SQL and business-data analysis skills and will continue to evolve as additional analytical and visualization capabilities are added.

---

## ⭐ If You Find This Project Useful

Feel free to explore the repository, review the SQL queries, and provide feedback or suggestions.

**Thank you for visiting!**
