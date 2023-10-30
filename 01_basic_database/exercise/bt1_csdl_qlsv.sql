CREATE database school;
create table my_class (
	id INT primary key,
    `name` varchar(50)
);

create table teacher(
	id INT primary key,
    `name` varchar(50),
    age INT ,
    country varchar(50)
);