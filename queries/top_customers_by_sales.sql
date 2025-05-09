-- Top Customers by Sales
-- Returns customers with total sales > $100,000 and cities starting with letters S through W.

SELECT 
    C.CustID,
    COUNT(DISTINCT SO.SalesOrderNumber) AS NumberOfSalesOrders,
    SUM(SO.TotalDue) AS TotalSales
FROM 
    CUSTOMER C
    JOIN SALES_ORDERS SO ON C.CustID = SO.CustomerID
WHERE 
    C.City LIKE '[S-W]%'
GROUP BY 
    C.CustID
HAVING 
    SUM(SO.TotalDue) > 100000
ORDER BY 
    TotalSales DESC;
