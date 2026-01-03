SELECT 
    EnglishProductName,
    Class,
    [Size],
    Color,
    [Status],
    SafetyStockLevel


FROM DimProduct

-- WHERE Color = 'Blue' OR Color = 'Black' OR Color = 'White' OR Color = 'Yellow' -- This can be replaced by IN operator
-- WHERE Color IN ('Blue', 'Black', 'White', 'Yellow')

-- WHERE SafetyStockLevel IN(500,800,1000)
-- WHERE SafetyStockLevel NOT IN(500,800,1000)
-- WHERE SafetyStockLevel >=500 AND SafetyStockLevel <=1000

-- IN always works with OR condition while NOT IN works with AND condition
-- BETWEEN operator is used for range checking. It works with AND condition

WHERE SafetyStockLevel BETWEEN 500 AND 1000;


-- LIKE operator is used for pattern matching

SELECT 
    FirstName,
    EmailAddress,
    Phone
    

FROM DimCustomer

-- WHERE FirstName LIKE '_r%'  -- Names with second letter 'r'
-- WHERE FirstName LIKE 'A%'  -- Names starting with 'A'

-- WHERE FirstName LIKE 'r__' -- Names with 3 letters starting with 'r'. These are two underscores after r.
WHERE Phone LIKE '123%';  -- Phone numbers beginning with 123


SELECT 
    FirstName,
    LastName,
    EmailAddress,
    FORMAT(YearlyIncome,'N2') AS YearlyIncome,
    Phone,
    IIF(YearlyIncome >70000, 'High Income', 'Low Income') AS IncomeBracket

FROM DimCustomer

-- WHERE YearlyIncome >70000 -- Income greater than 70000 
-- We want to make buckets of income using IIF function

WHERE IIF(YearlyIncome >70000, 'High Income', 'Low Income') = 'High Income'


-- Video watched till the end.