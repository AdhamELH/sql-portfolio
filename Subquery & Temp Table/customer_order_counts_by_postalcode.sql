-- Q1: Customer counts by postal code and order activity

DECLARE @ResultTable TABLE (
    PostalCode VARCHAR(20),
    TotalCustomers INT,
    CustomersWithAtLeast5Orders INT,
    CustomersWith2To4Orders INT
);

INSERT INTO @ResultTable
SELECT 
    c.PostalCode,
    (SELECT COUNT(*) FROM CUSTOMER WHERE PostalCode = c.PostalCode),
    (
        SELECT COUNT(DISTINCT CustID) 
        FROM CUSTOMER 
        WHERE PostalCode = c.PostalCode AND CustID IN (
            SELECT CustomerID 
            FROM SALES_ORDERS 
            GROUP BY CustomerID 
            HAVING COUNT(SalesOrderNumber) >= 5
        )
    ),
    (
        SELECT COUNT(DISTINCT CustID) 
        FROM CUSTOMER 
        WHERE PostalCode = c.PostalCode AND CustID IN (
            SELECT CustomerID 
            FROM SALES_ORDERS 
            GROUP BY CustomerID 
            HAVING COUNT(SalesOrderNumber) BETWEEN 2 AND 4
        )
    )
FROM CUSTOMER c
GROUP BY c.PostalCode;

SELECT 
    PostalCode,
    TotalCustomers AS [Total number of customers],
    CustomersWithAtLeast5Orders AS [Number of customers with ≥ 5 orders],
    CustomersWith2To4Orders AS [Number of customers with 2–4 orders]
FROM @ResultTable
ORDER BY PostalCode;
