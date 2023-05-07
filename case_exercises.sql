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
  
   

-- 1. Write a query that returns all employees, their department number,
-- hire date, end date, and a new column 
-- 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 
USE employees;
  SELECT emp_no, dept_no, from_date,to_date, 
    IF(to_date = '9999-01-01', 1, 0) AS is_current_employee
FROM 
    dept_emp;
    
    
-- 2.Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that 
-- returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT 
    CONCAT(first_name, ' ', last_name) AS employee_name,
    CASE 
        WHEN last_name LIKE 'A%' OR last_name LIKE 'B%' OR last_name LIKE 'C%' OR last_name LIKE 'D%' OR last_name LIKE 'E%' OR last_name LIKE 'F%' OR last_name LIKE 'G%' OR last_name LIKE 'H%' THEN 'A-H'
        WHEN last_name LIKE 'I%' OR last_name LIKE 'J%' OR last_name LIKE 'K%' OR last_name LIKE 'L%' OR last_name LIKE 'M%' OR last_name LIKE 'N%' OR last_name LIKE 'O%' OR last_name LIKE 'P%' OR last_name LIKE 'Q%' THEN 'I-Q'
        ELSE 'R-Z'
    END AS alpha_group
FROM 
    employees;
    
    -- 3. How many employees (current or previous) were born in each decade?
    
    SELECT 
    CONCAT(FLOOR(YEAR(birth_date)/10) * 10, '-', FLOOR(YEAR(birth_date)/10) * 10 + 9) AS decade,
    COUNT(*) AS num_employees
FROM 
    employees
GROUP BY 
    decade;
-- number of employees and decade 1950-1959 182886,  1960- 1969 117138

-- 4.What is the current average salary for each of the following department groups:
--  R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
    CASE 
        WHEN dept_name IN ('Development', 'Research') THEN 'R&D'
        WHEN dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
        WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
        WHEN dept_name = 'Finance' OR dept_name = 'Human Resources' THEN 'Finance & HR'
        ELSE 'Customer Service'
    END AS dept_group,
    AVG(salary) AS avg_salary
FROM 
    employees
JOIN 
    dept_emp USING(emp_no)
JOIN 
    departments USING(dept_no)
JOIN 
    salaries USING(emp_no)
WHERE 
    salaries.to_date = '9999-01-01'
GROUP BY 
    dept_group;
    
-- R&D,67718.5563, Sales & Marketing,86379.3407, Prod & QM,67315.3668, Finance & HR,71111.6674, Customer Service,66971.3536



