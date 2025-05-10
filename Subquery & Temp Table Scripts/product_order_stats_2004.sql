-- Q4: Product-level order stats in 2004

DECLARE @ProductStats2004 TABLE (
    ProductID VARCHAR(20),
    NumOrdersContainingProduct INT,
    NumCustomersOrdered INT,
    NumOrdersWithQtyAtLeast2 INT
);

INSERT INTO @ProductStats2004
SELECT 
    p.ProductID,
    (
        SELECT COUNT(DISTINCT so.SalesOrderNumber)
        FROM SALES_ORDERS so
        JOIN ORDER_DETAILS od ON so.SalesOrderNumber = od.SalesOrderNum
        WHERE od.ProductID = p.ProductID AND YEAR(so.OrderDate) = 2004
    ),
    (
        SELECT COUNT(DISTINCT so.CustomerID)
        FROM SALES_ORDERS so
        JOIN ORDER_DETAILS od ON so.SalesOrderNumber = od.SalesOrderNum
        WHERE od.ProductID = p.ProductID AND YEAR(so.OrderDate) = 2004
    ),
    (
        SELECT COUNT(DISTINCT so.SalesOrderNumber)
        FROM SALES_ORDERS so
        JOIN ORDER_DETAILS od ON so.SalesOrderNumber = od.SalesOrderNum
        WHERE od.ProductID = p.ProductID AND od.OrderQty >= 2 AND YEAR(so.OrderDate) = 2004
    )
FROM PRODUCT p;

SELECT 
    ProductID,
    NumOrdersContainingProduct AS [Orders Containing Product in 2004],
    NumCustomersOrdered AS [Customers Who Ordered in 2004],
    NumOrdersWithQtyAtLeast2 AS [Orders with Qty ≥ 2]
FROM @ProductStats2004
ORDER BY ProductID DESC;
