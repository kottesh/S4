-- PL/SQL Triggers

-- 1. Write a trigger to restrict DML operations on a table.
CREATE OR REPLACE TRIGGER trg_restrict_dml
BEFORE INSERT OR UPDATE OR DELETE ON employees
BEGIN
  RAISE_APPLICATION_ERROR(-20001, 'DML operations are not allowed on the employees table.');
END;

-- tests
INSERT INTO employees (emp_id, emp_name, department) VALUES (101, 'Test Employee', 'IT');
UPDATE employees SET department = 'HR' WHERE emp_id = 101;
DELETE FROM employees WHERE emp_id = 101;

-- 2. Write a trigger to prevent updating a table on Sundays.
CREATE OR REPLACE TRIGGER trg_no_update_on_sunday
BEFORE UPDATE ON employees
DECLARE
  v_day_of_week NUMBER;
BEGIN
  SELECT TO_CHAR(SYSDATE, 'D') INTO v_day_of_week FROM dual;
  
  IF v_day_of_week = 1 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Updates to the employees table are not allowed on Sundays.');
  END IF;
END;

-- tests
UPDATE employees SET department = 'Engineering' WHERE emp_id = 101;

