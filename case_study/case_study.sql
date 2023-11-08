create database case_study;
use case_study;

-- qh 1nv - nhieu vt,td,bp
create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45) not null unique
);

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45)not null unique
);

create table bo_phan(
ma_bo_phan int primary key auto_increment,
ten_bo_phan	varchar(45) not null unique
);

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45) unique,
luong double,
so_dien_thoai varchar(45) unique,
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
    ho_ten varchar(50),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45) unique,
    so_dien_thoai varchar(45) unique,
    email varchar(45) unique,
    dia_chi varchar(45),
    ma_loai_khach int,
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

-- hợp đồng 1 - n nhan_vie, 1-n khach_hang , 1 - n dich_vu, n-n dich_vu_di_kem
create table hop_dong (

);