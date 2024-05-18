--------------- ALTERATION FOR THE TABLE -------------------

CREATE TABLE job_history(
    history_id INT NOT NULL AUTO_INCREMENT,
    employee_id INT NOT NULL,
    job_id INT NOT NULL,
    job_title VARCHAR(25) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL, 
    salary FLOAT,
    commission INT,

    PRIMARY KEY(history_id),
    FOREIGN KEY(employee_id) REFERENCES employee(ID)
);

DROP TABLE job_history;

INSERT INTO job_history (employee_id, job_id, job_title, start_date, end_date, salary, commission)
    VALUES (1, 16, 'HR Analyst', '2001-01-14', '2002-12-22', 26679.3, 2904),
           (2, 53, 'Junior Clerk', '1989-12-12', '1997-01-13', 68181.67, 7485),
           (4, 40, 'Junior Analyst', '1993-04-07', '2001-07-09', 87356.94, 18476),
           (4, 44, 'Security Engineer', '2002-04-06', '2014-07-09', 187306.94, 10476),
           (5, 90, 'Junior Analyst', '1997-04-14', '2003-10-16', 22661.79, 16796),
           (5, 16, 'Security Engineer', '2004-11-24', '2013-05-18', 108933.84, 16250),
           (6, 68, 'Junior Analyst', '2000-07-10', '2009-10-13', 102773.08, 4236),
           (8, 42, 'CA Assistant', '1985-07-23', '1989-11-19', 25347.22, 2644),
           (9, 19, 'CA L2', '2000-07-28', '2005-01-12', 113492.09, 11888),
           (10, 53, 'Software Engineer', '2008-09-03', '2014-03-24', 109957.61, 1373),
           (13, 71, 'Principal Data Analyst', '2011-05-13', '2020-01-01', 65819.56, 8086),
           (13, 60, 'Junior Analyst', '2005-04-15', '2010-04-02', 35014.23, 12911),
           (16, 23, 'IT Support', '1990-02-12', '1998-02-27', 72757.05, 16258),
           (17, 23, 'IT Support', '1991-04-29', '2000-02-05', 89895.34, 15034),
           (17, 54, 'Software Developer', '2001-03-27', '2020-01-22', 100929.04, 191);


------------------------------------------------------------

-- Set Operators and Views

CREATE VIEW EmployeeWithoutHistory AS
SELECT 
    e.ID AS employee_id, 
    e.designation AS job_title, 
    e.hire_date AS start_date, 
    NULL AS end_date, 
    e.salary, 
    e.commission
FROM 
    employee e
WHERE NOT EXISTS (
  SELECT 1
  FROM job_history jh
  WHERE e.ID = jh.employee_id
);

CREATE VIEW EmployeeHistory AS
SELECT 
    jh.employee_id, 
    jh.job_title, 
    jh.start_date, 
    jh.end_date, 
    jh.salary, 
    jh.commission
FROM 
    job_history jh
WHERE 
    jh.end_date = (
        SELECT MAX(jh2.end_date)
        FROM job_history jh2
        WHERE jh.employee_id = jh2.employee_id
    );

CREATE VIEW current_job AS
SELECT
	e.ID AS employee_id,
	e.designation AS job_title,
	e.hire_date AS start_date,
	NULL AS end_date,
	e.salary,
	e.commission
FROM 
	employee e
	
CREATE VIEW past_job AS
SELECT
	jh.employee_id,
	jh.job_title,
	jh.start_date,
	jh.end_date,
	jh.salary,
	jh.commission
FROM 
	job_history jh 



-- 1.Display the current and previous job details of all employees. Display each employee only once.
(SELECT * FROM EmployeeWithHistory)
UNION
(SELECT * FROM EmployeeHistory)
ORDER BY employee_id;

-- 2.Display the current and previous job details of all employees.Include all duplications.
(SELECT * FROM current_job)
UNION ALL
(SELECT * FROM past_job)
ORDER BY employee_id

-- 3.Display the employee id and job id of all employees who currently have a job title that they held before begining thier tenure with the company.
SELECT employee_id, job_title FROM current_job
INTERSECT
SELECT employee_id, job_title FROM past_job

-- 4.Display the employees id of those employees who have not changed their jobs even once.
SELECT employee_id FROM current_job
EXCEPT
SELECT employee_id FROM past_job

-- 5.Find the job that was filled in first half of 1990 and the same job that was filled during same period in 1991.
SELECT jh.job_id, jh.job_title FROM job_history jh 
WHERE jh.start_date <= '1990-06-01' AND jh.start_date >= '1990-01-01'
INTERSECT
SELECT jh.job_id, jh.job_title FROM job_history jh
WHERE jh.start_date <= '1991-06-01' AND jh.start_date >= '1991-01-01';


-- 6.Write a compound query to produce a list of employees showing raise percentages,employeeids,old salary and new salary in rupees.
    -- COALESCE returns the first non null value in a list
SELECT 
    e.ID AS employee_id, 
    COALESCE((((e.salary - COALESCE(jh.salary, e.salary)) / COALESCE(jh.salary, e.salary)) * 100), 0) AS raise_percentage, 
    COALESCE(jh.salary, e.salary) AS old_salary, 
    e.salary AS new_salary
FROM 
    employee e
LEFT JOIN 
    job_history jh ON e.ID = jh.employee_id AND jh.end_date = (
        SELECT MAX(end_date)
        FROM job_history
        WHERE employee_id = e.ID
    );

