-- PL/SQL Exception Handling

-- 1. Write a Pl/SQL program to implement - Exception-Divide by Zero
DECLARE
  numerator NUMBER := 10;
  denominator NUMBER := 0;
  result NUMBER;
BEGIN
  BEGIN
    result := numerator / denominator;
  EXCEPTION
    WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Error: Attempted to divide by zero.');
  END;
END;

-- 2. Write a Pl/SQL program to implement  - Invalid-Dept Exception
DECLARE
  dept VARCHAR2(20) := 'Engineering';
  invalid_dept EXCEPTION;
BEGIN
  IF dept NOT IN ('HR', 'IT', 'Finance') THEN
    RAISE invalid_dept;
  ELSE
    DBMS_OUTPUT.PUT_LINE('Valid Department: ' || dept);
  END IF;
EXCEPTION
  WHEN invalid_dept THEN
    DBMS_OUTPUT.PUT_LINE('Error: Invalid Department.');
END;

-- 3. Write a Pl/SQL program to find Best of 2 marks among 3 marks and calculate the average
DECLARE
  mark1 NUMBER := 85;
  mark2 NUMBER := 76;
  mark3 NUMBER := 92;
  lowest_mark NUMBER;
  total NUMBER;
  average NUMBER;
BEGIN
  -- find the lowest mark
  IF mark1 < mark2 AND mark1 < mark3 THEN
    lowest_mark := mark1;
  ELSIF mark2 < mark1 AND mark2 < mark3 THEN
    lowest_mark := mark2;
  ELSE
    lowest_mark := mark3;
  END IF;

  -- calculate total of the best two marks
  total := mark1 + mark2 + mark3 - lowest_mark;

  -- calculate average of the best two marks
  average := total / 2;

  DBMS_OUTPUT.PUT_LINE('Average of the best two marks: ' || average);
END;

