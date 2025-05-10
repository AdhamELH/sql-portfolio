-- Q3: Number of products per order and percentage of total orders

DECLARE @TotalOrders INT;

SELECT @TotalOrders = COUNT(*) FROM SALES_ORDERS;

DECLARE @ProductCountsResult TABLE (
    NumDifferentProducts INT,
    NumOrders INT,
    PercentageOfOrders DECIMAL(5,2)
);

INSERT INTO @ProductCountsResult
SELECT 
    t.NumDifferentProducts,
    COUNT(*) AS NumOrders,
    (COUNT(*) * 100.0 / @TotalOrders) AS PercentageOfOrders
FROM (
    SELECT 
        so.SalesOrderNumber,
        COUNT(DISTINCT od.ProductID) AS NumDifferentProducts
    FROM SALES_ORDERS so
    JOIN ORDER_DETAILS od ON so.SalesOrderNumber = od.SalesOrderNum
    GROUP BY so.SalesOrderNumber
) t
GROUP BY t.NumDifferentProducts;

SELECT 
    NumDifferentProducts AS [# of Different Products in Order],
    NumOrders AS [# of Orders],
    PercentageOfOrders AS [% of All Orders]
FROM @ProductCountsResult
ORDER BY NumDifferentProducts DESC;
