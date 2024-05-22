DECLARE
	n INTEGER := 40;
	cnt INTEGER;
BEGIN
	FOR num IN 2..n LOOP
		cnt := 0;
		
		FOR i IN 2 .. num/2 LOOP
			IF mod(num, i) = 0 THEN
				cnt := cnt + 1;
				EXIT;
			END IF;
		END LOOP;
		IF cnt = 0 THEN
			DBMS_OUTPUT.PUT_LINE(num);
		END IF;
	END LOOP;
END;

DECLARE
	num INTEGER:=7774;
	reversed INTEGER := 0;
	rem INTEGER := 0;
BEGIN
	WHILE num != 0 LOOP
		rem := mod(num, 10);
		reversed := (reversed * 10) + rem;
		num := trunc(num / 10);
	END LOOP;
	DBMS_OUTPUT.PUT_LINE(reversed);
END;

DECLARE
	CURSOR e_cur IS 
	SELECT emp_name, department FROM employees;
	v_emp_name employees.emp_name%TYPE;
	v_emp_dep employees.department%TYPE;
BEGIN
	OPEN e_cur;
	LOOP 
		FETCH e_cur INTO v_emp_name, v_emp_dep;
		EXIT WHEN e_cur%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(v_emp_name || v_emp_dep);
	END LOOP;
	CLOSE e_cur;
END;

DECLARE
	CURSOR e_cur IS
		SELECT emp_name, department FROM employees;
BEGIN
	FOR emp_rec IN e_cur LOOP
		DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name || emp_rec.department);
	END LOOP;
END;


BEGIN
	FOR rec IN (
		SELECT emp_name, department
		FROM employees
	) LOOP
		DBMS_OUTPUT.PUT_LINE(rec.emp_name || rec.department);
	END LOOP;
END;


DECLARE
	num INTEGER := 10;
	deno INTEGER := 0;
	res INTEGER;
BEGIN
	res := num / deno;
	DBMS_OUTPUT.PUT_LINE(res);
EXCEPTION
	WHEN ZERO_DIVIDE THEN
	DBMS_OUTPUT.PUT_LINE('Error!');
END;


DECLARE
	invalid_dept EXCEPTION;
	dept VARCHAR2(20) := 'HR';
BEGIN
	IF dept NOT IN ('HR', 'IT') THEN
	 RAISE invalid_dept;
	ELSE
		DBMS_OUTPUT.PUT_LINE('FOUND');
	END IF;
EXCEPTION
	WHEN invalid_dept THEN
		DBMS_OUTPUT.PUT_LINE('INVALID DEPT');
END;


CREATE OR REPLACE PACKAGE math_pkg IS 
	FUNCTION calc_area(radius IN INTEGER) RETURN NUMBER;
	FUNCTION calc_area(len IN INTEGER, width IN INTEGER) RETURN INTEGER;
END math_pkg;

CREATE OR REPLACE PACKAGE BODY math_pkg IS
	FUNCTION calc_area(radius IN INTEGER) RETURN NUMBER IS
	BEGIN 
		RETURN radius * radius * 3.143;
	END calc_area;
	FUNCTION calc_area(len IN INTEGER, width IN INTEGER) RETURN INTEGER IS
	BEGIN
		RETURN len * width;
	END calc_area;
END math_pkg;

BEGIN
	DBMS_OUTPUT.PUT_LINE(math_pkg.calc_area(4));
	DBMS_OUTPUT.PUT_LINE(math_pkg.calc_area(1, 2));
END;

SELECT TO_CHAR(SYSDATE) FROM dual;

CREATE OR REPLACE TRIGGER restrict_update
BEFORE UPDATE ON employees
DECLARE
	week_day VARCHAR2(1);
BEGIN 
	SELECT TO_CHAR(SYSDATE, 'D') INTO week_day FROM dual;
	IF week_day = 1 THEN
		DBMS_OUTPUT.PUT_LINE('Updated on sundays is not allowed.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Updating');
	END IF;
END;
UPDATE employees SET DEPARTMENT = 'Engineering' WHERE DEPARTMENT = 'IT';

-- for today

CREATE OR REPLACE TRIGGER restrict_update
BEFORE UPDATE ON employees
DECLARE
  v_today DATE;
BEGIN 
  v_today := TRUNC(SYSDATE);  -- Get today's date (truncated to remove time part)

  IF v_today = TRUNC(SYSDATE) THEN
    DBMS_OUTPUT.PUT_LINE('Updates on today are not allowed.');
    RAISE_APPLICATION_ERROR(-20002, 'Updates to the employees table are not allowed today.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Updating');
  END IF;
END;
/


SELECT * FROM EMPLOYEES;
SELECT * FROM user_triggers WHERE TABLE_name = 'EMPLOYEES';

DROP TRIGGER TRG_RESTRICT_DML;
DROP TRIGGER TRG_NO_UPDATE_ON_SUNDAY;




	
	



