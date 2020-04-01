-- Drop table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

-- Create new table
CREATE TABLE departments (
	dept_no		VARCHAR,
	dept_name 	VARCHAR
);

CREATE TABLE dept_emp (
	emp_no		INT,	
	dept_no		VARCHAR,
	from_date 	DATE,	
	to_date 	DATE

);

CREATE TABLE dept_manager (
	dept_no		VARCHAR,
	emp_no		INT,	
	from_date 	DATE,	
	to_date 	DATE

);

CREATE TABLE employees (
	emp_no      INT,
	birth_date	DATE,
	first_name	VARCHAR,
	last_name	VARCHAR,
	gender	    VARCHAR,
	hire_date   DATE
);

CREATE TABLE salaries (
	emp_no		INT,
	salary		INT,
	from_date	DATE,
	to_date		DATE

);

CREATE TABLE titles (
	emp_no		INT,
	title		VARCHAR,
	from_date	DATE,
	to_date 	DATE

);

-- View table columns and datatypes
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

