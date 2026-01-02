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

WHERE Class <> 'H' -- both conditions will give the same result;


-- Let's do AND + OR operators below

SELECT *


FROM DimProduct;


-- Watched video until minute 25