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

*/

-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 32 until 0 hr 15 min (total video length is  2 hr 04 min)