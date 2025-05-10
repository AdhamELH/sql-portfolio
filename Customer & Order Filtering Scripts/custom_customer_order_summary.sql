-- Q5: Filtered customers with order breakdown and total additional cost

SELECT
    C.accountNum AS [Customer Account],
    CONCAT(C.fname, ' ', C.mInitial, ' ', C.lname) AS [Full Name],
    P.PONum AS [Purchase Order Number],
    DATENAME(MONTH, P.datePlaced) AS [Order Month],
    DATEPART(YEAR, P.datePlaced) AS [Order Year],
    (P.shippingCost + P.taxAmount + P.otherAdjustments) AS [Total Additional Cost]
FROM CUSTOMER C
LEFT JOIN [PURCHASE ORDER] P ON C.accountNum = P.accountNum
WHERE (C.city LIKE '[CKL]%' AND C.city NOT LIKE '%N')
  AND ((C.zipCode LIKE '%7%' AND C.zipCode LIKE '%0%') OR C.zipCode LIKE '%1');
