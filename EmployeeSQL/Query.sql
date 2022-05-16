-- Question 1) List the following details of each employee:
-- Employee Number
-- Last Name
-- First Name
-- Sex
-- Salary

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no;

-- Question 2) List First Name, Last Name and Hire Date for employees who were hired in 1986:

SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date>'1986-1-1'::date AND employees.hire_date<'1987-1-1'::date;

-- Question 3) List the Manager of each Department with the following information:
-- Department Number
-- Department Name
-- Manager's Employee Number
-- Last Name
-- First Name

Select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN employees
ON dept_manager.emp_no = employees.emp_no
JOIN departments
ON dept_manager.dept_no = departments.dept_no;

-- Question 4) List the department of each empolyee with the following information:
-- Employee Number
-- Last Name
-- First Name
-- Department Name

SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no;

-- Question 5) List First Name, Last Name, and Sex for employees whose:
-- First Name is "Hercules"
-- Last Name Begins with "B"

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- Question 6) List all employees in the Sales Department, including:
-- Employees Number
-- Last Name
-- First Name
-- Department Name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Question 7) List all employees in the Sales and Development departments, including:
-- Employees Number
-- Last Name
-- First Name
-- Department Name

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
ON employees.emp_no=dept_emp.emp_no
JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- Question 8) List the frequency count of employee last names
-- (i.e., how many employees share each last name) in descending order.

SELECT employees.last_name, Count (*)
FROM employees
GROUP BY employees.last_name
ORDER BY Count(*) DESC;