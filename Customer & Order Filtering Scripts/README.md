# 📁 Customer & Order Filtering Logic

This folder contains SQL scripts focused on filtering and retrieving customer and order data based on specific patterns, conditions, and business rules.
---

## 📄 Query List

| File | Description |
|------|-------------|
| `customers_no_orders_or_name_or_address.sql` | Customers who never ordered, have middle initials C–G, or live on a "Dr" street. |
| `recent_orders_william_shipping.sql` | Orders in the last 30 days with specific shipping codes and customers whose name contains "William". |
| `weekend_orders_non_thu_fri_delivery.sql` | Shipping codes for orders placed on weekends but not delivered on Thursday or Friday. |
| `mismatched_customer_shipto.sql` | Customers whose name or contact info doesn’t match with their shipping address record. |
| `custom_customer_order_summary.sql` | Full name, order month/year, and total additional cost for customers in cities starting with C/K/L and specific zip rules. |

---
## 💡 Purpose

This assignment was designed to build skills in advanced filtering, string manipulation, temporal logic, and multi-condition querying in SQL.
