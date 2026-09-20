/*  ========================
    What is SQL? 
    SQL stands for Structured Query Language. 
    It is used to communicate with and manipulate databases. 
    SQL allows you to create, read, update, and delete data in a database.

    ========================

    Types of SQL Commands:

    1. DDL (Data Definition Language)
       
       - Used to define and manage database structures such as tables, indexes, and schemas.
       
       - Commands include 
        1. CREATE  - create a new database object such as a table or index
        2. ALTER   - modify an existing database object
        3. DROP    - delete an existing database object
        4. TRUNCATE - remove all records from a table, but keep the table structure
    
    2. DML (Data Manipulation Language)
       
       - Used to retrieve, insert, update, and delete data in a database.
       
       - Commands include 
        1. SELECT - retrieve data from the database
        2. INSERT - add new data to the database
        3. UPDATE - modify existing data in the database
        4. DELETE - remove data from the database
    
    3. DCL (Data Control Language)
       
       - Used to control access to data in the database, such as granting and revoking permissions.
       
       - Commands include 
        1. GRANT - give specific privileges to a user
        2. REVOKE - remove specific privileges from a user
    
    4. TCL (Transaction Control Language)
      
       - Used to manage transactions in the database, such as committing and rolling back changes.
      
       - Commands include 
        1. COMMIT - save all changes made in the current transaction
        2. ROLLBACK - undo all changes made in the current transaction
        3. SAVEPOINT - set a point within a transaction to which you can later roll back
        4. SET TRANSACTION - configure the properties of the current transaction

+++++ Practice now on XAMP and then come back here +++++
        
        ========================
        DDL Commands for Databases:
        
        Practice CREATE and DROP

        CREATE DATABASE campusx;   // this will create a new database named campusx if it doesn't already exist
        DROP DATABASE campusx;   // this will delete the database named campusx if it exists

        CREATE DATABASE IF NOT EXISTS campusx;   // this will create the database only if it doesn't already exist

        DROP DATABASE IF EXISTS campusx;   // this will delete the database only if it exists

        the difference between CREATE and CREATE IF NOT EXISTS is that 
        the former will attempt to create the database regardless of whether it already exists, 
        potentially causing an error if it does, while the latter will only create the database 
        if it does not already exist, avoiding such an error.

        ========================

        DDL Commands for Tables:

        Practice CREATE, ALTER, and DROP
*/

/*
        CREATE DATABASE IF NOT EXISTS campusx

            CREATE TABLE users(
                user_id INTEGER,
                name VARCHAR(255),
                email VARCHAR(255),
                password VARCHAR(255)
            );

        ==========================
        TRUNCATE TABLE users;   // this will remove all data from the users table but keep the table structure intact 
                                /* you have to be very careful when using TRUNCATE as it will remove all data from the table permanently
                                */
        
        
        ==========================


*/


-- Watched video 31 until 0 hr 25 min (total video length is 2 hr 04 min)