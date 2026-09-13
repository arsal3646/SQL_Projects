/* We will study this whole session from the perspective of a data analyst

This session will cover the basics of databases, including 
    1. tables
    2. queries
    3. relationships.

By the end of this session, you should have a basic understanding of how to work with databases as a data analyst.

We will also explore some common SQL commands and how to use them effectively.

By the end of this session, you should be able to write basic SQL queries to 
    - retrieve data from a database 
    - manipulate data

You will also gain an understanding of how to design and structure a database to efficiently store and manage data.

Finally, we will discuss best practices for 
    - maintaining
    - optimizing a database to ensure its performance and reliability.

A comment in SQL starts with -- for single-line comments or /* */ for multi-line comments.
For example:
-- This is a single-line comment
*/

/* This is a multi-line comment */  

/* What is Database? 

- A database is an organized collection of data, generally stored and accessed electronically from a computer system.
- Databases are used to efficiently 
        -   store
        -   retrieve, and 
        -   manage data for various applications.

- Databases can be: 
        -   relational, where data is organized into tables with relationships, or 
        - non-relational, where data is stored in a more flexible format.

- Databases play a crucial role in modern applications, 
- as it is enabling efficient data management and supporting various data-driven decision-making processes.

*/

/* Databases are used for:
    -   storing data for various applications
    -   data analysis
    -   record keeping
    -   web applications, mobile applications, enterprise applications
*/

/* CRUD Operations in Databases

CRUD stands for Create, Read, Update, and Delete, which are the four basic operations for managing data in a database.

    - Create: Adding new records to a database table.
    - Read: Retrieving data from a database table.
    - Update: Modifying existing records in a database table.
    - Delete: Removing records from a database table.

*/

/*
Properties of an ideal database include:

    - Data integrity: 
            1. Ensuring accuracy, e.g. no negative values for age or salary.
            2. Ensuring consistency of data, e.g. no conflicting information across different tables.

    - Availability: Ensuring that the database is accessible when needed. 
            e.g. minimal downtime and quick recovery from failures.

    - Security: Protecting data from unauthorized access. 
            e.g. using encryption and access controls.
    
    - Independent of Application: The database should function independently of the application using it. 
            e.g. changes in the application should not affect the database structure.

    - Concurrency: The database should support multiple users accessing and modifying data simultaneously without conflicts. 
            e.g. using locking mechanisms and transaction management.
*/

/*  Types of Databases:

    - Relational Databases: 
            - Organize data into tables with predefined relationships. 
            - Examples include MySQL, PostgreSQL, and Oracle.
            - Suitable for structured data with clear relationships.
            - Suitable for scenarios where the schema may evolve over time and flexibility is required.
            - Commonly used in web and mobile applications where rapid development and scalability are important.
            - Often used in scenarios where data integrity and complex queries are important.

    - NoSQL Databases: 
            - Store data in a more flexible format, such as key-value pairs, documents, or graphs. 
            - Examples include MongoDB, Cassandra, and Redis.
    
    
    - Column Databases: 
            - Store data in columns rather than rows, which can improve performance for certain types of queries. 
            - Examples include Apache Cassandra and HBase.
    
    
    - Graph Databases: 
            - Store data in graph structures with nodes, edges, and properties, which is useful for analyzing relationships. 
            - Examples include Neo4j and Amazon Neptune.
   
   
    - Key-value Databases: 
            - Store data as key-value pairs, which allows for fast retrieval based on the key. 
            - Examples include Redis and Amazon DynamoDB.

*/

-- Watched the video until min 29