USE HR;
SELECT * FROM TABLES;
SELECT * FROM EMPLOYEES;

/*1st Query*/
SELECT 
first_name,last_name,
first_name AS FirstName ,last_name AS LastName
FROM employees;

SELECT * FROM DEPARTMENTS;

/*2nd query*/
select distinct (department_id)
from employees;

/*3rd query*/
SELECT *
FROM employees
ORDER BY first_name DESC;
 SELECT * FROM employees;
 
/*4th query*/
 select first_name,last_name,salary,salary*.15 PF 
 from employees;
 
 /*5th query*/
 select employee_id,first_name,last_name,salary
 from employees
 order by salary ASC;
 
/*6th query*/
 SELECT SUM(salary)
FROM employees;
 
/*7th query*/
 Select max(salary),min(salary)
 from employees;
 
/*8th query*/
 Select avg(salary),count(employee_id)
 from employees;

/*9th query*/
select count(employee_id)
from employees;

/*10th query*/
select count(job_id)
from employees;

/*11th query*/
SELECT UPPER(first_name) 
FROM employees;

/*12th Query*/
select substring(first_name,1,3)
from employees;

/*13th Query*/
select trim(first_name) as first_name
from employees;

/*14th query*/
select first_name,last_name,length(first_name),length(last_name),length(first_name)+length(last_name) As 'total_len'
from employees;

/*15th query*/
select first_name
from employees 
where  first_name REGEXP  '[0-9]';

/*16th query*/
select first_name,last_name,salary
from employees
where salary not between 10000 and 15000;

/*17th Query*/
 select first_name,last_name,department_id
 from employees
 where department_id in(30,100) 
 order by department_id asc;
 
 /*18th query*/
 select first_name,last_name,salary,department_id
 from employees
 where (salary not between 10000 and 15000 )and department_id in(30,100);
 
 select * from employees;
 
 /*19th query*/ 
select first_name,last_name,hire_date
 from employees
 where hire_date like '1987%';
 
 /*20th query*/
 select first_name
 from employees
 where first_name like'%b%' and first_name like '%c%';
 
 /*21th query*/
 select last_name,job_title,salary
 from employees,jobs 
 where job_title in('programmer','Shipping Clerk') and salary not in ( 4500, 10000 ,15000);
 
 /*22nd query*/
 select last_name
 from employees
 where length(last_name)='6';
 
 /*23rd query*/
 select last_name 
 from employees 
 where last_name LIKE '__e%';

/*24th query*/
select job_id, GROUP_CONCAT(employee_id, ' ')  'Employees ID' 
from employees GROUP BY job_id;

/*25th query*/
update employees
set phone_number= replace (phone_number,'124','999')
where phone_number like '%124%';

/*26 query*/
select *
from employees
where length(first_name)>=8;

select * from employees;

/*27th query*/
SELECT CONCAT(email , "@exmaple.com") AS Email_id
From employees;

/*28th query*/
select phone_number,right(phone_number,4) AS last_4
from employees;
select * from locations;

/*29th query*/

Select SUBSTRING_INDEX(street_address,' ', -1) As last_streetaddress
from locations;

/*30th query*/
SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT  MIN(LENGTH(street_address)) 
FROM locations);

/*31 query*/
SELECT SUBSTRING_INDEX(job_title,' ',1)as First,job_title  
from jobs;

/*32nd query*/
SELECT first_name, last_name
FROM employees 
WHERE last_name like '__c%';
 
 /*33rd query*/
 select first_name as Name,length(first_name) as Length
 from employees
 where (first_name like 'a%' or first_name like 'j%' or first_name like 'm%' ) ORDER BY
    first_name ASC;
 
 /*34th query*/
 SELECT first_name,Salary,lpad(salary,10,'$') as SALARY
 from employees;

/*35th query*/
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000)) 
'SALARY($)', salary
FROM employees
ORDER BY salary DESC;

/*36th query*/
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;

