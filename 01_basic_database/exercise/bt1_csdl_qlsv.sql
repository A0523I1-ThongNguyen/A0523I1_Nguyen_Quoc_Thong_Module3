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
select id,`name` from teacher;
select * from teacher;

insert into teacher(id,`name`,age)
values 
		(1,'NguyenThi',40),
        (2,'VanLinh',20),
        (3,'NguyenHuong',35);
SET SQL_SAFE_UPDATES = 0;-- false , disable primary key
update teacher
set id = 5
where
	id = 2;

insert into my_class(id,`name`)
values
		(1,'TranB'),
        (2,'NguyenVanTai'),
        (3,'TruongNgan');
        
