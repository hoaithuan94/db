# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;


SELECT *
FROM GIAOVIEN LEFT OUTER JOIN BOMON 
ON BOMON.MABM = GIAOVIEN.MABM;

# SQL cho phép viết tắt OUTER JOIN -> JOIN
SELECT *
FROM BOMON LEFT JOIN GIAOVIEN 
ON BOMON.MABM = GIAOVIEN.MABM;
-- Record nào bảng phải không có thì để null
-- Record nào bảng trái không có thì không ghi vào


SELECT *
FROM BOMON RIGHT JOIN GIAOVIEN 
ON BOMON.MABM = GIAOVIEN.MABM;


# Cho biết mã giáo viên, họ tên giáo viên và họ tên người quản lý chuyên môn giáo viên nếu có
SELECT GV.MAGV, GV.HOTEN, QLCM.HOTEN 
FROM GIAOVIEN AS GV LEFT OUTER JOIN GIAOVIEN AS QLCM 
ON GV.GVQLCM = QLCM.MAGV;

# SQL cho phép viết tắt OUTER JOIN -> JOIN
SELECT GV.MAGV, GV.HOTEN, QLCM.HOTEN 
FROM GIAOVIEN AS GV LEFT JOIN GIAOVIEN AS QLCM 
ON GV.GVQLCM = QLCM.MAGV;



# Bài tập 
-- 1. Cho biết mã giáo viên, họ tên giáo viên và tên đề tài của họ tham gia nếu có.


