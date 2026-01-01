-- Vide 05: DataTime Functions in SQL
-- Both DATETIME* and SMALLDATETIME* are now obsolete. We use only DATE, TIME, DATETIME2* and DATETIMEOFFSET* data types.

SELECT TOP 10

GETDATE() AS CurrentDateTime, -- Returns the current database system timestamp as a DATETIME value
SYSDATETIME() AS CurrentDateTime2, -- Returns the current database system timestamp as a DATETIME2 value
SYSUTCDATETIME() AS CurrentUTCDateTime2, -- Returns the current database system timestamp as a DATETIME2 value in UTC time zone
CURRENT_TIMESTAMP AS CurrentTimestamp, -- ANSI SQL equivalent of GETDATE() -- ANSI SQL means American National Standards Institute standards for SQL language and these are widely accepted standards.
GETUTCDATE() AS CurrentUTCDateTime, -- Returns the current database system timestamp as a DATETIME value in UTC time zone 

-- Why is the result of the above five functions almost the same? it is because they are executed one after another in a very short time frame. but if you run them separately you will see different results.

-- Also, the server is in UK time zone while I am in Dubai time zone (UTC +4). so the UTC time will be 4 hours behind my local time. 
-- How can I see Dubai time? we will see that in the next videos about DATETIMEOFFSET* data type.

DueDate,
OrderDate,

DueDate - OrderDate AS DeliveryDuration,  -- Issue: This is not giving error but it is showing the result in DATETIME format which is not correct. We need in number of days.
DATEDIFF(day, OrderDate, DueDate) AS DateDiffDays,  -- Correct way to find difference between two dates in number of days.
DATEDIFF(hour, OrderDate, DueDate) AS DateDiffDays -- Correct way to find difference between two dates in number of hours.

FROM FactInternetSales;

-- How to find difference between two dates? use DATEDIFF function.

SELECT TOP(10)
    BirthDate,
    GETDATE() AS CurrentDate,
    DATEDIFF(year, BirthDate, GETDATE()) AS AgeInYears,
    DATEDIFF(month, BirthDate, GETDATE()) AS AgeInMonths,
    DATEDIFF(day, BirthDate, GETDATE()) AS AgeInDays

FROM DimCustomer;

SELECT TOP (10)

    DATEADD(day,29,'20201201') AS New_Date,  -- Adding 29 days to 1st Dec 2020
    DATENAME(month,'20201101') AS Month_Name  -- Returns the name of the month

FROM DimCustomer;

-- Example: Find total quantity sold per month name

SELECT
    DATENAME(month, OrderDate) AS Order_Month_Name,
    SUM(OrderQuantity) AS Quantity_Sold
    

FROM FactInternetSales

GROUP BY DATENAME(month, OrderDate)

ORDER BY Quantity_Sold DESC; -- Best month for selling products is December while worst month is February.

-- Check date format

SET LANGUAGE British  -- Changing language settings to British English to use DD/MM/YYYY format.

SELECT
 MONTH('02/12/2025') AS Month_Value_BRITISH_FORMAT,  -- Returns 2 for February not 12 for December as the format is MM/DD/YYYY by default in SQL Server (i.e. American way). 
    -- if you want to use DD/MM/YYYY format then you need to change the language settings of your database server to British English.

    DATENAME(month,'02/12/2025') AS Month_Name_BRITISH_FORMAT -- Returns February as the format is MM/DD/YYYY by default in SQL Server.

-- the above was just for practice. Normally, we use ISO format YYYYMMDD to avoid confusion.

-- Video watched till 46 minutes.
