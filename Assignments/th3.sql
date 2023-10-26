DROP DATABASE IF EXISTS QUANLYBANHANG;
CREATE DATABASE IF NOT EXISTS QUANLYBANHANG 
CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
USE QUANLYBANHANG;

CREATE TABLE KHACHHANG (
	MAKH CHAR(4),
    HOTEN VARCHAR(50),
    DCHI VARCHAR(20),
    SODT VARCHAR(20),
    NGSINH DATE,
    DOANHSO DECIMAL(10,3),
    NGDK DATE
);

CREATE TABLE NHANVIEN (
	MANV	CHAR(4), 
    HOTEN	VARCHAR(50),
    SODT	VARCHAR(20),
    NGVL	DATE
);

CREATE TABLE SANPHAM(
	MASP	CHAR(4),
    TENSP	VARCHAR(40),
    DVT		VARCHAR(20),
    NUOCSX	VARCHAR(40),
    GIA		DECIMAL(6,3)
);

CREATE TABLE HOADON (
	SOHD INT, 
    NGHD DATETIME,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA DECIMAL(10,3)
);

CREATE TABLE CTHD (
	SOHD	INT,
    MASP	CHAR(4),
    SL		INT
);


-- SINH VIÊN TỰ KHAI BÁO CÁC KHÓA CHÍNH VÀ KHÓA NGOẠI
# ...



-- THÊM DỮ LIỆU VÀO BẢNG NHANVIEN
INSERT INTO NHANVIEN VALUES
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

-- THÊM DỮ LIỆU VÀO BẢNG KHACHHANG
INSERT INTO KHACHHANG VALUES
('KH01','Nguyễn Thành Nam','HCM','0398451950','2003-10-20',13060.000,'2022-07-22'),
('KH02','Trần Ngọc Nga','Long An','0908256478','1994-04-03','980.000','2022-07-30'),
('KH03','Vũ Quang Minh','HCM','0938776266','1999-06-12','3860.000','2022-08-05'),
('KH04','Trần Thành Long','Dong Thap','0917325476','1995-03-09','250.000','2022-10-02'),
('KH05','Lê Nhật Hào','Can Tho','0390164901','2000-03-10','821.000','2022-10-28'),
('KH06','Nguyễn Thành Luân','HCM','0896317388','1999-12-31','915.000','2022-11-24'),
('KH07','Nguyễn Thành Tài','An Giang','0916783565','2003-04-06','529.500','2022-12-01'),
('KH08','Trần Đăng Khoa','HCM', '0938435706','2002-01-10','365.000','2022-12-13'),
('KH09','Nguyễn Thị Trà My','Long An','0397628492','1998-09-03','710.000','2023-01-14'),
('KH10','Đặng Thế Anh','HCM','0993810503','2003-05-02','667.500','2023-01-16'),
('KH11','Trần Minh Quân','Long An','0976510590','2000-01-05','15167.000','2020-01-01'),
('KH12','Lê Phước Hải','An Giang','0976511762','1999-09-29','3861.000','2022-10-20'),
('KH13','Đoàn Thị Kiều Nga','Tây Ninh','09765990877','1991-12-11','8876.000','2020-12-28'),
('KH14','Bùi Quang Trung','HCM','0976589062','2001-08-01','10177.000','2021-02-19'),
('KH15','Trịnh Minh Anh','Cần Thơ','0976575479','1990-02-27','9752.000','2021-06-01');

-- THÊM DỮ LIỆU VÀO BẢNG SANPHAM
INSERT INTO SANPHAM VALUES
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

-- THÊM DỮ LIỆU VÀO BẢNG HOADON
INSERT INTO HOADON VALUES
(1001,'2022-07-23','KH01','NV01',320.000),
(1002,'2022-08-12','KH01','NV02',840.000),
(1003,'2022-08-23','KH02','NV01',100.000),
(1004,'2022-09-01','KH02','NV01',180.000),
(1005,'2022-10-20','KH01','NV02',3800.000),
(1006,'2022-10-16','KH01','NV03',2430.000),
(1007,'2022-10-28','KH03','NV03',510.000),
(1008,'2022-10-28','KH01','NV03',440.000),
(1009,'2022-10-28','KH03','NV04',200.000),
(1010,'2022-11-01','KH01','NV01',5200.000),
(1011,'2022-11-04','KH04','NV03',250.000),
(1012,'2022-11-30','KH05','NV03',21.000),
(1013,'2022-12-12','KH06','NV01',5.000),
(1014,'2022-12-31','KH03','NV02',3150.000),
(1015,'2023-01-01','KH06','NV01',910.000),
(1016,'2023-01-01','KH07','NV02',12.500),
(1017,'2023-01-02','KH08','NV03',35.000),
(1018,'2023-01-13','KH08','NV03',330.000),
(1019,'2023-01-13','KH01','NV03',30.000),
(1020,'2023-01-14','KH09','NV04',70.000),
(1021,'2023-01-16','KH10','NV03',67.500),
(1022,'2023-01-16',NULL,'NV03',7.000),
(1023,'2023-01-17',NULL,'NV01',330.000);

-- THÊM DỮ LIỆU VÀO BẢNG CTHD
INSERT INTO CTHD VALUES
(1001,'TV02',10),
(1001,'ST01',5),
(1001,'BC01',5),
(1001,'BC02',10),
(1001,'PB03',10),
(1002,'BC04',20),
(1002,'BB01',20),
(1002,'BB02',20),
(1003,'BB03',10),
(1004,'TV01',20),
(1004,'TV02',10),
(1004,'TV03',10),
(1004,'TV04',10),
(1005,'TV05',50),
(1005,'TV06',50),
(1006,'TV07',20),
(1006,'ST01',30),
(1006,'ST02',10),
(1007,'ST03',10),
(1008,'ST04',8),
(1009,'ST05',10),
(1010,'TV07',50),
(1010,'PB02',50),
(1010,'PB03',100),
(1010,'ST04',50),
(1010,'TV03',100),
(1011,'PB01',50),
(1012,'PB02',3),
(1013,'PB03',5),
(1014,'BC02',80),
(1014,'BB02',100),
(1014,'BC04',60),
(1014,'BB01',50),
(1015,'BB02',30),
(1015,'BB03',7),
(1016,'TV01',5),
(1017,'TV02',1),
(1017,'TV03',1),
(1017,'TV04',5),
(1018,'ST04',6),
(1019,'ST05',1),
(1019,'PB01',2),
(1020,'PB02',10),
(1021,'PB03',5),
(1021,'TV01',7),
(1021,'TV02',10),
(1022,'PB02',1),
(1023,'ST04',6),
(1023,'BC03',10);



# ...
