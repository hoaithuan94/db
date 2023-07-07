# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Cho biết mã giáo viên, họ tên và lương. Kết quả trả về sắp xếp mức lương tăng dần
SELECT MAGV, HOTEN, LUONG
FROM GIAOVIEN
ORDER BY LUONG ASC;

# Giới hạn kết quả sắp xếp
SELECT MAGV, HOTEN, LUONG
FROM GIAOVIEN
ORDER BY LUONG
LIMIT 4;

# Cho biết mã giáo viên, họ tên và lương. Kết quả trả về sắp xếp mức lương giảm dần
SELECT MAGV, HOTEN, LUONG
FROM GIAOVIEN
ORDER BY LUONG DESC;

# Cho biết mã giáo viên, họ tên và lương. Kết quả trả về sắp xếp mức lương giảm dần, 
# sau đó các kết quả cùng mức lương xếp theo MAGV giảm dần 
SELECT MAGV, HOTEN, LUONG
FROM GIAOVIEN
ORDER BY LUONG DESC, MAGV DESC;


# Bài tập 
-- 1. Cho biết mã giáo viên, họ tên. Kết quả trả về sắp xếp tên giáo viên tăng dần
-- 2. Cho biết mã đề tài, số thứ tự công việc, tên công việc.  
-- Kết quả trả về sắp xếp mã đề tài tăng dần, số thứ tự công việc giảm dần.

