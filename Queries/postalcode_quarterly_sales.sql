-- Postal Code Quarterly Sales
-- Aggregates number of orders, total sales, and averages by Postal Code, Quarter, and Year.

SELECT 
    C.PostalCode,
    DATEPART(QUARTER, SO.OrderDate) AS Quarter,
    YEAR(SO.OrderDate) AS Year,
    COUNT(DISTINCT SO.SalesOrderNumber) AS NumberOfOrders,
    SUM(SO.TotalDue) AS TotalSales,
    AVG(SO.TotalDue) AS AvgTotalDuePerOrder,
    AVG(SO.Freight) AS AvgFreightPerOrder
FROM 
    SALES_ORDERS SO
    RIGHT JOIN CUSTOMER C ON SO.CustomerID = C.CustID
GROUP BY 
    C.PostalCode,
    DATEPART(QUARTER, SO.OrderDate),
    YEAR(SO.OrderDate)
ORDER BY 
    C.PostalCode;
