-- create database for parach
-- students, course, tutors

create database parach;

use parach;

-- creating table course 

create table course(
	course_id int,
    title varchar(20) not null,
    fee int not null,
    
    primary key(course_id)
);

-- create table tutor and link it with course
create table tutor(
	tutor_id int,
    full_name varchar(20) not null,
    birth_date date not null,
    gender enum('male', 'female','unknown') default 'unknown',
    course_id int not null,
    
    primary key(tutor_id),
    foreign key (course_id) references course (course_id)
);

-- create table student

create table student(
	student_id int,
    full_name varchar(30) not null,
    gender enum('male', 'female') not null,
    birth_date date not null,
    course_id int,
    
    primary key(student_id),
    foreign key (course_id) references course (course_id)
);

-- creating attendance register

create table register(
	row_id int auto_increment,
    student_id int not null,
    check_in datetime default now(),
    check_out time not null,
    
    primary key(row_id),
    foreign key (student_id) references student (student_id)
    
);








