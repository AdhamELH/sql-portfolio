-- Q2: Recent orders (last 30 days) with specific shipping codes and name containing "William"

SELECT
    C.accountNum,
    P.PONum,
    CONCAT(C.fname, ' ', C.mInitial, ' ', C.lname) AS FullName
FROM CUSTOMER C
LEFT JOIN [PURCHASE ORDER] P ON C.accountNum = P.accountNum
WHERE P.datePlaced >= DATEADD(day, -30, GETDATE())
  AND P.shipCode IN ('EXP', 'FCP', 'INT')
  AND (C.fName LIKE '%WILLIAM%' OR C.lName LIKE '%WILLIAM%');
