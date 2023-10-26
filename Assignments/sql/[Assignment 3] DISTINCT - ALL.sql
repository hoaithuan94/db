# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

SELECT LUONG FROM GIAOVIEN;

# Cho biết thông tin lương của giáo viên (yêu cầu loại bỏ giá trị trùng)
SELECT DISTINCT LUONG 
FROM GIAOVIEN;

# Cho biết thông tin lương của giáo viên (yêu cầu không loại bỏ giá trị trùng)
SELECT ALL LUONG 
FROM GIAOVIEN;


# Bài tập:
-- 1. Cho biết thông tin năm thành lập của các khoa (yêu cầu không loại bỏ giá trị trùng)
-- 2. Cho biết thông tin giảng viên có người thân
