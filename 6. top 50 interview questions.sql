CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

select * from Worker;
SELECT * FROM Title;
SELECT * FROM Bonus;


CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 
 -- Q-1. Write an SQL query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>.
 select FIRST_NAME as WORKER_NAME from Worker;
-- Q-2. Write an SQL query to fetch "FIRST_NAME" from Worker table in upper case.
 select UPPER(FIRST_NAME) from Worker;
-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct DEPARTMENT from Worker;
-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
select substring(FIRST_NAME, 1, 2) from Worker;
-- Q-5. Write an SQL query to find the position of the alphabet ('b') in the first name column 'Amitabh' from Worker table.

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(FIRST_NAME) from Worker;
-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(FIRST_NAME) from Worker;
-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct DEPARTMENT, length(DEPARTMENT) AS total_length from Worker;
-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'.
select replace(FIRST_NAME, 'a', 'A') as replace_name from Worker;
-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(FIRST_NAME," ", LAST_NAME) as FullName from Worker;
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from Worker order by FIRST_NAME asc;
-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Worker order by Workers asc , DEPARTMENT desc;
-- Q-13. Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
select * from Worker where FIRST_NAME in ("Vipul","Satish");
-- Q-14. Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from Worker table.
select * from Worker where FIRST_NAME not in ("Vipul","Satish");
-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as "Admin*".
select * from Worker where DEPARTMENT = "Admin";
-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
select * from Worker where FIRST_NAME like '%a%';
-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'.
select * from Worker where FIRST_NAME like '%a';
-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets.
select * from Worker where FIRST_NAME like '_____h';
-- if ask 6 length FIRST_NAME
select FIRST_NAME, length(FIRST_NAME) as total_length from Worker where FIRST_NAME like '%h' and length(FIRST_NAME) = 6; 
-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Worker where SALARY between 100000 and 500000;
-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb'2014.
select * from  Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2;
-- Q-21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
select count(*) as total_Worker from Worker where DEPARTMENT='Admin';
-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
select concat(FIRST_NAME, " ", LAST_NAME) as FULL_NAME, SALARY from Worker where SALARY between 50000 and 100000;
-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- select * from Worker;
select concat(FIRST_NAME, " ", LAST_NAME) as FULL_NAME , DEPARTMENT, count(WORKER_ID) from Worker group by FULL_NAME, DEPARTMENT order by DEPARTMENT desc;
-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
select w.*, WORKER_TITLE as Role from Worker as w inner join Title as t on w.WORKER_ID = t.WORKER_REF_ID where t.WORKER_TITLE = 'Manager';
-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
select WORKER_TITLE, count(WORKER_ID) as total_worker from Title as t left join Worker as w on w.WORKER_ID = t.WORKER_REF_ID group by WORKER_TITLE having total_worker>1;
-- Q-26. Write an SQL query to show only odd rows from a table.
select * from Worker where mod(WORKER_ID,2)!=0;
-- Q-27. Write an SQL query to show only even rows from a table.
select * from Worker where mod(WORKER_ID,2)=0;
-- Q-28. Write an SQL query to clone a new table from another table.
create table Worker_Clone like Worker;
insert into Worker_Clone select * from Worker;
select * from Worker_Clone;
-- Q-29. Write an SQL query to fetch intersecting records of two tables.

-- Q-30. Write an SQL query to show records from one table that another table does not have.

-- Q-31. Write an SQL query to show the current date and time.

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
select * from Worker order by SALARY desc limit 5;
-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- after limit (n-1) 1
select distinct SALARY from Worker order by SALARY desc limit 4,1;
-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
select distinct SALARY from Worker w1 where 4 = (select count(distinct SALARY) from Worker w2 where w2.SALARY>w1.SALARY);
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
select w1.* from Worker w1, Worker w2 where w1.SALARY = w2.SALARY and w1.WORKER_ID != w2.WORKER_ID;
-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
select distinct SALARY from Worker w1 where 1 = (select count(distinct SALARY) from Worker w2 where w2.SALARY>w1.SALARY);
-- Q-37. Write an SQL query to show one row twice in results from a table.

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

-- Q-42. Write an SQL query to show the last record from a table.

-- Q-43. Write an SQL query to fetch the first row of a table.

-- Q-44. Write an SQL query to fetch the last five records from a table.

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery.

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.