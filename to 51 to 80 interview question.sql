SHOW DATABASES;
USE ORG;

select * from Worker;

SELECT * FROM Title;
SELECT * FROM Bonus;

-- Q-51. Write an SQL query to fetch employees along with their bonus amount using LEFT JOIN.
select * from worker w left join bonus b on w.WORKER_ID = b.WORKER_REF_ID;
-- Q-52. Write an SQL query to fetch departments with their average salary.
select DEPARTMENT, avg(SALARY) from worker group by DEPARTMENT;
-- Q-53. Write an SQL query to fetch employees who joined in the last 30 days.
select * from worker where JOINING_DATE >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);
-- Q-54. Write an SQL query to find duplicate FIRST_NAME values.
select w1.* from worker w1, worker w2 where w1.FIRST_NAME = w2.FIRST_NAME and w1.WORKER_ID != w2.WORKER_ID;
-- use group by
select FIRST_NAME, count(FIRST_NAME) as count from worker group by FIRST_NAME having count >= 2;
-- Q-55. Write an SQL query to remove duplicate rows from a table.
delete w1 from worker w1 inner join worker w2  ON w1.FIRST_NAME = w2.FIRST_NAME
AND w1.LAST_NAME = w2.LAST_NAME
AND w1.SALARY = w2.SALARY
AND w1.DEPARTMENT = w2.DEPARTMENT
AND w1.WORKER_ID > w2.WORKER_ID;

-- Q-56. Write an SQL query to get the second highest salary using a window function.

-- Q-57. Write an SQL query to get the running total of salary using window function.

-- Q-58. Write an SQL query to create a VIEW from Worker table.
create view worker_view as select FIRST_NAME, LAST_NAME, DEPARTMENT from worker;
-- showing
select * from worker_view;
-- Q-59. Write an SQL query to increase salary by 10%.
-- update worker set salary = salary * 1.10 ;
-- Q-60. Write an SQL query to delete employees from Admin department.
-- delete  from worker where DEPARTMENT = "Admin";
-- Q-61. Write an SQL query to create an index on FIRST_NAME.
create index FIRST_NAME_inx on worker(FIRST_NAME);
-- Q-62. Write an SQL query to fetch employee details using a subquery (IN).

-- Q-63. Write an SQL query to fetch highest salary per department using window functions.
select distinct DEPARTMENT, max(SALARY) as MAX from worker group by DEPARTMENT;
-- Q-64. Write an SQL query to count employees hired each year.
select year(JOINING_DATE) as YEAR, count(WORKER_ID) TOTAL_HIRE from worker group by year(JOINING_DATE);
-- Q-65. Write an SQL query to calculate total bonus per employee.
select FIRST_NAME, sum(b.BONUS_AMOUNT) BonusAm from worker w1 left join bonus b on w1.WORKER_ID = b.WORKER_REF_ID group by FIRST_NAME, WORKER_REF_ID having BonusAm is not null;
-- Q-66. Write an SQL query to fetch employees whose salary is above department average.
select w1.* from worker w1 join (select distinct DEPARTMENT, avg(SALARY) as sly from worker group by DEPARTMENT) temp 
on temp.DEPARTMENT = w1.DEPARTMENT where w1.salary > temp.sly;
-- Q-67. Write an SQL query to fetch employees whose name starts with V, A, or S.
select * from worker where FIRST_NAME like 'A%' or FIRST_NAME like 'V%' or FIRST_NAME like 'S%';
-- Q-68. Write an SQL query to fetch employees working in more than one department.
select distinct FIRST_NAME, count(DEPARTMENT) as dept from worker group by FIRST_NAME having dept >1;
-- Q-69. Write an SQL query to disable safe updates in MySQL.

-- Q-70. Write an SQL query to fetch the maximum bonus amount.
select max(BONUS_AMOUNT) from bonus;
-- Q-71. Write an SQL query to create a stored procedure.

-- Q-72. Write an SQL query to call a stored procedure.

-- Q-73. Write an SQL query to create a trigger that logs salary changes.

-- Q-74. Write an SQL query to fetch maximum, minimum, and average salary.
select max(SALARY) as MAX_SALARY, min(SALARY) AS MIN_SALARY, avg(SALARY) AS AVG_SALARY FROM worker;
-- Q-75. Write an SQL query to fetch employees having the highest salary.
SELECT * FROM Worker WHERE SALARY = (SELECT MAX(SALARY) FROM Worker);
-- Q-76. Write an SQL query to fetch the highest bonus per year.
select year(BONUS_DATE) YEAR, max(distinct BONUS_AMOUNT) MAXIMUM_BONOUS from bonus group by YEAR;
-- Q-77. Write an SQL query to count employees based on salary range groups.

-- Q-78. Write an SQL query to fetch employees who do not belong to Admin or HR.
select * from worker where DEPARTMENT not in ("Admin" , "HR");
-- Q-79. Write an SQL query to fetch employees who joined before 2014.
select * from worker where year(JOINING_DATE) < 2014;
-- Q-80. Write an SQL query to sort all employees by salary desc and first name asc.
select * from worker order by DEPARTMENT desc, FIRST_NAME asc;