# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

-- Cấu trúc truy vấn 
# Xuất ra thông tin các giáo viên có mã bộ môn là 'HTTT'
SELECT * 
FROM GIAOVIEN
WHERE MABM = 'HTTT';

# Xuất ra thông tin các giáo viên thuộc bộ môn 'Hệ thống thông tin' và có lương >=2500
SELECT * 
FROM GIAOVIEN, BOMON
WHERE GIAOVIEN.MABM = BOMON.MABM 
	  AND TENBM = 'Hệ thống thông tin' 
      AND LUONG >= 2500;


# Bài tập:
-- 1. Cho biết các khoa có năm thành lập từ 1980 trở về sau.
-- 2. Cho biết mã giáo viên, họ tên giáo viên có mức lương > 2000
-- 3. Cho biết mã khoa, tên khoa và tên giáo viên làm trưởng khoa đó.
-- 4. Cho biết mã giáo viên, họ tên giáo viên và tên khoa của giáo viên đó đang làm việc.
-- 5. Cho biết mã giáo viên, họ tên giáo viên và họ tên người quản lý chuyên môn 
-- của giáo viên đó.
