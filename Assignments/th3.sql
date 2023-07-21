DROP DATABASE IF EXISTS QLNV;
CREATE DATABASE QLNV;

USE QLNV;


CREATE TABLE PHONG(
    MAPH CHAR(3) NOT NULL PRIMARY KEY,
    TENPH VARCHAR(40),
    DIACHI VARCHAR(50),
    TEL CHAR(10),
)


CREATE TABLE DMNN(
    MANN CHAR(2) NOT NULL PRIMARY KEY,
    TENNN VARCHAR(20),

)


CREATE TABLE NHANVIEN(
    MANV CHAR(5) NOT NULL PRIMARY KEY,
    HOTEN VARCHAR(40),
    GT VARCHAR(3),
    NGSINH DATE,
    LUONG INT,
    MAPH CHAR(3),
    SDT CHAR(10),
    NGAYBC DATE
    FOREIGN KEY (MAPH) REFERENCES PHONG(MAPH),
)


CREATE TABLE TDNN(
    MANV CHAR(5),
    MANN CHAR(2),
    TDO CHAR(1),
    PRIMARY KEY (MANV,MANN),
    CONSTRAINT PK_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    CONSTRAINT PK_NN FOREIGN KEY (MANN) REFERENCES DMNN(MANN)
)


INSERT INTO PHONG 
VALUES
('HCA', 'Hành chính tổ hợp', '371 Nguyễn Kiệm', '0362588541'),
('KDA', 'Kinh doanh', '371 Nguyễn Kiệm', '0362517395'),
('KTA', 'Kỹ thuật', '371 Nguyễn Kiệm', '0362567401'),
('QTA', 'Quản trị', '371 Nguyễn Kiệm', '0362565788');

INSERT INTO DMNN 
VALUES
('01', 'Anh'),
('02', 'Nga'),
('03', 'Pháp'),
('04', 'Nhật'),
('05', 'Trung Quốc'),
('06', 'Hàn Quốc');

INSERT INTO NHANVIEN 
VALUES
('HC001', 'Nguyễn Thị Hà', 'Nữ', '8/27/1966', 7500000, 'HCA', NULL, '2/8/1995'),
('HC002', 'Trần Văn Nam', 'Nam', '6/12/1995', 8000000, 'HCA', NULL, '6/8/2017'), 
('HC003', 'Nguyễn Thanh Huyề', 'Nữ', '7/3/1998', 6500000, 'HCA', NULL, '9/24/2019'),
('KD001', 'Lê Tuyết Anh', 'Nữ', '2/3/1992', 7500000, 'KDA', NULL, '10/2/2021'),
('KD002', 'Nguyễn Anh Tú', 'Nam', '7/4/1962', 7600000, 'KDA', NULL, '7/14/2000'),
('KD003', 'Phạm An Thái', 'Nam', '5/9/1977', 6600000, 'KDA', NULL, '10/13/2019'),
('KD004', 'Lê Văn Hải', 'Nam', '1/2/1976', 7900000, 'KDA', NULL, '6/8/2017'), 
('KD005', 'Nguyễn Phương Minh', 'Nam', '1/2/1980', 7000000, 'KDA', NULL, '10/2/2021'),
('KT001', 'Trần Đình Khâm', 'Nam', '12/2/1971', 7700000, 'KTA', NULL, '1/1/2022'),
('KT002', 'NguyễN Mạnh Hùng', 'Nam', '8/16/1991', 7300000, 'KTA', NULL, '1/1/2022'),
('KT003', 'Phạm Thanh Sơ', 'Nam', '8/20/1994', 7100000, 'KTA', NULL, '1/1/2022'),
('KT004', 'Vũ Thị Hoài', 'Nữ', '12/5/1995', 7500000, 'KTA', NULL, '10/2/2021'),
('KT005', 'Nguyễn Thu La', 'Nữ', '10/5/1994', 8000000, 'KTA', NULL, '10/2/2021'),
('KT006', 'Trần Hoài Nam', 'Nam', '7/2/1978', 7800000, 'KTA', NULL, '6/8/2017'),
('TT007', 'Hoàng Nam Sơ', 'Nam', '12/3/1969', 8200000, NULL, NULL, '7/2/2015'),
('KT008', 'Lê Thu Trang', 'Nữ', '7/6/1970', 7500000, 'KTA', NULL, '8/2/2018'),
('KT009', 'Khúc Nam Hải', 'Nam', '7/22/1980', 7000000, 'KTA', NULL, '1/1/2015'),
('TT010', 'Phùng Trung Dũng', 'Nam', '8/28/1978', 7200000, NULL, NULL, '9/24/2022');

INSERT INTO TDNN 
VALUES 
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

