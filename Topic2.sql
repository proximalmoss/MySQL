use customers;

create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);
desc student;
alter table student modify age int not null;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
unique(id)
);
insert into person values (3,'Harry','Lewis',28);
select * from person;
alter table person add unique(first_name);
desc person;
#When you want a combination of records to be unique AKA multi-unique constraint
alter table person add constraint uc_person unique(age,first_name);
#dropping a unique constraint
alter table person drop index uc_person;
#Primary key
create table person1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25),
age int,
constraint pk_person primary key(id,last_name)
);
desc person1;
#dropping primary key
alter table person1 drop Primary key;
#adding primary key to only 1 column
alter table person1 add primary key(id);
drop table person;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);
desc person;
drop table person;
#adding primary key again
alter table person add primary key(id);
#foreign key
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25),
age int,
salary int,
primary key (id)
);
desc person;
show tables;
create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id),
constraint fk_persondepartment foreign key(id) references person(id)
);
desc department;
drop table department;
create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id)
);
alter table department add foreign key(id) references person(id);
#check constraints
drop table department;
drop table person;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25),
age int,
salary int,
primary key (id),
check (salary<50000)
);
desc person;
insert into person values (1,'Hanan','Hidayath',19,40000);
select*from person;
#default constraint
drop table person;
create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25),
city_name varchar(25) default 'Mumbai'
);
desc person;
alter table person alter city_name drop default;
/*
to drop check constraint you need to name your check
"constraint chk_age check(age>=20)"
then to drop
"alter table users drop check chk_age"
/*