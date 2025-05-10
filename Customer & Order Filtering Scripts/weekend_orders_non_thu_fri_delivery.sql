-- Q3: Orders placed on weekends with delivery not on Thursday or Friday

SELECT DISTINCT
    P.shipCode
FROM [PURCHASE ORDER] P
WHERE DATENAME(WEEKDAY, P.datePlaced) IN ('Saturday', 'Sunday')
  AND DATENAME(WEEKDAY, P.exptectedDel) NOT IN ('Thursday', 'Friday');
