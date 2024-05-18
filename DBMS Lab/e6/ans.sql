-- Referential Constraints and Aggregation

CREATE TABLE country (
    counrty_id CHAR(2) PRIMARY KEY, 
    country_name VARCHAR(40),
    region_id NUMBER references region(region_id)
);


CREATE TABLE region (
    region_id NUMBER PRIMARY KEY, 
    region_name VARCHAR(25)
);


CREATE TABLE job (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35) NOT NULL, 
    max_sal NUMBER(6), 
    min_sal NUMBER(6)
);


CREATE TABLE location (
    loc_id NUMBER(10) PRIMARY KEY,
    str_addr VARCHAR2(40), 
    postal_code VARCHAR2(12),
    city VARCHAR2(30) NOT NULL,
    state_prov VARCHAR2(25),
    country_id CHAR(2) references country(counrty_id)
);


CREATE TABLE depart (
    dep_id NUMBER(4) PRIMARY KEY,
    dep_name VARCHAR2(30)NOT NULL,
    mgr_id NUMBER(6),
    locat_id NUMBER(4) references location(loc_id)
);


CREATE TABLE employee1 (
    emp_id NUMBER(6) PRIMARY KEY, 
    first_name VARCHAR2(20),
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(25) NOT NULL,
    phone_no VARCHAR2(20),
    hire_DATE DATE NOT NULL,
    job_id VARCHAR2(10) references job(job_id),
    salary NUMBER(8,2), 
    commission_pct NUMBER(2,2),
    manager_id NUMBER(6) references employee1(emp_id), 
    dept_id NUMBER(4) references depart(dep_id)
);


CREATE TABLE job_grades (
    grade_level VARCHAR2(3) unique,
    low_sal NUMBER, high_sal NUMBER
);


CREATE TABLE job_history (
    emp_id NUMBER(6) NOT NULL references employee1(emp_id), 
    stare_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL references job(job_id),
    dep_id NUMBER(4) references depart(dep_id)
);


-- Insert data into the region table
INSERT INTO region (region_id, region_name) VALUES (1, 'North America');
INSERT INTO region (region_id, region_name) VALUES (2, 'Europe');
INSERT INTO region (region_id, region_name) VALUES (3, 'Asia');

-- Insert data into the country table
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('US', 'United States', 1);
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('CA', 'Canada', 1);
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('FR', 'France', 2);
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('UK', 'United Kingdom', 2);
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('IN', 'India', 3);
INSERT INTO country (counrty_id, country_name, region_id) VALUES ('CN', 'China', 3);

-- Insert data into the job table
INSERT INTO job (job_id, job_title, max_sal, min_sal) VALUES ('IT_PROG', 'Programmer', 9000, 5000);
INSERT INTO job (job_id, job_title, max_sal, min_sal) VALUES ('SA_MAN', 'Sales Manager', 15000, 10000);
INSERT INTO job (job_id, job_title, max_sal, min_sal) VALUES ('AD_ASST', 'Administration Assistant', 5000, 3000);
INSERT INTO job (job_id, job_title, max_sal, min_sal) VALUES ('HR_REP', 'HR Representative', 8000, 4000);
INSERT INTO job (job_id, job_title, max_sal, min_sal) VALUES ('PR_REP', 'Public Relations Representative', 10000, 5000);

-- Insert data into the location table
INSERT INTO location (loc_id, str_addr, postal_code, city, state_prov, country_id) VALUES (1800, '123 Main St', '12345', 'Anytown', 'State', 'US');
INSERT INTO location (loc_id, str_addr, postal_code, city, state_prov, country_id) VALUES (1700, '456 Oak St', '67890', 'Anycity', 'Province', 'CA');
INSERT INTO location (loc_id, str_addr, postal_code, city, state_prov, country_id) VALUES (1500, '789 Elm St', '13579', 'Anycity', 'Province', 'FR');

-- Insert data into the depart table
INSERT INTO depart (dep_id, dep_name, mgr_id, locat_id) VALUES (10, 'Administration', NULL, 1500);
INSERT INTO depart (dep_id, dep_name, mgr_id, locat_id) VALUES (20, 'Executive', NULL, 1700);
INSERT INTO depart (dep_id, dep_name, mgr_id, locat_id) VALUES (30, 'Sales', NULL, 1800);
INSERT INTO depart (dep_id, dep_name, mgr_id, locat_id) VALUES (40, 'IT', NULL, 1800);
INSERT INTO depart (dep_id, dep_name, mgr_id, locat_id) VALUES (50, 'HR', NULL, 1700);

-- Insert data into the employee1 table
INSERT INTO employee1 (emp_id, first_name, last_name, email, phone_no, hire_DATE, job_id, salary, commission_pct, manager_id, dept_id) VALUES (1001, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', TO_DATE('2023-01-01', 'YYYY-MM-DD') , 'AD_ASST', 4000, NULL, NULL, 10);
INSERT INTO employee1 (emp_id, first_name, last_name, email, phone_no, hire_DATE, job_id, salary, commission_pct, manager_id, dept_id) VALUES (1002, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'HR_REP', 5000, NULL, NULL, 50);
INSERT INTO employee1 (emp_id, first_name, last_name, email, phone_no, hire_DATE, job_id, salary, commission_pct, manager_id, dept_id) VALUES (1003, 'Mike', 'Johnson', 'mike.johnson@example.com', '555-123-4567', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'IT_PROG', 6000, NULL, NULL, 40);
INSERT INTO employee1 (emp_id, first_name, last_name, email, phone_no, hire_DATE, job_id, salary, commission_pct, manager_id, dept_id) VALUES (1004, 'Alice', 'Wong', 'alice.wong@example.com', '111-222-3333', TO_DATE('2023-02-15', 'YYYY-MM-DD'), 'SA_MAN', 12000, NULL, NULL, 30);
INSERT INTO employee1 (emp_id, first_name, last_name, email, phone_no, hire_DATE, job_id, salary, commission_pct, manager_id, dept_id) VALUES (1005, 'Bob', 'Lee', 'bob.lee@example.com', '444-555-6666', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'PR_REP', 8000, NULL, NULL, 10);

-- Insert data into the job_history table
INSERT INTO job_history (emp_id, stare_date, end_date, job_id, dep_id) VALUES (1001, TO_DATE('2023-01-01','YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'AD_ASST', 10);
INSERT INTO job_history (emp_id, stare_date, end_date, job_id, dep_id) VALUES (1002, TO_DATE('2023-01-15','YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'HR_REP', 50);
INSERT INTO job_history (emp_id, stare_date, end_date, job_id, dep_id) VALUES (1003, TO_DATE('2023-02-01','YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'IT_PROG', 40);
INSERT INTO job_history (emp_id, stare_date, end_date, job_id, dep_id) VALUES (1004, TO_DATE('2023-02-15','YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'SA_MAN', 30);
INSERT INTO job_history (emp_id, stare_date, end_date, job_id, dep_id) VALUES (1005, TO_DATE('2023-03-01','YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'PR_REP', 10);


-- 1. Show dno, loc, ename, job titles and salary of employees who work in location 1800.
SELECT d.dep_id AS dno, l.loc_id AS loc, e.first_name || ' ' || e.last_name AS ename, j.job_title, e.salary
FROM employee1 e
    JOIN depart d ON e.dept_id = d.dep_id
    JOIN location l ON d.locat_id = l.loc_id
    JOIN job j ON e.job_id = j.job_id
WHERE l.loc_id = 1800;

-- 2. How many employees have a name that ends with ‘n’.
SELECT COUNT(*) AS num_employees
FROM employee1
WHERE last_name LIKE '%n';

-- 3. Show the names and location for all department and number of employees working in each department.
SELECT d.dep_name, l.city AS location, COUNT(e.emp_id) AS num_employees
FROM depart d
    JOIN location l ON d.locat_id = l.loc_id
    LEFT JOIN employee1 e ON d.dep_id = e.dept_id
GROUP BY d.dep_name, l.city;

-- 4. Which jobs are found in administration and executive department and how many employees do those jobs?
SELECT d.dep_name, j.job_title, COUNT(e.emp_id) AS num_employees
FROM depart d
    JOIN employee1 e ON d.dep_id = e.dept_id
    JOIN job j ON e.job_id = j.job_id
WHERE d.dep_name IN ('Administration', 'Executive')
GROUP BY d.dep_name, j.job_title;

-- 5. Show department name and number of employee and average salary of all department together with names, salaries and jobs of employees working in each department.
SELECT d.dep_name, COUNT(e.emp_id) AS num_employees, AVG(e.salary) AS avg_salary,
       e.first_name || ' ' || e.last_name AS ename, e.salary, j.job_title
FROM depart d
    JOIN employee1 e ON d.dep_id = e.dept_id
    JOIN job j ON e.job_id = j.job_id
GROUP BY d.dep_name, e.first_name, e.last_name, e.salary, j.job_title;

-- 6.Show the department number and lowest salary of department with the highest average salary.
SELECT d.dep_id, MIN(e.salary) AS lowest_salary
FROM depart d
    JOIN employee1 e ON d.dep_id = e.dept_id
GROUP BY d.dep_id
HAVING AVG(e.salary) = (SELECT MAX(avg_salary) FROM (SELECT AVG(salary) AS avg_salary FROM employee1 GROUP BY dept_id));

-- 7.Show the department number, name and location of department where no sales representative work.
SELECT d.dep_id, d.dep_name, l.city AS location
FROM depart d
    JOIN location l ON d.locat_id = l.loc_id
WHERE d.dep_id NOT IN (SELECT dept_id FROM employee1 WHERE job_id = 'SA_MAN');

-- 8. Show the department number, name and number of employees working in each department that has fewer than 3 employees
SELECT d.dep_id, d.dep_name, COUNT(e.emp_id) AS num_employees
FROM depart d
    LEFT JOIN employee1 e ON d.dep_id = e.dept_id
GROUP BY d.dep_id, d.dep_name
HAVING COUNT(e.emp_id) < 3;

-- 9. Show the department number, name and number of employees working in each department that has Highest number of employees.
SELECT d.dep_id, d.dep_name, COUNT(e.emp_id) AS num_employees
FROM depart d
    JOIN employee1 e ON d.dep_id = e.dept_id
GROUP BY d.dep_id, d.dep_name
HAVING COUNT(e.emp_id) = (SELECT MAX(num_employees) FROM (SELECT COUNT(emp_id) AS num_employees FROM employee1 GROUP BY dept_id));

-- 10. Show the employee number, name, salary department number, average salary in the department for all employees.
SELECT e.emp_id, e.first_name || ' ' || e.last_name AS name, e.salary, e.dept_id, AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary_in_dept
FROM employee1 e;

