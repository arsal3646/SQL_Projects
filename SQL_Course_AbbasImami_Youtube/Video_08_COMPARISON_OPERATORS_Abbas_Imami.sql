SELECT 
    EnglishProductName,
    Class

FROM DimProduct
-- WHERE Class = 'H'
-- WHERE Class <> 'H' -- to select all except 'H' This is same as WHERE NOT Class = 'H'

-- Note: We cant use any comparison operator with NULL values. For example: it is not allowed to write WHERE Class = NULL. 
-- This is because NULL means unknown. So any comparison with unknown is also unknown.
-- Instead, we have to use IS NULL or IS NOT NULL to check for NULL values.

-- WHERE Class IS NULL -- to select all rows where Class is NULL IS NOT "NULL" -- to select all rows where Class is NOT NULL

WHERE Class <> 'H' AND Class IS NULL; -- to select all rows where Class is NOT 'H' and Class is NULL. The result will be empty because Class cannot be both NOT 'H' and NULL at the same time.


-- Let's do AND + OR operators below

SELECT 
    EnglishProductName,
    Class,
    [Size],
    Color,
    [Status]


FROM DimProduct
WHERE (Class <> 'H' OR Class IS NULL) AND [Status] = 'Current'; -- we want to find all products where Class is NOT 'H' OR Class is NULL, AND Status is 'Current'

-- Watched video till the end.