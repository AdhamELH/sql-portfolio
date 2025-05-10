-- Regional Order Stats
-- Displays orders, quantities, and customers by ProductID, PostalCode, and OrderYear.

SELECT 
    SOD.ProductID,
    C.PostalCode,
    YEAR(SO.OrderDate) AS OrderYear,
    COUNT(DISTINCT SO.SalesOrderNumber) AS NumberOfOrders,
    SUM(SOD.OrderQty) AS TotalQuantityOrdered,
    COUNT(DISTINCT SO.CustomerID) AS NumberOfCustomers
FROM 
    ORDER_DETAILS SOD
    LEFT JOIN SALES_ORDERS SO ON SOD.SalesOrderNum = SO.SalesOrderNumber
    LEFT JOIN CUSTOMER C ON SO.CustomerID = C.CustID
GROUP BY 
    SOD.ProductID,
    C.PostalCode,
    YEAR(SO.OrderDate)
ORDER BY 
    TotalQuantityOrdered DESC;
