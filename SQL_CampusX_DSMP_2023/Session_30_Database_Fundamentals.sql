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

/* 

## THE EVOLUTION: FROM FILE SYSTEMS TO DATABASES

### Era 1: File Systems (1950s–1970s)

What existed:
        Companies stored data in paper files, then text files on computers. 
        Each department had its own files: 
                - HR had employee files
                - Finance had salary files
                - Operations had project files

        No central system — just folders and documents.

The Problem — Four Major Disasters:

1. Data Redundancy:
        Customer "Arsalan Afridi" lived in both HR file AND Sales file. 
        If Arsalan moved, you had to update TWO files. Mistake? Now you have conflicting data.
        
        Example: HR says Arsalan is in Dubai, Sales says he's in Sharjah.

2. Data Inconsistency:

        Because of redundancy, files would disagree. 
        "Is Arsalan active or inactive?" — depends which file you read. 
        No single source of truth.
        
3. Data Isolation:
       
        Files couldn't "talk" to each other. To answer "Which customers bought projects worth > 50,000 AED?" you had to:

        - Read Sales file
        - Manually cross-reference with Customer file
        - Do the math yourself

No query language (like SQL). Took weeks to answer simple business questions.

4. Data Access Difficulty:

        To find "all projects over budget," you had to:
        - Open project file
        - Read every record manually
        - Calculate and compare

        No indexing, no search, no automation.

---

### Era 2: The Solution — Database Management Systems (1970s onward)

What changed:

1. Centralized Data:    One place: THE DATABASE. 
        - All departments access the same data. 
        - One Arsalan Afridi record → everyone sees the same Arsalan.

2. Redundancy Eliminated
        
        - Store customer info ONCE. 
        - Every application uses the same record. 
        - Update once → instantly correct everywhere.

3. Query Language (SQL)
        
        - Ask the database in English-like syntax:

                SELECT * FROM customers WHERE name = 'Arsalan Afridi';
                SELECT SUM(amount) FROM projects WHERE status = 'over_budget';

        - Answers in seconds, not weeks.

4. Data Integrity

        - Rules enforced automatically. 
        - Cannot enter negative salary. 
        - Cannot delete a customer if they still have projects. 
        - Database enforces consistency.

5. Security & Access Control

        - HR can see salary, Finance cannot. 
        - Finance can see invoices, Operations cannot. 
        - Controlled access instead of "whoever has the file."

6. Backup & Recovery

        - One backup point covers everything. 
        - If something breaks, restore from yesterday's backup. 
        - File systems? Backup each department separately.

---

### Why File Systems STILL Have High Cost (The Trick)

        - When databases first appeared, companies thought:
        - "Databases cost money — licenses, setup, training"
        - "File systems are free — we already have them"

BUT the hidden cost of file systems was massive:
        - Programmers spent 80% of time managing data inconsistencies.
        - Managers spent weeks waiting for reports.
        - Mistakes were expensive (conflicting data led to wrong decisions).

So the real cost comparison:
        - File system: "Free" software + 500K/year in wasted programmer time
        - Database: 10K software + 50K/year in programmer time

        - Databases actually SAVED money. That's why they replaced file systems everywhere.
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
            - Suitable for scenarios where the schema may evolve over time and flexibility is required.
            - Commonly used in web and mobile applications where rapid development and scalability are important.
            - Often used in scenarios where high availability and horizontal scalability are important.
    
    
    - Column Databases: 
            - Relational data is row-based database storage, where each row represents a record and each column represents a field.
            - The problem with row-based storage is that 
            - it can be inefficient for analytical queries that need to read only a few columns from a large number of rows.
            - e.g. we want mean of cgpa of all students, we don't need to read all other columns like name, address, etc.
            - this will waste too much I/O and memory resources.

            - Column databases store data in columns rather than rows, which can improve performance for certain types of queries. 
            - Examples include Apache Cassandra and HBase.
            - Amazon Redshift and Google BigQuery are popular column databases.
            - Google BigQuery is available as a fully managed, serverless data warehouse solution.
            - The most worldwide used column databases by market share are Amazon Redshift, Google BigQuery, and Snowflake.

            - Suitable for analytical queries and scenarios where read performance is critical.
            - Often used in data warehousing, analytical applications and business intelligence applications.
    
    
    - Graph Databases: 
            - Store data in graph structures with nodes, edges, and properties, which is useful for analyzing relationships. 
            - Examples include Neo4j and Amazon Neptune.
            - Suitable for scenarios where relationships between data points are complex and need to be traversed efficiently.
            - Often used in social networks, recommendation engines, and fraud detection applications.

            - Graph database is a niche technology, primarily used for specialized use cases involving complex relationships between data points.
            - Facebook is a notable example of a company that uses graph databases to manage and analyze complex social network relationships.
   
   
    - Key-value Databases: 
            - Store data as key-value pairs, which allows for fast retrieval based on the key. 
            - Examples include Redis and Amazon DynamoDB.
            - Suitable for scenarios where quick lookups based on a unique key are required.
            - Often used in caching, session management, and real-time analytics applications.

            - Redis very famous example of a key-value database.
            - Redis is an in-memory key-value store, which makes it extremely fast for read and write operations.

            - Amazon DynamoDB is another widely used key-value database, especially in cloud-based applications.

     - Functions of DBMS:
             - Data management, i.e. store, retrieve and update data
             - Data integrity, i.e. ensuring accuracy and consistency of data
             - Data security, i.e. protecting data from unauthorized access
             - Transaction management, i.e. ensuring that all database operations are completed successfully or none at all
             - Concurrency control, i.e. managing simultaneous data access by multiple users
             - Backup and recovery, i.e. creating data backups and restoring data in case of failure
     
     
     - Keys

             - Super Key: A set of one or more attributes that can uniquely identify a tuple in a relation.
                - Example: In a table of students, 
                        a combination of student_id and email could be a super key if both together uniquely identify each student.

             - Candidate Key: A minimal super key, i.e., a super key with no redundant attributes.
                - Example: In the same table of students, 
                        if student_id alone can uniquely identify each student, it is a candidate key.

             - Primary Key: A candidate key chosen by the database designer to uniquely identify tuples in a relation.
                - Example: In the same table of students, 
                        student_id could be chosen as the primary key.

             - Foreign Key: An attribute or set of attributes in one relation that refers to the primary key in another relation.
                - Example: In a table of course enrollments, 
                        student_id could be a foreign key referring to the primary key in the students table.

             - Composite Key: A key that consists of two or more attributes that together uniquely identify a tuple in a relation.
                - Example: In a table of course enrollments, 
                        a combination of student_id and course_id could be a composite key.

             - Alternate Key: A candidate key that is not chosen as the primary key.
                - Example: In the students table, 
                        if student_id is the primary key, email could be an alternate key.

             - Surrogate Key: An artificially created key, often a sequential number, used to uniquely identify tuples 
                        when no natural primary key exists.
                - Example: In a table of employees, 
                        an auto-incremented employee_id could serve as a surrogate key.

                        "surrogate key is a primary key in majbooori"

             - Self-referencing Key: A foreign key that refers to the primary key in the same table.
                
                - Example: In an employees table, a manager_id column could be a self-referencing key referring to the employee_id column.
                - Note: Self-referencing keys are used to establish a relationship within the same table.
                - Self-referencing keys are often used to represent hierarchical relationships within the same table, 
                        such as an organizational chart.


        - Primary key can never be NULL.
        - Foreign key can be NULL if the relationship is optional.

        - Primary key uniquely identifies each record in a table.

        - Primary key cannot have duplicate values. For example, no duplicate roll numbers of students

        - Good to have criteria for primary keys include:
            - Uniqueness: The key should uniquely identify each record.
            - Minimality: The key should have no redundant attributes.
            - Stability: The key should not change frequently.
            - Simplicity: The key should be simple and easy to use.
*/

/*

What is entity:
                - An entity is a real-world object or concept that can have data stored about it in a database.
                - Example: A student, a course, or an employee can be considered entities.

                - To make it simpler to understand, an entity is something for which you can make a table in a database.

Cardinality of Relationships:

        It refers to the number of instances of one entity that can or must be associated with each instance of another entity in a relationship.

        - One-to-One (1:1): 
                Each instance of entity A is associated with at most one instance of entity B, and vice versa.
        
        - One-to-Many (1:N): 
                Each instance of entity A can be associated with multiple instances of entity B, 
                but each instance of entity B is associated with at most one instance of entity A.
        
        - Many-to-Many (M:N): 
                Each instance of entity A can be associated with multiple instances of entity B, 
                and each instance of entity B can be associated with multiple instances of entity A.
        
        - Optional Relationships: 
                Some relationships may be optional, meaning that an instance of one entity may not be associated 
                with any instance of the related entity.
        
        - Mandatory Relationships: 
                Some relationships may be mandatory, 
                meaning that an instance of one entity must be associated with at least one instance of the related entity.

        - Thumb Rule:
                1. For 1:1 (one to one), you need ONE table.
                2. For 1:N (one to many), you need TWO tables with a foreign key in the "many" side table.
                3. For M:N (many to many), you need THREE tables: two for the entities and one junction table to handle the relationship.

                4. Other than this, do not try any other complex relationship mapping without a good reason 
                        otherwise the data integrity may be compromised, and database design is bound to fail (CampusX teacher).
                
        *** NORMALIZATION will be taught later in detail in a separate session.

        *** Side Note:  there can be too many tables in a database, which may complicate queries and maintenance. 
                        The teacher gave example that he saw 40 tables in a database.
*/


/*

Drawbacks of Databases:

        - Complexity: Databases can be complex to design, implement, and maintain.
                      "Database" say log real life may bohat dartay hain, i.e. isko proper tareeqay say handle karna zaroori hai.
                      warna yei phr big handle karna mushkil ho jata hai.

        - Cost: Setting up and maintaining a database system can be expensive.
                      - hardware
                      - software
                      - personnel/training
                      - ongoing maintenance
                      - unexpected issues or emergencies

        - Scalability: Databases (esp. RDBMS in large-scale applications) need to be able to handle growth in data volume and user load.
                       
                       Some solutions include:
                       
                        - Vertical scaling (upgrading hardware such as CPU, RAM, or storage)
                        
                        - Horizontal scaling (adding more servers)
                        
                        - Database sharding (this means splitting the database into smaller, more manageable pieces called shards)
                        
                        - Load balancing
                        
                        - Caching mechanisms (storing frequently accessed data in memory to reduce database load)
                        
                        - Optimized indexing
        
        - Data Integrity: Ensuring the accuracy and consistency of data over its lifecycle can be challenging.
                        
                        Some solutions include:
                        
                        - Implementing constraints (e.g., primary keys, foreign keys, unique constraints)
                        - Using transactions to ensure atomicity
                        - Regular data validation and cleaning

        - Performance: Poorly designed databases can lead to performance issues.


        - Security: Databases require robust security measures to protect sensitive data.
                        
                        Some solutions include:
                
                        - Implementing access controls and authentication mechanisms
                        - Encrypting sensitive data
                        - Regular security audits and monitoring
                        - Keeping software and patches up to date


        - Backup and Recovery: Ensuring proper backup and recovery mechanisms can be challenging.
                        
                        Some solutions include:

                        - Regularly scheduled backups
                        - Storing backups in multiple locations (e.g., on-site and off-site)
                        - Testing backup and recovery procedures periodically
                        - Implementing disaster recovery plans
        
        - Data Migration: Moving data from one system to another can be complex and error-prone.

                Some solutions include:

                        - Planning and testing the migration process thoroughly
                        - Using ETL (Extract, Transform, Load) tools
                        - Ensuring data consistency and integrity during migration
                        - Performing post-migration validation and cleanup

        - Flexibility: Adapting the database to changing requirements can be challenging.

                Some solutions include:

                        - Designing the schema with future changes in mind
                        - Using database abstraction layers (means to decouple the application logic from the database implementation)
                        - Implementing modular and decoupled architecture

Summary: Despite so many challenges and complexities, companies have almost no other option but to have databases.
        
        That is why it is important for us (tech people) must know how to work with databases. 
        
        A general understanding is must and deeper understanding is highly beneficial as 
        there are many jobs that require database knowledge such as  
                - Database Administrators
                - Data Analysts
                - Data Engineers
                - Software Developers

Side notes:

        - MySQL is a database management system (DBMS) that uses Structured Query Language (SQL) for managing and manipulating relational databases.
        - PhpMyAdmin is a web-based interface for managing MySQL databases.
        - SQL is the standard language for interacting with relational databases. SQL is super important to learn.
        
*/

-- Watched video 30 until 2 hr 15 min (total video length is 2 hr 15 min)