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

    -- REFERENTIAL ACTIONS mean the actions that are taken on the child table when a corresponding row in the parent table is updated or deleted.

    Four Referencial Actions in SQL:
   
    - RESTRICT: This is default behavior. 
                Prevents the deletion or update of a row in the parent table if there are related rows in the child table.
                
                Example: 
                    CREATE TABLE orders(
                        order_id INTEGER NOT NULL AUTO_INCREMENT,
                        user_id INTEGER NOT NULL,
                        order_date DATE NOT NULL,
                        CONSTRAINT orders_pk PRIMARY KEY(order_id),
                        CONSTRAINT orders_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE RESTRICT

                        -- this ensures that if there are related rows in the child table, 
                        -- the deletion or update in the parent table will be restricted.
                    );

                

    - CASCADE:  Automatically updates or deletes the related rows in the child table when the 
                corresponding row in the parent table is updated or deleted.
                
                Example: 
                    CREATE TABLE orders(
                        order_id INTEGER NOT NULL AUTO_INCREMENT,
                        user_id INTEGER NOT NULL,
                        order_date DATE NOT NULL,
                        CONSTRAINT orders_pk PRIMARY KEY(order_id),
                        CONSTRAINT orders_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE CASCADE
                    );

                -- this ensures that if a row in the parent table is deleted, 
                -- the related rows in the child table will also be automatically deleted.
    
    - SET NULL: Sets the foreign key column in the child table to NULL when the corresponding row in the parent table is deleted.
                
                Example: 
                    CREATE TABLE orders(
                        order_id INTEGER NOT NULL AUTO_INCREMENT,
                        user_id INTEGER NOT NULL,
                        order_date DATE NOT NULL,
                        CONSTRAINT orders_pk PRIMARY KEY(order_id),
                        CONSTRAINT orders_user_fk FOREIGN KEY(user_id) REFERENCES users(user_id) ON DELETE SET NULL
                    );

                -- this ensures that if a row in the parent table is deleted, 
                -- the foreign key column in the child table will be set to NULL.
    
    - NO ACTION: Similar to RESTRICT, 
                 it prevents the deletion or update of a row in the parent table if there are related rows in the child table, 
                 but the check is deferred until the end of the transaction.

*/

    - ALTER TABLE comment:
        Used to modify an existing table, such as adding, dropping, or modifying columns, 
        as well as adding or dropping constraints.

        Example:
            ALTER TABLE orders
            ADD COLUMN status VARCHAR(20) DEFAULT 'pending';

        -- This adds a new column 'status' to the 'orders' table with a default value of 'pending'.

        Example: in our customer table, we can add a new column 'email' to store customer email addresses.

            ALTER TABLE customers
            ADD COLUMN email VARCHAR(255);

        -- This adds a new column 'email' to the 'customers' table to store customer email addresses.

        Example: in our orders table, we can drop the 'status' column if it is no longer needed.

            ALTER TABLE orders
            DROP COLUMN status;

        -- This removes the 'status' column from the 'orders' table.

        Example: in our customers table, we can add a column by choosing LOCATION (i.e. between columns) of our own choice.
            ALTER TABLE customers
            ADD COLUMN phone_number VARCHAR(20) AFTER email;

        -- This adds a new column 'phone_number' to the 'customers' table after the 'email' column.

        -- We can use BEFORE also to specify that the new column should be added before an existing column.
        -- Example: in our customers table, we can add a column 'middle_name' before the 'last_name' column.

            ALTER TABLE customers
            ADD COLUMN middle_name VARCHAR(255) BEFORE last_name;

        -- This adds a new column 'middle_name' to the 'customers' table before the 'last_name' column.


        -- More than one column can be added or deleted in a single ALTER TABLE statement.

        Example: in our customers table, we can add both 'city' and 'state' columns at once.

            ALTER TABLE customers

            ADD COLUMN city VARCHAR(100) AFTER phone_number,
            ADD COLUMN state VARCHAR(100) AFTER city;

        -- This adds new columns 'city' and 'state' to the 'customers' table after the 'phone_number' column.

        Similary, we can drop multiple columns in a single ALTER TABLE statement.

        Example: in our customers table, we can drop both 'city' and 'state' columns at once.

            ALTER TABLE customers
            DROP COLUMN city,
            DROP COLUMN state;

        -- This removes the 'city' and 'state' columns from the 'customers' table.

        MODIFY COLUMN can be used to change the data type or attributes of an existing column.

        Example: in our customers table, we can modify the 'phone_number' column to have a larger length.

            ALTER TABLE customers
            MODIFY COLUMN phone_number VARCHAR(30);
            MODIFY COLUMN email VARCHAR(255);
            MODIFY COLUMN middle_name VARCHAR(255);

        -- This changes the 'phone_number' column in the 'customers' table to have a length of 30 characters.
        -- This changes the 'email' column in the 'customers' table to have a length of 255 characters.
        -- This changes the 'middle_name' column in the 'customers' table to have a length of 255 characters.

    -- MODIFY or DELETE constraints in existing tables can also be done using the ALTER TABLE statement.

    Example: in our customers table, we can add a primary key constraint to the 'id' column.

            ALTER TABLE customers
            ADD CONSTRAINT pk_customers_id PRIMARY KEY (id);

        -- This adds a primary key constraint to the 'id' column in the 'customers' table.

    Example: in our customers table, we can drop the primary key constraint from the 'id' column.

            ALTER TABLE customers
            DROP CONSTRAINT pk_customers_id;

        -- This removes the primary key constraint from the 'id' column in the 'customers' table.
*/

-- sudo /Applications/XAMPP/xamppfiles/xampp start

-- verify using sudo /Applications/XAMPP/xamppfiles/xampp status
-- http://localhost/phpmyadmin

-- Watched video 31 until 1 hr 47 min (total video length is 2 hr 04 min)