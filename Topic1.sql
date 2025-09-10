# Session 1
/*
1. SQL Create Database
2. SQL Drop Databases
3. SQL Create Table
4. SQL Insert Into Table
5. SQL Drop Table
*/
show databases;
create database customers;
use customers;
#create table in database
create table customer_info
( id integer auto_increment, 
first_name varchar(25), 
last_name varchar(25), 
salary integer, primary key(id));
select * from customer_info;
insert into customer_info(first_name,last_name, salary)
values
('John','Doe',50000),
('Hanan','Hidayathulla',30000),
('JJ','Olatunji',100000),
('Harry', 'Wroetshaw', 70000),
('Yas','Marina',NULL);
select * from customer_info where salary is not null;
#sql update statement to replace the NULL value
update customer_info set salary=50000 where id=5;
select*from customer_info;
#SQL delete statement
delete from customer_info where id=5;
select*from customer_info;
#SQL alter table
alter table customer_info add email varchar(25);
select*from customer_info;
update customer_info set email='john@gmail.com' where id=1;
select*from customer_info;
update customer_info set email='jj@gmail.com' where id=2;
update customer_info set email='hanan@gmail.com' where id=3;
update customer_info set email='harry@gmail.com' where id=4;
select*from customer_info;
alter table customer_info add dob date;
#Alter table modify column
alter table customer_info modify dob year;
desc customer_info;
#alter table to drop columns
alter table customer_info drop column dob;
desc customer_info;