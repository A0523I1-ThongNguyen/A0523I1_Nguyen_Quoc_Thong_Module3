create database case_study;
use case_study;

-- qh 1nv - nhieu vt,td,bp
create table vi_tri(
ma_vi_tri int auto_increment primary key ,
ten_vi_tri varchar(45) unique
);

create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45) unique
);

create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan	varchar(45) unique
);

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null unique,
luong double not null,
so_dien_thoai varchar(45) not null unique,
email varchar(45) unique,
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

-- qh 1kh - nhieu loai kh. (1 loại khách có thể có nhiêù kiểu  khách hàng khác nhau  , 1 khách hàng thì thuộc 1 loại khách)
create table loai_khach (
	 ma_loai_khach int primary key auto_increment,
     ten_loai_khach varchar(50)
);

create table khach_hang(
	ma_khach_hang int primary key auto_increment,
    ho_ten varchar(50) not null,
    ngay_sinh date not null,
    gioi_tinh bit(1) not null,
    so_cmnd varchar(45) not null unique,
    so_dien_thoai varchar(45) not null unique,
    email varchar(45) unique,
    dia_chi varchar(45),
    ma_loai_khach int,
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table kieu_thue (
	ma_kieu_thue int primary key auto_increment,
    ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
	ma_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(45)
);
	
-- dịch vụ n -1 loại dịch vụ, n-1 kiểu thuê
create table dich_vu(
	ma_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(45) not null,
    dien_tich int,
    chi_phi_thue double not null,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

-- hợp đồng 1 - n nhan_vien, 1-n khach_hang , 1 - n dich_vu, n-n dich_vu_di_kem
create table hop_dong (
	ma_hop_dong int primary key auto_increment,
    ngay_lam_hop_dong datetime not null,
    ngay_ket_thuc datetime not null,
    tien_dat_coc double not null,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);



create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45) not null,
    gia double not null,
    don_vi varchar(10) not null,
    trang_thai varchar(45)
);

-- bảng n-n của hop_dong và dich_vu_di_kem (tạo khóa phức hợp liên kết với  2 bảng kia )
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int primary key auto_increment,
    so_luong int not null,
    ma_hop_dong int,
    ma_dich_vu_di_kem int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

	insert into vi_tri(ten_vi_tri)
    values ('Quan Ly') , ('Nhan Vien');
    
    insert into trinh_do(ten_trinh_do)
    values ('Trung cap'),('Cao Dang'),('Dai Hoc'),('Sau Dai Hoc');

	insert into bo_phan(ten_bo_phan)
    values ('Sale-Marketing'),('Hành chính'),('Phục vụ'),('Quản lý');
    
    insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
VALUES ('Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1);  
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Lê Văn Bình', '1997-04-09', '654231234', 7000000,'0934212314','binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ('Hồ Thị Yến','1995-12-12','999231723',14000000, '0412352315', 'thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai', 1,3,2);
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values	('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
('Khúc Nguyễn An Nghi',	'2000-11-08','964542311',7000000,	'0978653213',	'annghi20@gmail.com',	'294 Nguyễn Tất Thành, Đà Nẵng',	2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,	'0941234553',	'nhh0101@gmail.com',	'4 Nguyễn Chí Thanh, Huế'	,2,	3,2),
('Nguyễn Hà Đông',	'1989-09-03',	'234414123',	9000000,	'0642123111',	'donghanguyen@gmail.com',	'111 Hùng Vương, Hà Nội',	2,	4,	4),
('Tòng Hoang'	,'1982-09-03'	,'256781231',	6000000,	'0245144444',	'hoangtong@gmail.com',	'213 Hàm Nghi, Đà Nẵng',	2,	4,	4),
('Nguyễn Công Đạo'	,'1994-01-08',	'755434343',	8000000,	'0988767111',	'nguyencongdao12@gmail.com',	'6 Hoà Khánh, Đồng Nai',	2,	3	,2);
;

insert into loai_khach(ten_loai_khach) 
values('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
values
('Nguyễn Thị Hào',	'1970-11-07',	0,	'643431213',	'0945423362', 'thihao07@gmail.com',	'23 Nguyễn Hoàng Đà Nẵng',	5),
('Phạm Xuân Diệu',	'1992-08-08',	1,	'865342123',	'0954333333',	'xuandieu92@gmail.com',	'K77/22 Thái Phiên, Quảng Trị',	3),
('Trương Đình Nghệ',	'1990-02-27'	,1,	'488645199',	'0373213122',	'nghenhan2702@gmail.com',	'K323/12 Ông Ích Khiêm, Vinh',	1),
('Dương Văn Quan', '1981-07-08',	1,	'543432111',	'0490039241',	'duongquan@gmail.com',	'K453/12 Lê Lợi, Đà Nẵng',	1),
('Hoàng Trần Nhi Nhi',	'1995-12-09',	0,	'795453345',	'0312345678','nhinhi123@gmail.com',	'224 Lý Thái Tổ, Gia Lai',	4),
('Tôn Nữ Mộc Châu',	'2005-12-06',	0,	'732434215',	'0988888844',	'tonnuchau@gmail.com',	'37 Yên Thế, Đà Nẵng',	4),
('Nguyễn Mỹ Kim',	'1984-04-08',	0,	'856453123',	'0912345698',	'kimcuong84@gmail.com',	'K123/45 Lê Lợi, Hồ Chí Minh',	1),
('Nguyễn Thị Hào',	'1999-04-08',	0,	'965656433',	'0763212345',	'haohao99@gmail.com	55', 'Nguyễn Văn Linh, Kon Tum',	3),
('Trần Đại Danh',	'1994-07-01',	1,	'432341235',	'0643343433',	'danhhai99@gmail.com',	'24 Lý Thường Kiệt, Quảng Ngãi',	1),
('Nguyễn Tâm Đắc',	'1989-07-01',	1,	'344343432',	'0987654321',	'dactam@gmail.com',	'22 Ngô Quyền, Đà Nẵng',	2);


insert into kieu_thue(ten_kieu_thue)
values('year'),('month'),('day'),('hour');

insert into loai_dich_vu(ten_loai_dich_vu)
values ('Villa'),('House'),('Room');

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
values
('Villa Beach Front',	25000,	10000000,	10,	'vip',	'Có hồ bơi',	500	,4,	3,	1),
('House Princess 01',	14000,	5000000,	7,	'vip',	'Có thêm bếp nướng',	null,	3,	2,	2),
('Room Twin 01',	5000,	1000000,	2,	'normal',	'Có tivi',	null	,null	,4,	3),
('Villa No Beach Front',	22000,	9000000,	8,	'normal',	'Có hồ bơi',	300,	3	,3,	1),
('House Princess 02',	10000,	4000000,	5,	'normal',	'Có thêm bếp nướng',	null,	2	,3,	2),
('Room Twin 02',	3000,	900000,	2,	'normal',	'Có tivi',	null,	null,	4,	3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
values ('Karaoke',	10000,	'giờ',	'tiện nghi, hiện tại'),
('Thuê xe máy',	10000,	'chiếc',	'hỏng 1 xe'),
('Thuê xe đạp',	20000,	'chiếc',	'tốt'),
('Buffet buổi sáng',	15000,	'suất',	'đầy đủ đồ ăn,tráng miệng'),
('Buffet buổi trưa',	90000,	'suất',	'đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối',	16000,	'suất',	'đầy đủ đồ ăn, tráng miệng');

insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values 
('2020-12-08',	'2020-12-08',	0,	3,	1,	3),
('2020-07-14',	'2020-07-21',	200000,	7,	3,	1),
('2021-03-15',	'2021-03-17',	50000,	3,	4,	2),
('2021-01-14',	'2021-01-18',	100000,	7,	5,	5),
('2021-07-14',	'2021-07-15',	0,	7,	2,	6),
('2021-06-01',	'2021-06-03',	0,	7,	7,	6),
('2021-09-02',	'2021-09-05',	100000,	7,	4,	4),
('2021-06-17',	'2021-06-18',	150000,	3,	4,	1),
('2020-11-19',	'2020-11-19',	0,	3,	4,	3),
('2021-04-12',	'2021-04-14',	0,	10,	3,	5),
('2021-04-25',	'2021-04-25',	0,	2,	2,	1),
('2021-05-25',	'2021-05-27',	0,	7,	10,	1);



insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
values 
(5,	 2,	4),
(8,	 2,	5),
(15, 2,	6),
(1,	 3,	1),
(11, 3,	2),
(1,	 1,	3),
(2,	 1,	2),
(2,	12,	2);
drop database case_study;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select nhan_vien.*
from nhan_vien
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and length(ho_ten) <=15;


select * from nhan_vien
where (substring_index(ho_ten,' ',-1) like 'H%' or  -- hàm substring_index(s, d, n) sẽ trả về phần cuối cùng của chuỗi 's' sau khi phân tách bằng dấu cách 'd' lần thứ 'n' từ đầu chuỗi.
substring_index(ho_ten,' ',-1) like 'T%' or --  tham số thứ ba là một số âm để chỉ định rằng chúng ta muốn trích xuất phần tử từ phải sang trái. Ví dụ, nếu lấy -1 thì nó sẽ trả về phần tử cuối cùng trong chuỗi
substring_index(ho_ten,' ',-1) like 'K%') and
char_length(substring_index(ho_ten,' ',-1)) <= 15 ;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang -- sử dụng hàm `TIMESTAMPDIFF(year, ngay_sinh, CURDATE())`, nó tính toán số năm giữa ngày sinh và ngày hiện tại.
where timestampdiff(year,ngay_sinh,NOW()) between 18 and 50 --  CURDATE() > trả về ngày, now > ngày+giờ 
and dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%';

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang,kh.ho_ten, count(hd.ma_khach_hang) as 'So lan dat phong' -- hiểu : số khách hàng đã làm hợp đồng
from khach_hang kh
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang -- nhóm theo hd.ma_khach_hang cũng dc (mã kh đã tạo hd = hd đã tạo vs khách hàng )
order by count(hd.ma_khach_hang);

-- 

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). 

select kh.ma_khach_hang , kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu , hd.ngay_lam_hop_dong, hd.ngay_ket_thuc
,dv.chi_phi_thue + sum( hdct.so_luong * dvdk.gia)  as 'tong tien'
from loai_khach lk
left join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc;
-- Trong trường hợp của bạn, cần phải group by nhiều trường như vậy vì bạn đang tính tổng tiền cho từng khách hàng, loại khách hàng, hợp đồng, dịch vụ, ngày làm hợp đồng và ngày kết thúc.
-- Khi bạn chỉ group by kh.ma_khach_hang, bạn không đủ thông tin để xác định các trường còn lại trong SELECT statement và nên gây ra lỗi.

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),0) as tong_tien-- nếu giá trị của biểu thức "dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia)" là null, thì hàm IFNULL sẽ trả về giá trị 0 (expr2). Nếu giá trị không phải null, thì giá trị của biểu thức sẽ được trả về.
 from loai_khach lk left join khach_hang kh on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc; 

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng  thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2,3) 

select dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,dv.ten_dich_vu,ldv.ten_loai_dich_vu
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (select dv.ma_dich_vu 
				  from hop_dong hd
                  where hd.ma_dich_vu = dv.ma_dich_vu
				  and year(hd.ngay_lam_hop_dong) = 2021
				  and quarter(hd.ngay_lam_hop_dong) = 1)
group by dv.ma_dich_vu;
                    

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where not exists( select hd.ngay_lam_hop_dong from hop_dong hd -- Nếu không có bất kỳ hàng nào thỏa mãn điều kiện này, mệnh đề NOT EXISTS sẽ trả về TRUE và các bản ghi tương ứng sẽ được lựa chọn. Ngược lại, nếu có bất kỳ hàng nào thỏa mãn điều kiện, mệnh đề NOT EXISTS sẽ trả về FALSE và các bản ghi tương ứng sẽ không được lựa chọn.
where hd.ma_dich_vu=dv.ma_dich_vu and 						   -- Vì vậy, trong trường hợp này, câu truy vấn trả về các dịch vụ có mã ma_dich_vu, tên_dich_vu, dien_tich, chi_phi_thue và ten_loai_dich_vu mà không có bất kỳ hợp đồng nào được thực hiện trong quý 1 năm 2021.
year(hd.ngay_lam_hop_dong) = 2021 and
quarter(hd.ngay_lam_hop_dong) = 1)
group by dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu;

-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
-- cach 1
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where not exists (
	select dv1.ma_dich_vu from dich_vu dv1 -- Bảng tạm thời "dv1" chứa thông tin về các dịch vụ đã được thuê trong năm 2021.
	join hop_dong hd on hd.ma_dich_vu = dv1.ma_dich_vu -- so sánh mã dịch vụ của bảng tạm thời "dv1" với mã dịch vụ của bảng "dich_vu
	where year(hd.ngay_lam_hop_dong) = 2021 and dv1.ma_dich_vu = dv.ma_dich_vu) 
and exists (
	select dv1.ma_dich_vu from dich_vu dv1
	join hop_dong hd on hd.ma_dich_vu = dv1.ma_dich_vu
	where year(hd.ngay_lam_hop_dong) = 2020 and dv1.ma_dich_vu = dv.ma_dich_vu
    )
group by dv.ma_dich_vu;

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where not exists(
	select dv1.ma_dich_vu from dich_vu dv1 join hop_dong hd on dv1.ma_dich_vu = hd.ma_dich_vu
    where dv1.ma_dich_vu = dv.ma_dich_vu and year(hd.ngay_lam_hop_dong = 2021)
)and exists (
	select dv1.ma_dich_vu from dich_vu dv1
	join hop_dong hd on hd.ma_dich_vu = dv1.ma_dich_vu
	where year(hd.ngay_lam_hop_dong) = 2020 and dv1.ma_dich_vu = dv.ma_dich_vu
    )
group by dv.ma_dich_vu;


-- cach 2 
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in(
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021) 
and dv.ma_dich_vu in(
select dv.ma_dich_vu from dich_vu dv
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020)
group by dv.ma_dich_vu;

-- 8 .Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

 select distinct kh.ho_ten from khach_hang kh;

 select ho_ten , count(ho_ten) from khach_hang 
 group by ho_ten;
 
 -- trung nhau
SELECT kh.ho_ten,count(kh.ho_ten) as 'số lần trùng nhau '
 FROM khach_hang kh 
GROUP BY kh.ho_ten
HAVING COUNT(*) > 1; 

-- 9  thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as 'Tháng', count(month(hd.ngay_lam_hop_dong)) as 'Số lượng khách hàng'
from hop_dong hd where year(hd.ngay_lam_hop_dong)=2021
group by month(hd.ngay_lam_hop_dong)
ORDER BY MONTH(hd.ngay_lam_hop_dong) ASC;


 -- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, 
 -- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as 'Số lượng dịch vụ đi kèm'
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong;


select hd.ma_hop_dong , hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,hd.tien_dat_coc, sum(hdct.so_luong) as 'so luong dich vu di kem (on hdct)'
from hop_dong hd 
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
group by hd.ma_hop_dong; 



-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
-- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem , lk.ten_loai_khach
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach like 'Diamond' and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%')
group by dvdk.ma_dich_vu_di_kem,lk.ten_loai_khach;

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem 
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh
on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach like 'Diamond' and
(substring_index(kh.dia_chi,', ',-1) like 'Vinh'
or substring_index(kh.dia_chi,', ',-1) like 'Quảng Ngãi')
group by dvdk.ma_dich_vu_di_kem;


-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong , nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as 'so_luong_dich_vu_di_kem',sum(hd.tien_dat_coc) as 'tien dat coc'
from hop_dong hd join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where not exists(select dv.*
				from dich_vu dv2
                join hop_dong hd on dv2.ma_dich_vu = hd.ma_dich_vu
                where dv2.ma_dich_vu = hd.ma_dich_vu 
                and  year(hd.ngay_lam_hop_dong) = 2021 and (quarter(hd.ngay_lam_hop_dong) = 1 and quarter(hd.ngay_lam_hop_dong) = 2)
)
and   exists(select dv.*
				from dich_vu dv2 
                join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
                where dv2.ma_dich_vu = hd.ma_dich_vu 
                and  (year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) = 4)
)
group by hd.ma_hop_dong;


select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) as 'so_luong_dich_vu_di_kem', sum(hd.tien_dat_coc) as tien_dat_coc
from hop_dong hd join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where dv.ma_dich_vu not in (
	select dv.*
    from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
    where year(hd.ngay_lam_hop_dong) = 2021 and (quarter(hd.ngay_lam_hop_dong) = 1 and quarter(hd.ngay_lam_hop_dong) = 2)
)
and dv.ma_dich_vu in (
	select dv.*
    from dich_vu dv join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
    where (year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) = 4)
)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as 'số lần dịch vụ đi kèm được sử dụng'
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
order by sum(hdct.so_luong) desc
limit 2;

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem  
order by sum(hdct.so_luong) desc;


select max(hdct.so_luong) as so_luong_dich_vu_di_kem
 from hop_dong_chi_tiet hdct
group by hdct.ma_dich_vu_di_kem;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, 
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, ldv.ten_loai_dich_vu , dvdk.ten_dich_vu_di_kem, count(hdct.so_luong)
from loai_dich_vu ldv join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;


select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(*) as so_lan_su_dung
from loai_dich_vu ldv join dich_vu dv
on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd 
on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem) = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from trinh_do td join nhan_vien nv
on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp 
on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

DELETE FROM nhan_vien nv
WHERE NOT EXISTS
( SELECT hd.* FROM hop_dong hd
WHERE hd.ma_nhan_vien = nv.ma_nhan_vien
AND year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);

DELETE FROM nhan_vien nv
WHERE nv.ma_nhan_vien NOT IN 
( SELECT hd.ma_nhan_vien FROM hop_dong hd 
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);




select kh.ma_khach_hang, kh.ho_ten, kh.ma_loai_khach
from khach_hang kh join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv 
on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where kh.ma_loai_khach != 1
group by kh.ma_khach_hang
having sum(dv.chi_phi_thue + (hdct.so_luong + dvdk.gia)) >= 10000000;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
	UPDATE khach_hang
	SET ma_loai_khach = (SELECT ma_loai_khach FROM loai_khach WHERE ten_loai_khach = 'Diamond')
	WHERE ma_khach_hang IN (SELECT ma_khach_hang FROM hop_dong WHERE YEAR(ngay_lam_hop_dong) = 2021 
	GROUP BY ma_khach_hang
	HAVING SUM(tien_dat_coc) > 10000000) ;
    
    UPDATE khach_hang 
    SET khach_hang.ma_loai_khach = (SELECT lk.ma_loai_khach  FROM loai_khach lk  WHERE lk.ten_loai_khach = 'Diamond')
    WHERE khach_hang.ma_khach_hang IN (SELECT khach_hang.ma_khach_hang  FROM hop_dong hd  WHERE YEAR(ngay_lam_hop_dong) = 2021
    AND hd.tien_dat_coc > 10000000);
    
    -- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
DELETE from khach_hang kh
where exists (
select hd.* from hop_dong hd
where kh.ma_khach_hang = hd.ma_khach_hang and year(hd.ngay_lam_hop_dong) < 2021
);

select kh.ma_khach_hang, kh.ho_ten
from khach_hang kh join hop_dong hd
on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) < 2021
group by kh.ma_khach_hang;


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select nv.ma_nhan_vien as 'Ma NV & KH',nv.ho_ten,nv.email,nv.so_dien_thoai,nv.ngay_sinh,nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang,kh.ho_ten,kh.email,kh.so_dien_thoai,kh.ngay_sinh,kh.dia_chi
from khach_hang kh;

