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



-- Watched Video 12 until minute 1
-- Watched 11 till the end
