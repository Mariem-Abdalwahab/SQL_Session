-- create database

create database datasession;
use datasession;

-- DQL

--- create
CREATE TABLE Employee(
emp_id int,
Fname varchar(20),
Lname varchar(20),
salary float,
branch_id int
);


-- drop

drop table Employee;

-- Truncate

truncate table Employee;



--- alter

--- add ssn column
alter table Employee
add ssn float; -- will change datatype after while

alter table Employee
alter column ssn int;

alter table Employee
drop column ssn;


----------------------

insert into Employee (emp_id, Fname, Lname, salary, branch_id)
values (
1, 'mariem', 'elshall', 15000, 5
),
(
2, 'mohamed', 'nour', 15000, 8
),(
3, 'noha', 'mohamed', 12000, 6
),(
4, 'lila', 'ahmed', 15000, 4
),(
5, 'lila', 'ahmed', 20000, 4
);

-- DQL

--- select
select * 
from Employee;

select emp_id, salary
from Employee;

--- select distinct

select distinct salary
from Employee;

-- order by

select emp_id 
from Employee; -- order randomlly

select emp_id 
from Employee
order by emp_id; --  ascending order by default

select emp_id 
from Employee
order by emp_id desc; -- descending order

select emp_id
from Employee
order by branch_id desc; 

select *
from Employee
order by emp_id desc, branch_id desc; 

select *
from Employee
order by Fname; 


-- DML

--- insert


insert into Employee (emp_id, Fname, Lname, salary, branch_id)
values (
1, 'mariem', 'elshall', 15000, 5
); -- insert one row


insert into Employee (emp_id, Fname, Lname, salary, branch_id)
values (
1, 'mariem', 'elshall', 15000, 5
),
(
2, 'mohamed', 'nour', 15000, 8
),(
3, 'noha', 'mohamed', 12000, 6
),(
4, 'lila', 'ahmed', 15000, 4
),(
5, 'lila', 'ahmed', 20000, 4
); -- insert many rows

insert into Employee (emp_id, Fname, Lname, salary)
values (
7, 'm', 'elshall', 1500);

--- insert into select

create table branch(
id int,
Bid int);


insert into  branch (id,Bid)
select emp_id,branch_id from Employee;

-- Update
--- select * from Employee;

update Employee
set branch_id = 10
where branch_id = 5;


-- Delete

delete from Employee
where branch_id = 8;

-- between
select salary 
from Employee
where salary between 12000 and 20000;

-- <> != not equal
select salary 
from Employee
where salary <> 12000 ;

-- in 
SELECT * FROM Customers
WHERE City IN ('Paris','London');

-- like

select Fname 
from Employee
where Fname like 'm%'; -- any names start with m

select Fname 
from Employee
where Fname like '%m';  -- any names end with m


select Fname 
from Employee
where Fname like '%[ei]m';  

------------------------------------------------

-- min
select min(salary)
from Employee;

-- max
select max(salary)
from Employee;

select max(salary) as max_salary
from Employee
where branch_id =5;

select max(salary) as [max salary] -- "max salary"
from Employee
where branch_id =5;


-- count
select count(emp_id)
from Employee;

select count(emp_id)
from Employee
where branch_id = 10;

select count(salary)
from Employee;

select count(distinct salary)
from Employee;

-- sum

select sum(salary)
from Employee;

-- avg

select avg(salary)
from Employee;


-----------------------------------------
-- JOINS

create database one;
use one;


CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY ,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    country VARCHAR(50)
);

INSERT INTO customers (Fname, Lname, email, phone, country) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', 'USA'),
('Robert', 'Johnson', 'robert.johnson@example.com', '345-678-9012', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '456-789-0123', 'Canada'),
('Michael', 'Brown', 'michael.brown@example.com', '567-890-1234', 'Canada'),
('Sarah', 'Jones', 'sarah.jones@example.com', '678-901-2345', 'UK'),
('David', 'Miller', 'david.miller@example.com', '789-012-3456', 'UK'),
('Laura', 'Wilson', 'laura.wilson@example.com', '890-123-4567', 'Australia'),
('James', 'Moore', 'james.moore@example.com', '901-234-5678', 'Australia'),
('Linda', 'Taylor', 'linda.taylor@example.com', '012-345-6789', 'Germany'),
('William', 'Anderson', 'william.anderson@example.com', '123-456-7891', 'Germany'),
('Karen', 'Thomas', 'karen.thomas@example.com', '234-567-8902', 'France'),
('Richard', 'Jackson', 'richard.jackson@example.com', '345-678-9013', 'France'),
('Patricia', 'White', 'patricia.white@example.com', '456-789-0124', 'Italy'),
('Charles', 'Harris', 'charles.harris@example.com', '567-890-1235', 'Italy'),
('Barbara', 'Martin', 'barbara.martin@example.com', '678-901-2346', 'Spain'),
('Joseph', 'Thompson', 'joseph.thompson@example.com', '789-012-3457', 'Spain'),
('Susan', 'Garcia', 'susan.garcia@example.com', '890-123-4568', 'Mexico'),
('Thomas', 'Martinez', 'thomas.martinez@example.com', '901-234-5679', 'Mexico'),
('Nancy', 'Robinson', 'nancy.robinson@example.com', '012-345-6790', 'Brazil');


CREATE TABLE orders (
    order_id INT IDENTITY(1,1)  PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-01-15'),
(2, '2024-01-17'),
(3, '2024-01-20'),
(4, '2024-01-25'),
(5, '2024-02-01'),
(6, '2024-02-05'),
(7, '2024-02-10'),
(8, '2024-02-15'),
(9, '2024-02-20'),
(10, '2024-02-25');


--- inner join
select * from 
customers c inner join orders o
on c.customer_id = o.customer_id;

select * from 
customers c  join orders o
on c.customer_id = o.customer_id;

--- left join

select * from 
customers c left join orders o
on c.customer_id = o.customer_id;

-- right join
select * from 
customers c right join orders o
on c.customer_id = o.customer_id;


-- Full join == full outer join
select * from 
customers c full join orders o
on c.customer_id = o.customer_id;


-- self join
select * from 
customers c1, customers c2
where c1.customer_id <> c2.customer_id
and c1.country = c2.country

