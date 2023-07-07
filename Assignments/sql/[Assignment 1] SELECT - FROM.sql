
# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

-- Cấu trúc truy vấn 
# Hiển thị tất cả thông tin trong bảng bộ môn
SELECT * 
FROM BOMON; 

# Hiển thị cột mã bộ môn + tên bộ môn trong bảng bộ môn
SELECT MABM, TENBM 
FROM BOMON;


# BÀI TẬP:
-- 1. Truy xuất tất cả thông tin của bảng giáo viên
-- 2. Lấy ra danh sách mã giáo viên, họ tên giáo viên và lương của giáo viên đó
-- 3. Lấy ra danh sách mã khoa và tên khoa tương ứng
