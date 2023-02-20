create database win_fun;
use win_fun;

create table ineuron_students(
student_id int,
student_batch varchar(60),
student_name varchar(60),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(50));

insert into ineuron_students values(100 ,'fsda' , 'saurabh','cs',80,'saurabh@gmail.com'),
(102 ,'fsda' , 'sanket','cs',81,'sanket@gmail.com'),
(103 ,'fsda' , 'shyam','cs',80,'shyam@gmail.com'),
(104 ,'fsda' , 'sanket','cs',82,'sanket@gmail.com'),
(105 ,'fsda' , 'shyam','ME',67,'shyam@gmail.com'),
(106 ,'fsds' , 'ajay','ME',45,'ajay@gmail.com'),
(106 ,'fsds' , 'ajay','ME',78,'ajay@gmail.com'),
(108 ,'fsds' , 'snehal','CI',89,'snehal@gmail.com'),
(109 ,'fsds' , 'manisha','CI',34,'manisha@gmail.com'),
(110 ,'fsds' , 'rakesh','CI',45,'rakesh@gmail.com'),
(111 ,'fsde' , 'anuj','CI',43,'anuj@gmail.com'),
(112 ,'fsde' , 'mohit','EE',67,'mohit@gmail.com'),
(113 ,'fsde' , 'vivek','EE',23,'vivek@gmail.com'),
(114 ,'fsde' , 'gaurav','EE',45,'gaurav@gmail.com'),
(115 ,'fsde' , 'prateek','EE',89,'prateek@gmail.com'),
(116 ,'fsde' , 'mithun','ECE',23,'mithun@gmail.com'),
(117 ,'fsbc' , 'chaitra','ECE',23,'chaitra@gmail.com'),
(118 ,'fsbc' , 'pranay','ECE',45,'pranay@gmail.com'),
(119 ,'fsbc' , 'sandeep','ECE',65,'sandeep@gmail.com');

select * from ineuron_students;

# To (+,-,*,/) a particular group of column values , we are use GROUP BY 
select student_batch, sum(student_marks) from ineuron_students group by student_batch;
select student_batch, min(student_marks) from ineuron_students group by student_batch;
select student_batch, max(student_marks) from ineuron_students group by student_batch;
select student_batch, avg(student_marks) from ineuron_students group by student_batch;

#manager ask what is count of student_batch
select count(student_batch) from ineuron_students;

#The SELECT DISTINCT statement is used to return only distinct (different) values.
#Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.
select count(distinct student_batch) from ineuron_students;

#how many types of streams students are in in student_batch
select student_batch, count(*) from ineuron_students group by student_batch;

#This all are called AGGREGRATED WINDOWING FUNCTION

#------->>   Now we see, ANALATICAL BASED WINDOWING FUNCTION

#Manager ask me, what is the highest mark in fsda batch?
select student_batch, max(student_marks) from ineuron_students where student_batch = 'fsda';

select student_name, student_batch, max(student_marks) from ineuron_students group by student_batch;
#here in this query, we get wrong output. for that use below

select student_name from ineuron_students where student_marks in 
(select max(student_marks) from ineuron_students where student_batch="fsda");

#Manager want second highest mark from the fsda column, for that
select * from ineuron_students where student_batch = 'fsda' order by student_marks desc limit 1,3;
# for doubt watch (01.04.30)

#Manager wants to ask, i want full coulmn of fsda in a asending order by marks
select * from ineuron_students where student_batch ='fsda' order by student_marks;

#looking for a 3rd highest marks
select * from ineuron_students where student_marks =(
select min(student_marks) from 
(select student_marks from ineuron_students 
where student_batch ="fsda"
order by student_marks desc
limit 3 ) as top);

#ROW NUMBER 
select student_id, student_batch, student_stream, student_marks, row_number() over(order by student_marks) as 'row number' from ineuron_students;

#if you want row number for different batch , just add PARTITION BY
select student_id, student_batch, student_stream, student_marks, row_number() over(partition by student_batch order by student_marks) as 'row number' from ineuron_students;

select student_id, student_batch, student_stream, student_marks, row_number() over(partition by student_batch order by student_marks desc) as'row num' from ineuron_students as test where row_num = 1;

#Rank function
select student_id, student_batch, student_stream, student_marks, rank() over(order by student_marks desc) as 'row_rank'from ineuron_students;

select * from (select student_id, student_batch, student_stream, student_marks, 
row_number() over(partition by student_batch order by student_marks desc) as 'row_number',
rank() over( partition by student_batch order by student_marks desc) as 'row_rank',
dense_rank() over(partition by student_batch order by student_marks desc) as ' dense_rank' from
ineuron_students) as test where `dense_rank` = 2;

























