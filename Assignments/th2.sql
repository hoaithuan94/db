DROP DATABASE IF EXISTS QuanLyThiTuyenSinh;
CREATE DATABASE QuanLyThiTuyenSinh;

USE QuanLyThiTuyenSinh;


-- Tạo bảng MonThi
/*
CREATE TABLE MonThi(
    mon VARCHAR(6) NOT NULL UNIQUE,
    heso INT,
    ghichu VARCHAR(50),

    CONSTRAINT monthi_pk PRIMARY KEY(mon)
);
*/


-- Tạo bảng ThiSinh



-- Tạo bảng KetQua



# Thêm dữ liệu vào bảng MonThi
INSERT INTO MonThi VALUES 
('TIN',2,'Môn chuyên cho lớp chuyên tin'),
('LY',2,'Môn chuyên cho lớp chuyên lý'),
('HOA',2,'Môn chuyên cho lớp chuyên hóa'),
('TOAN',2,'Môn chung cho tất cả thí sinh'),
('VAN',1,'Môn chung cho tất cả thí sinh'),
('TOANCH',2,'Môn chuyên cho lớp chuyên toán'),
('VANCH',2,'Môn chuyên cho lớp chuyên ngữ văn');


# Thêm dữ liệu vào bảng ThiSinh
	


# Thêm dữ liệu vào bảng KetQua

#...





# ...


