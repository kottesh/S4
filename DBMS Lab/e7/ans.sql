CREATE TABLE employees (
  emp_id NUMBER PRIMARY KEY,
  emp_name VARCHAR2(100),
  department VARCHAR2(50)
);

CREATE SEQUENCE emp_seq
  START WITH 1
  INCREMENT BY 1
  NOMAXVALUE;

-- 1. Write a PL/SQL program to perform DML operations.
DECLARE
BEGIN
  -- Insert operation
  INSERT INTO employees (emp_id, emp_name, department) VALUES (emp_seq.nextval, 'Warren Costa', 'Rust Developer');
  DBMS_OUTPUT.PUT_LINE('Insert operation completed.');
  
  -- Update operation
  UPDATE employees SET department = 'HR' WHERE emp_id = 1;
  IF SQL%ROWCOUNT > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Update operation completed. Rows updated: ' || SQL%ROWCOUNT);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Update operation completed. No rows updated.');
  END IF;
  
  -- Delete operation
  DELETE FROM employees WHERE emp_id = 1;
  IF SQL%ROWCOUNT > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Delete operation completed. Rows deleted: ' || SQL%ROWCOUNT);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Delete operation completed. No rows deleted.');
  END IF;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Changes committed.');
END;

-- 2. Write a PL/SQL program to perform factorials of a given number.
DECLARE
  num INTEGER := 5;
  factorial INTEGER := 1;
BEGIN
  FOR i IN REVERSE 1 .. num LOOP
    factorial := factorial * i;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Factorial of ' || num || ' is: ' || factorial);
END;

-- 3. Write a PL/SQL program to perform Fibonacci series till a given number.
DECLARE
  n INTEGER := 10;
  first INTEGER := 0;
  second INTEGER := 1;
  next INTEGER;
BEGIN
  DBMS_OUTPUT.PUT_LINE(first);
  DBMS_OUTPUT.PUT_LINE(second);
  
  FOR i IN 2 .. n LOOP
    next := first + second;
    DBMS_OUTPUT.PUT_LINE(next);
    first := second;
    second := next;
  END LOOP;
END;

-- 4. Write a PL/SQL program to generate prime numbers up to a given number.
DECLARE
  n INTEGER := 30;
  cnt INTEGER;
BEGIN
  FOR num IN 2 .. n LOOP
    cnt := 0;
    
    FOR i IN 2 .. num/2 LOOP
      IF mod(num, i) = 0 THEN
        cnt := cnt + 1;
        EXIT;
      END IF;
    END LOOP;
    
    IF cnt = 0 AND num != 1 THEN
      DBMS_OUTPUT.PUT_LINE(num);
    END IF;
  END LOOP;
END;

-- 5. Write a PL/SQL program to perform reversal of a given number.
DECLARE
  num INTEGER := 12345;
  reversed_num INTEGER := 0;
  remainder INTEGER;
BEGIN
  WHILE num != 0 LOOP
    remainder := mod(num, 10);
    reversed_num := reversed_num * 10 + remainder;
    num := trunc(num / 10);
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('Reversed Number: ' || reversed_num);
END;

