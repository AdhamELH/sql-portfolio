-- High Demand Products
-- Lists ProductIDs with more than 100 units sold and at least 200 unique customers.

SELECT 
    P.ProductID,
    COUNT(DISTINCT SO.CustomerID) AS NumberOfCustomers
FROM 
    PRODUCT P
    LEFT JOIN ORDER_DETAILS SOD ON P.ProductID = SOD.ProductID
    LEFT JOIN SALES_ORDERS SO ON SOD.SalesOrderNum = SO.SalesOrderNumber
GROUP BY 
    P.ProductID
HAVING 
    SUM(SOD.OrderQty) > 100
    AND COUNT(DISTINCT SO.CustomerID) >= 200
ORDER BY 
    NumberOfCustomers DESC;
