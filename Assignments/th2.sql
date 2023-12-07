DROP DATABASE IF EXISTS QUANLYTHITUYENSINH;
CREATE DATABASE QUANLYTHITUYENSINH;

USE QUANLYTHITUYENSINH;


-- Tạo bảng MONTHI
/*
CREATE TABLE MONTHI(
    MON VARCHAR(6) NOT NULL UNIQUE,
    HESO INT,
    GHICHU VARCHAR(50),

    CONSTRAINT MONTHI_PK PRIMARY KEY(MON)
);
*/


-- Tạo bảng THISINH



-- Tạo bảng KETQUA



# THÊM DỮ LIỆU VÀO BẢNG MONTHI
INSERT INTO MONTHI VALUES 
('TIN',2,'Môn chuyên cho lớp chuyên TIN'),
('TOAN',2,'Môn chung cho tất cả thí sinh'),
('VAN',1,'Môn chung cho tất cả thí sinh'),
('TOANCH',2,'Môn chuyên cho lớp chuyên TOAN'),
('VANCH',2,'Môn chuyên cho lớp chuyên VAN');


# THÊM DỮ LIỆU VÀO BẢNG THISINH
	


# THÊM DỮ LIỆU VÀO BẢNG KETQUA





# ...


