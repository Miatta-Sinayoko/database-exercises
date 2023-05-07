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
 
 -- 1.Use the employees database
 USE employees;

-- 2.Using the example in the Associative Table Joins section as a guide, write a query that shows each department 
-- along with the name of the current manager for that department.
DESCRIBE employees;
SELECT * 
FROM employees;
SHOW CREATE TABLE departments;

-- CREATE TABLE `departments` (
--   `dept_no` char(4) NOT NULL,
--   `dept_name` varchar(40) NOT NULL,
--   PRIMARY KEY (`dept_no`),
--   UNIQUE KEY `dept_name` (`dept_name`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1


  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
  

SELECT dept_name AS 'Department Name'
CONCAT(e.first_name, ' ', e.last_name) AS dept_manager
FROM dept_manager AS dm
JOIN  departments AS d
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01';
  
  
-- 3.Find the name of all departments currently managed by women.



SELECT dept_name AS 'Depatment name'
CONCAT(e.first_name, ' ', e.last_name) AS dept_manager
FROM dept_manager AS dm
JOIN  departments AS d
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';




-- 3.Find the current titles of employees currently working in the Customer Service department.



SHOW CREATE TABLE dept_emp;

CREATE TABLE `departments` (
  `dept_no` char(4) NOT NULL,
  `dept_name` varchar(40) NOT NULL,
  PRIMARY KEY (`dept_no`),
  UNIQUE KEY `dept_name` (`dept_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

SELECT title,
COUNT(*) AS employees
FROM  dept_emp AS de
JOIN  titles AS t
  ON de.dept_no = t.dept_no
JOIN  AS t
  ON t.emp_no = m.emp_no
WHERE dm.from_date = '9999-01-01' AND e.gender =; 




-- 4.Find the current salary of all current managers.


Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393
Sales              | Hauke Zhang       | 101987

-- 5.Find the number of current employees in each department.


+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+

-- 6.Which department has the highest average salary? Hint: Use current not historic information.


+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+

-- 7.Who is the highest paid employee in the Marketing department?


+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+

-- 8.Which current department manager has the highest salary?


+------------+-----------+--------+-----------+
| first_name | last_name | salary | dept_name |
+------------+-----------+--------+-----------+
| Vishwani   | Minakawa  | 106491 | Marketing |
+------------+-----------+--------+-----------+

-- 9.Determine the average salary for each department. Use all salary information and round your results.


+--------------------+----------------+
| dept_name          | average_salary | 
+--------------------+----------------+
| Sales              | 80668          | 
+--------------------+----------------+
| Marketing          | 71913          |
+--------------------+----------------+
| Finance            | 70489          |
+--------------------+----------------+
| Research           | 59665          |
+--------------------+----------------+
| Production         | 59605          |
+--------------------+----------------+
| Development        | 59479          |
+--------------------+----------------+
| Customer Service   | 58770          |
+--------------------+----------------+
| Quality Management | 57251          |
+--------------------+----------------+
| Human Resources    | 55575          |
+--------------------+----------------+

-- 10.Bonus Find the names of all current employees, their department name, and their current manager's name.


240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 .....
 
-- SELECT DISTINCT customer_first_name
-- FROM customer
-- GROUP BY customer_first_name;










-- SELECT DISTINCT last_name
-- FROM employees
-- WHERE last_name like 'e%e'
-- GROUP BY last_name;
