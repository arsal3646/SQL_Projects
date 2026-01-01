-- String data type examples. String means text data. Strings are sequences of characters.
-- A lot of data is stored as strings in databases
-- Examples include names, addresses, phone numbers, email addresses, etc.
-- we need to know how to work with string data types in SQL and remember the important functions
-- SQL Server has several string data types including CHAR, VARCHAR, NCHAR, NVARCHAR, TEXT, and NTEXT
-- The most commonly used string data types are VARCHAR and NVARCHAR
-- VARCHAR is used to store variable-length non-Unicode strings
-- NVARCHAR is used to store variable-length Unicode strings
-- Unicode strings can store characters from multiple languages, making NVARCHAR more versatile for international applications
-- VARCHAR and NVARCHAR can store up to 8000 characters, while TEXT and NTEXT can store much larger amounts of data but are deprecated in favor of VARCHAR(MAX) and NVARCHAR(MAX)
-- nVARCHAR uses 2 bytes per character, while VARCHAR uses 1 byte per character
-- It is important to choose the appropriate string data type based on the requirements of your application and the type of data you need to store

SELECT TOP(15)  -- Let's see an example of CONCAT function
    FirstName,
    LastName,
    EmailAddress,
    LOWER(CONCAT(FirstName, ' ', LastName)) AS FullName,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower,
    LEN(FirstName) AS FirstName_Length,
    RIGHT(LastName, 3) AS LastName_Right3,
    UPPER(LEFT(FirstName, 2)) AS FirstName_Left2,
    LOWER(EmailAddress) AS EmailAddress_Lower,
    UPPER(REPLACE(FirstName, 'Jon', 'Arsalan')) AS FirstName_Replaced
    

FROM DimCustomer;

-- Watched video until minute 30