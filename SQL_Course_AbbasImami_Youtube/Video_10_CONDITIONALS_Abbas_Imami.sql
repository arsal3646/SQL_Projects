SELECT 
    FirstName,
    LastName,
    EmailAddress,
    YearlyIncome,
    Phone,

    CASE -- Conditional Statement for Income Bracket for showing different labels based on Yearly Income
        WHEN YearlyIncome >= 130000 THEN 'High Income'
        WHEN YearlyIncome >= 90000 THEN 'Standard Income'
        WHEN YearlyIncome >= 50000 THEN 'Normal Income'        
        ELSE 'Low Income'
    END AS IncomeBracket

FROM DimCustomer


-- Watched video till the end. What I learned:
-- 1. How to use CASE statement in SQL to create conditional logic.
-- 2. How to categorize data based on specific criteria using CASE.

Also, 
-- I understood the difference between IIF and CASE statements.
-- IIF is a shorthand for simple conditional checks, while CASE is more versatile and can handle multiple conditions.
-- IIF is not supported in all SQL databases, whereas CASE is widely supported.
-- CASE can handle complex conditions and multiple branches, making it more powerful for advanced queries.
-- CASE is more readable for complex logic compared to nested IIF statements.
-- IIF is much slower than CASE when dealing with large datasets or complex conditions. IIF will lead to performance issues in such scenarios and slower your laptop or server.