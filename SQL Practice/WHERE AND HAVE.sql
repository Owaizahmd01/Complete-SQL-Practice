create database next_practice;
use next_practice;

# In sql if you see fundamentally, there are two ways of data can be filter
#Which is where and Having 

# WHERE --> If an induvidual row using this
# HAVING --> For an aggregated values 

# If both, firstly use WHERE and then HAVING

create table wher_hav(
emp_id int,
emp_name varchar(50),
department_id int ,
salary int,
manager_id int);

select * from wher_hav;

insert into wher_hav values(1, 'Ankit', 100, 10000, 4),
(2,	'Mohil',	100,	15000,	5),
(3,	'Vikas',	100,	10000,	4),
(4,	'Rohit',	100,	5000,	2),
(5,	'Mudil',	200,	12000,	6),
(6,	'Agam',	    200,	12000,	2),
(7,	'Sanjay',	200,	9000,	2),
(8,	'Ashish',	200,	5000,	2);

select * from wher_hav
where salary>10000;

# WHERE
select department_id, avg(salary) from wher_hav 
group by department_id;

#HAVING
select department_id, avg(salary) from wher_hav 
group by department_id 
having avg(salary) > 9500;

# BOTH -- WHERE & HAVING 
select department_id, avg(salary) from wher_hav
where salary >10000
group by department_id
having avg(salary) >12000;


select department_id, sum(salary) from wher_hav;


select * from wher_hav;

select * from wher_hav
where salary >= 9500;

select department_id, avg(salary) from wher_hav
where salary >=9500
group by department_id 
having avg(9500);

select department_id, avg(salary) from wher_hav
where salary<= 9500
group by department_id
having avg(salary) <= 9500;

select department_id, COUNT(salary) from wher_hav
group by department_id ;
















































