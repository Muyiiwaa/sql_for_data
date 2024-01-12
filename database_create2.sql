-- create database for appclick
create database appclick;

-- activate the database
use appclick;

-- create the needed tables inside the database
-- course
-- students
-- tutors
-- attendance

-- create the course table

create table course(
	course_id int,
    title varchar(20) not null,
    fee int not null,
    
    primary key(course_id)
);

-- create table tutor

create table tutor(
	tutor_id int,
    full_name varchar(50) not null,
    gender enum('male', 'female', 'others'),
    course_id int not null,
    birthdate date not null,
    
    primary key(tutor_id),
    foreign key (course_id) references course (course_id)
);

-- create students table

create table students(
	student_id int,
    full_name varchar(50) not null,
    gender enum('male', 'female'),
    course_id int not null,
    
    
    primary key(student_id),
    foreign key (course_id) references course (course_id)
);

-- create attendance table

create table attendance(

	row_id int auto_increment,
    student_id int not null,
    check_in datetime default now(),
    
    primary key(row_id),
    foreign key(student_id) references students (student_id)

);

-- insert data into the tables 

insert into course
values
(1, 'data analysis', 30000),
(2, 'data science', 20000),
(3, 'web design', 40000),
(4, 'fullstack', 60000),
(5, 'back end eng', 35000);

insert into tutor(tutor_id, full_name,gender,course_id,birthdate)
values
(1,'wale', 'male', 2, '1998-02-03'),
(2,'taye', 'female', 1, '1997-02-03'),
(3,'temi', 'female', 3, '1996-02-03'),
(4,'sodiq', 'male', 4, '1999-02-03');


insert into students(student_id, full_name,gender,course_id)
values
(1,'wale', 'male', 2),
(2,'taye', 'female', 1),
(3,'temi', 'female', 3),
(4,'sodiq', 'male', 4),
(5,'bello', 'male', 2),
(6,'john', 'male', 4),
(7,'hakeem', 'male', 4),
(8,'blessing', 'female', 4);

-- insert into attendance

insert into attendance(student_id)
values
(4),
(3),
(1),
(2);

select *
from attendance;



