SELECT DISTINCT CustomerKey -- This is like 'Remove Duplicates' in Excel

FROM FactInternetSales;

-- Removing duplicates based on multiple columns in SQL
-- In this example, we will select distinct combinations of CustomerKey and OrderDate
-- from the FactInternetSales table.

SELECT DISTINCT
    CustomerKey,
    OrderDate
FROM FactInternetSales

ORDER BY CustomerKey -- Ordering the results by CustomerKey for better readability