-- This video is about JOINS and NORMALIZATION in SQL

-- JOIN is used to combine rows from two or more tables, based on a related column between them.
-- There are several types of JOINs: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, CROSS JOIN.

-- NORMALIZATION is the process of organizing data in a database to reduce redundancy and improve data integrity.
-- There are several normal forms (1NF, 2NF, 3NF, BCNF, etc.) that define the levels of normalization.
-- The goal of normalization is to ensure that each piece of data is stored only once, making the database more efficient and easier to maintain.
-- 1NF (First Normal Form): Ensures that the table has a primary key and that all columns contain atomic values (no repeating groups or arrays).
-- 2NF (Second Normal Form): Achieved when the table is in 1NF
-- and all non-key columns are fully dependent on the primary key (no partial dependency).
-- 3NF (Third Normal Form): Achieved when the table is in 2NF
-- and all non-key columns are not dependent on other non-key columns (no transitive dependency).
-- BCNF (Boyce-Codd Normal Form): A stronger version of 3NF where every determinant is a candidate key.
-- Denormalization is the process of combining tables to reduce the number of joins needed for queries, which can improve performance in certain scenarios.
-- It is important to balance normalization and denormalization based on the specific needs of the database and its usage patterns.

-- SQL have five types of JOINS:
-- 1. INNER JOIN: Returns records that have matching values in BOTH tables.
-- 2. LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table, and the matched records from the right table. If there is no match, NULL values are
-- returned for columns from the right table.
-- 3. RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table, and the matched records from the left table. If there is no match, NULL values are
-- returned for columns from the left table.
-- 4. FULL JOIN (or FULL OUTER JOIN): Returns all records when there is a match in either left or right table. If there is no match, NULL values are returned for
-- columns from the table without a match.
-- 5. CROSS JOIN: Returns the Cartesian product of both tables, combining each row from the first table with all rows from the second table.    
-- OUTER JOIN is a general term that refers to LEFT JOIN, RIGHT JOIN, and FULL JOIN.

-- ERD Diagram: Entity-Relationship Diagram is a visual representation of the database structure, showing the entities (tables) and their relationships.

-- Note: FACT TABLES are used in data warehousing to store quantitative data for analysis and reporting while
-- DIMENSION TABLES are used to store descriptive attributes related to the fact data, providing context for analysis. 
-- There is no data in fact tables, only keys that reference dimension tables.



SELECT TOP(10)
    f.SalesOrderNumber,
    f.OrderQuantity,
    f.SalesAmount,
    f.TaxAmt,
    t.SalesTerritoryRegion,

    DATEDIFF(YEAR, dc.BirthDate, GETDATE()) AS CustomerAge, -- Calculating Customer Age from BirthDate
    dc.FirstName,
    dc.LastName,
    CONCAT(dc.FirstName, ' ', dc.LastName) AS FullName

FROM FactInternetSales  AS f -- Fact Table (almost always FROM is from FACT TABLE)
    -- JOIN DimCustomer -- inner join by default
   INNER JOIN DimCustomer AS dc
   ON f.CustomerKey = dc.CustomerKey -- Joining Fact Table with Dimension Table using CustomerKey 

   LEFT JOIN DimSalesTerritory AS t
    ON f.SalesTerritoryKey = t.SalesTerritoryKey -- Left Join with DimSalesTerritory to get all sales even if territory is missing



-- Watched Video 13 until minute 23
-- Watched Video 12 until the end
-- Watched 11 till the end 