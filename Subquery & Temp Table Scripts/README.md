# 📁 Subquery & Temp Table Analytics – HW7

This folder contains advanced SQL scripts that use temporary tables, subqueries, and aggregation logic to analyze customer behavior, order patterns, and product sales using a SQL Server retail database.

---
## 🔗 Database Access

Due to size limitations, the full SQL Server database is hosted externally:

📥 [Download Retail Database (SQL Server) – Google Drive](https://drive.google.com/file/d/12eE1ivC_bTpomX8NcQmRxw8thCzeOKzG/view?usp=sharing)
---

## 📄 Query List

| File | Description |
|------|-------------|
| `customer_order_counts_by_postalcode.sql` | Counts customers by postal code and groups them by number of orders placed (5+, 2–4). |
| `2004_customers_in_high_order_postalcodes.sql` | Filters customers who live in areas with >50 orders in 2004 and shows their 2004 stats. |
| `product_count_distribution_per_order.sql` | Shows how many different products were ordered per order, and what % of total orders that represents. |
| `product_order_stats_2004.sql` | For each product, displays order and customer counts from 2004, plus how many orders included quantity ≥ 2. |

---
## 💡 Purpose

This assignment emphasizes subqueries, temporary tables, derived metrics, and grouped analysis — great for practicing intermediate-to-advanced SQL logic used in business intelligence work.
