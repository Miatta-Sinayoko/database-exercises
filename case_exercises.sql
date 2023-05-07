USE farmers_market;
-- CASE statements and the IF() function are used to return a value when a condition is true.
--  this  executes code when it's true, they serve a different purpose than the use cases.


SELECT *
	CASE booth_type
		WHEN 'Standard' THEN 1
		ELSE 0
     END AS is_standard
   FROM booth;
   
   SELECT *
   FROM product_category;
  USE employees;
  DESCRIBE employees;
  SHOW CREATE TABLE hire_date;
  
   
-- 1.
SELECT
    emp_no,
    department,
    hire_date,
    end_date,
    IF(e.end_date IS NULL OR e.end_date > CURRENT_DATE, 1, 0) AS is_current_employee
FROM employees ;

 SELECT
  emp_no,dept_no,hire_date,to_date,
  CASE WHEN to_date < NOW() THEN 0 ELSE 1 END AS
FROM employees;

DESCRIBE dept_emp;
SHOW CREATE TABLE dept_emp;
   SELECT
  emp_no,
  dept_no,
  hire_date,
  to_date,
  CASE WHEN to_date < NOW() THEN 0 ELSE 1 
FROM employees;







- SELECT *
-- FROM employees
-- WHERE last_name like 'e%e'
-- GROUP BY last_name;


