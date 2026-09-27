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

CREATE DATABASE IF NOT EXISTS bits_coursera;
CREATE TABLE users(
    user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL


)

*/

-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 32 until 0 hr 15 min (total video length is  2 hr 04 min)