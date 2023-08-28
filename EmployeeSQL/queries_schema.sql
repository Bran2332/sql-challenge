
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT Employees.Emp_No, Employees.last_name, Employees.first_name, Employees.sex, Salaries.Salary
FROM Employees
INNER JOIN Salaries ON
Salaries.Emp_No=Employees.Emp_No;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, (hire_date)
FROM Employees 
WHERE extract(year from hire_date) = 1986
-- can also use where hire_date >= '1986-01-01' and
  --    hire_date < '1987-01-01'
  
--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT Employees.Emp_No, 
Employees.last_name, 
Employees.first_name, 
Depart_Managers.Dept_No,
Departments.Dept_Name
FROM Employees
INNER JOIN Depart_Managers ON
Employees.Emp_No = Depart_Managers.Emp_No
INNER JOIN Departments ON 
Depart_Managers.Dept_No = Departments.Dept_No

--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
CREATE VIEW emp_with_dept AS
SELECT Employees.Emp_No, 
Employees.last_name, 
Employees.first_name,
Depart_Employees.Dept_No,
Departments.Dept_Name
FROM Employees
INNER JOIN Depart_Employees ON
Employees.Emp_No = Depart_Employees.Emp_No
INNER JOIN Departments ON 
Depart_Employees.Dept_No = Departments.Dept_No

--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

--List each employee in the Sales department, 
--including their employee number, last name, and first name.

SELECT first_name,
last_name,
Emp_NO,
Dept_Name
FROM emp_with_dept
WHERE dept_name = 'Sales'

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

SELECT first_name,
last_name,
Emp_NO,
Dept_Name
FROM emp_with_dept
WHERE dept_name IN ('Sales', 'Development')

--List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name)
FROM Employees
GROUP BY last_name
Order BY COUNT(last_name) DESC;



