CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no varchar(255) NOT NULL
);

DROP TABLE dept_emp

SELECT * FROM dept_emp

copy dept_emp(emp_no, dept_no)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_dept_emp.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE departments (
	dept_no varchar(255) NOT NULL,
	dept_name varchar(255) NOT NULL
);
DROP TABLE departments

SELECT * FROM departments

copy departments(dept_no, dept_name)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_departments.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE dept_manager (
    dept_no varchar(255) NOT NULL,
    emp_no integer NOT NULL
);

DROP TABLE dept_manager

SELECT * FROM dept_manager

copy dept_manager(dept_no, emp_no)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_dept_manager.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);

DROP TABLE salaries

SELECT * FROM salaries

copy salaries(emp_no, salary)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_salaries.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title_id varchar(255) NOT NULL,
	birth_date date NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    sex varchar(255) NOT NULL,
    hire_date date NOT NULL
);

DROP TABLE employees

SELECT * FROM employees

copy employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_employees.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE titles (
    title_id varchar(255) NOT NULL,
    title varchar(255) NOT NULL
);

DROP TABLE titles

SELECT * FROM titles

copy titles(title_id, title)
FROM 'C:\Users\agust\Downloads\02-Homework_09-SQL_Instructions_data_titles.csv'
DELIMITER ',' CSV HEADER;

--1
SELECT salaries.salary, employees.emp_no, employees.last_name, employees.first_name, employees.sex
FROM employees
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

--2
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' AND '1986-12-31';

--3
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees 
ON dept_emp.emp_no = employees.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no;

--5
--Can't believe there are twenty
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

--8
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;