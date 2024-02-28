-- created the churrch database 
create database winners;

-- activated the winners database
use winners;


-- create the tables needed inside the church database
-- branch
-- pastors
-- members
-- record

create table branch(
	branch_id int,
    branch_name varchar(20) not null,
    city varchar(20) not null,
    
    primary key(branch_id) 
);
-- create table pastors 

create table pastors(
	pastor_id int,
    fullname varchar(45) not null,
    gender enum('male', 'female') default 'male',
    birthdate date not null,
    branch_id int not null,
    
    primary key(pastor_id),
    foreign key (branch_id) references branch (branch_id)
);


-- create the members table

create table members(
	member_id int,
    fullname varchar(50) not null,
    gender enum('male', 'female') not null,
    worker enum('yes', 'no') default 'no',
    birthdate date not null,
    branch_id int not null,
    
    primary key(member_id),
    foreign key (branch_id) references branch (branch_id)
);

-- set up the church attendance record

create table attendance(
	row_id int,
    member_id int not null,
    service enum('sunday', 'bible study', 'thanksgiving') default 'sunday',
    arrival datetime default now(),
    
    primary key(row_id),
    foreign key (member_id) references members (member_id)
);

-- populating the database with records 
insert into branch(branch_id, branch_name, city)
values
(1, 'love', 'ibadan'),
(2, 'peace', 'lagos'),
(3, 'holy ghost', 'abuja'),
(4, 'light', 'ibadan');

insert into pastors
values
(1,'wale john', 'male', '1985-02-20', 3),
(2,'bode john', 'male', '1985-01-01', 1),
(3,'tobi john', 'female', '1985-11-01', 3),
(4,'wale moses', 'male', '1984-03-01', 1),
(5,'wole johnson', 'male', '1985-02-01', 4),
(6,'taiwo james', 'female', '1985-03-01', 2);

insert into members(member_id, fullname, gender,worker, birthdate, branch_id)
values
(7, 'tola babs', 'female','yes', '2002/03/03', 1),
(8, 'toyin badmus', 'female','no', '2002/03/03', 1),
(9, 'stephen babs', 'male','yes', '2002/03/03', 2),
(10, 'bola babs', 'male','no', '2002/03/03', 3),
(11, 'wale babs', 'male','yes', '2002/03/03', 4),
(12, 'john babs', 'male','yes', '2002/03/03', 2);

alter table attendance
modify column row_id int auto_increment;

insert into attendance(member_id)
values
(1),
(2),
(4),
(3),
(9),
(7),
(6),
(5);

