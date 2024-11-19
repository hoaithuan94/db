
DROP DATABASE IF EXISTS QuanLyThiTotNghiep;
CREATE DATABASE QuanLyThiTotNghiep;

USE QuanLyThiTotNghiep;


CREATE TABLE Truong (
   matrg CHAR(3) NOT NULL UNIQUE,
   tentruong VARCHAR(30),
    
   CONSTRAINT Truong_pk PRIMARY KEY(matrg)
);

CREATE TABLE ThiSinh (
   sobd CHAR(5), 
   hoten VARCHAR(50), 
   ngaysinh DATE, 
   noisinh VARCHAR(20),
   matrg CHAR(3),
    
    CONSTRAINT ThiSinh_pk PRIMARY KEY(sobd),
    CONSTRAINT ThiSinh_matrg_fk FOREIGN KEY(matrg) REFERENCES Truong(matrg)
    
);

CREATE TABLE MonThi(
    mamt CHAR(2),
    tenmt VARCHAR(20),
    
    CONSTRAINT MonThi_pk PRIMARY KEY(mamt)
);

CREATE TABLE KetQua(
    sobd CHAR(5),
    mamt CHAR(2),
    diem FLOAT,
    gchu VARCHAR(20),
    
    CONSTRAINT KetQua_pk PRIMARY KEY(sobd,mamt),
    CONSTRAINT KetQua_sobd_fk FOREIGN KEY(sobd) REFERENCES ThiSinh(sobd),
    CONSTRAINT KetQua_mamt_fk FOREIGN KEY(mamt) REFERENCES MonThi(mamt)
    
);



# Thêm dữ liệu vào bảng Truong
INSERT INTO Truong 
VALUES 
('016','Lê Hồng Phong'),
('017','Nguyễn Thị Minh Khai'),
('018','Nguyễn Khuyến'),
('019','Nguyễn Thị Một');


# Thêm dữ liệu vào bảng ThiSinh
INSERT INTO ThiSinh 
VALUES
('19101', 'Nguyễn Lan Anh', '2005-02-16','HCM','016'),
('19102', 'Lê Hoài Thương', '2005-04-21','HCM','016'),
('19103', 'Nguyễn Trung Hiếu', '2005-06-08','HCM','017'),
('19104', 'Phạm Minh Chính', '2005-07-11','Long An','018'),
('19105', 'Lê Phước Hậu', '2005-11-29','Long An','018'),
('19106', 'Bùi Thị Trọng', '2005-12-14','Cần Thơ','019');
	


# Thêm dữ liệu vào bảng MonThi
INSERT INTO MonThi 
VALUES 
('DL','Địa lý'),
('HH','Hóa học'),
('VL','Vật lý'),
('NN','Ngoại ngữ'),
('SH','Sinh học'),
('LS','Lịch sử'),
('TH','Toán học'),
('VH','Văn học');



# Thêm dữ liệu vào bảng KetQua
INSERT INTO KetQua 
VALUES 
('19101','DL',8.5,''),
('19101','HH',5.0,''),	
('19101','VL',3.5,''),
('19101','LS',4.5,''),
('19101','TH',5.0,''),
('19101','VH',6.5,''),
('19102','DL',9.0,''),
('19102','HH',7.0,''),	
('19102','VL',8.5,''),
('19102','LS',8.0,''),
('19102','TH',8.0,''),
('19102','VH',9.5,''),
('19103','DL',0.0,'VT'),
('19103','HH',0.0,'VT'),	
('19103','VL',0.0,'VT'),
('19103','LS',0.0,'VT'),
('19103','TH',0.0,'VT'),
('19103','VH',0.0,'VT'),
('19104','DL',9.0,''),
('19104','HH',7.0,''),	
('19104','VL',7.5,''),
('19104','LS',9.0,''),
('19104','TH',8.0,''),
('19104','VH',9.0,''),
('19105','DL',5.5,''),
('19105','HH',1.0,''),	
('19105','VL',2.0,''),
('19105','LS',5.5,''),
('19105','TH',0.0,''),
('19105','VH',6.5,''),
('19106','DL',0.0,'VT'),
('19106','HH',10.0,''),
('19106','VL',10.0,''),
('19106','LS',10.0,''),
('19106','TH',10.0,''),
('19106','VH',9.5,'');


#....





