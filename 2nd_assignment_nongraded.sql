use hr;
show tables;
select * from departments;
select * from employees;

/*1st query*/
select d.department_name,p.location_id,p.street_address,p.postal_code,p.city,p.state_province,p.country_id
from departments d
join locations p
on d.location_id=p.location_id;

/*2nd query*/
select Concat(c.first_name," ",c.last_name) as Name ,c.department_id,p.department_name
from employees c
join departments p
on c.department_id=p.department_id;

/*3rd query*/
select concat(e.first_name,' ',e.last_name) as Name,j.job_title,e.department_id,d.department_name,l.city
from jobs j,locations l,employees e
inner join departments d 
on e.department_id=d.department_id
where l.city='london';

/*4th query*/
select employee_id,last_name as Name ,concat(manager_id,"-",last_name) "managerid with name"
from employees;

select * from employees;

/*5th query*/
SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees d
ON (d.last_name = 'Jones') 
WHERE d.hire_date < e.hire_date;

/*6th query*/
select e.department_name,count(c.department_id) As Number
from departments e
join employees c
on c.department_id=e.department_id
group by e.department_name;

select * from departments;
/*7th query*/
SELECT DEPARTMENT_NAME, concat(FIRST_NAME," ",last_name) as "Name" ,SALARY  
    FROM departments D 
       JOIN employees E 
         ON (D.MANAGER_ID=E.MANAGER_ID)  
           WHERE  (SYSDATE()-HIRE_DATE) / 365 > 5;
           
/*8th query*/
select concat(first_name," ",last_name) as name,salary 
from employees
where salary>(select salary 
			 from employees 
             where last_name="BULL");
             
/*9th query*/
select concat(e.first_name," ",e.last_name)as Name 
from employees e
join departments d
on e.department_id=d.department_id
where d.department_name="IT";

/*10th query*/
select * from locations;
select * from job_history;
select * from employees;
select * from departments;

/*10th query*/
SELECT concat(first_name, " ",last_name)As Name
FROM employees 
WHERE manager_id in (select employee_id 
FROM employees WHERE department_id 
IN (SELECT department_id FROM departments WHERE location_id 
IN (select location_id from locations where country_id='US')));

/*11th query*/
select concat(first_name,"  ",last_name) as Name,salary
from employees
where salary>(select avg(salary) from employees);

/*12th query*/


select concat(e.first_name," ",e.last_name) as name, e.salary 
from employees e
where e.salary = (select min_salary
from jobs j
where e.job_id = j.job_id);

/*13th query*/
select concat(first_name," ",last_name) as name ,salary
from employees
where salary >(select avg(salary) from employees) and
department_id in (select department_id from departments where department_name="IT");

/*14th query*/
select concat(first_name," ",last_name) as name,salary,min_salary
from employees,jobs 
where salary =min_salary; 

/*15th query*/
select concat(first_name," ",last_name) as Name ,salary from employees
where salary> all(select salary from employees where job_id="sh_clerk")
order by salary;

select * from employees;