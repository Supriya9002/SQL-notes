-- Create the database
CREATE DATABASE IF NOT EXISTS JoinDB;

-- Show all databases
SHOW DATABASES;

-- Use the database
USE JoinDB;

-- Create departments table first (since employees will reference it)
CREATE TABLE departments (
    dept_id INT NOT NULL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create employees table with foreign key reference
CREATE TABLE employees (
    emp_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id INT,
    salary INT,
    FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id)
        ON DELETE SET NULL
);

-- Insert data into departments table
INSERT INTO departments 
    (dept_id, dept_name) VALUES
    (10, 'Sales'),
    (20, 'Marketing'),
    (30, 'HR');

-- Insert data into employees table
INSERT INTO employees 
    (emp_id, name, dept_id, salary) VALUES
    (1, 'Rahul', 10, 50000),
    (2, 'Mina', 20, 35000),
    (3, 'Arjun', 10, 60000),
    (4, 'Riya', null, 40000);

-- Verify the data
SELECT * FROM departments;

SELECT * FROM employees;
-- departments , employees 
-- Q1. Write SQL to display employee name and department name using INNER JOIN.
select * from employees inner join departments on departments.dept_id = employees.dept_id;
-- Q2. Write SQL to show all employees and their departments (even if department is NULL).
select * from employees left join departments on departments.dept_id = employees.dept_id; 
-- Q3. Show all departments even if they have no employees.
select dept_name, name from departments left join employees on departments.dept_id = employees.dept_id; 
-- Q4. Write SQL to show employees who do NOT belong to any department.
-- Q5. Write SQL to show all possible combinations of employees × departments.
-- Q6. Show number of employees in each department using JOIN + GROUP BY.
select dept_name, count(emp_id) as total_employees from departments left join employees on departments.dept_id = employees.dept_id group by dept_name;
-- Q7. Show employees who work in the “Sales” department.

-- Q8. Write SQL to find employees whose department ID does not match with any department.