# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

## Cấu trúc phép kết bằng ( inner join )
# inner join kiểu cũ
SELECT * 
FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM;

# inner join kiểu mới. mọi join điều cần điều kiện
SELECT *
FROM GIAOVIEN INNER JOIN BOMON 
ON BOMON.MABM = GIAOVIEN.MABM;
# SQL cho phép viết tắt INNER JOIN -> JOIN
SELECT *
FROM GIAOVIEN JOIN BOMON 
ON BOMON.MABM = GIAOVIEN.MABM;


# Bài tập
-- 1. Cho biết mã giáo viên, họ tên giáo viên thuộc bộ môn 'Hệ thống thông tin'
-- 2. Cho biết mã giáo viên, họ tên giáo viên quản lý chuyên môn
-- 3. Cho biết mã giáo viên, họ tên giáo viên và tên người thân của giáo viên đó
-- 4. Cho biết mã giáo viên, họ tên giáo viên trưởng khoa và tên khoa tương ứng
-- 5. Cho biết mã giáo viên, họ tên giáo, số điện thoạ của các giáo viên bộ môn 'Hệ thống thông tin'


