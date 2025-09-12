use customers;
select @record as Totalrecords;
call get_student_info(@record,30);
call get_student_info(30);
get_student_info(30);
select*from student;
select student.first_name, student.last_name, department.department_name
from student natural join department;
select student.first_name, student.last_name, department.department_name
from student cross join department;
select student.first_name, student.last_name, department.department_name
from student left join department on 
student.student_id=department.student_id
union
select student.first_name, student.last_name, department.department_name
from student right join department on 
student.student_id=department.student_id;
select student.first_name, student.last_name, department.department_name
from student right join department on 
student.student_id=department.student_id;
select student.first_name, student.last_name, department.department_name
from student left join department on 
student.student_id=department.student_id;
select student.first_name, student.last_name, department.department_name
from student inner join department on 
student.student_id=department.student_id;
select * from department;
select student.first_name, student.last_name, department.department_name
from student inner join department on 
student.student_id=departmen.student_id;
select * from department;
select * from student;
insert into student values (4,'Ethan','Payne',30),
(5,'George','Clarky',25);
select * from student;
select * from department;
select * from student;
use customers;
use customer;
