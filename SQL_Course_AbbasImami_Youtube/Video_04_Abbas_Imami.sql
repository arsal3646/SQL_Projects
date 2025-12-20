SELECT -- TOP (10) PERCENT  -- Limits the result set to the top 10 percent of rows. As industry standard, this is often used for sampling large datasets.
    SalesOrderNumber AS InvoiceNumber,
    OrderDate,
    SUM(OrderQuantity) AS QuantitySold,
    SUM(SalesAmount) AS TotalSales,
    SUM(TaxAmt) AS TaxAmount,
    SUM(SalesAmount) + SUM(TaxAmt) AS TotalAmount -- This is a derived column calculating the total amount including tax.

FROM FactInternetSales

GROUP BY SalesOrderNumber, OrderDate

-- HAVING SUM(SalesAmount) >= 1000

ORDER BY TotalSales ASC -- Orders the results by TotalSales in ascending order. DESC can be used for descending order.

-- This query retrieves the top 10 sales invoices with a total sales amount of at least 1000,
-- along with their order dates, total sales amounts, tax amounts, and quantities sold.

-- Data cleaning is an important role of a data analyst to ensure accurate and reliable analysis.

OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY -- Skips the first 5 rows of the result set, useful for pagination.