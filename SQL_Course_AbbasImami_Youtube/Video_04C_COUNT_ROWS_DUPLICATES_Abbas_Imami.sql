-- SELECT DISTINCT FirstName, LastName -- Select distinct first and last names to eliminate duplicates -- This is same like two columns in pivot table
-- Note: Dim files are dimension tables in a data warehouse schema. This means they contain descriptive attributes related to the fact data such as customers, products, or time.


SELECT
    -- Count total customers
    COUNT(*) AS No_Of_Customers, -- We don't need to give column name and instead use STAR because we are counting all rows regardless of columns
    AVG(YearlyIncome) AS Avg_Income_Of_All_Customers -- Calculate average yearly income of customers
    -- YearlyIncome column cannot be used here because it will bring 18,000 rows while the above two are AGGREGATE functions, which means they will bring SINGLE row result only.
    -- GROUP BY funftion can help in using YearlyIncome column here if we want to group by certain column.

FROM DimCustomer

GROUP BY YearlyIncome

ORDER BY Avg_Income_Of_All_Customers ASC; -- Order the result by average income in descending order

-- SELECT DISTINCT FirstName, LastName -- Select distinct first and last names to eliminate duplicates -- This is same like two columns in pivot table
-- Note: Dim files are dimension tables in a data warehouse schema. This means they contain descriptive attributes related to the fact data such as customers, products, or time.


-- Next query
SELECT
    
    COUNT(*) AS TotalCustomers,
    COUNT(CustomerKey),
    COUNT(MiddleName), -- This is not giving 18k because some customers do not have middle name and those NULL values are not counted in COUNT function.
    COUNT(CustomerKey) - COUNT(MiddleName) AS No_Of_Customers_Without_MiddleName -- This will give number of customers without middle name

FROM DimCustomer

-- SELECT MiddleName FROM DimCustomer
