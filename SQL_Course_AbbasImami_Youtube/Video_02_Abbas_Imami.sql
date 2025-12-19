-- SELECT TOP(9)* -- What you want to see, i.e. the data you want to retrieve

-- FROM FactInternetSales;  -- From which table you want to see it. This is like a reference to the table from which you want to extract data.

-- There are SIX main clauses in a SQL query:
-- 1. SELECT
-- 2. FROM
-- 3. WHERE
-- 4. GROUP BY
-- 5. HAVING
-- 6. ORDER BY

-- SELECT TOP(3)*

-- FROM FactFinance;

-- SELECT TOP(3)*

-- FROM FactCallCenter;

-- SELECT TOP (100)       -- Don't put star because it will select all columns, while now we only want few columns
-- OrderDate,
-- SalesOrderNumber       -- Never put comma after the last column

-- FROM FactInternetSales;


SELECT       -- Don't put star because it will select all columns, while now we only want few columns
    -- SalesTerritoryKey AS CanadaSales,

    OrderDate, -- Aggregation cannot be done on DATE fields as these are non-numerical fields
    SalesOrderNumber,   
    SUM(SalesAmount) AS 'Total Sales Amount',   -- SUM is an AGGREGATION function in SQL. It adds up all the values in the specified column.
    SUM(TaxAmt) AS 'Total Tax Amount',
    -- DueDate,
    -- CurrencyKey AS 'New Columnn Name Currency', -- This is how you rename a column in SQL. And, this renaming only works in the output, not in the actual table.
    sum(OrderQuantity) AS 'Total Quantity Sold'     -- Don't put comma after the last column otherwise it will give error    

FROM FactInternetSales
WHERE SalesTerritoryKey = 6  -- This is how you filter data in SQL. Only the rows that satisfy this condition will be shown in the output.


-- AGGREGATION - We need tax, quantity sold, and sales amount for each invoice (similar to SUMIF in Excel)
-- AGGREGATION is always done on NUMERICAL fields

-- WHERE SalesOrderNumber = 'SO51182'

-- In GROUP BY clause, 
-- (1) we need to mention the columns on basis of which we want to aggregate the data, and 
-- (2) mentioned how we want to display the non-aggregated columns. 

GROUP BY SalesOrderNumber, OrderDate
