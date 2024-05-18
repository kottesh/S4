USE app;

SELECT * FROM employee;

INSERT INTO employee(first_name, last_name, designation, manager_name, salary, hire_date, commission, department_no)
VALUES
	('Natasha', 'Mendoza', 'Data Intern', 'Jensen', 12000, '2020-03-17', NULL, 8956),
	('Cora', 'Caffey', 'Tech Lead', 'Jensen', 562220, '1999-08-02', 25000, 8956);

-- 11.List the different jobs available in employee table.
SELECT DISTINCT designation FROM employee; 

-- 12.List the employees who are not eligible for the commission.
UPDATE employee
SET commission = NULL
WHERE designation LIKE "%intern";

-- Renaming column
ALTER TABLE employee
RENAME COLUMN commisson TO commission;

SELECT * FROM employee
WHERE commission IS NULL OR commission = 0;

-- 13.List the employee's first name, last name and designation who does'nt report to anybody.
UPDATE employee
SET manager_name = NULL
WHERE manager_name = ''

SELECT first_name, last_name, designation
FROM employee
WHERE manager_name IS NULL 

-- 14.List the employee first names which starts with 'S'.
SELECT first_name FROM employee
WHERE first_name LIKE "N%";

-- 15.List the employee first names having exactly 5 characters.
SELECT first_name FROM employee
WHERE CHAR_LENGTH(first_name) = 5;
-- there is LEN() for SQL server.

-- 16.List employee first names having 'i' as second character.
SELECT first_name FROM employee
WHERE first_name LIKE '_i%';

-- 17.List the average salary of employees in each department.
SELECT department_no, AVG(salary) AS avg_salary
FROM employee
GROUP BY department_no;

-- 18.Find the maximum salary in each department. (I used subquery here)
SELECT * 
FROM employee
WHERE salary IN (
    SELECT max(salary)
    FROM employee
    GROUP BY department_no
)
GROUP BY department_no;

-- 19.Find the maximum salary in each department having maximum salary of 150000.
SELECT department_no, min(salary)
FROM employee
GROUP BY department_no
HAVING max(salary) <= 1500000;

-- 20.List the number of employees.
SELECT count(*) as EMPLOYEE_COUNT
FROM employee;

-- 21.List the total salary payable to employee jobwise.
SELECT designation, sum(salary) as TOTAL_SALARY_PAYABLE
FROM employee
GROUP BY designation;

-- 22.List maximum and minimum of salary.
SELECT min(salary) as MIN_SAL, max(salary) as MAX_SAL
FROM employee

SELECT *
FROM employee
WHERE salary = (SELECT min(salary) FROM employee)
	OR salary = (SELECT max(salary) FROM employee);

-- 23.List the employee name,hra,pf and gross salary.

SELECT ID,
	   first_name, last_name,
	   salary,
	   salary * .4 AS hra,
	   salary * .12 AS pf,
	   salary + salary * .4 AS gross_sal
FROM employee;


-- 24.List the total and average salary of employee jobwise for department number 20 and also display only those rows having average>2000.
SELECT department_no, SUM(salary) AS Total_Sal, AVG(salary) AS Avg_Sal
FROM employee
GROUP BY designation
HAVING department_no = 8956 AND AVG(salary) >= 15000;


-- 25.List the employee name using the following functions.                                                                       
-- i. Upper(emp)
SELECT UPPER(first_name) AS UC_EMP_NAME FROM employee;

-- ii. Lower(emp)
SELECT LOWER(first_name) AS LC_EMP_NAME FROM employee;

-- iii. Length(emp)
SELECT LENGTH(first_name) AS NAME_LENGTH FROM employee;

-- iv. Lpad(emp,10,*)
SELECT LPAD(first_name, 10, '*') AS LPAD FROM employee;

-- v. Rpad(emp,10,*)
SELECT RPAD(first_name, 10, '*') AS RPAD FROM employee;

-- vi. Replace ~Translate(emp,a,1)~
SELECT REPLACE(first_name , 'a', 1) AS "REPLACE" FROM employee;

-- vii. Instr(emp,i)
SELECT INSTR(first_name, 'i') AS FIND_LOC_CHAR FROM employee;

-- viii. Substr(emp,2,3)
SELECT SUBSTR(first_name, 2, 3) AS SUBSTRING_EMP_NAME FROM employee;

-- 26.Use the following data functions.

-- i. sysdate
SELECT SYSDATE();
-- ii. last-day(hiredate)
SELECT LAST_DAY(hire_date) FROM employee;

-- ------- These Aggregate Funcs won't work in MySQL or MariaDB -------
-- iii. next-day(sysdate,'Friday')
-- iv. add-months(hiredate,5)
-- v. months-between(hiredate,sysdate)
-- --------------------------------------------------------------------

-- 27.List the total salary amount payable to employees.
SELECT SUM(salary) AS total_emp_sal FROM employee;

