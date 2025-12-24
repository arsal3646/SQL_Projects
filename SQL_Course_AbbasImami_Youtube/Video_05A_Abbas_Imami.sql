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

FROM DimCustomer

-- Video watched till 21 minutes.