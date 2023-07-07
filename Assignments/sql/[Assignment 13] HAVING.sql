# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;
-- Như WHERE của SELECT nhưng dành cho GROUP BY (hay HAVING là WHERE của GROUP BY)

# Xuất ra số lượng giáo viên trong từng bộ môn mà số giáo viên > 1
SELECT BOMON.MABM, COUNT(*) AS 'SOLUONG' -- Cột hiển thị phải là thuộc tính của GROUP BY hoặc các hàm tính tổng hợp
FROM GIAOVIEN, BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM
GROUP BY MABM
HAVING SOLUONG > 1;


# Bài tập 
-- 1. Cho biết bộ môn nào có lương trung bình hơn 2000
-- 2. Cho biết đề tài nào có số lượng giáo viên tham gia trên 3 giáo viên.

