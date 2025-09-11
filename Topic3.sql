show databases;
use customers;
select*from person;
#index syntax
create index index_city_name on person(city_name);
desc person;
drop table student;
create table student(
id int not null,
first_name varchar(25),
last_name varchar(25),
age int
);
desc student;
create index index_age on student(age);

create index index_age_first_age on student(age,first_name);
alter table student drop index index_age_first_age;
#Views
drop table student;
create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(studentid)
);
insert into student values (1,'Hanan','H',19);
insert into student values (2,'JJ','Olatunji',30),
(3,'Harry','Lewis',28);

create table department(
student_id int auto_increment,
department_name varchar(25) not null,
foreign key (student_id) references student(studentid)
);
desc department;

insert into department values (1,'comp sci'),
(2,'electronics'),
(3,'mechanical');

select*from department;
select*from student;
alter table student change studentid student_id int not null auto_increment;
create view student_info as
select first_name,last_name,age from student inner join department
using(student_id);

select * from student_info;
drop view student_info;