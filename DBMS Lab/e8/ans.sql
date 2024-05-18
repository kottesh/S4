-- Pl/SQL Cursor

BEGIN
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Alice Johnson', 'HR');
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Bob Smith', 'IT');
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Charlie Brown', 'Sales');
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Diana Prince', 'Marketing');
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Evan Wallace', 'Customer Support');
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Taylor Avalos', 'IT');
  COMMIT;
END;


-- 1.Write a Pl/SQL program to implement - Simple Cursor
DECLARE
  CURSOR emp_cursor IS
    SELECT emp_name, department FROM employees;
  v_emp_name employees.emp_name%TYPE;
  v_department employees.department%TYPE;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO v_emp_name, v_department;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_emp_name || ', Department: ' || v_department);
  END LOOP;
  CLOSE emp_cursor;
END;

-- 2.Write a Pl/SQL program to implement - Cursor for loop
DECLARE
  CURSOR emp_cursor IS
    SELECT emp_name, department FROM employees;
BEGIN
  FOR emp_record IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_record.emp_name || ', Department: ' || emp_record.department);
  END LOOP;
END;

-- 3.Write a Pl/SQL program to implement  - Cursor for loop using sub-query
DECLARE
BEGIN
  FOR emp_record IN (
    SELECT e.emp_name, e.department
    FROM employees e
    WHERE e.department IN (
      SELECT department
      FROM employees
      GROUP BY department
      HAVING COUNT(emp_id) > 1
    )
  ) LOOP
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_record.emp_name || ', Department: ' || emp_record.department);
  END LOOP;
END;

