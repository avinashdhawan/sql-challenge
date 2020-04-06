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
CREATE VIEW hire_1986 AS
	SELECT first_name, last_name, hire_date
	FROM employees
	WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

SELECT
	*
FROM
	hire_1986

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
	
--List the department of each employee with the following information: employee number, last name, first name, and department name
  
  CREATE VIEW employee_dept_info_table AS
	SELECT employees.emp_no, last_name, first_name, dept_name
	FROM employees
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	

SELECT
	*
FROM
	employee_dept_info_table
	
--List all employees whose first name is "Hercules" and last names begin with "B."
CREATE VIEW employee_Hercules_B AS
	SELECT first_name, last_name
	FROM employees
	WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

SELECT
	*
FROM
	employee_Hercules_B
	
--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
  
  CREATE VIEW sales_dept_table AS
	SELECT employees.emp_no, last_name, first_name, dept_name
	FROM employees
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name LIKE 'Sales';

SELECT
	*
FROM
	sales_dept_table
	
--List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.

  CREATE VIEW sales_and_development_dept_table AS
	SELECT employees.emp_no, last_name, first_name, dept_name
	FROM employees
	INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
	INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
	WHERE dept_name LIKE 'Sales'
	OR dept_name LIKE 'Development';

SELECT
	*
FROM
	sales_and_development_dept_table
	
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW last_name_count AS
	SELECT last_name, COUNT(last_name) AS "last name count"
	FROM employees
	GROUP BY last_name
	ORDER BY "last name count" DESC;

SELECT
	*
FROM
	last_name_count