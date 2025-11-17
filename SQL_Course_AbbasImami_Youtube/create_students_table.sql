DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    marks INTEGER
);

INSERT INTO students (name, age, marks) VALUES ('Arsalan', 30, 92);
INSERT INTO students (name, age, marks) VALUES ('Ali', 25, 85);
INSERT INTO students (name, age, marks) VALUES ('Babar', 22, 78);

SELECT * FROM students;