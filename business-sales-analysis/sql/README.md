# SQL Files

This folder contains the SQL scripts used for the Business Sales Analysis project.

## Files

### `database_setup.sql`

This script is used to set up the MySQL environment for the project.

It includes:

* Creating the `business_analysis` database
* Selecting the database
* Creating the `sales_data` table
* Checking the available tables
* Checking the table structure
* Checking the number of records

### `business_sales_analysis.sql`

This script contains the SQL analysis performed on the `sales_data` table.

The analysis includes:

1. Overall sales performance
2. Customer performance
3. Sales by category
4. Sales by region
5. Sales by payment method
6. Yearly sales performance
7. Monthly sales performance
8. Year-over-year sales growth
9. Product performance
10. Product ranking within categories
11. Top 10 customers by sales
12. Top 10 products by profit
13. High-sales and low-margin products
14. Customer profit margin analysis

## Database

**Database:** `business_analysis`

**Main table:** `sales_data`

## Tools

* MySQL
* MySQL Workbench
* SQL

## How to Run

Run `database_setup.sql` first to create the database and table.

After the data has been loaded into `sales_data`, run `business_sales_analysis.sql` to perform the analysis.
