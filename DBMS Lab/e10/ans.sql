-- PL/SQL Packages

-- 1. Write a Pl/SQL package to implement DML operations on Employee table.
CREATE OR REPLACE PACKAGE emp_pkg IS
  -- to insert a new employee
  PROCEDURE insert_emp(p_emp_id IN employees.emp_id%TYPE, p_emp_name IN employees.emp_name%TYPE, p_department IN employees.department%TYPE);
  
  -- to update an employee's department
  PROCEDURE update_emp_dept(p_emp_id IN employees.emp_id%TYPE, p_department IN employees.department%TYPE);
  
  -- to delete an employee
  PROCEDURE delete_emp(p_emp_id IN employees.emp_id%TYPE);
END emp_pkg;

CREATE OR REPLACE PACKAGE BODY emp_pkg IS
  PROCEDURE insert_emp(p_emp_id IN employees.emp_id%TYPE, p_emp_name IN employees.emp_name%TYPE, p_department IN employees.department%TYPE) IS
  BEGIN
    INSERT INTO employees (emp_id, emp_name, department) VALUES (p_emp_id, p_emp_name, p_department);
   	DBMS_OUTPUT.PUT_LINE('Employee inserted: ' || p_emp_name);
  END insert_emp;
  
  PROCEDURE update_emp_dept(p_emp_id IN employees.emp_id%TYPE, p_department IN employees.department%TYPE) IS
  BEGIN
    UPDATE employees SET department = p_department WHERE emp_id = p_emp_id;
  END update_emp_dept;
  
  PROCEDURE delete_emp(p_emp_id IN employees.emp_id%TYPE) IS
  BEGIN
    DELETE FROM employees WHERE emp_id = p_emp_id;
  END delete_emp;
END emp_pkg;

-- 2. Write a Pl/SQL package to implement Function Overloading.
CREATE OR REPLACE PACKAGE math_pkg IS
  -- calculate the area of a circle
  FUNCTION calc_area(radius IN NUMBER) RETURN NUMBER;
  
  -- calculate the area of a rectangle
  FUNCTION calc_area(length IN NUMBER, width IN NUMBER) RETURN NUMBER;
END math_pkg;

CREATE OR REPLACE PACKAGE BODY math_pkg IS
  FUNCTION calc_area(radius IN NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN 3.14 * radius * radius;
  END calc_area;
  
  FUNCTION calc_area(length IN NUMBER, width IN NUMBER) RETURN NUMBER IS
  BEGIN
    RETURN length * width;
  END calc_area;
END math_pkg;

DECLARE
  area_circle NUMBER;
  area_rectangle NUMBER;
BEGIN
  area_circle := math_pkg.calc_area(radius => 5);
  DBMS_OUTPUT.PUT_LINE('Area of the circle: ' || area_circle);
  
  area_rectangle := math_pkg.calc_area(length => 10, width => 20);
  DBMS_OUTPUT.PUT_LINE('Area of the rectangle: ' || area_rectangle);
END;

BEGIN
  emp_pkg.insert_emp(p_emp_id => 101, p_emp_name => 'John Doe', p_department => 'IT');
  emp_pkg.update_emp_dept(p_emp_id => 101, p_department => 'HR');
  emp_pkg.delete_emp(p_emp_id => 101);
  
  COMMIT;
END;


