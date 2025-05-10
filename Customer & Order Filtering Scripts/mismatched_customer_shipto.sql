-- Q4: Customers whose name or contact info does not match the SHIPTO table

SELECT
    C.*
FROM CUSTOMER C
LEFT JOIN SHIPTO S ON C.accountNum = S.accountNum
WHERE (C.fName != S.fName AND C.lName != S.lName)
   OR (C.telNum != S.telNum OR C.email != S.email);
