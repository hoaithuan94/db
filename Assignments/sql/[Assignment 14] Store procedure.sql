# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Ví dụ 1. Tạo store procedure xuất danh sách giáo viên (không chứa tham số truyền vào)
DELIMITER //  
CREATE PROCEDURE xuat_ds_giaovien()
BEGIN
	SELECT * FROM GIAOVIEN;
END
//

# Gọi store procedure in danh sách giáo viên
CALL xuat_ds_giaovien();


# Ví dụ 2. Tạo store procedure tìm danh sách giáo viên (có tên chứa kí tự là tham số truyền vào)
DELIMITER //  
CREATE PROCEDURE tim_ds_giaovien(str VARCHAR(10))
BEGIN
	SELECT * FROM GIAOVIEN
    WHERE HOTEN LIKE CONCAT('%',str,'%');
END
//

# Gọi store procedure tìm danh sách giáo viên có họ trần
CALL tim_ds_giaovien('Trần');


# Xoá store procedure
#DROP PROCEDURE IF EXISTS `DB`.`in_ds_giaovien`;

# Bài tập 
-- 1. Tạo store procedure xuất danh sách các bộ môn
-- 2. Tạo store procedure xuất danh sách các giáo viên thuộc bộ môn 'HTTT'
-- 3. Tạo store các khoa thành lập từ năm 1980 đến năm 1990
-- 4. Tạo store procedure xuất danh sách các giáo viên có độ tuổi từ a đến b (với a,b là 2 tham số truyền vào).
-- 5. Tạo store procedure tính tuổi của giáo viên, lưu kết quả tính được vào bảng giáo viên.

