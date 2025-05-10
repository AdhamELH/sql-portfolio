# 📁 SQL Queries – Retail Database Project

This folder contains SQL scripts written for analyzing and managing a sample retail sales database.

---
## 🏗️ Setup Script

- [`Retail Database.sql`](./Retail%20Database.sql)  
  ⤷ Recreates the full retail database, including schema and sample data. Run this first in SSMS before executing the other queries.
---
## 📊 Analysis Scripts

| File | Description |
|------|-------------|
| [`product_sales_analysis.sql`](./product_sales_analysis.sql) | Total sales, order quantity, order count, and customer count per product. |
| [`high_demand_products.sql`](./high_demand_products.sql) | Identifies products with >100 units sold and ≥200 unique customers. |
| [`regional_order_stats.sql`](./regional_order_stats.sql) | Aggregated orders and customers by product, postal code, and year. |
| [`postalcode_quarterly_sales.sql`](./postalcode_quarterly_sales.sql) | Sales and freight averages by quarter and postal code. |
| [`top_customers_by_sales.sql`](./top_customers_by_sales.sql) | Customers with over $100K in sales from cities starting with letters S through W. |

---
## 💡 Notes

- Scripts are modular and well-commented for clarity.
- Designed for learning and demonstration purposes — can be extended to BI dashboards.

