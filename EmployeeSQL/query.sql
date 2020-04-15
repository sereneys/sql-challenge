---1. List the following details of each employee:
---employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
JOIN salaries
	ON employees.emp_no = salaries.emp_no
ORDER BY employees.emp_no;
	
---2. List employees who were hired in 1986---
SELECT * 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: 
---department number, department name, the manager's employee number, 
---last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, 
	last_name, first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
JOIN employees
	ON dept_manager.emp_no = employees.emp_no
JOIN departments
	ON dept_manager.dept_no = departments.dept_no;

---4. List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
CREATE VIEW employee_department AS
SELECT employees.emp_no, last_name, first_name, departments.dept_name
FROM employees
JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no
JOIN departments
	ON dept_emp.dept_no = departments.dept_no;

SELECT * FROM employee_department;

---5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

---6. List all employees in the Sales department, 
---including their employee number, last name, first name, and department name.
SELECT *
FROM employee_department
WHERE dept_name = 'Sales';

---7. List all employees in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.
SELECT *
FROM employee_department
WHERE dept_name = 'Sales'
	OR dept_name = 'Development';

---8. In descending order, list the frequency count of employee last names, 
---i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS count_of_LN
FROM employees
GROUP BY last_name
ORDER BY count_of_LN DESC;

