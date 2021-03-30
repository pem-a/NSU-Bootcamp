-- Select all the employees who were born between January 1, 1952 and December 31, 1955 and their titles and title date ranges
-- Order the results by emp_no

with employees as (select * 
		from employees 
		where to_char(birth_date, 'YYYY-MM-DD') between '1952-01-01' and '1955-12-31')
select employees.emp_no, 
		employees.first_name,
		employees.last_name,
		employees.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from employees join titles on employees.emp_no=titles.emp_no
		order by emp_no;
        
-- Select only the current title for each employee
with employees_query as (
with employees as (select * from employees 
where to_char(birth_date, 'YYYY-MM-DD') between '1952-01-01' and '1955-12-31')
	
select employees.emp_no, 
		employees.first_name,
		employees.last_name,
		employees.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from employees join titles 
		on employees.emp_no=titles.emp_no
		order by emp_no),
		
current_employee as (
select emp_no, max(from_date) as most_recent 
	from titles group by emp_no)

select 
	employees_query.emp_no, 
	employees_query.first_name, 
	employees_query.last_name, 
	employees_query.title as current_title 
from employees_query join current_employee on ((employees_query.emp_no=current_employee.emp_no) 
and (employees_query.from_date=current_employee.most_recent));

-- Count the total number of employees about to retire by their current job title
with recent_title as (
with employees_query as (
with employees as (select * from employees 
where to_char(birth_date, 'YYYY-MM-DD') between '1952-01-01' and '1955-12-31')
	
select employees.emp_no, 
		employees.first_name,
		employees.last_name,
		employees.birth_date,
		titles.title,
		titles.from_date,
		titles.to_date
		from employees join titles 
		on employees.emp_no=titles.emp_no
		order by emp_no),
		
current_employee as (
select emp_no, max(from_date) as most_recent 
	from titles group by emp_no)

select 
	employees_query.emp_no, 
	employees_query.first_name, 
	employees_query.last_name, 
	employees_query.title as current_title 
	from employees_query join current_employee on ((employees_query.emp_no=current_employee.emp_no) 
	and (employees_query.from_date=current_employee.most_recent)))
select current_title, count (*) as emp_count 
	from recent_title group by current_title;

-- Count the total number of employees per department
with count_by_department as(
select dept_no, count(emp_no) as emp_count 
	from dept_emp 
	group by dept_no )
select dept_name, count_by_department.emp_count 
	from departments join count_by_department on (departments.dept_no=count_by_department.dept_no);

-- Bonus: Find the highest salary per department and department manager

with recent_salaries as (
with current_emp_date as(
with current_emp as (select emp_no, max(from_date) as from_date from dept_emp group by emp_no)
select current_emp.emp_no, 
		current_emp.from_date, 
		dept_emp.dept_no
		from current_emp join dept_emp 
		on current_emp.emp_no=dept_emp.emp_no
		and dept_emp.from_date=current_emp.from_date)
select current_emp_date.emp_no,
		current_emp_date.dept_no,
		salaries.salary
		from current_emp_date join salaries
		on current_emp_date.emp_no=salaries.emp_no
		and current_emp_date.from_date=salaries.from_date
		order by emp_no)
select dept_no, 
		max(salary) as highest_salary from
		recent_salaries
		group by dept_no
		order by dept_no 