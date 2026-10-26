-- case study 2

create table location1(
location_id int primary key,
city varchar(10) );

insert into location1 values
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

select * from location1

create table department(
department_id int primary key,
Name varchar(20),
Location_id int
)

insert into department values
(10, 'Accounting', 122),
(20, 'Sales', 123),
(30, 'Research', 124),
(40, 'Operations', 167)

create table Job(
Job_id int primary key,
Designation varchar(15))

insert into Job values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President')

create table employee(
Employee_id int,
Last_name varchar(10),
First_name varchar(10),
Middle_name char(1),
Job_id int ,
Hire_date date,
Salary numeric,
comm int,
Department_id int);

insert into employee values
(7369,'SMITH','JOHN','Q',667,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,'22-FEB-85',1250,500,30)
 
-- Simple Queries:
-- 1. List all the employee details.
select * from employee

-- 2. List all the department details.
select * from department

-- 3. List all job details.
select * from Job

-- 4. List all the locations.
select * from location1

-- 5. List out the First Name, Last Name, Salary, Commission for all Employees.
select first_name, Last_name, Salary, Comm from employee;

-- 6. List out the Employee ID, Last Name, Department ID for all employees and alias
     -- Employee ID as "ID of the Employee", Last Name as "Name of the
     -- Employee", Department ID as "Dep_id".
select Employee_id as ID_of_the_Employee, Last_name as Name_of_the_Employee, Department_id as Dept_id from employee

-- 7. List out the annual salary of the employees with their names only.
select first_name, salary as annual_salary from employee

-- WHERE Condition:
-- 1. List the details about "Smith".
select * from employee where Last_name = 'Smith'

-- 2. List out the employees who are working in department 20.
select * from employee where Department_id = 20

-- 3. List out the employees who are earning salary between 2000 and 3000.
select * from employee where Salary between 2000 and 3000

-- 4. List out the employees who are working in department 10 or 20.
select * from employee where Department_id in(10, 20)

-- 5. Find out the employees who are not working in department 10 or 30.
select * from employee where Department_id not in(10, 30)

-- 6. List out the employees whose name starts with 'L'.
select * from employee where First_name like 'L%'

-- 7. List out the employees whose name starts with 'L' and ends with 'E'.
select * from employee where First_name like 'L%E'

-- 8. List out the employees whose name length is 4 and start with 'J'.
select len(First_name) as lenght, First_name from employee where First_name like 'J%'
-- 9. List out the employees who are working in department 30 and draw the
-- salaries more than 2500.
select * from employee where Salary > 2500 and Department_id = 30 

-- 10. List out the employees who are not receiving commission.
select * from employee where comm is null

-- ORDER BY Clause:
-- 1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
select employee_id, Last_name from employee
order by Employee_id asc

-- 2. List out the Employee ID and Name in descending order based on salary.
select Employee_id, First_name, Salary from employee
order by Salary

-- 3. List out the employee details according to their Last Name in ascending-order.
select * from employee 
order by Last_name asc

-- 4. List out the employee details according to their Last Name in ascending
-- order and then Department ID in descending order.
select * from employee 
order by Last_name asc
select * from employee 
order by department_id desc

-- GROUP BY and HAVING Clause:
-- 1. List out the department wise maximum salary, minimum salary and
-- average salary of the employees.
select department_id,
Max(salary) as max_sal, 
min(salary) as MIn_sal, 
avg(salary) as avg_sal 
from employee 
group by Department_id
having Department_id = 20

-- 2. List out the job wise maximum salary, minimum salary and average
-- salary of the employees.
select job_id, 
Max(salary) as max_sal, 
min(salary) as MIn_sal, 
avg(salary) as avg_sal 
from employee 
group by Job_id
having job_id = 667

-- 3. List out the number of employees who joined each month in ascending order.
select * from employee
order by Hire_date asc

-- 4. List out the number of employees for each month and year in
-- ascending order based on the year and month.
select * from employee 
order by Hire_date

select *, 
datepart(year, hire_date) as yr,
datepart(month, hire_date) as mon from employee
order by yr

select *, 
datepart(year, hire_date) as yr,
datepart(month, hire_date) as mon from employee
order by mon

-- 5. List out the Department ID having at least four employees.
select department_id, count(department_id) as cnt from employee 
group by Department_id
having count(department_id) = 4

-- 6. How many employees joined in February month.
select *,
datepart(month, hire_date) as mon from employee where datepart(month, hire_date) = 2

-- 8. How many employees joined in 1985?
select *, DATEPART(year, hire_date) as yr from employee where DATEPART(year, hire_date) = 1985

-- 9. How many employees joined each month in 1985?
select *, DATEPART(year, hire_date) as yr, datepart(month, hire_date) as mon from employee where DATEPART(year, hire_date) = 1985

-- 7. How many employees joined in May or June month.
select *, datename(month, Hire_date) as mon 
from employee where datename(month, Hire_date) in ('may' , 'june')

-- 10. How many employees were joined in April 1985?
select *, datename(year, hire_date) as yr, datename(month, hire_date) as mon from employee
where datename(year, hire_date) = 1985 and datename(month, hire_date) = 'april'

-- 11. Which is the Department ID having greater than or equal to 3 employees
-- joining in April 1985?
select department_id, Hire_date, count(department_id) as cnt_dept from employee 
group by department_id,  Hire_date
having count(department_id) >= 3

-- Joins:
-- 1. List out employees with their department names.
select * from employee as e join department as d
on e.Department_id = d.department_id

-- 2. Display employees with their designations.
select * from employee as e join job as j 
on e.Job_id = j.Job_id

-- 3. Display the employees with their department names and city.
select * from employee as e inner join department as d
on e.Department_id = d.department_id 
inner join location1 as l 
on l.location_id = d.Location_id

-- 4. How many employees are working in different departments? Display with department names.
select d.name,d.department_id, count(e.first_name) as cnt_dept from employee as e join department as d
on e.Department_id = d.department_id
group by e.first_name, d.Name, d.department_id

-- 5. How many employees are working in the sales department?
select d.Name, count(d.Name) as cnt from employee as e join department as d
on d.department_id = e.Department_id
group by d.Name
having Name = 'sales'

-- 6. Which is the department having greater than or equal to 3
-- employees and display the department names in ascending order.
select d.name, count(e.Department_id) as cnt_dept from employee as e join department as d 
on e.Department_id = d.department_id
group by d.name
having count(e.Department_id) >= 3
order by cnt_dept asc

-- 7. How many employees are working in 'Dallas'?
select * from employee as e join department as d on e.Department_id = d.department_id 
join location1 as l on l.location_id = d.Location_id
where l.city = 'dallas'

-- 8. Display all employees in sales or operation departments.
select * from employee as e join department as d 
on e.Department_id = d.department_id
where d.Name ='sales' or d.name = 'operation'

-- CONDITIONAL STATEMENT
-- 1. Display the employee details with salary grades. Use conditional statement to
-- create a grade column.
select First_name, Salary ,
   case
    when salary > 2500 then 'Grade A'
    when salary > 2000 then 'Grade B'
    else 'Grade C'
    end as salary_grade
  from employee

-- 2. List out the number of employees grade wise. Use conditional statement to
-- create a grade column.
select First_name, Salary , salary_grade, count(first_name) as cnt 
from (select first_name, salary, 
case
    when salary > 2500 then 'Grade A'
    when salary > 2000 then 'Grade B'
    else 'Grade C'
   end as salary_grade
from employee
) as emp_with_grade
group by first_name, salary_grade, Salary;

-- 3. Display the employee salary grades and the number of employees between
-- 2000 to 5000 range of salary.
select 
case
    when salary > 2500 then 'Grade A'
    when salary > 2000 then 'Grade B'
    else 'Grade C'
    end as salary_grade, count(*) as cnt_emp_range
    from employee 
    where salary between 2000 and 5000 
group by 
    case 
    when salary > 2500 then 'Grade A'
    when salary > 2000 then 'Grade B'
    else 'Grade C' 
end;
