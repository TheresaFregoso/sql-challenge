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
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
--List each employee in the Sales department, including their employee number, last name, and first name.
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).