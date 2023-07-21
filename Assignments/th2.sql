DROP DATABASE IF EXISTS QUANLYGIAOVU;
CREATE DATABASE IF NOT EXISTS QUANLYGIAOVU 
CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE QUANLYGIAOVU;

CREATE TABLE HOCVIEN(
	MAHV CHAR(5),
    HO VARCHAR(40),
    TEN VARCHAR(10),
    NGSINH DATE,
    GIOITINH VARCHAR(3),
    NOISINH VARCHAR(50),
    
    CONSTRAINT HV_MHV_PK PRIMARY KEY(MAHV)
);

CREATE TABLE GIAOVIEN(
	MAGV CHAR (4),
	HOTEN VARCHAR (40),
	HOCVI VARCHAR (10),
	HOCHAM VARCHAR (10),
	GIOITINH VARCHAR (3),
	NGSINH DATE,
	NGVL DATE,
	HESO DECIMAL(2,1),
	LUONG DECIMAL(8,3),
    
	CONSTRAINT GV_MGV_PK PRIMARY KEY(MAGV)

);

CREATE TABLE LOP(
	MALOP CHAR(3),
    TENLOP VARCHAR(40),
    TRGLOP CHAR(5),
    SISO TINYINT,
    MAGVCN CHAR(4),
    
    CONSTRAINT LOP_ML_PK PRIMARY KEY(MALOP),
    CONSTRAINT LOP_MGV_FK FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV),
	CONSTRAINT LOP_MHV_FK FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
);


CREATE TABLE KHOA(
	MAKHOA VARCHAR(4),
	TENKHOA VARCHAR(40),
	NGTLAP DATE,
	TRGKHOA CHAR(4),
    
	CONSTRAINT KHOA_MK_PK PRIMARY KEY(MAKHOA),
	CONSTRAINT FK_TRGKHOA FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
);

CREATE TABLE MONHOC(
	MAMH VARCHAR(10),
	TENMH VARCHAR(40),
	TCTL TINYINT ,
	TCTH TINYINT,
	MAKHOA VARCHAR(4),
    
	CONSTRAINT MH_MMH_PK PRIMARY KEY (MAMH),
	CONSTRAINT MH_MK_FK FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
);

CREATE TABLE DIEUKIEN (
	MAMH VARCHAR(10),
	MAMH_TRUOC VARCHAR(10),
    
    
    CONSTRAINT DK_PK PRIMARY KEY (MAMH, MAMH_TRUOC),
    
	CONSTRAINT DK_MMH_FK FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH),
	CONSTRAINT DK_MMHT_FK FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
);



CREATE TABLE GIANGDAY(
	MALOP CHAR(3),
    MAMH VARCHAR(10),
    MAGV CHAR(4),
    HOCKY TINYINT,
    NAM INT,
    TUNGAY DATE,
    DENNGAY DATE,
    
    CONSTRAINT GD_PK PRIMARY KEY (MALOP, MAMH),
    
    CONSTRAINT GD_ML_FK FOREIGN KEY(MALOP) REFERENCES LOP(MALOP),
    CONSTRAINT GD_MAMH_FK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
    CONSTRAINT GD_MGV_FK FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
);

CREATE TABLE KETQUATHI(
	MAHV CHAR(5),
    MAMH VARCHAR(10),
    LANTHI TINYINT,
    NGTHI DATE,
    DIEM DECIMAL(4,2),
    KETQUA VARCHAR(10),
    
    CONSTRAINT KQ_PK PRIMARY KEY(MAHV,MAMH,LANTHI),
    
    CONSTRAINT KQ_MMH_FK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH),
    CONSTRAINT KQ_MHV_FK FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
);


-- Thêm dữ liệu cho bảng HOCVIEN
INSERT INTO HOCVIEN(MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH) VALUES
('K1101', 'Nguyễn Đức', 'Anh', '2003-1-27', 'Nam', 'HCM'),
('K1102' ,'Trần Thiên','Bảo' ,'2003-3-14' ,'Nam', 'Kiên Giang'),
('K1103','Nguyễn Kim','Biên','2003-4-18','Nam','Cần Thơ'),
('K1104','Lê Quang','Linh','2003-8-30','Nam','Tây Ninh'),
('K1105','Nguyễn Kim','Ngân','2003-2-27', 'Nữ', 'HCM'),
('K1106','Hoàng Kim','Minh','2003-11-24','Nam','HCM'),
('K1107','Trần Hữu','Nhân','2003-1-21','Nam','Đồng Nai'),
('K1108','Nguyễn Thanh','Tâm', '2003-6-16','Nam', 'Kiên Giang'),
('K1109', 'Bùi Thanh', 'Thanh', '2003-9-09','Nữ' ,'Vĩnh Long'),
('K1110', 'Lê Thị', 'Thương', '2003-2-5', 'Nữ', 'Cần Thơ'),
('K1111', 'Nguyễn Thu', 'Thảo', '2003-12-25', 'Nữ', 'Long An'),
('K1201', 'Nguyễn Thanh', 'Thảo' ,'2003-2-11', 'Nữ' ,'HCM'),
('K1202', 'Võ Kim', 'Duyên', '2003-1-18', 'Nữ','HCM'),
('K1203', 'Trần Thị' ,'Lụa', '2003-9-17', 'Nữ', 'HCM'),
('K1204', 'Trương Mỹ', 'Hạnh', '2003-5-19', 'Nữ', 'Đồng Nai'),
('K1205', 'Nguyễn Gia', 'Hân', '2003-4-17' ,'Nam', 'HCM'),
('K1206', 'Diệp Minh', 'Thanh','2002-3-4','Nữ','Long An'),
('K1207','Trần Thị Như','Ý','2003-2-8','Nữ','Đồng Tháp'),
('K1208','Đoàn','Thanh','2003-4-9','Nam','Tây Ninh'),
('K1209','Nguyễn Như','Mộng','2003-2-23','Nữ','HCM'),
('K1210','Trần Bá','Dương','2003-2-14','Nam','HCM'),
('K1211','Đỗ Thị','Xuân','2003-3-9','Nữ','Đồng Tháp'),
('K1212','Lê Phi','Yến','2003-3-12','Nữ','Trà Vinh'),
('K1301','Nguyễn Thị Kim','Cúc','2003-6-9','Nữ','An Giang'),
('K1302','Trương Thị Mỹ','Hiền','2003-3-18','Nữ','Cần Thơ'),
('K1303','Lê Đức','Dũng','2003-3-21','Nam','Tây Ninh'),
('K1304','Lê Quang','Hiển','2003-4-18','Nam','HCM'),
('K1305','Lê Thị','Hương','2003-3-27','Nữ','HCM'),
('K1306','Nguyễn Thái','Hiền','2003-3-30','Nam',' HCM'),
('K1307','Trần Minh','Trí','2003-5-28','Nam','HCM'),
('K1308','Nguyễn Hiếu','Nghĩa','2003-4-8','Nam','Tây Ninh'),
('K1309','Nguyễn Trung','Hiếu','2002-1-18','Nam','Đồng Nai'),
('K1310','Trần Thị Hồng','Thắm','2003-4-22','Nữ','Đồng Tháp'),
('K1311','Trần Minh','Thức','2003-4-4','Nam','HCM'),
('K1312','Nguyễn Thị Mỹ','Tâm','2003-9-7','Nữ','HCM');


-- Thêm dữ liệu cho bảng GIAOVIEN
INSERT INTO GIAOVIEN VALUES
('GV01','Hồ Thanh Sơn','TS','GS','Nam','1980-5-2','2015-1-11','5.0','2250.000'),
('GV02','Trần Thanh Tâm','TS','PGS','Nam','1975-12-17','2016-4-20','4.5','2025.000'),
('GV03','Đỗ Quốc Dũng','TS','GS','Nam','1969-8-1','2016-9-23','4.0','2100.000'),
('GV04','Trần Minh Nhật','TS','PGS','Nam','1961-2-22','2012-07-12','5.0','2525.000'),
('GV05','Mai Thành Danh','ThS','GV','Nam','1988-3-12','2018-1-10','3.0','1850.000'),
('GV06','Trần Hữu Nghĩa','TS','GV','Nam','1983-3-11','2017-1-12','4.5','2050.000'),
('GV07','Nguyễn Minh Tiến','ThS','GV','Nam','1981-11-23','2018-3-1','4.0','1800.000'),
('GV08','Lê Thị Tuyết','KS',NULL,'Nữ','1984-3-26','2019-3-10','1.6','1050.000'),
('GV09','Nguyễn Tố Lan','ThS','GV','Nữ','1990-12-31','2020-10-1','4.0','1800.000'),
('GV10','Lê Ánh Loan','KS',NULL,'Nữ','1972-7-17','2018-6-1','1.9','1250.000'),
('GV11','Hồ Thanh Tùng','CN','GV','Nam','1996-1-12','2021-5-15','2.6','1600.000'),
('GV12','Trần Văn Chương','CN',NULL,'Nam','1991-3-29','2020-5-15','1.8','1560.500'),
('GV13','Nguyễn Linh Đan','CN',NULL,'Nữ','1994-5-25','2021-09-10','2.6','1800.000'),
('GV14','Trương Minh Châu','ThS','GV','Nữ','1986-11-30','2018-5-15','3.5','1850.000'),
('GV15','Lê Thanh Hà','ThS','GV','Nam','1988-5-4','2018-5-16','3.0','1950.000');

-- Thêm dữ liệu cho bảng KHOA
INSERT INTO KHOA VALUES
('KHMT', 'Khoa học máy tính', '2018-6-7', 'GV01'),
('CNTT', 'Công nghệ thông tin', '2018-6-7', 'GV04'),
('HTTT', 'Hệ thống thông tin', '2018-6-7', 'GV02'),
('TTS', 'Truyền thông số','2018-10-20','GV03'),
('NNA','Ngôn ngữ Anh','2018-12-20', NULL);

-- Thêm dữ liệu cho bảng LOP
INSERT INTO LOP VALUES
('K11','Lớp K11 khóa 1','K1108','48','GV01'),
('K12','Lớp K12 khóa 1','K1205','42','GV05'),
('K13','Lớp K13 khóa 1','K1312','50','GV03');

-- Thêm dữ liệu cho bảng MONHOC
INSERT INTO MONHOC VALUES('THDC','Tin học đại cương','3','2','CNTT'),
('CTRR','Cấu trúc rời rạc','5','0','KHMT'),
('CSDL','Cơ sở dữ liệu','3','2','HTTT'),
('CTDLGT','Cấu trúc dữ liệu và giải thuật','3','2','CNTT'),
('PTTKTT','Phân tích thiết kế thuật toán','5','0','KHMT'),
('DHMT','Đồ hoạ máy tính','3','2','CNTT'),
('TKCSDL','Thiết kế cơ sở dữ liệu','3','2','HTTT'),
('PTTKHTTT','Phân tích thiết kế hệ thống thông tin','3','2','HTTT'),
('HDH','Hệ điều hành','3','2','KHMT'),
('MMT','Mạng máy tính','4','0','TTS'),
('TA1','Tiếng Anh 1','3','0','NNA'),
('TA2','Tiếng Anh 2','3','0','NNA'),
('TACN','Tiếng Anh chuyên ngành','3','0','CNTT');

-- Thêm dữ liệu cho bảng GIANGDAY
INSERT INTO GIANGDAY VALUES
('K11','THDC','GV07','1','2022','2022-1-2','2022-5-12'),
('K12','THDC','GV06','1','2022','2022-1-2','2022-5-12'),
('K13','THDC','GV15','1','2022','2022-1-2','2022-5-12'),
('K11','CTRR','GV02','1','2022','2022-1-9','2022-5-17'),
('K12','CTRR','GV02','1','2022','2022-1-9','2022-5-17'),
('K13','CTRR','GV08','1','2022','2022-1-9','2022-5-17'),
('K11','CSDL','GV05','2','2022','2022-6-1','2022-7-15'),
('K12','CSDL','GV09','2','2022','2022-6-1','2022-7-15'),
('K13','CTDLGT','GV15','2','2022','2022-6-1','2022-7-15'),
('K13','CSDL','GV05','3','2022','2022-8-1','2022-12-15'),
('K13','DHMT','GV07','3','2022','2022-8-1','2022-12-15'),
('K11','CTDLGT','GV15','3','2022','2022-8-1','2022-12-15'),
('K12','CTDLGT','GV15','3','2022','2022-8-1','2022-12-15'),
('K11','HDH','GV04','1','2023','2023-1-2','2023-2-18'),
('K12','HDH','GV04','1','2023','2023-1-2','2023-2-21'),
('K11','DHMT','GV07','1','2023','2023-2-18','2023-3-20'),
('K11','TA1','GV14','1','2023','2023-2-18','2023-3-20');

-- Thêm dữ liệu cho bảng DIEUKIEN
INSERT INTO DIEUKIEN VALUES
('CSDL','CTRR'),
('CSDL','CTDLGT'),
('CTDLGT','THDC'),
('PTTKTT','THDC'),
('PTTKTT','CTDLGT'),
('DHMT','THDC'),
('MMT','THDC'),
('PTTKHTTT','CSDL'),
('TKCSDL','CSDL'),
('TA2','TA1'),
('TACN','TA2');



-- Thêm dữ liệu cho bảng KETQUATHI
INSERT INTO KETQUATHI VALUES
('K1101','CSDL','1','2022-7-20',10.00,'Đạt'),
('K1101','CTDLGT','1','2022-12-28',9.00,'Đạt'),
('K1101','THDC','1','2022-5-20',9.00,'Đạt'),
('K1101','CTRR','1','2022-5-13',9.50,'Đạt'), 

('K1102','CSDL','1','2022-7-20',4.00,'Không đạt'), 
('K1102','CSDL','2','2022-7-27',4.25,'Không đạt'), 
('K1102','CSDL','3','2022-8-10',4.50,'Không đạt'), 
('K1102','CTDLGT','1','2022-12-28',4.50,'Không đạt'), 
('K1102','CTDLGT','2','2023-1-5',4.00,'Không đạt'), 
('K1102','CTDLGT','3','2023-1-15',6.00,'Đạt'), 
('K1102','THDC','1','2022-5-20',5.00,'Đạt'), 
('K1102','CTRR','1','2022-5-13',7.00,'Đạt'),

('K1103','CSDL','1','2022-7-20',3.50,'Không đạt'), 
('K1103','CSDL','2','2022-7-27',8.25,'Đạt'), 
('K1103','CTDLGT','1','2022-12-28',7.00,'Đạt'), 
('K1103','THDC','1','2022-5-20',8.00,'Đạt'), 
('K1103','CTRR','1','2022-5-13',6.50,'Đạt'), 

('K1104','CSDL','1','2022-7-20',3.75,'Không đạt'), 
('K1104','CTDLGT','1','2022-12-28',4.00,'Không đạt'), 
('K1104','THDC','1','2022-5-20',4.00,'Không đạt'), 
('K1104','CTRR','1','2022-5-13',4.00,'Không đạt'), 
('K1104','CTRR','2','2022-5-20',3.50,'Không đạt'), 
('K1104','CTRR','3','2022-6-30',4.00,'Không đạt'), 

('K1201','CSDL','1','2022-7-20',6.00,'Đạt'), 
('K1201','CTDLGT','1','2022-12-28',5.00,'Đạt'), 
('K1201','THDC','1','2022-5-20',8.50,'Đạt'), 
('K1201','CTRR','1','2022-5-13',9.00,'Đạt'), 

('K1202','CSDL','1','2022-7-20',8.00,'Đạt'),
('K1202','CTDLGT','1','2022-12-28',4.00,'Không đạt'),
('K1202','CTDLGT','2','2023-1-5',5.00,'Đạt'), 
('K1202','THDC','1','2022-5-20',4.00,'Không đạt'), 
('K1202','THDC','2','2022-5-27',4.00,'Không đạt'), 
('K1202','CTRR','1','2022-5-13',3.00,'Không đạt'),
('K1202','CTRR','2','2022-5-20',4.00,'Không đạt'),
('K1202','CTRR','3','2022-6-30',6.25,'Đạt'),

('K1203','CSDL','1','2022-7-20',9.25,'Đạt'), 
('K1203','CTDLGT','1','2022-12-28',9.50,'Đạt'), 
('K1203','THDC','1','2022-5-20',10.00,'Đạt'), 
('K1203','CTRR','1','2022-5-13',10.00,'Đạt'), 

('K1204','CSDL','1','2022-7-20',8.50,'Đạt'), 
('K1204','CTDLGT','1','2022-12-28',6.75,'Đạt'), 
('K1204','THDC','1','2022-5-20',4.00,'Không đạt'), 
('K1204','CTRR','1','2022-5-13',6.00,'Đạt'), 

('K1301','CSDL','1','2022-12-20',4.25,'Không đạt'), 
('K1301','CTDLGT','1','2022-7-25',8.00,'Đạt'), 
('K1301','THDC','1','2022-5-20',7.75,'Đạt'), 
('K1301','CTRR','1','2022-5-13',8.00,'Đạt'), 

('K1302','CSDL','1','2022-12-20',6.75,'Đạt'), 
('K1302','CTDLGT','1','2022-7-25',5.00,'Đạt'), 
('K1302','THDC','1','2022-5-20',8.00,'Đạt'), 
('K1302','CTRR','1','2022-5-13',8.50,'Đạt'),

('K1303','CSDL','1','2022-12-20',4.00,'Không đạt'), 
('K1303','CTDLGT','1','2022-7-25',4.50,'Không đạt'), 
('K1303','CTDLGT','2','2022-8-7',4.00,'Không đạt'), 
('K1303','CTDLGT','3','2022-8-15',4.25,'Không đạt'), 
('K1303','THDC','1','2022-5-20',4.50,'Không đạt'), 
('K1303','CTRR','1','2022-5-13',3.25,'Không đạt'), 
('K1303','CTRR','2','2022-5-20',5.00,'Đạt'), 

('K1304','CSDL','1','2022-12-20',7.75,'Đạt'), 
('K1304','CTDLGT','1','2022-7-25',9.75,'Đạt'), 
('K1304','THDC','1','2022-5-20',5.50,'Đạt'), 
('K1304','CTRR','1','2022-5-13',5.00,'Đạt'), 

('K1305','CSDL','1','2022-12-20',9.25,'Đạt'), 
('K1305','CTDLGT','1','2022-7-20',10.00,'Đạt'), 
('K1305','THDC','1','2022-5-20',8.00,'Đạt'), 
('K1305','CTRR','1','2022-5-13',10.00,'Đạt');






