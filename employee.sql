create table employee (
id numeric(5) primary key,
name varchar(20),
manager varchar(20),
salary numeric(10)
);

insert into employee values(1001, 'shubham',null,20000);
insert into employee values(1002, 'pranoy','shubham',20000);
insert into employee values(1003, 'yogi','pranoy',20000);
insert into employee values(1004, 'ketan','yogi',20000);
insert into employee values(1005, 'suyog','ketan',20000);
select * from employee ;
select e2.id,e2.name from employee e1 join employee e2 on e1.name = e2.manager;



