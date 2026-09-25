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

        ======================        sudo /Applications/XAMPP/xamppfiles/xampp status====
        TRUNCATE TABLE users;   // this will remove all data from the users table but keep the table structure intact 
                                /* you have to be very careful when using TRUNCATE as it will remove all data from the table permanently
                                */
        
        
        ==========================
/*
    CONSTRAINTS in MySQL:
        
        CONSTRAINTS are rules applied to columns in a table to enforce data integrity.

        CONSTRAINTS include:
        1. PRIMARY KEY - uniquely identifies each record in a table
        2. FOREIGN KEY - ensures referential integrity between tables
        3. UNIQUE - ensures all values in a column are unique
        4. NOT NULL - ensures a column cannot have a NULL value
        5. CHECK - ensures the values in a column meet a specific condition
        6. DEFAULT - sets a default value for a column
        7. AUTO_INCREMENT - automatically generates a unique value for the column, typically used for primary keys

    -- Example of creating a table with constraints

        CREATE TABLE users(
            user_id INTEGER NOT NULL,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL UNIQUE,
            password VARCHAR(255) NOT NULL
            
               
        )

    -- Another way of creating a table with constraints

        CREATE TABLE users(
            user_id INTEGER NOT NULL,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL
            
            CONSTRAINT users_email_unique UNIQUE(email)
    
        )

    -- The first method is useful for quickly adding constraints directly to the column definitions,
    -- while the second method is useful when you want a COMBINATION of two or more columns to have a unique constraint, 
        rather than just a single column.


    CREATE TABLE users(
            user_id INTEGER NOT NULL,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL
            
            CONSTRAINT users_email_unique UNIQUE(name, email)   // this will ensure that the combination of name and email is unique, 
                e.g. ('John Doe', 'john.doe@example.com') and ('John Doe', 'john.doe@example.com') will not be allowed 
                because the combination of name and email must be unique.
                This will be solved by making one of them different, e.g. john.doe1@example.com
        )
    
    Primary Key can be added in two ways:
        1. Directly in the column definition:
            user_id INTEGER NOT NULL PRIMARY KEY
        2. Using a table-level constraint:
            CONSTRAINT users_pk PRIMARY KEY(user_id)

    CREATE TABLE users(
	user_id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
    
	CONSTRAINT users_email_unique UNIQUE(name,email,password),
    CONSTRAINT users_pk PRIMARY KEY(user_id)

    Composite primary key can be added using a table-level constraint:
        CONSTRAINT users_pk PRIMARY KEY(user_id, email)
    
)


AUTO_INCREMENT contraint: 
    - this constraint automatically generates a unique value for the column whenever a new row is inserted.
    - typically used for primary key columns to ensure each row has a unique identifier.
    - in MySQL, the AUTO_INCREMENT keyword is used to define such a column.
    - example:
        CREATE TABLE users(
            user_id INTEGER NOT NULL AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL,
            CONSTRAINT users_pk PRIMARY KEY(user_id)
        );

CHECK contraint:

    - this constraint is used to ensure that the values in a column meet a specific condition.
    - typically used to enforce domain integrity by limiting the values that can be placed in a column.
    - in MySQL, the CHECK keyword is used to define such a constraint.

    - example:
        CREATE TABLE users(
            user_id INTEGER NOT NULL AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            password VARCHAR(255) NOT NULL,
            CONSTRAINT users_pk PRIMARY KEY(user_id),
            CONSTRAINT users_email_check CHECK(email LIKE '%@%.%')
        );

DEFAULT constraint:

    - this constraint is used to provide a default value for a column when no value is specified during an insert operation.
    - in MySQL, the DEFAULT keyword is used to define such a constraint.

    - example:
        CREATE TABLE users(
            user_id INTEGER NOT NULL AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,

            password VARCHAR(255) NOT NULL DEFAULT 'password123',
            
            CONSTRAINT users_pk PRIMARY KEY(user_id)
        );

FOREIGN KEY constraint:

    - This is the most important constraint for maintaining relationships between tables.
    - this constraint is used to ensure that the values in a column (or a set of columns) match the values in a column of another table.
    - typically used to enforce referential integrity between tables.
    - in MySQL, the FOREIGN KEY keyword is used to define such a constraint.

    - example:
        CREATE TABLE orders(
            order_id INTEGER NOT NULL AUTO_INCREMENT,
            user_id INTEGER NOT NULL,
            order_date DATE NOT NULL,
            CONSTRAINT orders_pk PRIMARY KEY(order_id),
            CONSTRAINT orders_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id)
        );

    example:
        CREATE TABLE order(
        order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
        cid INTEGER NOT NULL,
        order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        
        CONSTRAINT orders_foreign_key FOREIGN KEY (cid) REFERENCES customers(cid)
      
        );
    -- Very important: even if we try to delete the customers table, the deletion will not be allowed.
    -- This ensures referential integrity between the orders and customers tables.

*/

ß
*/

-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 31 until 1 hr 22 min (total video length is 2 hr 04 min)