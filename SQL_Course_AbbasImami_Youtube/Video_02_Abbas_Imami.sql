SELECT TOP(9)* -- What you want to see

FROM FactInternetSales;  -- From which table you want to see it

-- There are SIX main clauses in a SQL query:
-- 1. SELECT
-- 2. FROM
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. ORDER BY

SELECT TOP(3)*

FROM FactFinance;

SELECT TOP(3)*

FROM FactCallCenter;

SELECT TOP (100)       -- Don't put star because it will select all columns, while now we only want few columns
OrderDate,
SalesOrderNumber       -- Never put comma after the last column

FROM FactInternetSales;


SELECT TOP (11)       -- Don't put star because it will select all columns, while now we only want few columns
    OrderDate,
    SalesOrderNumber,   
    SalesAmount,
    TaxAmt,
    OrderQuantity     -- Don't put comma after the last column otherwise it will give error    

FROM FactInternetSales;
