-- Q2: Customers in postal codes with >50 orders in 2004 and their order stats

DECLARE @OrdersIn2004 TABLE (
    CustomerID VARCHAR(20),
    NumOrders INT,
    TotalSales DECIMAL(10,2)
);

DECLARE @QualifyingPostalCodes TABLE (
    PostalCode VARCHAR(20)
);

INSERT INTO @OrdersIn2004
SELECT 
    so.CustomerID,
    COUNT(so.SalesOrderNumber),
    SUM(so.TotalDue)
FROM SALES_ORDERS so
WHERE YEAR(so.OrderDate) = 2004
GROUP BY so.CustomerID;

INSERT INTO @QualifyingPostalCodes
SELECT c.PostalCode
FROM CUSTOMER c
JOIN SALES_ORDERS so ON c.CustID = so.CustomerID
WHERE YEAR(so.OrderDate) = 2004
GROUP BY c.PostalCode
HAVING COUNT(so.SalesOrderNumber) > 50;

SELECT 
    c.CustID AS [Customer ID],
    COALESCE(o.NumOrders, 0) AS [Total Orders in 2004],
    COALESCE(o.TotalSales, 0) AS [Total Sales in 2004]
FROM CUSTOMER c
LEFT JOIN @OrdersIn2004 o ON c.CustID = o.CustomerID
WHERE c.PostalCode IN (SELECT PostalCode FROM @QualifyingPostalCodes)
ORDER BY c.CustID;
