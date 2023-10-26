DROP DATABASE IF EXISTS QLNV;
CREATE DATABASE IF NOT EXISTS QLNV
CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';
USE QLNV;

CREATE TABLE PHONG(
    MAPH CHAR(3) NOT NULL PRIMARY KEY,
    TENPH VARCHAR(40),
    DIACHI VARCHAR(50),
    TEL CHAR(10)
);


CREATE TABLE DMNN(
    MANN CHAR(2) NOT NULL PRIMARY KEY,
    TENNN VARCHAR(20)
);


CREATE TABLE NHANVIEN(
    MANV CHAR(5) NOT NULL PRIMARY KEY,
    HOTEN VARCHAR(40),
    GT VARCHAR(3),
    NGSINH DATE,
    LUONG INT,
    MAPH CHAR(3),
    SDT CHAR(10),
    NGAYBC DATE
);


CREATE TABLE TDNN(
    MANV CHAR(5),
    MANN CHAR(2),
    TDO CHAR(1)
);


-- SINH VIÊN TỰ KHAI BÁO CÁC KHÓA CHÍNH VÀ KHÓA NGOẠI
# ...



INSERT INTO PHONG VALUES
('HCA', 'Hành chính', '371 Nguyễn Kiệm', '0362588541'),
('KDA', 'Kinh doanh', '371 Nguyễn Kiệm', '0362517395'),
('KTA', 'Kỹ thuật', '371 Nguyễn Kiệm', '0362567401'),
('QTA', 'Quản trị', '371 Nguyễn Kiệm', '0362565788');

INSERT INTO DMNN VALUES
('01', 'Anh'),
('02', 'Nga'),
('03', 'Pháp'),
('04', 'Nhật'),
('05', 'Trung Quốc'),
('06', 'Hàn Quốc');

INSERT INTO NHANVIEN VALUES
('HC001', 'Nguyễn Thị Hà', 'Nữ', '1966-08-27', 7500000, 'HCA', NULL, '1995-02-08'),
('HC002', 'Trần Văn Nam', 'Nam', '1995-12-06', 8000000, 'HCA', NULL, '2017-08-06'), 
('HC003', 'Nguyễn Thanh Huyề', 'Nữ', '1998-03-07', 6500000, 'HCA', NULL, '2019-09-24'),
('KD001', 'Lê Tuyết Anh', 'Nữ', '1992-03-02', 7500000, 'KDA', NULL, '2021-02-10'),
('KD002', 'Nguyễn Anh Tú', 'Nam', '1962-04-07', 7600000, 'KDA', NULL, '2000-07-14'),
('KD003', 'Phạm An Thái', 'Nam', '1977-09-05', 6600000, 'KDA', NULL, '2019-10-13'),
('KD004', 'Lê Văn Hải', 'Nam', '1976-02-01', 7900000, 'KDA', NULL, '2017-08-06'), 
('KD005', 'Nguyễn Phương Minh', 'Nam', '1980-02-01', 7000000, 'KDA', NULL, '2021-02-10'),
('KT001', 'Trần Đình Khâm', 'Nam', '1971-02-12', 7700000, 'KTA', NULL, '2022-01-01'),
('KT003', 'Phạm Thanh Sơn', 'Nam', '1994-08-20', 7100000, 'KTA', NULL, '2022-01-01'),
('KT004', 'Vũ Thị Hoài', 'Nữ', '1995-05-12', 7500000, 'KTA', NULL, '2021-02-10'),
('KT005', 'Nguyễn Thu Lan', 'Nữ', '1994-05-10', 8000000, 'KTA', NULL, '2021-02-10'),
('KT006', 'Trần Hoài Nam', 'Nam', '1978-02-07', 7800000, 'KTA', NULL, '2017-08-06'),
('TT007', 'Hoàng Nam Sơ', 'Nam', '1969-03-12', 8200000, NULL, NULL, '2015-02-07'),
('KT008', 'Lê Thu Trang', 'Nữ', '1970-06-07', 7500000, 'KTA', NULL, '2018-02-08'),
('KT009', 'Khúc Nam Hải', 'Nam', '1980-07-22', 7000000, 'KTA', NULL, '2015-01-01'),
('TT010', 'Phùng Trung Dũng', 'Nam', '1978-08-28', 7200000, NULL, NULL, '2022-09-24');

INSERT INTO TDNN VALUES 
('HC001', '01', 'A'),
('HC001', '02', 'B'),
('HC002', '01', 'C'),
('HC002', '03', 'C'),
('HC003', '01', 'D'),
('KD001', '01', 'C'),
('KD001', '02', 'B'),
('KD002', '01', 'D'),
('KD002', '02', 'A'),
('KD003', '01', 'B'),
('KD003', '02', 'C'),
('KD004', '01', 'C'),
('KD004', '04', 'A'),
('KD004', '05', 'A'),
('KD005', '01', 'B'),
('KD005', '02', 'D'),
('KD005', '03', 'B'),
('KD005', '04', 'B'), 
('KT001', '01', 'D'),
('KT001', '04', 'E'),
('KT002', '01', 'C'), 
('KT002', '02', 'B'),
('KT003', '01', 'D'),
('KT003', '03', 'C'), 
('KT004', '01', 'D'), 
('KT005', '01', 'C');



# ...
