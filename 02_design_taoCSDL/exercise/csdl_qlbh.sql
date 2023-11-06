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


create table product(
	p_id int primary key auto_increment,
    p_name varchar(50),
    p_price float
);

create table OrderDetail(
	o_id int ,
    p_id int ,
    primary key(o_id,p_id),
    quantity int , -- Mỗi hóa đơn có thể có nhiều mặt hàng - Mỗi mặt hàng trong hóa đơn có thể được mua với số lượng nhiều hơn 1 cái.
    foreign key (o_id) references order_dh(o_id),
    foreign key (p_id) references product(p_id)
);
SELECT * FROM customer WHERE c_id IN (SELECT c_id FROM order_dh); -- test truy van con(sub query)

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id , o.o_date,p.p_price ,od.quantity
from order_dh o
join OrderDetail od
on o.o_id = od.o_id
join product p
on  p.p_id = od.p_id;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.c_id, c.c_name , p.p_name
from customer c
join order_dh o
on c.c_id = o.c_id
join OrderDetail od
on od.o_id = o.o_id
join product p
on od.p_id = p.p_id;


-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.c_name , od.o_id ,c.c_id
FROM customer c
LEFT JOIN order_dh o ON c.c_id = o.c_id
LEFT JOIN OrderDetail od ON o.o_id = od.o_id
WHERE o.c_id IS NULL; -- WHERE od.o_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id, o.o_date , o.o_total_price , sum(od.quantity*p.p_price) 'Tong tien' 
from order_dh o
join OrderDetail od
on  o.o_id = od.o_id
join product p
on od.p_id = p.p_id
group by o.o_id;


SELECT o.o_id, o.o_date,  SUM(od.quantity * p.p_price) AS 'tong' 
FROM order_dh o
JOIN OrderDetail od 
ON o.o_id = od.o_id
JOIN product p
ON od.p_id = p.p_id
GROUP BY o.o_id;