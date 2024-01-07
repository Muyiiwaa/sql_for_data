-- 2nd class

-- creating a database for mrbiggs restaurant

create database mrbiggs;

-- activate the database
use mrbiggs;

-- creating the tables

-- orders // facts table 
-- branch // dimension table
-- staff // dimension table

-- creating the branch table
create table branch(
	branch_id int,
    street varchar(20) not null,
    city varchar(20) not null,
    date_founded date not null,
    
    primary key(branch_id)
);

-- creating the staff table
create table staff(
	staff_id int,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    gender enum('M','F','prefer not to say') default 'prefer not to say',
    birthdate date not null,
    branch_id int not null,
    
    primary key(staff_id),
    foreign key (branch_id) references branch (branch_id)
);

-- creating the orders table

create table orders(
	order_id int,
    quantity decimal not null,
    unitprice decimal not null,
    staff_id int not null,
    branch_id int not null,
    order_date datetime default now(),
    
    primary key(order_id),
    foreign key (staff_id) references staff (staff_id),
    foreign key (branch_id) references branch (branch_id)
);


-- insert data into the tables 

insert into branch(branch_id, street, city, date_founded)
values
(1,'Ikeja','Lagos','2023-01-01'),
(2,'Yaba','Lagos','2022-01-01'),
(3,'Bodija','Ibadan','2023-05-01'),
(4,'Garki','Abuja','2021-01-01');


