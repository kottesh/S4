-- Joins and Subqueries


/* ------------------------------------------------------------------------------------------------------------------- */
-- some alterations to database

USE app;

SELECT * FROM employee;
SELECT * FROM department;

ALTER TABLE employee
DROP COLUMN pf;

INSERT INTO employee(first_name, last_name, designation, manager_name, salary, hire_date, commisson, department_no)
VALUES
	('Esme', 'Brown', 'Data Analyst', 'Jensen', 500000, '2022-08-07', 1000, 8956),
/* ------------------------------------------------------------------------------------------------------------------- */

-- 1.List the employee where salary is > Smith.
SELECT first_name 
FROM employee
WHERE SALARY > (
    SELECT salary
    FROM employee
    WHERE first_name LIKE "jagger" 
);

-- 2.Display the employee details where department no is same as that of employee 1.
SELECT *
FROM employee
WHERE department_no = (
    SELECT department_no
    FROM employee
    WHERE id = 1
);

-- 3.Display the employee details where deparment no is same as that of employee 1 and whose salary is same or > employee 2.
SELECT *
FROM employee
WHERE department_no = (
    SELECT department_no
    FROM employee
    WHERE id = 1
) AND salary >= (
    SELECT salary 
    FROM employee
    WHERE id = 2
);


-- 4.Display the name,job and salary of the employee who gets minimum salary.
SELECT first_name, designation, salary
FROM employee
WHERE salary = (
    SELECT min(salary) FROM employee
);

-- 5.Display the dept. and minimum salary of department having minimum salary > department 20.
SELECT name, MIN(salary)
FROM employee
    INNER JOIN department ON employee.department_no = department.no
GROUP BY department_no
HAVING MIN(salary) > (
    SELECT MIN(salary)
    FROM employee
    WHERE department_no = 8956  
);

-- 6.List the employees who get the minimum salary in each department.
SELECT first_name, salary, employee.department_no
FROM employee
INNER JOIN (
    SELECT MIN(salary) as min_salary, employee.department_no 
    FROM employee
    GROUP BY department_no
) res 
ON employee.department_no = res.department_no AND employee.salary = res.min_salary;

-- 7.List the employee details whose salary is less than that of analyst.
SELECT *
FROM employee
WHERE salary < (
    SELECT min(salary)
    FROM employee
    WHERE designation LIKE "%analyst%"
);

-- 8.List the employee and their department name.
SELECT first_name, name
FROM employee
INNER JOIN department ON employee.department_no = department.no;

-- 9.List the employee details with their department .
SELECT *
FROM employee 
    INNER JOIN department ON employee.department_no = department.no;

-- 10.List the employees working under other employees.
SELECT first_name
FROM employee
WHERE manager_name IS NOT NULL;

-- (won't do this one, this is unrelated.) 11.List the names and grades of employees where

-- 12.List the employee with second minimum salary.
SELECT first_name, salary
FROM employee
ORDER BY salary ASC
LIMIT 1 OFFSET 1;

-- 13.List the employees belonging to department of jane.
SELECT first_name  
FROM employee
WHERE manager_name LIKE "jane"
   
