create database demo;
use demo;
drop table Products;
create table Products (
	id int primary key auto_increment,
    productCode int,
    productName varchar(50),
    productPrice double,
    productAmount int,
    productDescription varchar(50),
	productStatus varchar(50)
    );
    insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
	values (1,'Bánh',5.000,2,'Ngon','on'),(2,'Kẹo',2.000,5,'Ngọt','off'),(3,'Trai Cay',10.000,5,'chua','off'),(2,'dau phong',5.000,5,'la','off');
    
    -- thêm cột 
    ALTER TABLE Products ADD new_pro int;
    
    -- xóa cột 
    ALTER TABLE Products
    DROP COLUMN new_pro;
    
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index unique_index
on Products(productCode);
create index index_status on Products(productStatus);


-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index composite_index -- composite index sử dụng nhiều cột để tạo ra một chỉ mục duy nhất, trong khi index chỉ sử dụng một cột
on Products(productName,productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from Products where productStatus = 'on'; -- chua tao index
explain select * from Products where productName = 'dau phung'; -- da tao index

-- So sánh câu truy vấn trước và sau khi tạo index
-- before create index : type = ALL , rows = 4
-- later create index : type = ref , rows = 1

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view view_product as
select productCode,productName,productPrice,productStatus
from Products;

-- lấy thông tin từ view_product 
select * from view_product;

select p.productName,p.productPrice
from view_product p
where productPrice >=2 and productPrice<=5;


-- Tiến hành sửa đổi view
update view_product 
set productCode='66'
where productName='pepsi' and productPrice=2;

-- Tiến hành xoá view
drop view view_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure m_product()
begin
select * from Products;
end //
delimiter ;

call m_product();

delimiter //
create procedure m2_product()
begin
select p.productName, p.productPrice
from Products p
where productPrice <10;
end 
// delimiter;

call m2_product();


-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(new_productCode int,new_productName varchar(50),new_productPrice double,
new_productAmount double,new_productDescription varchar(50),new_productStatus bit) 
begin
insert into Products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
value (new_productCode,new_productName,new_productPrice,new_productAmount,new_productDescription,new_productStatus);
end //

delimiter ;

call add_new_product(4,'Coca',10.000,3,'Ngon',1);

-- delete record 
delete from Products p
where p.id like 7;

delimiter //
create procedure add_product2(new_pcode int , new_pname varchar(50),new_price double,new_pamount double, new_pdescription varchar(50),new_pstatus varchar(50))
begin
insert into Products( productCode ,productName ,productPrice ,productAmount ,productDescription ,productStatus )
values (new_pcode,new_pname,new_price,new_pamount, new_pdescription,new_pstatus);
end //
delimiter;

call add_product2(99,'sting',11.000,2,'do',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure fix_id(in id2 int, in new_productName varchar(50), in new_productPrice double)
begin
update products
set productName=new_productName, productPrice=new_productPrice
where(id2=id);
end //

delimiter ;

call fix_id(12,'bo huc',12.000);

delimiter //
create procedure fix_id2(fix_id int , new_pname varchar(50), new_pprice double,new_pdescription varchar(50))
begin
update Products p 
set   p.productName = new_pname, p.productPrice= new_pprice  ,p.productDescription = new_pdescription 
where fix_id = p.id;
end //
delimiter;

call fix_id2(1,'banh chung','8.000','mem');

drop procedure fix_id;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_id(in id2 int)
begin
delete from Products
where(id=id2);
end //

delimiter ;

call delete_id(12); -- bohuc

delimiter //
create procedure delete_id2(del_id int)
begin
delete from Products
where(del_id=id);
end //
delimiter ;

call delete_id2(11);

drop procedure delete_id;