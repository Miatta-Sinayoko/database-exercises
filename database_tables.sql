<<<<<<< HEAD
-- 3. List all the databases
SHOW DATABASES; 

-- 4. Write the SQL code necessary to use the albums_db database
USE albums_db;

# 5. Show the currently selected database
SELECT DATABASE();

-- 6. List all tables in the database
SHOW TABLES; 

# 7. Write the SQL code to switch the employees database
USE employees;

# 8. Show the currently selected database
SELECT DATABASE();

# 9. List all the tables in the database
SHOW TABLES;

# 10. Explore the employees table. What different data types are present on this table?
-- Which table(s) do you think contain a numeric type column?

USE employees;
SHOW CREATE TABLE employees;

-- Can also use:
DESCRIBE employees;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE table_schema = 'employees'
	AND table_name = 'employees';

-- 'emp_no','int'
-- 'birth_date','date'
-- 'first_name','varchar'
-- 'last_name','varchar'
-- 'gender','enum'
-- 'hire_date','date'

# 11. Which table(s) do you think contain a numeric type column? 
-- (Write this question and your answer in a comment)

/* These table has numeric datatypes:
'departments'
'dept_emp'
'dept_manager'
'employees'
'salaries'
'titles'

*/

# 12. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
    
/*
These table has numeric datatypes:
departments
dept_emp
dept_manager
employees
titles
*/

# 13. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
/*
These table has numeric datatypes:
dept_emp
dept_manager
employees
salaries
titles
*/

# 14. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- No direct relationship

# Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;

/*
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/
=======

>>>>>>> be7c52622e15910c884c693c3f51906541d12aed
