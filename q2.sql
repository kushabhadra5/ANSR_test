/*Creating a database mydatabase*/
CREATE DATABASE mydatabase;


/*Creating a table*/
CREATE TABLE IF NOT EXISTS mydatabase.employees (
	depname TEXT,
    empno INTEGER PRIMARY KEY,
    salary REAL
);


/*Inserting data in the table*/
INSERT INTO mydatabase.employees (depname, empno, salary)
VALUES
    ('develop', 11, 5200),
    ('develop', 7, 4200),
    ('develop', 9, 4500),
    ('develop', 8, 6000),
    ('develop', 10, 5200),
    ('personnel', 5, 3500),
    ('personnel', 2, 3900),
    ('sales', 3, 4800),
    ('sales', 1, 5000),
    ('sales', 4, 4800);


/*Query to fetch the empno having the highest salary*/    
SELECT empno
FROM mydatabase.employees
ORDER BY salary DESC
LIMIT 1;
