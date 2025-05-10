-- Q1: Customers meeting any of the following criteria:
-- a) Never placed an order
-- b) Middle initial is between C–G
-- c) Street address ends in "Dr"

SELECT
    C.*
FROM CUSTOMER C
LEFT JOIN [PURCHASE ORDER] P ON C.accountNum = P.accountNum
WHERE P.datePlaced IS NULL
   OR C.mInitial LIKE '[C-G]'
   OR C.streetLine1 LIKE '%DR';
