DROP DATABASE IF EXISTS QuanLyBanHang;
CREATE DATABASE IF NOT EXISTS QuanLyBanHang 
CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE QuanLyBanHang;

CREATE TABLE KhachHang (
	makh CHAR(4),
    hoten VARCHAR(50),
    dchi VARCHAR(20),
    sdt VARCHAR(20),
    ngsinh DATE,
    doanhso DECIMAL(10,3),
    ngdk DATE
);

CREATE TABLE NhanVien (
	manv	CHAR(4), 
    hoten	VARCHAR(50),
    sdt	VARCHAR(20),
    ngvl	DATE
);

CREATE TABLE SanPham(
	masp	CHAR(4),
    tensp	VARCHAR(40),
    dvt		VARCHAR(20),
    nuocsx	VARCHAR(40),
    gia		DECIMAL(6,3)
);

CREATE TABLE HoaDon (
	sohd    INT, 
    nghd    DATETIME,
    makh    CHAR(4),
    manv    CHAR(4),
    trigia  DECIMAL(10,3)
);

CREATE TABLE CTHD (
	sohd	INT,
    masp	CHAR(4),
    sl		INT
);


-- Sinh viên tự khai báo các khóa chính và khóa ngoại
# ...



-- Thêm dữ liệu vào bảng NhanVien
INSERT INTO NhanVien VALUES
('NV01','Nguyễn Lan Anh','0392351468','2022-02-16'),
('NV02','Lê Hoài Thương','0987567390','2022-04-21'),
('NV03','Bùi Thị Ngọc Hân','0997047382','2022-04-27'),
('NV04','Vũ Minh Quân','0913758498','2023-01-10'),
('NV05','Nguyễn Thị Trúc Thanh','0918590387','2022-07-20'),
('NV06','Trần Hào Nam','0918566552','2021-12-21'),
('NV07','Nguyễn Minh Tân','0911220388','2023-01-01'),
('NV08','Lê Thị Nga','0918599007','2023-01-29'),
('NV09','Trần Văn Hào','0907255211','2020-06-08'),
('NV10','Nguyễn Quốc Hoàng','0918599662','2020-11-08');

-- Thêm dữ liệu vào bảng KhachHang
INSERT INTO KhachHang VALUES
('KH01','Nguyễn Văn Nam','HCM','0398451950','2003',13060.000,'2022-07-22'),
('KH02','Trần Ngọc Nga','Long An','0908256478','1994','980.000','2022-07-30'),
('KH03','Vũ Quang Minh','HCM','0938776266','1999','3860.000','2022-08-05'),
('KH04','Trần Thành Long','Dong Thap','0917325476','1995','250.000','2022-10-02'),
('KH05','Lê Nhật Hào','Can Tho','0390164901','2000','821.000','2022-10-28'),
('KH06','Nguyễn Thành Luân','HCM','0896317388','1999','915.000','2022-11-24'),
('KH07','Nguyễn Thành Tài','An Giang','0916783565','2003','529.500','2022-12-01'),
('KH08','Trần Đăng Khoa','HCM', '0938435706','2002','365.000','2022-12-13'),
('KH09','Bùi Thị Trà My','Long An','0397628492','1998','710.000','2023-01-14'),
('KH10','Đặng Thế Anh','HCM','0993810503','2003','667.500','2023-01-16'),
('KH11','Trần Minh Quân','Long An','0976510590','2000','15167.000','2020-01-01'),
('KH12','Lê Phước Hải','An Giang','0976511762','1999','3861.000','2022-10-20'),
('KH13','Lê Thị Kiều Nga','Tây Ninh','0976599087','1991','8876.000','2020-12-28'),
('KH14','Bùi Quang Trung','HCM','0976589062','2001','10177.000','2021-02-19'),
('KH15','Trịnh Minh Anh','Cần Thơ','0976575479','1990','9752.000','2021-06-01');

-- Thêm dữ liệu vào bảng SanPham
INSERT INTO SanPham VALUES
('BC01','Bút chì','cây','Singapore',3.000),
('BC02','Bút chì','cây','Singapore',5.000),
('BC03','Bút chì','cây','Việt Nam',3.500),
('BC04','Bút chì','hộp','Việt Nam',30.000),
('BB01','Bút bi','cây','Việt Nam',5.000),
('BB02','Bút bi','cây','Trung Quốc',7.000),
('BB03','Bút bi','hộp','Thái Lan',100.000),
('TV01','Tập 100 giấy mỏng','quyển','Trung Quốc',2.500),
('TV02','Tập 200 giấy mỏng','quyển','Trung Quốc',4.500),
('TV03','Tập 100 giấy tốt','quyển','Việt Nam',3.000),
('TV04','Tập 200 giấy tốt','quyển','Việt Nam',5.500),
('TV05','Tập 100 trang','chục','Việt Nam',23.000),
('TV06','Tập 200 trang','chục','Việt Nam',53.000),
('TV07','Tập 100 trang','chục','Trung Quốc',34.000),
('ST01','Sổ tay 500 trang','quyển','Trung Quốc',40.000),
('ST02','Sổ tay loại 1','quyển','Việt Nam',55.000),
('ST03','Sổ tay loại 2','quyển','Việt Nam',51.000),
('ST04','Sổ tay tốt','quyển','Thái Lan',55.000),
('ST05','Sổ tay mỏng','quyển','Thái Lan',20.000),
('PB01','Phấn viết bảng','hộp','Việt Nam',5.000),
('PB02','Phấn không bụi','hộp','Việt Nam',7.000),
('PB03','Bông bảng','cái','Việt Nam',1.000),
('BL01','Bút lông','cây','Việt Nam',5.000),
('BL02','Bút lông','cây','Trung Quốc',7.000);

-- Thêm dữ liệu vào bảng HOADON
INSERT INTO HOADON VALUES
(101,'2022-07-23','KH01','NV01',320.000),
(102,'2022-08-12','KH01','NV02',840.000),
(103,'2022-08-23','KH02','NV01',100.000),
(104,'2022-09-01','KH02','NV01',180.000),
(105,'2022-10-20','KH01','NV02',3800.000),
(106,'2022-10-16','KH01','NV03',2430.000),
(107,'2022-10-28','KH03','NV03',510.000),
(108,'2022-10-28','KH01','NV03',440.000),
(109,'2022-10-28','KH03','NV04',200.000),
(110,'2022-11-01','KH01','NV01',5200.000),
(111,'2022-11-04','KH04','NV03',250.000),
(112,'2022-11-30','KH05','NV03',21.000),
(113,'2022-12-12','KH06','NV01',5.000),
(114,'2022-12-31','KH03','NV02',3150.000),
(115,'2023-01-01','KH06','NV01',910.000),
(116,'2023-01-01','KH07','NV02',12.500),
(117,'2023-01-02','KH08','NV03',35.000),
(118,'2023-01-13','KH08','NV03',330.000),
(119,'2023-01-13','KH01','NV03',30.000),
(120,'2023-01-14','KH09','NV04',70.000),
(121,'2023-01-16','KH10','NV03',67.500),
(122,'2023-01-16',NULL,'NV03',7.000),
(123,'2023-01-17',NULL,'NV01',330.000);

-- Thêm dữ liệu vào bảng CTHD
INSERT INTO CTHD VALUES
(101,'TV02',10),
(101,'ST01',5),
(101,'BC01',5),
(101,'BC02',10),
(101,'PB03',10),
(102,'BC04',20),
(102,'BB01',20),
(102,'BB02',20),
(103,'BB03',10),
(104,'TV01',20),
(104,'TV02',10),
(104,'TV03',10),
(104,'TV04',10),
(105,'TV05',50),
(105,'TV06',50),
(106,'TV07',20),
(106,'ST01',30),
(106,'ST02',10),
(107,'ST03',10),
(108,'ST04',8),
(109,'ST05',10),
(110,'TV07',50),
(110,'PB02',50),
(110,'PB03',100),
(110,'ST04',50),
(110,'TV03',100),
(111,'PB01',50),
(112,'PB02',3),
(113,'PB03',5),
(114,'BC02',80),
(114,'BB02',100),
(114,'BC04',60),
(114,'BB01',50),
(115,'BB02',30),
(115,'BB03',7),
(116,'TV01',5),
(117,'TV02',1),
(117,'TV03',1),
(117,'TV04',5),
(118,'ST04',6),
(119,'ST05',1),
(119,'PB01',2),
(120,'PB02',10),
(121,'PB03',5),
(121,'TV01',7),
(121,'TV02',10),
(122,'PB02',1),
(123,'ST04',6),
(123,'BC03',10);



# ...
