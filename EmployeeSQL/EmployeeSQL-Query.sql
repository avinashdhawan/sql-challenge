-- Drop table if exists
DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE titles;

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" INT   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "from_date" DATE   NOT NULL,
    "to_date" DATE   NOT NULL
);

CREATE TABLE "junction_table" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no_dept_no" FOREIGN KEY("emp_no", "dept_no")
REFERENCES "junction_table" ("emp_no", "dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no_emp_no" FOREIGN KEY("dept_no", "emp_no")
REFERENCES "junction_table" ("dept_no", "emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "junction_table" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "junction_table" ("emp_no");

ALTER TABLE "junction_table" ADD CONSTRAINT "fk_junction_table_dept_no" FOREIGN KEY("dept_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "junction_table" ADD CONSTRAINT "fk_junction_table_emp_no" FOREIGN KEY("emp_no")
REFERENCES "departments" ("dept_no");

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

