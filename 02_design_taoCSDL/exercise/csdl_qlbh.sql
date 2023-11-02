create database bt_2_2;
use  bt_2_2;

CREATE TABLE customer (
    c_id INT,
    c_name VARCHAR(50),
    c_age INT,
    PRIMARY KEY (c_id)
);

create table order_dh(
	o_id int primary key,
    c_id int,
    o_date date,
    foreign key (c_id) references customer(c_id)
);
create table product(
	p_id int primary key,
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