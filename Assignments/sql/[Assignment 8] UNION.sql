# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Cho biết mã giáo viên của những giáo viên có lương >= 2500 hoặc có người thân là nam 
SELECT MAGV 
FROM GIAOVIEN
WHERE LUONG >= 2500
UNION
SELECT MAGV 
FROM NGUOITHAN
WHERE PHAI = 'Nam';


# Bài tập 
-- 1. Cho biết mã đề tài có giáo viên tham gia với họ là 'Trần' 
-- hoặc người chủ nhiệm đề tài có họ là 'Trần'.




