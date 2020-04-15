---Drop tables if already exist---
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS titel;
DROP TABLE IF EXISTS salaries;

---Create following tables---
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name  VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR,
	hire_date DATE
);

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR
);

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no),
	from_date DATE,
	to_date DATE
);

CREATE TABLE dept_emp (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no),
	from_date DATE,
	to_date DATE
);

CREATE TABLE titles (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR,
	from_date DATE, 
	PRIMARY KEY (emp_no, title, from_date),
	to_date DATE
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT,
	from_date DATE,
	to_date DATE
);
	