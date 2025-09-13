#creating databse 
create database company;
use company;
#creating table
create table Employee (
empid int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department_name varchar(25)
);
insert into Employee (first_name,last_name,salary, joining_date, department_name) values
('Hanan','Hidayath',50000,'2011-12-14 09:00:00','Development'),
('Sudhanshu','Kumar',60000,'2011-12-12 11:00:00','Development'),
('Sanket','Kumar',30000,'2011-12-10 09:00:00','HR'),
('Darius','Bengali',50000,'2011-11-11 09:00:00','Accountant'),
('Satish','Bhansal',40000,'2011-10-17 09:00:00','HR'),
('Shaktiman','Kapoor',70000,'2011-10-17 09:00:00','Accountant');
select*from Employee;
delete from Employee where empid between 7 and 18;
create table bonus(
emp_ref_id int,
bonus_amt int,
bonus_date datetime,
foreign key(emp_ref_id) references Employee(empid)
on Delete cascade
);
insert into bonus (emp_ref_id, bonus_amt, bonus_date) values
(1,3000,'2016-12-15'),
(2,5000,'2017-03-14'),
(3,4000,'2016-12-15'),
(1,3000,'2018-12-19'),
(4,7000,'2016-03-21'),
(5,5000,'2020-12-15'),
(1,10000,'2018-12-20'),
(2,85000,'2017-12-21');
select * from bonus;
create table designation(
emp_ref_id int,
designation varchar(25),
designation_date datetime,
foreign key(emp_ref_id) references Employee(empid)
);
insert into designation (emp_ref_id,designation,designation_date) values
(1,'Manager','2016-05-15'),
(2,'Executive','2017-12-20'),
(3,'Executive','2017-05-17');
select*from designation;

#QUESTIONS
#sql query to retreive all details where first name from employee table which starts with 'H'
select * from Employee where first_name like "H%";
#sql query to print all details of the employees whose salary between 10000 35000 fetch employee name
select * from Employee where salary between 10000 and 35000;
#(inner query-what if first name and last name needs to be combined)
select concat(first_name,' ',last_name) as employee_name,salary from Employee where empid in
(select empid from Employee where salary between 10000 and 55000);
#sql query to retreive details of the employees who have joined ona specific date
#dec 2014
select * from Employee where year(joining_date)=2014 and month(joining_date)=12;
#sql query to fetch number of employees in every department
select count(*),department_name from Employee group by department_name;
#sql query to print details of employee who are also executives
select Employee.first_name from Employee
inner join
designation #table
on Employee.empid=designation.emp_ref_id
and designation.designation='Executive'; #in ('Executive')
#sql query to clone a new table from another table #only structure gets cloned
create table clone_employee like Employee;
select * from clone_employee;
desc clone_employee;
#sql query to show top n salaries of employee
select * from Employee order by salary desc limit 4;
#sql query to determine the 4th highest salary
select salary from Employee order by salary desc limit 3,1;#n-1,1
#sql query to determine 6th highest salary without using limit
select salary from Employee e1 where 3=(select count(distinct salary) from
Employee e2 where e2.salary>e1.salary);
