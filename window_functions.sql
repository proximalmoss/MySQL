show databases;
use customers;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

INSERT INTO employee (emp_id, emp_name, dept_name, salary) VALUES
(1, 'Alice Johnson', 'HR', 50000),
(2, 'Bob Smith', 'Finance', 60000),
(3, 'Charlie Brown', 'IT', 70000),
(4, 'Diana Prince', 'Marketing', 55000),
(5, 'Ethan Hunt', 'Operations', 65000),
(6, 'Fiona Davis', 'HR', 48000),
(7, 'George Clark', 'Finance', 72000),
(8, 'Hannah Lee', 'IT', 80000),
(9, 'Ian Wright', 'Operations', 53000),
(10, 'Julia Roberts', 'Marketing', 58000);

select*from employee;
select max(salary) as max_salary from employee;
select max(salary) as max_salary from employee group by dept_name;
#if we want max salary dept wise but we also want to display other details from the employee table
select e.*, max(salary) over() as max_salary from employee e; #gives overall max salary
#now if we want the max salary from each dept to be displayed
select e.*, max(salary) over(partition by dept_name) as max_salary from employee e;
#here any of the aggregate functions can be used instead of max

#row_number, rank, dense_rank, lead and lag
select e.*, row_number() over() as rn from employee e;
#if we want the row number to be displayed based on department name
select e.*, row_number() over (partition by dept_name) as rn from employee e;
#fetch first 2 employees from each dept who join the company
select * from (
select e.*, row_number() over (partition by dept_name order by emp_id) as rn from employee e) x
where x.rn<3;

#rank()
#fetch the top 1 employee in each department earning the max salary
select * from
(select e.*,
rank() over (partition by dept_name order by salary desc) as rnk
from employee e) x
where x.rnk=1;

#dense_rank()
select e.*, rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over (partition by dept_name order by salary desc) as dense_rnk
from employee e;

#lead() and lag()
#fetch a query to display if the salary of an employee is higher, lower or equal to the previous employee
select e.*, lag(salary) over (partition by dept_name order by emp_id) as prev_emp_salary
from employee e; #gives the salary of previous record in each dept
select e.*, lag(salary) over (partition by dept_name order by emp_id) as prev_emp_salary,
case when e.salary>lag(salary) over(partition by dept_name order by emp_id) then "Higher"
when e.salary<lag(salary) over(partition by dept_name order by emp_id) then "Lower"
when e.salary=lag(salary) over(partition by dept_name order by emp_id) then "Equal"
end sal_range
from employee e;
#aggregate
select emp_name,dept_name,salary,sum(salary) over(partition by dept_name order by salary) as running_total_salary
from employee;
#ntile()
#divides dept employees into 2 buckets (top or bottom half by salary)
select emp_name, dept_name, salary, ntile(2) over (partition by dept_name order by salary desc) as salary_bucket
from employee; #higher 1 and lower 2
#first_value()/last_value()
#gives first and last salary in the dept
select emp_name, dept_name, salary,
first_value(salary) over (partition by dept_name order by salary desc) as highest_salary
from employee;
select emp_name, dept_name, salary,
last_value(salary) over (partition by dept_name order by salary desc rows between unbounded preceding and unbounded following) as lowest_salary
from employee;
#cume_dist()/percent_rank()
#relative position in dept by salary
select emp_name, dept_name, salary,
cume_dist() over(partition by dept_name order by salary desc) as row1,
percent_rank() over (partition by dept_name order by salary desc) as row2
from employee;