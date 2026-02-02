create database ab;
use ab;
create table Student1(
RollNo int primary key,
Department varchar(100),
Name varchar(100),
DOB date
);
insert into Student1(RollNo,Department,Name,DOB)
values
(1,'CSE','Raj','2005-02-02'),
(2,'AIML','Ram','2005-08-12'),
(3,'ECE','Vikram','2007-02-11'),
(4,'CSBS','Jithin','2006-09-13'),
(5,'IT','Jeffrin','2006-10-10');
create table instructor1(
InstructorId int primary key,
InstructorName varchar(100),
Department varchar(100)
);
insert into instructor1(InstructorId,InstructorName,Department)
values
(101,'Rajesh','CSE'),
(102,'Rahuk','IT'),
(103,'Vyom','AIML');
create table course(
CourseId int primary key,
Title varchar(100),
Credit int,
InstructorId int
);
insert into course(CourseId,Title,Credit,InstructorId)
values
(200,'Database Management System',4,101),
(201,'Software Engineering',3,102),
(202,'Maths',4,103);
create table Enrollment(
Rollno int,
CourseId int,
Grade char(2)
);
insert into Enrollment(RollNo,CourseId,Grade)
values
(1,200,'A'),
(2,201,'B'),
(3,202,'A');
select RollNo,Name from student1 where Department='CSE'
union 
select RollNo,Name from student1 where Department='IT';

select Department from student1
union all
select Department from instructor1;

select Department from student1 
intersect 
select Department from instructor1;

select Department from student1
except
select Department from instructor1;

select Title from course C
where(select count(*) from Enrollment E where E.CourseID=C.CourseId)>2;

select Title,Credit from course
where Credit=(select max(Credit) from course);

select S.Name,C.Title from student1 S
Join enrollment E on S.RollNo=E.RollNo
Join course C on E.CourseId=C.CourseId;

select S.Name,C.Title from student1 S
Left Join enrollment E on S.RollNo=E.RollNo
Left Join course C on E.CourseId=C.CourseId;

select S.Name,C.Title from student1 S
Right Join enrollment E on S.RollNo=E.RollNo
Right Join course C on E.CourseId=C.CourseId;

SELECT S.Name, C.Title
FROM student1 S
LEFT JOIN enrollment E ON S.RollNo = E.RollNo
LEFT JOIN course C ON E.CourseId = C.CourseId

UNION

SELECT S.Name, C.Title
FROM student1 S
RIGHT JOIN enrollment E ON S.RollNo = E.RollNo
RIGHT JOIN course C ON E.CourseId = C.CourseId;
