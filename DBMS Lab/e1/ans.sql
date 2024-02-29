USE app;

DROP TABLE employee;
DROP TABLE department;

CREATE TABLE department (
    no INT NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    location VARCHAR(128) NOT NULL
);


-- ALTER TABLE department MODIFY name VARCHAR(64) NOT NULL;
-- ALTER TABLE department MODIFY location VARCHAR(128) NOT NULL;

CREATE TABLE employee (
    ID INT NOT NULL UNIQUE AUTO_INCREMENT,
    first_name VARCHAR(16) NOT NULL,
    last_name VARCHAR(16),
    designation VARCHAR(16),
    manager_name VARCHAR(16),
    salary INT,
    hire_date DATE,
    commisson INT,
    department_no INT,
    
    FOREIGN KEY (department_no) REFERENCES department(no),
    PRIMARY KEY(ID)
);

-- ALTER TABLE employee AUTO_INCREMENT=8960;


INSERT INTO department
VALUES
	(5621, 'Security', 'Cold Storage Sector, East Block, CBE, IN'),
	(8952, 'Finance', 'John Kicks Block, CBE, IN'),
	(8989, 'Human Resources', 'Main Block, CBE, IN'),
    (8956, 'Mark Engineering Labs', 'North face building, CBE, IN');
   
SELECT * FROM department;

INSERT INTO employee(first_name, last_name, designation, manager_name, salary, hire_date, commisson, department_no)
VALUES
	('John', 'Smith', 'HR', 'Dravid', 100000, '2004-05-04', 60000, 8989)

-- FAILING INSERT EXAMPLE
	
INSERT INTO employee(first_name, last_name, designation, manager_name, salary, hire_date, commisson, department_no)
VALUES
	('John', 'Smith', 'HR', 'Dravid', 100000, '2004-05-04', 60000, 8987)

INSERT INTO employee(first_name, last_name, designation, manager_name, salary, hire_date, commisson, department_no)
VALUES
	('Jaylee', 'Man', 'Clerk', 'Luna', 500000, '2000-03-17', 1000, 8989),
	('Alena', 'Glover', 'Clerk', 'Luna', 400000, '1989-03-19', 2000, 8989),
	('Rosie', 'Bowers', 'Security Engineering Manager', '', 100000, '2014-09-04', 10000, 5621),
	('Noa', 'Jacobs', 'Security Analyst', 'Jane', 1000000, '2012-05-04', 10000, 5621),
	('Ximena', 'Chou', 'Security Lead', 'Jane', 500000, '2010-02-24', 50000, 5621),
	('Alaiya', 'Cannon', 'Security Intern', 'Jane', 50000, '2016-08-26', 50000, 5621),
    ('Aprelle', 'Cotton', 'CA L3', 'Bond', 839490, '1990-03-20', 7000, 8952),
    ('Philip', 'Keith', 'CA L2', 'Bond', 800000, '2005-02-27', 2000, 8952),
    ('Jagger', 'McGuire', 'Rust Developer', 'Jensen', 900000, '2015-02-27', 20000, 8956),
    ('Dash', 'Orr', 'Tech Lead', 'Jensen', 1000000, '1980-02-27', 20000, 8956),
    ('Nicolas', 'Ortega', 'Data Intern', 'Jensen', 10000, '2020-02-27', 2000, 8956);
    ('Mateo', 'Hart', 'Data Engineering Manager', '', 100000, '2020-01-27', 20000, 8956);
    ('Nicolas', 'Ortega', 'Data Intern', 'Jensen', 10000, '2020-02-27', 2000, 8956);

-- 1.List  all records in the employee table.
SELECT * FROM employee;

-- 2.List department name and location from department table.
SELECT name, location FROM department;

-- 3.List all employees belonging to dep "10".
SELECT * FROM employee WHERE department_no=8956;

-- 4.List all the names of clerk and analysts working in dep "20"
SELECT first_name, last_name FROM employee WHERE (designation='Clerk' OR  designation LIKE '%Analyst%') AND department_no = 8989;

-- 5.List the names and salary of employees whose salary is more than 2000.
SELECT first_name, last_name, salary FROM employee WHERE salary > 2000;

-- 6.List the employee whose salary are more than 2000 and less than 5000.
SELECT * FROM employee WHERE salary > 5000 AND salary < 60000;

-- 7.List the details of employees who joined before september 1981.
SELECT * FROM employee WHERE hire_date <  '1981-09-01';

-- 8.List the employees who are not managers.
SELECT * FROM employee WHERE designation NOT LIKE '%manager%';

-- 9.List the employees who do not belong to department 10 and 20.
SELECT * FROM employee WHERE department_no NOT IN (5621, 8956);

-- 10.List the employees who joined before june 1991 and after december 1981.
SELECT * FROM employee WHERE hire_date > '1981-12-01' AND hire_date < '1991-06-01';
