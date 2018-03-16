CREATE SCHEMA step_example;



SET search_path to step_example;



-- DDL student

CREATE TABLE student(
roll_no	NUMERIC(5),
name		VARCHAR(100),
dept_code	CHAR(2),
subject1	NUMERIC(3),
subject2	NUMERIC(3),
subject3	NUMERIC(3)
);



-- Primary key

ALTER TABLE student
ADD CONSTRAINT st_pk_roll_no PRIMARY KEY (roll_no);

-- Other column constraints

ALTER TABLE student
ALTER COLUMN name SET NOT NULL;

-- Check constraints on vales in subject score columns

ALTER TABLE student
ADD CONSTRAINT ck_subject1 CHECK (subject1>=0 AND subject1<=100);

ALTER TABLE student
ADD CONSTRAINT ck_subject2 CHECK (subject2>=0 AND subject2<=100);

ALTER TABLE student
ADD CONSTRAINT ck_subject3 CHECK (subject3>=0 AND subject3<=100);



-- DDL department

CREATE TABLE department(
dept_code		CHAR(2) PRIMARY KEY,
dept_name		varchar(20) NOT NULL
);



-- Foreign Key columns for student table

ALTER TABLE student ADD CONSTRAINT st_dept_dept_code FOREIGN KEY (dept_code) REFERENCES department(dept_code);


--

--  Find the missing step to satisfy successfully run the next step.

--

insert into department values('CS','Computer');
insert into department values('ME','a');
insert into department values('EE','b');
insert into department values('AU','c');

-- Loading data from a CSV file

-- Copy of the CSV file is attached with the email

COPY student from '/Users/subhasc/projects/learning_sql/step/step_example.csv' with delimiter ',';





/*

 * -- Test scripts

 * select * from student;

 * select * from department;

 *

 *

 *  -- Cleanup scripts

 *  DROP SCHEMA step_example CASCADE;

 *

 */

select name from student join department on student.dept_code=department.dept_code
  where dept_code = 'CS';
select dept_name from department join student 
  on department.dept_code=student.dept_code where subject1>90;
select dept_name from student right join department on student.dept_code=department.dept_code
  where student.dept_code is null;
select dept_name from student s right join department d on s.dept_code=d.dept_code
  where s.dept_code is null;

select count(*) as cnt from student s where s.dept_code='CS'; 
select dept_code, count(*) from student group by dept_code;
select dept_code, count(*) from student group by dept_code having count(*)>10;

select name,dept_code from student where dept_code in ('CS','ME');
select dept_code, avg(subject1+subject2+subject3) from student group by dept_code;


select count(*) as count_of_rows from student;
select count(s.*) as count_of_rows from student s;
select * from ( select * from student s) s1;
with s1 as ( select * from student s) select * from s1;


select 1;
select 1 union select 2;
select 1 union select 2 union select 1;
select 1 union all select 2 union all select 1;
select 1 union all select 2 union all select 1 except select 2;
select 1 union all select 2 union all select 1 except all select 2;

select roll_no, name from student where dept_code = 'ME'
 union select roll_no,name from student where dept_code = 'CS';
select * from student where subject1>70 
  union select * from student where subject2>70;
select * from student where subject1>70 
  union select * from student where subject2>70 order by subject1;
select * from student where subject1>70 
  intersect select * from student where subject2>70 order by subject1;

select roll_no,name,subject1 from student order by subject1;
select roll_no,name,subject1 from student order by subject1 desc;
(select roll_no,name,dept_code from student where dept_code = 'CS' order by roll_no) 
  union (select roll_no,name,dept_code from student where dept_code = 'ME' order by roll_no);

select * from student cross join department;
select * from student s1 cross join student s2;
select * from student s1 join student s2 on s1.roll_no=s2.roll_no;
select * from student s1 left join student s2 on s1.roll_no=s2.roll_no;
select * from student s full outer join department d on s.dept_code=d.dept_code;

select dept_code, count(*) as count from student group by dept_code;
select * from student order by name;
select * from student order by name, roll_no;
select * from student order by dept_code,roll_no desc;

select * from student s join department d on s.dept_code=d.dept_code;

ALTER table department ADD COLUMN hod varchar(20);

update  department set hod ='ashok' where dept_code = 'CS';
update  department set hod ='manish' where dept_code = 'ME';
update  department set hod ='ramesh' where dept_code = 'EE';
update  department set hod ='rahul' where dept_code = 'ME';


select name, roll_no,subject1,subject2,subject3,hod from student s join department d on
s.dept_code = d.dept_code where s.dept_code = 'CS';
CREATE view me_student  as(
select name, roll_no,subject1,subject2,subject3,hod,dept_name from student s join department d on
s.dept_code = d.dept_code where s.dept_code = 'ME') ;

update me_student set hod = 'ab' where hod = 'rahul';

CREATE view view_student as (
  select * from student
);
update view_student set subject1 = 90 where subject1 = 89;

select name,dept_name from student s join department d on s.dept_code=d.dept_code;
select name,dept_name from department d join student s on s.dept_code=d.dept_code;
select name,dept_name from student s left join department d on s.dept_code=d.dept_code;
select name,dept_name from department d left join student s on s.dept_code=d.dept_code;
select name,dept_name from student s right join department d on s.dept_code=d.dept_code;
select name,dept_name from department d right join student s on s.dept_code=d.dept_code;
select name,dept_name from student s full outer join department d on s.dept_code=d.dept_code;
select name,dept_name from department d full outer join student s on s.dept_code=d.dept_code;