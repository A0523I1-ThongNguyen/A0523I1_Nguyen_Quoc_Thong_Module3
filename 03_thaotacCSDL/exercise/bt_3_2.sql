-- from database database bt_2_2;

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