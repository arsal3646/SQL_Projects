/* This session we will not use XAMPP, we will use MySQL Workbench instead.

Note:   Database and Schema are essentially the same in MySQL. 
        A database is a collection of tables, and a schema is a logical container for database objects.

-- DML is the most interesting part of SQL as it allows us to manipulate and interact with the data stored in the database.
-- In this session we will cover SQL DML (Data Manipulation Language) commands such as 
        1.INSERT
        2.UPDATE
        3.DELETE
        4.SELECT

-- we will use "smartphone" dataset.

-- Import Data
        
-- CRUD operations are:

        1. CREATE (INSERT)
        2. READ (SELECT)
        3. UPDATE (UPDATE)
        4. DELETE (DELETE)


-- Practice begins here

-- Create table "users"

        CREATE DATABASE IF NOT EXISTS bits_coursera;
        CREATE TABLE users(
        user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE,
        password VARCHAR(255) NOT NULL
        );

-- INSERT rows information:

        i. entering one by one

        INSERT INTO campusx.users (user_id, name, email, password)
        VALUES (NULL, 'Nithish', 'nithish@gmail.com','1234'),  
        
        INSERT INTO campusx.users (user_id, name, email, password)
        VALUES (NULL, 'Arsalan', 'arsalan@bits.com', 'abcd');

        ii. entering multiple rows at once

        INSERT INTO campusx.users (user_id, name, email, password)
        VALUES (NULL, 'Ankit', 'ankit@example.com', 'pass123'),
                (NULL, 'Nivin', 'nivin@example.com', 'pass456'),
                (NULL, 'Reddy', 'reddy@example.com', 'pass789'),
                (NULL, 'Ramchandar', 'ramchandar@example.com', 'pass101'),
                (NULL, 'Christine', 'christine@example.com', 'pass202');


-- INSERT without mentioning column names:
        We can insert data without mentioning column names if we provide values for all columns in the correct order. For example:
        Note:   We must make sure that we provide values for 'all' columns in the 'correct order' as defined in the table schema.
                If any value is missed or sequence is incorrect, the insertion will fail.

        INSERT INTO campusx.users
        VALUES (NULL, 'Abdullah', 'abdullah@example.com', 'pass123');

-- INSErt without order of columns (random order of columns). 
                We can use this if we have many columns and we dont remember the exact order of columns. 
                We just need to specify the column names in the order we provide the values. For example:

        INSERT INTO campusx.users (email, name, password, user_id)
        VALUES ('Shahrukh.khan@example.com', 'Shahrukh Khan', 'Baazigar1997', NULL),
               ('Amitabh.bachchan@example.com', 'Amitabh Bachchan', 'Sholay1975', NULL),
               ('Salman.khan@example.com', 'Salman Khan', 'Bajrangi2015', NULL),
               ('Aamir.khan@example.com', 'Aamir Khan', 'Dangal2016', NULL);

-- SELECT
        This is the most used operation in CRUD as it allows us to read and 'retrieve' data from the database.

        -- we will use smartphones table for our SELECT queries

        -- The below query selects all columns and all rows from the smartphones_cleaned_v6 table        
        SELECT campusx.smartphones_cleaned_v6.*
        FROM campusx.smartphones_cleaned_v6;

        -- The below query selects all columns from the 'users' table (all columns and all rows)
        SELECT * 
        FROM campusx.users;

        -- selects all columns from the 'users' table where the condition is always true (1)
        -- the condition WHERE is optional
        -- 'WHERE' means the condition that must be met for the rows to be selected
        -- In this case, the condition is always true, so all rows will be selected.
        -- When WHERE is omitted, it is equivalent to WHERE 1, meaning all rows will be selected.
        -- The other option for WHERE is to specify a condition that filters the rows based on column values. For example:
        -- WHERE user_id = 1

        SELECT * 
        FROM campusx.users WHERE 1;

        -- Filter columns using SELECT

        Example: Selecting specific columns from the 'users' table

        SELECT name, email
        FROM campusx.users;

        Example: Selecting specific columns from the 'smartphones_cleaned_v6' table
                 Order of columns can be of your choice, as needed, i.e. not necessary to follow the order in which they are defined in the table.

        SELECT model, price, rating
        FROM campusx.smartphones_cleaned_v6;

        -- We can also rename the columns in the result set using the 'AS' keyword.
           This will only be in result output and does not change the actual column names in the table.
           The actual column names in the table remain unchanged.
           
        -- Example: Renaming columns in the result set using 'AS' keyword.
        
        SELECT model AS smartphone_model, price AS smartphone_price
        FROM campusx.smartphones_cleaned_v6;
      
        SELECT model AS sirf_model, price AS sirf_price
        FROM campusx.smartphones_cleaned_v6;

Creating constants:
        -- Creating a constant for the type of the product
        -- this is useful when you want to assign a fixed value to a column in the result set.

        SELECT model, 'smartphone' AS 'type'
        FROM campusx.smartphones_cleaned_v6;

DISTINCT:
        -- The DISTINCT keyword is used to return only unique (different) values.
        -- It filters out duplicate values in the result set.
        
        -- Example: Selecting distinct values for the 'os' column from the 'smartphones_cleaned_v6' table
        
        SELECT DISTINCT (brand_name) AS 'All brands'
        FROM campusx.smartphones_cleaned_v6;

        SELECT DISTINCT (processor_brand) AS 'All processor brands'
        FROM campusx.smartphones_cleaned_v6;

        SELECT DISTINCT (os) AS 'All operating systems'
        FROM campusx.smartphones_cleaned_v6;

        SELECT DISTINCT (battery_capacity) AS 'All battery capacities'
        FROM campusx.smartphones_cleaned_v6;

DISTINCT COMBINATIONS:
        -- The DISTINCT keyword can also be used to return unique combinations of multiple columns.
        -- Example: Selecting distinct combinations of 'brand_name' and 'os' from the 'smartphones_cleaned_v6' table

        SELECT DISTINCT brand_name, os
        FROM campusx.smartphones_cleaned_v6;

        SELECT DISTINCT brand_name, battery_capacity
        FROM campusx.smartphones_cleaned_v6;

WHERE:
        -- The WHERE clause is used to filter records based on a specified condition.
        -- WHERE is used for filtering rows based on a specified condition.
        -- Example: Selecting all smartphones with a battery capacity greater than 4000 mAh

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE battery_capacity > 4000;

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE brand_name = 'apple';

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE price > 5000;

BETWEEN:
        -- The BETWEEN operator is used to filter the result set within a certain range.
        -- Example: Selecting all smartphones with a price between 20000 and 50000

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE price > 50000 AND price < 75000;

        -- In Python, lowercase and is the logical operator, and AND isn't valid Python at all. 
        -- In pandas, you combine conditions with & (element-wise), not and. 
        -- Suggested line: "SQL: AND = and (case-insensitive). 
        --Python: only and exists. 
        -- pandas: use & for combining column conditions."

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE price BETWEEN 5000 AND 7500;

        -- Note: The BETWEEN operator is inclusive, meaning it includes the boundary values specified.

QUERY EXECUTION  ORDER (just for seeing how the queries work)

        - Visual representation of the query execution order using website infytq.onwingspan.com
        - Search topic "Order of query execution"

        -- FJWGHSDO  (Frank Just Wants Good SQL Done Orderly)

        -- F (FROM)
        -- J (JOIN)
        -- W (WHERE)
        -- G (GROUP BY)
        -- H (HAVING)
        -- S (SELECT)
        -- D (DISTINCT)
        -- O (ORDER BY)
        

        SELECT DISTINCT brand_name
        FROM campusx.smartphones_cleaned_v6
        WHERE price > 100000;

        SELECT DISTINCT * 
        FROM campusx.smartphones_cleaned_v6
        WHERE processor_brand = 'exynos' OR processor_brand = 'bionic';

-- IN operator:
        -- The IN operator is used to filter the result set based on a list of specified values.
        -- Example: Selecting all smartphones with processor brand either 'exynos' or 'bionic'

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE processor_brand IN ('exynos', 'bionic');

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE processor_brand IN ('exynos', 'bionic');

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE processor_brand IN ('exynos', 'bionic', 'snapdragon');

-- NOT IN operator:
        -- The NOT IN operator is used to filter the result set based on a list of specified values, excluding those values.
        -- Example: Selecting all smartphones with processor brand not 'exynos' or 'bionic'

        SELECT *
        FROM campusx.smartphones_cleaned_v6
        WHERE processor_brand NOT IN ('exynos', 'bionic');

-- UPDATE statement is used to modify existing records in a table.
        Syntax:
        UPDATE table_name
        SET column1 = value1, column2 = value2, ...
        WHERE condition;

        -- in the below example, we are updating the processor brand from 'mediatek' to 'dimensity' for all matching records.
        UPDATE campusx.smartphones_cleaned_v6
        SET processor_brand = 'dimensity'
        WHERE processor_brand = 'mediatek';

-- We can update multiple columns in a single UPDATE statement as well.
        -- Example: Updating both the processor brand and the price for all matching records.
        UPDATE campusx.smartphones_cleaned_v6
        SET processor_brand = 'dimensity', price = price * 1.1
        WHERE processor_brand = 'mediatek';

        SELECT*
        FROM campusx.users;

        UPDATE campusx.users
        SET email = 'nithish@yahoo.com', password = '@pass1234'
        WHERE name = 'nithish';

        SELECT*
        FROM campusx.users;

-- DELETE
        -- The DELETE statement is used to remove existing records from a table.
        Syntax:
        DELETE FROM table_name
        WHERE condition;

        -- Example: Deleting a user with the name 'nithish'
        DELETE FROM campusx.users
        WHERE name = 'nithish';

        SELECT*
        FROM campusx.users;

        -- An example of deleting a user with the name 'nithish' is shown below.

        SELECT*
        FROM campusx.users;

        DELETE FROM campusx.users
        WHERE name = 'nithish';

        SELECT*
        FROM campusx.users;

*/

-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 32 until 1 hr 28 min (total video length is  2 hr 04 min)