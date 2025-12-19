SELECT TOP (100)

    SalesOrderNumber AS InvoiceNumber,
    OrderDate,
    SUM(SalesAmount),
    SUM(TaxAmt),
    SUM(OrderQuantity)

FROM FactInternetSales

GROUP BY SalesOrderNumber, OrderDate
