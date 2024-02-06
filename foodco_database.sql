-- creating database foodco

create database foodco;

use foodco;

/*
creating 3 tables namely
branch, orders, staff
i go start with branch because say 
i no fit put my products fo roadside
*/
create table branch(
	branch_id int,
    street varchar(50) not null unique,
    city varchar(25) not null,
    
    primary key(branch_id)
);

create table staff(
	staff_id int,
    fullname varchar(55) not null,
    gender enum('m','f','binary'),
    branch_id int not null,
    
    primary key(staff_id),
    foreign key (branch_id) references branch (branch_id)
);

create table orders(
	order_id int auto_increment,
    amount decimal not null,
    orderdate datetime default now(),
    branch_id int not null,
    staff_id int not null,
    payment_type enum('cash','card','transfer') default 'cash',
    
    primary key(order_id),
    foreign key (branch_id) references branch (branch_id),
    foreign key (staff_id) references staff (staff_id)
);

-- insert data into all the tables in the database
insert into branch(branch_id, street, city)
values
(1, 'bodija','Ibadan'),
(2,'Tanke','Ilorin'),
(3,'Ekosodin','Benin'),
(4,'Lekki','Lagos');

insert into staff()
values
(1,'John Boyega','m',2),
(2,'Helen Keller','f',2),
(3,'Luka Doncic','m',1),
(4,'Adewale Ogunmefun','f',3),
(5,'Betha Bethlehem','f',4),
(6,'Gary Peyton','m',4);
/*
https://github.com/Muyiiwaa/sql_for_data
*/

insert into orders(amount,branch_id,staff_id)
values
(2000,1,3),
(12000,4,1),
(4000,3,3),
(24000,1,3),
(2500,2,2),
(2000,1,3),
(12000,4,1),
(5000,3,2),
(24050,1,3),
(2500,4,1);

select *
from orders;


