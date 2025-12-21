-- Removing duplicates based on multiple columns in SQL
-- In this example, we will select distinct combinations of CustomerKey and OrderDate
-- from the FactInternetSales table.

SELECT 
    CustomerKey,
    OrderDate
FROM FactInternetSales

ORDER BY CustomerKey