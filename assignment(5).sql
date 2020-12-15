use sample_worker;
show tables;
create table worker
( Worker_id int primary key,
 First_name varchar(25),
 Last_name varchar(15),
 Salary decimal(18,2),
 Joining_date datetime,
 Department varchar(15));
 show tables;
 select * from worker;
 INSERT INTO worker
VALUES 
(001,'Monica', 'Arora',100000,'2014-02-20 09:00:00','HR'),
(002, 'Niharika', 'Verma',80000,'2014-06-11 09:00:00','Admin'),
(003, 'Vishal','Singhal',300000, '2014-02-20 09:00:00','HR'),
(004, 'Amitabh','Singh',500000,'2014-02-20 09:00:00','Admin'),
(005,'Vivek','Bhati',500000,'2014-06-11 09:00:00','Admin'),
(006,'Vipul','Diwan',200000,'2014-06-11 09:00:00','Account'),
(007,'Sathish','Kumar',75000,'2014-01-20 09:00:00','Account'),
(008,'Geethika','Chauhan',90000,'2014-04-11 09:00:00','Admin');
select * from worker;

/*1st query*/
select First_name as Worker_name
from worker;

/*2nd query*/
select upper(First_name)
from worker;

/*3rd query*/
select distinct Department 
from worker;

/*4th query*/
select left(first_name,3)
from worker;

/*5th query*/
Select position('a' in 'amitabh')as position;

/*6th query*/
select rtrim(first_name)
from worker;

/*7th query*/
select ltrim(department) as DEPARTMENT
from worker;

/*8th query*/
select distinct(department),length(department) as len
from worker;

/*9th query*/
select REPLACE(first_name, "a", "A") as Replaced
from worker;

/*10th query*/
select Concat(first_name," ",last_name) As COMPLETE_NAME
from worker;

/*11th query*/
select * 
from worker
order by first_name ASC;

/*12th query*/
select * 
from worker
order by first_name ASC , department DESC;

/*13th query*/
select * 
from Worker 
where first_name="Vipul" or first_name="Sathish"; 

/*14th query*/
Select *
from worker
where first_name not in('Vipul','Sathish');

/*15th query*/
Select *
from worker
where department='admin';

/*16th query*/
select * 
from worker
where first_name like '%a%';

/*17th query*/
select * 
from worker
where first_name like '%a';

/*18th query*/
select *
from worker
where first_name like '%h'and length(first_name) = 6 ;

select * from worker;

/*19th query*/
select * 
from worker
where SALARY between 100000 and 500000;

/*20th query*/
select * 
from worker
where Joining_date like "2014-02-%";

/*21st query*/
select count(*) as Count_admin
from worker
where department = "admin";

/*22nd query*/
select first_name, Last_name
from worker
where 50000<salary<100000;

select department, count(*) as count_dep
from worker
group by department 
order by count_dep desc;

select * from worker;

/*24th query*/
select * 
from worker
where worker_id %2!=0;

/*25th query*/
select first_name,last_name,salary
from worker
order by salary desc limit 10;

/*26th query*/
select * 
from worker 
where salary in (
    select salary from worker
    group by salary having count(*) > 1
);

/*27th query*/
select First_name,Last_name,Salary
from worker
order by salary desc limit 1,1;

/*28th query*/
select department,count(*) as total
from worker 
group by Department
order by total<5;

/*29th query*/
select department,count(*) 'number'
from worker
group by department;

/*30th query*/
select *
from worker
order by Worker_id desc limit 1;

select * from worker;