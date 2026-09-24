# Business Sales Analysis

## Project Overview

This project analyzes business sales data using **MySQL and SQL** to understand sales performance, customer behavior, product performance, regional performance, payment methods, and sales trends over time.

The project demonstrates how SQL can be used to transform raw sales data into meaningful business insights.

---

## Dataset

The dataset contains **500 sales records** covering multiple customers, products, categories, regions, and payment methods.

### Key Metrics

| Metric                |      Value |
| --------------------- | ---------: |
| Total Records         |        500 |
| Total Sales           | 156,060.00 |
| Total Cost            | 109,193.00 |
| Total Profit          |  46,867.00 |
| Overall Profit Margin |     30.03% |

---

## Key Business Insights

### Customer Performance

The analysis contains 20 customers with 25 orders each.

The highest recorded sales totals were:

| Customer |     Sales |   Profit |
| -------- | --------: | -------: |
| Rahim    | 19,786.00 | 4,358.00 |
| Mim      | 19,401.00 | 3,944.00 |
| Nusrat   | 11,640.00 | 3,523.00 |
| Jannat   | 11,385.00 | 3,012.00 |
| Sumaiya  | 10,567.00 | 2,868.00 |

Customer profit margins vary considerably, showing that revenue alone does not describe customer profitability.

---

### Category Performance

| Category    | Orders |     Sales |    Profit | Margin |
| ----------- | -----: | --------: | --------: | -----: |
| Electronics |    130 | 68,479.00 | 17,612.00 | 25.72% |
| Furniture   |    100 | 39,123.00 | 12,732.00 | 32.54% |
| Grocery     |     95 | 21,663.00 |  4,881.00 | 22.53% |
| Clothing    |    100 | 18,429.00 |  7,954.00 | 43.16% |
| Stationery  |     75 |  8,366.00 |  3,688.00 | 44.08% |

Electronics generates the largest sales and profit totals, while Clothing and Stationery show higher profit margins.

---

### Regional Performance

| Region     | Orders |     Sales |    Profit | Margin |
| ---------- | -----: | --------: | --------: | -----: |
| Dhaka      |    175 | 74,927.00 | 19,781.00 | 26.40% |
| Sylhet     |    100 | 27,109.00 |  8,886.00 | 32.78% |
| Chattogram |    100 | 26,911.00 |  7,966.00 | 29.60% |
| Rajshahi   |     75 | 16,809.00 |  5,969.00 | 35.51% |
| Khulna     |     50 | 10,304.00 |  4,265.00 | 41.39% |

Dhaka has the highest sales volume, while profit margins differ across regions.

---

### Payment Method Analysis

| Payment Method | Orders |     Sales | Sales Contribution |    Profit |
| -------------- | -----: | --------: | -----------------: | --------: |
| Card           |    195 | 89,171.00 |             57.14% | 23,799.00 |
| Cash           |    150 | 29,559.00 |             18.94% | 11,186.00 |
| Mobile Banking |    130 | 25,690.00 |             16.46% |  8,359.00 |
| Bank Transfer  |     25 | 11,640.00 |              7.46% |  3,523.00 |

Card transactions represent the largest share of recorded sales.

---

## Product Insights

Products with high recorded sales include:

* Laptop — 43,395.00
* Rice — 16,184.00
* Sofa — 14,065.00
* Table — 12,831.00
* Monitor — 12,620.00

Products with relatively high profit margins include:

* Pen — 50.00%
* Mouse — 49.94%
* Shirt — 45.34%
* T-Shirt — 45.20%
* Notebook — 45.03%

The analysis shows that high sales revenue and high profit margin are not necessarily the same thing.

---

## Sales Trend

Annual sales from the available dataset:

| Year  |     Sales |    Profit | Margin |
| ----- | --------: | --------: | -----: |
| 2026  | 33,051.00 |  9,806.00 | 29.67% |
| 2027  | 36,316.00 | 10,771.00 | 29.66% |
| 2028  | 37,589.00 | 11,482.00 | 30.55% |
| 2029  | 46,224.00 | 13,862.00 | 29.99% |
| 2030* |  2,880.00 |    946.00 | 32.85% |

**Note:** 2030 contains only a partial period in the dataset and should not be directly compared with the full-year results.

Year-over-year sales growth:

* 2027: 9.88%
* 2028: 3.51%
* 2029: 22.97%

---

## Business Recommendations

### 1. Monitor Electronics profitability

Electronics produces substantial revenue and profit, but its margin is lower than several other categories. Product-level cost and pricing analysis can help identify opportunities to improve margins.

### 2. Monitor high-margin products

Products such as Pen, Mouse, Shirt, T-Shirt, and Notebook have relatively high profit margins. Their sales volume and inventory should be monitored.

### 3. Analyze regional profitability

Dhaka generates the largest sales volume, while other regions show different profit margins. Further analysis of pricing, product mix, and operating costs could explain these differences.

### 4. Support multiple payment methods

Card and Mobile Banking account for a substantial portion of recorded transactions. Maintaining convenient digital payment options can support customer purchasing behavior.

### 5. Analyze customer profitability

Customers with high sales are not necessarily the customers with the highest profit margins. Customer analysis should consider both revenue and profitability.

### 6. Monitor monthly sales fluctuations

Monthly results vary throughout the dataset. Tracking monthly patterns can support inventory planning and promotional decisions.

---

## SQL Analysis

The project includes SQL queries for:

* Overall sales performance
* Customer performance
* Category analysis
* Regional analysis
* Payment method analysis
* Yearly sales performance
* Monthly sales performance
* Year-over-year growth
* Product performance
* Product ranking
* Top 10 customers
* Top 10 products by profit
* High-sales/low-margin products
* Customer profit margins

---

## Project Structure

```text
business-sales-analysis/
│
├── data/
│   └── sales_data.csv
│
├── sql/
│   ├── database_setup.sql
│   ├── business_sales_analysis.sql
│   └── README.md
│
├── insights/
│   └── README.md
│
└── README.md
```

---

## Tools Used

* **MySQL**
* **MySQL Workbench**
* **SQL**
* **GitHub**

---

## Conclusion

This project demonstrates practical SQL skills for business analysis, including aggregation, grouping, filtering, window functions, ranking, profitability analysis, and time-based sales analysis.

The analysis converts raw sales records into structured business insights that can support decisions related to customers, products, regions, payment methods, and sales performance.
