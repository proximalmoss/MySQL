#JOINS
use customers;
select * from department;
select * from student;
#inner join
select student.first_name, student.last_name, department.department_name
from student inner join department on 
student.student_id=department.student_id;
#left join
select student.first_name, student.last_name, department.department_name
from student left join department on 
student.student_id=department.student_id;
#right join
select student.first_name, student.last_name, department.department_name
from student right join department on 
student.student_id=department.student_id;
#full outer join
select student.first_name, student.last_name, department.department_name
from student left join department on 
student.student_id=department.student_id
union
select student.first_name, student.last_name, department.department_name
from student right join department on 
student.student_id=department.student_id;
#cross join (gives all possible combinations)
select student.first_name, student.last_name, department.department_name
from student cross join department;
#natural join(gives table based on columns with same name or dtypes)
select student.first_name, student.last_name, department.department_name
from student natural join department;
#stored procedures
call get_student_info(30);
select @record as Totalrecords;
call get_student_info(@record,30);
