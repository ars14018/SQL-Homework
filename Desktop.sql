--List the following details of each employee:employee number, 
--last name, first name, sex, and salary

SELECT employees.emp_no, employees.last_name, employees.first_name,employees.sex,salaries.salary
from employees
inner join salaries 
on employees.emp_no = salaries.emp_no
order by last_name

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
from employees
WHERE extract(year from hire_date) = 1986
order by last_name

--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT departments.dept_no,departments.dept_name,department_manager.emp_no,employees.last_name,employees.first_name
from departments 
inner join department_manager
on departments.dept_no = department_manager.dept_no
inner join employees
on department_manager.emp_no = employees.emp_no
order by last_name

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT department_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from departments 
inner join department_manager on departments.dept_no = department_manager.dept_no
inner join employees on department_manager.emp_no = employees.emp_no


--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
from employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'D%'
order by last_name

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT department_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_emp
INNER JOIN employees ON department_emp.emp_no = employees.emp_no
INNER JOIN departments ON department_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
order by last_name

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT department_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM department_emp
INNER JOIN employees ON department_emp.emp_no = employees.emp_no
INNER JOIN departments ON department_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
or departments.dept_name = 'Development'
order by last_name


--In descending order, list the frequency count of employee last names, i.e., how many employees share each 
--last name.
SELECT last_name, count(*) AS CNT
from employees
group by last_name
having count (last_name) >1
order by last_name DESC





