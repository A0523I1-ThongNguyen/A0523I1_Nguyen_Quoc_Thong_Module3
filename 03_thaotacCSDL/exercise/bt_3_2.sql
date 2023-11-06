create database bt_2_2;
use  bt_2_2;

CREATE TABLE customer (
    c_id INT primary key auto_increment ,
    c_name VARCHAR(50),
    c_age INT
);
insert into customer(c_name,c_age)
values ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);

create table order_dh(
	o_id int primary key auto_increment,
    c_id int,
    o_date date,
    o_total_price float,
    foreign key (c_id) references customer(c_id)
);
insert into order_dh(c_id,o_date)
values (1,'2006-03-21'),(2,'2006-03-23'),(1,'2006-03-16');

select o.o_id,o.o_date,o.o_total_price
from order_dh o;

-- 1.Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id,o.o_date,p.p_price,p.p_name ,o.o_total_price
from order_dh o
join OrderDetail od on o.o_id=od.o_id
join Product p on od.p_id=p.p_id;

-- 2 Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách


create table product(
	p_id int primary key auto_increment,
    p_name varchar(50),
    p_price float
);
insert into product(p_name,p_price)
values ('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

create table OrderDetail(
	o_id int ,
    p_id int ,
    primary key(o_id,p_id),
    quantity int , -- Mỗi hóa đơn có thể có nhiều mặt hàng - Mỗi mặt hàng trong hóa đơn có thể được mua với số lượng nhiều hơn 1 cái.
    foreign key (o_id) references order_dh(o_id),
    foreign key (p_id) references product(p_id)
);
insert into OrderDetail(o_id,p_id,quantity)	
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);


SELECT * FROM customer WHERE c_id IN (SELECT c_id FROM order_dh); -- test truy van con(sub query)
SELECT o.o_id, o.o_date,  SUM(od.quantity * p.p_price) AS 'tong' 
FROM order_dh o
JOIN OrderDetail od 
ON o.o_id = od.o_id
JOIN product p
ON od.p_id = p.p_id
GROUP BY o.o_id;
