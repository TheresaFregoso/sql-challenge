--Checking tables loaded properly
select * 
from employees;

select * 
from titles;

select *
FROM salaries;

select * 
from "Dept_manager";

select *
FROM "Dept_emp";

select * 
FROM "Departments";

-----------------Begin Data Analysis-----------
--List the employee number, last name, first name, sex, and salary of each employee.
CREATE VIEW emp_salaries AS
SELECT e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;

SELECT * 
FROM emp_salaries;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
CREATE VIEW manager_info AS
SELECT dm.dept_no,
	dm.emp_no,
	d.dept_name,
	e.last_name,
	e.first_name
FROM "Dept_manager" as dm
INNER JOIN "Departments" as d on
dm.dept_no = d.dept_no
INNER JOIN "employees" as e ON
dm.emp_no = e.emp_no;

SELECT *
FROM manager_info;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
create view	dept_emp_info AS
Select	de.depth_no,
	de.emp_no, 
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Dept_emp" as de
INNER JOIN "employees" AS e
ON e.emp_no = de.emp_no
INNER JOIN "Departments" AS d
ON d.dept_no = de.depth_no;

SELECT *
FROM dept_emp_info;
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name,
	e.last_name,
	e.sex
FROM employees e
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT dei.emp_no,
	dei.last_name,
	dei.first_name
FROM dept_emp_info as dei where dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dei.emp_no,
	dei.last_name,
	dei.first_name,
	dei.dept_name
FROM dept_emp_info as dei where dept_name = 'Sales' or dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT e.last_name,
	COUNT(e.last_name) as frequency
FROM employees as e
GROUP BY e.last_name
ORDER BY frequency DESC;