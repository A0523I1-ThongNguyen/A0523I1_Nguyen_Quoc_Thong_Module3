create database bt_2_1;
use bt_2_1;

create table phieu_xuat(
so_phieuxuat int primary key ,
ngay_xuat date
);

create table vat_tu(
ma_vtu int primary key,
ten_vtu varchar(50)
);

create table phieuxuat_vattu(
so_px int,
ma_vt int,
dg_xuat varchar(50),
sl_xuat int,
primary key(so_px,ma_vt),
foreign key(so_px) references phieu_xuat(so_phieuxuat),
foreign key(ma_vt) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);

create table vattu_phieunhap(
ma_vt int,
so_pn int,
dg_nhap varchar(50),
sl_nhap int,
primary key(ma_vt, so_pn),
foreign key(ma_vt) references vat_tu(ma_vtu),
foreign key(so_pn) references phieu_nhap(so_phieu_nhap)
);

create table nha_cung_cap(
ma_nhacc int primary key,
ten_nhacc varchar(50),
diachi varchar(50)
);

create table don_dat_hang(
so_dhang int primary key,
ngay_dhang date, 
kn_ma_nhacc int ,
foreign key (kn_ma_nhacc) references nha_cung_cap(ma_nhacc) -- mỗi nhà cung cấp có thể có nhiều đơn đặt hàng, trong khi mỗi đơn đặt hàng chỉ thuộc về duy nhất một nhà cung cấp.
);

create table vattu_dondathang(
	ma_vt int,
    so_dh int,
    primary key(ma_vt,so_dh),
    foreign key(ma_vt) references vat_tu(ma_vtu),
    foreign key(so_dh) references don_dat_hang(so_dhang)
);
 

create table sdt(
MaNCC int auto_increment,
SDT varchar(20),
foreign key(mancc) references nha_cung_cap(ma_nhacc)
);

