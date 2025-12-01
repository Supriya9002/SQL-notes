CREATE DATABASE school;
SHOW DATABASES;
USE school;

create database company;
create database test;
drop database test;
 
use company;
create table products(
id int,
name varchar(100),
salery decimal(10, 3)
);
select * from products;

create table books(
id int,
title varchar(100),
auther varchar(10),
price decimal(10,2),
primary key (id)
);

show tables;
select * from books;

-- key
create table departments(
id int primary key,
name varchar(100)
);
insert into departments (id, name) values (1, "Supriya");
show tables;
select * from departments;

create table employees(
id int primary key,
name varchar(50),
dept_id int,
FOREIGN KEY (dept_id) REFERENCES departments(id)
);
select * from employees;
create table users(
id int primary key,
email varchar(50) not null unique,
age int check(age >=10),
city varchar(15) default "Pune"
);
insert into users (id, email, age) values (01, "hal22@gmail.com", 21);
select * from users;
select email, age from users;
insert into users (id, email, age, city) values (03, "roni@gmail.com", 15, "kplkata");
select distinct age, age + 10 as after_10_year from users;
select * from users where age > 20 limit 1;
select * from users order by email asc;

-- Count, avg
select count(*) from users; 
select avg(age) from users;
















-- Praktice-- 
CREATE DATABASE s;
USE s;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50),
    position VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    join_date DATE,
    experience INT,
    rating FLOAT,
    is_active BOOLEAN
);

INSERT INTO employees VALUES
(1, 'Arjun', 24, 'Male', 'IT', 'Frontend Developer', 35000, 'Kolkata', '2021-06-12', 2, 4.2, 1),
(2, 'Neha', 29, 'Female', 'HR', 'HR Manager', 45000, 'Delhi', '2019-02-18', 5, 4.6, 1),
(3, 'Rohan', 31, 'Male', 'Finance', 'Accountant', 38000, 'Mumbai', '2020-11-05', 4, 4.3, 1),
(4, 'Priya', 26, 'Female', 'IT', 'Backend Developer', 42000, 'Kolkata', '2022-04-22', 2, 4.1, 1),
(5, 'Sameer', 35, 'Male', 'Admin', 'Admin Head', 50000, 'Chennai', '2017-08-10', 8, 4.7, 1),
(6, 'Kamal', 28, 'Male', 'IT', 'Full Stack Developer', 55000, 'Delhi', '2018-03-15', 6, 4.4, 1),
(7, 'Rita', 32, 'Female', 'Finance', 'Senior Accountant', 60000, 'Mumbai', '2016-09-12', 9, 4.8, 1),
(8, 'Vikram', 27, 'Male', 'Sales', 'Sales Executive', 30000, 'Pune', '2021-01-25', 3, 3.9, 1),
(9, 'Sumi', 25, 'Female', 'Marketing', 'SEO Specialist', 28000, 'Kolkata', '2022-12-11', 1, 4.0, 1),
(10, 'Aman', 30, 'Male', 'IT', 'Data Analyst', 47000, 'Hyderabad', '2019-06-17', 5, 4.5, 1),
(11, 'Sneha', 33, 'Female', 'HR', 'Recruiter', 32000, 'Delhi', '2020-04-01', 4, 4.1, 0),
(12, 'Bhavesh', 34, 'Male', 'IT', 'Software Tester', 36000, 'Ahmedabad', '2018-11-23', 5, 4.2, 1),
(13, 'Amrita', 29, 'Female', 'Sales', 'Sales Manager', 52000, 'Bangalore', '2017-05-19', 7, 4.6, 1),
(14, 'Gopal', 38, 'Male', 'Admin', 'Office Staff', 26000, 'Kolkata', '2015-03-12', 10, 3.8, 0),
(15, 'Farhan', 27, 'Male', 'Marketing', 'Content Writer', 25000, 'Pune', '2021-09-29', 2, 3.7, 1);

select * from employees;
select distinct city from employees;
select name, gender, age from employees where gender = 'Female' AND age < 30;
show tables;







-- Group-By
CREATE DATABASE supriya;
use supriya;
CREATE TABLE sales (
    id INT,
    customer VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO sales (id, customer, product, quantity, price) VALUES
(1, 'Rahul',    'Pen',      2, 10),
(2, 'Rahul',    'Book',     1, 100),
(3, 'Mina',     'Pen',      5, 10),
(4, 'Mina',     'Pencil',   10, 5),
(5, 'Arjun',    'Pen',      3, 10),
(6, 'Arjun',    'Book',     2, 100);

 select * from sales;
-- Find total quantity purchased by each customer-- 
 select customer, sum(quantity) as total_quantity from sales group by customer;
-- Q2: Count how many products each customer bought
select customer, count(product) as total_product from sales group by price;
-- Q3: Find total money spent by each customer
select customer, sum(quantity * price) as total_money_spend from sales group by customer;
-- Show how many times each product was purchased
select product, count(product) as total from sales group by product;
 
 -- Practice employees Questions --
 use s;
 select * from employees;
 
 
 -- Part 3
 CREATE DATABASE part3;
use part3;
CREATE TABLE employees (
   emp_id INT PRIMARY KEY,
   name VARCHAR(50),
   department VARCHAR(50),
   salary INT,
   city VARCHAR(50),
   age INT
);

INSERT INTO employees VALUES
(1, 'Rahul', 'HR',        42000, 'Kolkata', 28),
(2, 'Mina',  'Sales',     55000, 'Mumbai', 32),
(3, 'Arjun', 'IT',        70000, 'Delhi', 26),
(4, 'Sita',  'Finance',   48000, 'Kolkata', 29),
(5, 'Neha',  'IT',        75000, 'Pune',   31),
(6, 'Ravi',  'Sales',     35000, 'Delhi',  25),
(7, 'Tara',  'HR',        39000, 'Chennai',34),
(8, 'Kiran', 'Finance',   52000, 'Mumbai', 27),
(9, 'Amit',  'IT',        88000, 'Kolkata',30),
(10,'Rohit', 'Sales',     60000,'Chennai', 33),
(11,'Sneha', 'HR',        45000,'Delhi',  29);

select * from employees;
 
 CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    department VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'HR', 'Building A'),
(2, 'IT', 'Building B'),
(3, 'Sales', 'Building C'),
(4, 'Finance', 'Building D');

select * from departments;
