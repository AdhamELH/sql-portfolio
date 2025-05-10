-- Product Sales Analysis
-- Shows total product sales, quantity ordered, number of orders, and number of customers

SELECT 
    P.ProductName,
    SUM(sod.LineTotal) AS TotalProductSales,
    SUM(sod.OrderQty) AS TotalQuantityOrdered,
    COUNT(DISTINCT sod.SalesOrderNum) AS NumberOfSalesOrders,
    COUNT(DISTINCT so.CustomerID) AS NumberOfCustomers
FROM 
    [PRODUCT] P
    LEFT JOIN ORDER_DETAILS sod ON p.ProductID = sod.ProductID
    LEFT JOIN SALES_ORDERS so ON sod.SalesOrderNum = so.SalesOrderNumber
GROUP BY 
    p.ProductName
ORDER BY 
    NumberOfCustomers DESC;
