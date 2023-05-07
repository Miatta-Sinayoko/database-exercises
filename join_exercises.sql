USE farmers_market;

DESCRIBE vendor_booth_assignments;

SELECT *
FROM vendor_booth_assignments;

SHOW CREATE TABLE vendor_booth_assignments;

-- CREATE TABLE `vendor_booth_assignments` (
  -- `vendor_id` int NOT NULL,
--   `booth_number` int NOT NULL,
--   `market_date` date NOT NULL,
--   PRIMARY KEY (`vendor_id`,`booth_number`,`market_date`),
--   KEY `market_date_fk_idx` (`market_date`),
--   KEY `booth_number_fk_idx` (`booth_number`),
--   CONSTRAINT `booth_number_fk` FOREIGN KEY (`booth_number`) REFERENCES `booth` (`booth_number`) ON DELETE RESTRICT ON UPDATE RESTRICT,
--   CONSTRAINT `market_date_fk` FOREIGN KEY (`market_date`) REFERENCES `market_date_info` (`market_date`) ON DELETE RESTRICT ON UPDATE RESTRICT,
--   CONSTRAINT `vendor_id_fk` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci 
-- */
DESCRIBE vendor;

SHOW CREATE TABLE vendor;

SELECT *
 FROM vendor;
 
 SELECT *
 FROM vendor_booth_assignments;
 
 SELECT *
 FROM vendor_booth_assignments
 JOIN vendor ON vendor_booth_assignments.vendor_id = vendor.vendor_id;
 
 
 
 
 SELECT *
 FROM vendor_booth_assignments
 JOIN vendor ON vendor_booth_assignments.vendor_id = vendor.vendor_id
 JOIN booth ON booth.booth_number = vendor_booth_assignments.booth_number;
 
 DESCRIBE booth;
 
 SHOW CREATE TABLE booth;
 
 SELECT vendor.vendor_name,
	booth.booth_number,
	booth.booth_description,
FROM vendor_booth_assignments
JOIN vendor ON vendor_booth_assignments.vendor_id = vendor.vendor_id
JOIN booth ON booth.booth_number = vendor_booth_assignments.booth_number;

-- ALIAS

 SELECT vendor.vendor_name,
	booth.booth_number,
	booth.booth_description,
FROM vendor_booth_assignments AS vba
JOIN vendor AS v ON vba.vendor_id = v.vendor_id
JOIN booth ON b.booth_number = vba.booth_number;


 SELECT *
FROM vendor_inventory;

DESCRIBE vendor_inventory;

 -- EXERCISE
 
 -- 1. Use the join_example_db. Select all the records from both the users and roles tables.

USE join_example_db;
-- tables: roles and users

SELECT *
FROM roles;
-- two columns are  id and name

DESCRIBE roles;
-- primary key is id

SELECT *
FROM users;
-- columns are  id, name, email, role_id

DESCRIBE users;
-- primary key is id

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
-- There are null values from the right table in rows 5 and 6
SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
-- There are null values from the left table in row 5

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
-- Hint: You will also need to use group by in the query.

	
	SELECT roles.name, 
	(SELECT COUNT(*) 
	FROM users 
	WHERE users.role_id = roles.id) AS user_count
	FROM roles;

-- 1. Use the employees database.

USE employees;

-- 2. Using the example in the Associative Table Joins section as a guide
-- Write a query that shows each department along with the name of the current manager for that department.


SELECT dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
   JOIN dept_manager as dm ON d.dept_no = dm.dept_no
    JOIN employees AS e ON dm.emp_no = e.emp_no
WHERE to_date > NOW()
ORDER BY dept_name;

-- 3. Find the name of all departments currently managed by women.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Manager Name'
FROM departments AS d
    JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
    JOIN employees AS e ON dm.emp_no = e.emp_no
WHERE to_date > NOW() AND gender LIKE 'F'
ORDER BY dept_name;


-- 4. Find the current titles of employees currently working in the Customer Service department.


SELECT title AS Title, COUNT(*) AS Count
FROM departments AS d
    JOIN dept_emp AS de ON d.dept_no = de.dept_no
    JOIN employees AS e ON de.emp_no = e.emp_no
    JOIN titles AS t ON e.emp_no = t.emp_no
WHERE dept_name LIKE 'Customer Service' AND de.to_date > NOW() AND t.to_date > NOW()
GROUP BY title
ORDER by title;

-- 5. Find the current salary of all current managers.

SELECT dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Name', salary AS Salary
FROM departments
    JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
    JOIN employees ON dept_manager.emp_no = employees.emp_no
    JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date > NOW() AND salaries.to_date > NOW()
ORDER BY dept_name;

-- 6. Find the number of current employees in each department.

SELECT dept_emp.dept_no,dept_name, COUNT(*) AS num_employees
FROM dept_emp
    JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > NOW()
GROUP BY dept_emp.dept_no, dept_name
ORDER BY dept_no;
-- Marketingv14842, Finance 12437,Human Resources,12898,Production,53304,Development 61386, 
-- Quality Management 14546,Sales 37701, Research 15441, Customer Service 17569

-- 7. Which department has the highest average salary? Hint: Use current not historic information.

SELECT dept_name, AVG(salary) AS average_salary
FROM departments
    JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
    JOIN employees ON dept_emp.emp_no = employees.emp_no
    JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date > NOW() AND salaries.to_date > NOW()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Sales average salary is $88,853

-- 8. Who is the highest paid employee in the Marketing department?

SELECT first_name, last_name
FROM salaries
    JOIN employees ON salaries.emp_no = employees.emp_no
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
    JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name LIKE 'Marketing'
ORDER BY salary DESC
LIMIT 1;

-- Akemi Warwick

-- 9. Which current department manager has the highest salary?

SELECT first_name, last_name, salary, dept_name
FROM salaries
    JOIN employees ON salaries.emp_no = employees.emp_no
    JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
    JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > NOW() AND salaries.to_date > NOW()
ORDER BY salary DESC
LIMIT 1;

-- Vishwani Minakawa from Marketing salary is 106,491 

-- 10. Determine the average salary for each department. Use all salary information and round your results.

SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary
FROM departments d
    JOIN dept_emp de USING (dept_no)
    JOIN salaries s USING (emp_no)
GROUP BY d.dept_name
ORDER BY avg_dept_salary DESC;
-- Sales 80k , Marketing 72k


