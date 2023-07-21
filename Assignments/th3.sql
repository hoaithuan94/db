USE master
GO 

DROP DATABASE IF EXISTS QLNV
GO

CREATE DATABASE QLNV
GO

USE QLNV
GO


CREATE TABLE PHONG(
    MAPH CHAR(3) NOT NULL PRIMARY KEY,
    TENPH NVARCHAR(40),
    DIACHI NVARCHAR(50),
    TEL CHAR(10),
)
GO

CREATE TABLE DMNN(
    MANN CHAR(2) NOT NULL PRIMARY KEY,
    TENNN NVARCHAR(20),

)
GO

CREATE TABLE NHANVIEN(
    MANV CHAR(5) NOT NULL PRIMARY KEY,
    HOTEN NVARCHAR(40),
    GT NVARCHAR(3),
    NGSINH DATE,
    LUONG INT,
    MAPH CHAR(3),
    SDT CHAR(10),
    NGAYBC DATE
    FOREIGN KEY (MAPH) REFERENCES PHONG(MAPH),
)
GO

CREATE TABLE TDNN(
    MANV CHAR(5),
    MANN CHAR(2),
    TDO CHAR(1),
    PRIMARY KEY (MANV,MANN),
    CONSTRAINT PK_NV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    CONSTRAINT PK_NN FOREIGN KEY (MANN) REFERENCES DMNN(MANN)
)
GO

INSERT INTO PHONG 
VALUES
('HCA', N'Hành chính tổ hợp', N'371 Nguyễn Kiệm', '0362588541'),
('KDA', N'Kinh doanh', N'371 Nguyễn Kiệm', '0362517395'),
('KTA', N'Kỹ thuật', N'371 Nguyễn Kiệm', '0362567401'),
('QTA', N'Quản trị', N'371 Nguyễn Kiệm', '0362565788');

INSERT INTO DMNN 
VALUES
('01', N'Anh'),
('02', N'Nga'),
('03', N'Pháp'),
('04', N'Nhật'),
('05', N'Trung Quốc'),
('06', N'Hàn Quốc');

INSERT INTO NHANVIEN 
VALUES
('HC001', N'Nguyễn Thị Hà', N'Nữ', '8/27/1966', 7500000, 'HCA', NULL, '2/8/1995'),
('HC002', N'Trần Văn Nam', N'Nam', '6/12/1995', 8000000, 'HCA', NULL, '6/8/2017'), 
('HC003', N'Nguyễn Thanh Huyền', N'Nữ', '7/3/1998', 6500000, 'HCA', NULL, '9/24/2019'),
('KD001', N'Lê Tuyết Anh', N'Nữ', '2/3/1992', 7500000, 'KDA', NULL, '10/2/2021'),
('KD002', N'Nguyễn Anh Tú', N'Nam', '7/4/1962', 7600000, 'KDA', NULL, '7/14/2000'),
('KD003', N'Phạm An Thái', N'Nam', '5/9/1977', 6600000, 'KDA', NULL, '10/13/2019'),
('KD004', N'Lê Văn Hải', N'Nam', '1/2/1976', 7900000, 'KDA', NULL, '6/8/2017'), 
('KD005', N'Nguyễn Phương Minh', N'Nam', '1/2/1980', 7000000, 'KDA', NULL, '10/2/2021'),
('KT001', N'Trần Đình Khâm', N'Nam', '12/2/1971', 7700000, 'KTA', NULL, '1/1/2022'),
('KT002', N'NguyễN Mạnh Hùng', N'Nam', '8/16/1991', 7300000, 'KTA', NULL, '1/1/2022'),
('KT003', N'Phạm Thanh Sơn', N'Nam', '8/20/1994', 7100000, 'KTA', NULL, '1/1/2022'),
('KT004', N'Vũ Thị Hoài', N'Nữ', '12/5/1995', 7500000, 'KTA', NULL, '10/2/2021'),
('KT005', N'Nguyễn Thu Lan', N'Nữ', '10/5/1994', 8000000, 'KTA', NULL, '10/2/2021'),
('KT006', N'Trần Hoài Nam', N'Nam', '7/2/1978', 7800000, 'KTA', NULL, '6/8/2017'),
('TT007', N'Hoàng Nam Sơn', N'Nam', '12/3/1969', 8200000, NULL, NULL, '7/2/2015'),
('KT008', N'Lê Thu Trang', N'Nữ', '7/6/1970', 7500000, 'KTA', NULL, '8/2/2018'),
('KT009', N'Khúc Nam Hải', N'Nam', '7/22/1980', 7000000, 'KTA', NULL, '1/1/2015'),
('TT010', N'Phùng Trung Dũng', N'Nam', '8/28/1978', 7200000, NULL, NULL, '9/24/2022');

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
GO

-- 1. Tạo thủ tục có tên inDanhSachNV dùng để in danh sách tất cả nhân viên.
CREATE PROCEDURE inDanhSachNV
AS 
BEGIN
    SELECT * FROM NHANVIEN;
END
GO

EXECUTE inDanhSachNV;
GO;

-- 2. Tạo thủ tục có tên timNV để tìm nhân viên theo mã 
-- (ví dụ timNV ’HC001’ sẽ in ra thông tin của nhân viên này).
CREATE PROC timNV (@MANV CHAR(5)) AS
BEGIN

    SELECT * FROM NHANVIEN WHERE MANV = @MANV

END
GO

EXECUTE timNV @MANV = 'HC001'
GO

--3. Tạo thủ tục có tên demNV để đếm số lượng nhân viên nam hoặc nữ 
-- (ví dụ demNV N’Nam’ sẽ in ra số lượng nhân viên nam)

CREATE PROC demNV (@gt NVARCHAR(3)) AS
BEGIN
     SELECT COUNT(*) FROM NHANVIEN WHERE GT = @gt;
END
GO

EXEC demNV N'Nữ'
GO

--4. Tạo thủ tục có tên DSNgoaiNngu hiển thị mã các ngoại ngữ của nhân viên 
--(ví dụ DSNgoaiNngu N’Nguyễn Thị Hà’ sẽ in ra các ngoại ngữ của ’Nguyễn Thị Hà’).
CREATE PROCEDURE DSNgoaiNngu (@tennv as NVARCHAR(50))
AS
BEGIN
    SELECT HOTEN, TENNN
    FROM NHANVIEN NV JOIN TDNN ON NV.MANV = TDNN.MANV 
                     JOIN DMNN ON TDNN.MANN = DMNN.MANN
    WHERE NV.HOTEN = @tennv
END
GO

EXEC DSNgoaiNngu @tennv = N'Lê Văn Hải'
GO

-- 5.Tạo thủ tục có tên timNVNN để in ra danh sách nhân viên có trình độ ngoại ngữ cầm tìm
CREATE PROCEDURE timNVNN (@tenNN as NVARCHAR(50))
AS
BEGIN
    SELECT HOTEN
    FROM NHANVIEN NV JOIN TDNN ON NV.MANV = TDNN.MANV 
                     JOIN DMNN ON TDNN.MANN = DMNN.MANN
    WHERE TENNN = @tenNN
END
GO

EXEC timNVNN @tenNN = N'Nhật'
GO

-- 6. Tạo thủ tục có đầu vào là TenNN và đầu ra là tổng số lượng nhân viên 
-- đã học ngoại ngữ này
CREATE PROC countNN (@tenNN NVARCHAR(20))
AS
BEGIN
    SELECT COUNT(*) AS SL
    FROM DMNN JOIN TDNN ON DMNN.MANN = TDNN.MANN
    WHERE TENNN = @tenNN 
END
GO

EXECUTE countNN @tenNN = N'Nhật'
GO

--7. Tổng số nhân viên trong cơ quan có độ tuổi trong khoảng Tuoi1 và Tuoi2.
CREATE PROCEDURE dsNV7 (@t1 INT, @t2 INT)
AS
BEGIN
    SELECT COUNT(*) FROM NHANVIEN 
    WHERE 2023 - YEAR(NGSINH) BETWEEN @t1 AND @t2
END
GO

EXEC dsNV7 @t1 = 20, @t2 = 40
GO

--8. Tạo thủ tục cập nhật SDT cho các nhân viên 
--(thủ tục có hai tham số đầu vào gồm mã nhân viên, số điện thoại). 
-- Nếu không tìm thấy nhân viên cần cập nhật trả về giá trị 0. 
-- Ngược lại, cho phép cập nhật.
CREATE PROC capNhatSDT(@MANV CHAR(5), @SDT CHAR(10))
AS
BEGIN
    DECLARE @id char(5);
    SELECT @id = MANV FROM NHANVIEN WHERE MANV = @MANV

    IF @id IS NULL
        PRINT '0'
    ELSE
        UPDATE NHANVIEN SET SDT = @SDT WHERE MANV = @id
END
GO

EXEC capNhatSDT @MANV = 'HC001', @SDT = '1234567890'
GO


-- 9.1 Tạo hàm có tên inDanhSachNV dùng để in danh sách tất cả nhân viên.
CREATE FUNCTION func_inDanhSachNV()
RETURNS TABLE
AS 
    RETURN (SELECT * FROM NHANVIEN)
GO

SELECT * FROM func_inDanhSachNV();
GO


-- 9.2. TạO hàm có tên func_timNV để tìm nhân viên theo mã 
-- (ví dụ timNV ’HC001’ sẽ in ra thông tin của nhân viên này).
CREATE FUNCTION func_timNV (@MANV CHAR(5))
RETURNS TABLE
AS 
    RETURN (SELECT * FROM NHANVIEN WHERE MANV = @MANV)
GO

SELECT * FROM func_timNV('HC001')
GO

-- 9.3. Tạo hàm có tên func_demNV để đếm số lượng nhân viên nam hoặc nữ 
-- (ví dụ demNV N’Nam’ sẽ in ra số lượng nhân viên nam)
CREATE FUNCTION func_demNV(@gt NVARCHAR(3))
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM NHANVIEN WHERE GT = @gt)
END
GO

SELECT dbo.func_demNV(N'Nữ')
GO

dROP FUNCTION func_demNV

--9.4. Tạo hàm có tên DSNgoaiNngu hiển thị mã các ngoại ngữ của nhân viên 
--(ví dụ DSNgoaiNngu N’Nguyễn Thị Hà’ sẽ in ra các ngoại ngữ của ’Nguyễn Thị Hà’).