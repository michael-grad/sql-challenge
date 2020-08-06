-- DEBUG QUERY 2 and QUERY 6

-- QUERY 1
-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

-- VERIFIED AS WORKING
select employees.emp_no, 
	employees.first_name, 
	employees.last_name, 
	employees.sex, 
	salaries.salary
	from employees
left join salaries
on employees.emp_no = salaries.emp_no;


-- QUERY 2
-- List first name, last name, and hire date 
-- for employees who were hired in 1986.

-- VERIFIED AS WORKING
-- extract sourced from 
-- https://stackoverflow.com/questions/25158185/how-to-use-mysql-extract-year-in-where-clause
select first_name, last_name, extract(year from hire_date) from employees
where extract(year from hire_date) = '1986';


-- QUERY 3
-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.

-- strategy
-- pull data from dept_manager
-- then join employees for first name and last name
-- then join departments for dept name

-- VERIFIED AS WORKING
select dept_manager.dept_no, 
	departments.dept_name,
	dept_manager.emp_no, 
	employees.first_name, 
	employees.last_name
	from dept_manager
left join employees
on dept_manager.emp_no = employees.emp_no
left join departments
on dept_manager.dept_no = departments.dept_no;


-- QUERY 4
-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

-- VERIFIED AS WORKING
select employees.emp_no, 
	employees.first_name, 
	employees.last_name,
	departments.dept_name
	from employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
left join departments
on dept_emp.dept_no = departments.dept_no;


-- QUERY 5
-- List first name, last name, and sex 
-- for employees whose first name is "Hercules" 
-- and last names begin with "B."

-- VERIFIED AS WORKING
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and left(last_name,1) = 'B';


-- QUERY 6
-- List all employees in the Sales department, 
-- including their employee number, last name, first name, 
-- and department name

-- VERIFIED AS WORKING
select departments.dept_name, employees.emp_no, 
	employees.first_name, employees.last_name
	from departments
left join dept_emp
on departments.dept_no = dept_emp.dept_no
left join employees
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales';


-- QUERY 7
-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name

-- VERIFIED AS WORKING
select departments.dept_name, 
	employees.emp_no, 
	employees.first_name, 
	employees.last_name
	from departments
left join dept_emp
on departments.dept_no = dept_emp.dept_no
left join employees
on dept_emp.emp_no = employees.emp_no
where dept_name = 'Sales' or dept_name = 'Development';


-- QUERY 8
-- In descending order, 
-- list the frequency count of employee last names, 
-- i.e., how many employees share each last name

-- VERIFIED AS WORKING
select count(last_name) as frequency, last_name
from employees
group by last_name
order by frequency desc;