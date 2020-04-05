SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
CREATE VIEW employee_info_table AS
	SELECT employees.emp_no, last_name, first_name, gender, salary
	FROM employees
	INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

SELECT
	*
FROM
	employee_info_table

--List employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
CREATE VIEW manager_info_table AS
	SELECT dept_manager.dept_no, dept_name, dept_manager.emp_no, last_name, first_name, dept_emp.from_date, dept_emp.to_date
	FROM dept_manager
	INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
	INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
	INNER JOIN dept_emp ON dept_manager.emp_no = dept_emp.emp_no

SELECT
	*
FROM
	manager_info_table
  