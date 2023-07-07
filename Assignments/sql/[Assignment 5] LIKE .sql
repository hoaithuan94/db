# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Cho biết thông tin các giáo viên có giới tính là nam
SELECT * 
FROM GIAOVIEN
WHERE PHAI LIKE 'nam';

# Cho biết thông tin các giáo viên có họ là 'Trần'
SELECT * 
FROM GIAOVIEN
WHERE HOTEN LIKE 'trần%';

# Cho biết thông tin các giáo viên có địa chỉ ở thành phố HCM
SELECT * 
FROM GIAOVIEN
WHERE DIACHI LIKE '%HCM';

# Cho biết thông tin các giáo viên có chữ h trong họ tên
SELECT * 
FROM GIAOVIEN
WHERE HOTEN LIKE '%H%';

# Bài tập
-- 1. Xuất ra thông tin giáo viên có tên bắt đầu bằng chữ 'p'
-- 2. Xuất ra thông tin giáo viên có tên kết thúc bằng chữ 'g'
-- 3. Xuất ra thông tin giáo viên có địa chỉ nhà ở Hùng Vương
