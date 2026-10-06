/* 

SQL Joins:
    SQL Joins are used to combine rows from two or more tables, based on a related column between them.

    Main criteria for SQL JOIN is the presence of a common column between the tables.
    Without a common column, a JOIN operation cannot be performed.

    Why do we need SQL Joins:
        -- To combine data from multiple tables based on a related column.
        -- To retrieve comprehensive information that is spread across different tables.
        -- To avoid data redundancy and maintain database normalization. 
            e.g. in Amazon, imagine if we have to repeat user information in every order record instead of 
            linking orders to a separate user table using user_id. 
            This will reduce data redundancy and make the database more efficient.
    
    NAIVE QUESTION: Why can't we just store all data in a single table instead of using joins?
        -- Storing all data in a single table can lead to data redundancy, update anomalies, and inefficient storage.
        -- It also makes it harder to maintain and query the database effectively.
    
    What is UPDATE ANOMALY:
        -- An update anomaly occurs when changes to data in one table require multiple updates in other tables due to data redundancy.
        -- This can lead to inconsistencies if not all related records are updated correctly.
        -- Using proper normalization and SQL joins helps to avoid update anomalies.

            Example:
                -- John was living in Dubai and he moved to Abu Dhabi.
                -- If we had stored his address in multiple tables, we would need to update all of them.
                -- This can lead to inconsistencies if we miss any table.
                -- Using a separate address table and linking it with user_id helps to avoid this update anomaly.
    
    -- Normalization (we will cover this in detail later)
        -- The process of organizing data in a database to reduce redundancy and improve data integrity.
        
        -- It involves dividing large tables into smaller, related tables and defining relationships between them.

        -- Proper normalization ensures that:
                1. Update anomalies are minimized.
                2. Joins can be effectively used to retrieve comprehensive data.

    Types of SQL Joins:

        1. INNER JOIN: 
            -- Returns records that have matching values in both tables.

        2. LEFT JOIN (or LEFT OUTER JOIN): 
        
            -- Returns all records from the left table, and the matched records from the right table. 
            -- If no match, NULL values are returned for columns from the right table.
        
        3. RIGHT JOIN (or RIGHT OUTER JOIN): 
        
            -- Returns all records from the right table, and the matched records from the left table. 
            -- If no match, NULL values are returned for columns from the left table.
        
        4. FULL JOIN (or FULL OUTER JOIN): 
        
            -- Returns all records when there is a match in either left or right table. 
            -- If no match, NULL values are returned for columns from the table without a match.
        
        5. CROSS JOIN: 
        
            -- Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.
        
        6. SELF JOIN: 
        
            -- A regular join but the table is joined with itself.

-- You can use a Venn diagram to illustrate the different types of joins:
        -- INNER JOIN: Intersection of both tables.
        -- LEFT JOIN: All records from the left table and the intersection.
        -- RIGHT JOIN: All records from the right table and the intersection.
        -- CROSS JOIN: Cartesian product of both tables.
        -- SELF JOIN: A table joined with itself.

-- CROSS JOIN
        -- This is also known as a Cartesian join.
        -- This gives you all possible combinations of rows from the two tables.

        -- CROSS JOIN is not normally used because it can produce a very large number of rows, especially with large tables.
        -- However, it can be useful in certain scenarios where you need all possible combinations of rows from two tables.

        -- Keep in mind that CROSS JOIN can quickly lead to performance issues if the tables involved are large.

        -- Example:
            SELECT * FROM table1 CROSS JOIN table2;

        -- Example of CROSS JOIN in practice:
            SELECT *
            FROM joins_practice.users
            CROSS JOIN joins_practice.users1;

-- INNER JOIN:
        -- This is the MOST important and commonly used type of join.
        -- Returns records that have matching values in both tables. 
        -- Kind of intersection between the two tables.
           
        -- Example:
                SELECT *
                FROM joins_practice.users u
                INNER JOIN joins_practice.users1 u1
                ON u.user_id = u1.user_id;

        -- Example of INNER JOIN in practice:
            
            SELECT *
            FROM joins_practice.users
            INNER JOIN joins_practice.users1
            ON joins_practice.users.name = joins_practice.users1.name;

-- LEFT JOIN (or LEFT OUTER JOIN)
        -- Returns all records from the left table (aka first table), and the matched records from the right table (aka second table). 
        -- If no match, NULL values are returned for columns from the right table.

        -- Example:
            SELECT *
            FROM joins_practice.users u
            LEFT JOIN joins_practice.users1 u1
            ON u.user_id = u1.user_id;

-- RIGHT JOIN (or RIGHT OUTER JOIN)
        -- Returns all records from the right table (aka second table), and the matched records from the left table (aka first table). 
        -- If no match, NULL values are returned for columns from the left table.

        -- Example:
            SELECT *
            FROM joins_practice.users u
            RIGHT JOIN joins_practice.users1 u1
            ON u.user_id = u1.user_id;

-- FULL OUTER JOIN (or FULL JOIN)
        -- Returns all records when there is a match in either left (first) or right (second) table.
        -- If no match, NULL values are returned for columns from the table without a match.

        -- Example:
            SELECT *
            FROM joins_practice.users u
            FULL OUTER JOIN joins_practice.users1 u1
            ON u.user_id = u1.user_id;

        -- This like UNION of LEFT JOIN and RIGHT JOIN, combining all records from both tables.
        -- Note: Some SQL databases may not support FULL OUTER JOIN directly. 
        -- In such cases, you can achieve the same result using a combination of LEFT JOIN, RIGHT JOIN, and UNION.


*/


-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin


-- FJWGHSDO  (Frank Just Wants Good SQL Done Orderly)


-- Watched video 34 until 1 hr 01 min (total video length is  2 hr  10 min)