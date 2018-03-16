CREATE TABLE student(
  rollno numeric(5),
  name varchar(20),
  age numeric(2),
  mark1 numeric(2),
  mark2 numeric(2),
  mark3 numeric(2),
  total numeric(3),
  grade char(1)
);

select * from student;

insert into student(rollno,name,age,mark1,mark2,mark3) values(100,'shubham',21,78,87,97);
insert into student(rollno,name,age,mark1,mark2,mark3) values(200,'ashish',20,76,56,56);
insert into student(rollno,name,age,mark1,mark2,mark3) values(300,'yogi',19,78,87,65);
insert into student(rollno,name,age,mark1,mark2,mark3) values(400,'sachin',20,79,69,85);
insert into student(rollno,name,age,mark1,mark2,mark3) values(500,'harshad',19,67,96,78);

ALTER TABLE student ADD mobile numeric(10);

insert into student values(200,'singh',5848599898);

update student set mobile = 9089767876 where rollno = 100;


CREATE  TABLE dept(
  name varchar(200) primary key,
  hod varchar(200),
  description varchar(500)
);

insert into dept values('ME','ds singh','mechanical');
ALTER TABLE student ALTER COLUMN rollno numeric(5) primary key;
select * from student where total>200;
update student set total = mark1+mark2+mark3;
select name from student where mark1>70 and mark2>80;
select * from student where mark1>60 and mark2>60 and mark3>60 and total>250;
select * from student where mark1<60 or mark2<60 or mark3<60;
select * from student where total>200 and name like 'z%';
select * from student where total>200 and (name like 'z%' or name like 'Z%');
select name from student where total>100 and mark1>60 and name like 's%';

ALTER TABLE student add COLUMN dept_name varchar(20);
ALTER TABLE student drop COLUMN dept_name;
ALTER TABLE student modify COLUMN dept_name not null;

insert into student (dept_name) values('cs');
delete from student where dept_name = 'cs';
update student set dept_name = 'cs' where mark1>20;
update student set dept_name = 'ee' where mark1<70;
update student set dept_name = 'me' where mark2<60;

ALTER TABLE dept add constraint u_hod unique(hod);

select distinct dept_name from student;
select max(mark1) from student;
select min(mark1) from student;
select min(mark1) from student where mark1>70;
select avg(mark1) from student;
select sum(mark1) from student;
select count(mark1) from student;

update dept set description = 'mechanical' where name = 'ME';
update dept set name = 'me' where name = 'ME';

insert into dept values 
('a','AAA','dept of a'),
('b','BBB','dept of b'),
('c','CCC','dept of c');

delete from student where mark2<60;
begin;
delete from student where mark2<80;
rollback;

ALTER TABLE student 
add constraint fk_dept_name foreign key(dept_name)
references dept(name);

