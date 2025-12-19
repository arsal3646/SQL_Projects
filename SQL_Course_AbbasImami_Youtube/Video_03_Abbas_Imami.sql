SELECT 

    SalesOrderNumber AS InvoiceNumber,
    OrderDate,
    SUM(SalesAmount) AS TotalSales,
    SUM(TaxAmt) AS TaxAmt, 
    SUM(OrderQuantity) AS QuantitySold 


FROM FactInternetSales

WHERE SalesTerritoryKey = 6

GROUP BY SalesOrderNumber, OrderDate

-- WHERE and HAVING clauses are both for filtering data.
-- WHERE is used to filter rows before aggregation.
-- HAVING is used to filter groups after aggregation.

HAVING SUM(SalesAmount) >= 1000

ORDER BY -- This clause is used to sort the result set.

SUM(SalesAmount) ASC;

-- ASC = Ascending Order
-- DESC = Descending Order
-- Alias can be used in ORDER BY clause but not in WHERE or HAVING clauses.
-- However, in MYSQL and POSTGRESQL, you can use alias in HAVING clause.