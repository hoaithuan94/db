# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Ví dụ 1. Tạo Trigger thêm giáo viên
# Tạo trigger
DELIMITER //  
CREATE TRIGGER them_giaovien
AFTER INSERT
ON GIAOVIEN FOR EACH ROW
BEGIN
	INSERT INTO GV_DT(MAGV, DIENTHOAI) VALUES (NEW.MAGV, '0392654310');
END 
//

INSERT INTO GIAOVIEN (MAGV, HOTEN, LUONG, PHAI, NGSINH, DIACHI, GVQLCM, MABM)
VALUES ('012','Lê Minh Đức', 2100, 'Nam','1994-10-01','153 Nguyễn Trãi, Q.5, TP HCM', NULL, 'HTTT');

# Xoá trigger
#DROP TRIGGER them_giaovien;


# Bài tập 
-- 1. Tạo trigger khi thêm hoặc chỉnh sửa dữ liệu của bảng giáo viên thì cột TUOI (tuổi)sẽ được tính theo công thức TUOI = năm hiện tại - năm sinh.
-- 2. Tạo trigger khi thêm một giáo viên thì mặc định để người đó tham gia đề tài có mã là 001.
