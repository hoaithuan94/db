# Sinh viên tiến hành chạy file DB.sql để lấy dữ liệu trước khi thực hiện các yêu cầu tiếp theo

USE DB;

# Cho biết thông tin các giáo viên có lương nằm trong khoảng từ 2000 đến 2500
SELECT * 
FROM GIAOVIEN
WHERE LUONG BETWEEN 2000 AND 2500;

# Cho biết thông tin các giáo viên có lương không nằm trong khoảng từ 2000 đến 2500
SELECT * 
FROM GIAOVIEN
WHERE LUONG NOT BETWEEN 2000 AND 2500;



# Bài tập 
# 1. Cho biết thông tin các giáo viên có độ tuổi từ 25 đến 35 tuổi
# 2. Cho biết thông tin các khoa thành lập từ năm 1980 đến năm 1990
# 3. Cho biết thông tin các giáo viên có mức phụ cấp tham gia đề tài từ 1.5 đến 2.0
# 4. Cho biết thông tin các đề tài có kinh phí không nằm trong khoảng từ 50tr đến 100tr
# 5. Cho biết thông tin các trưởng bộ môn nhận chức từ đầu năm 2015 đến hết năm 2016














SELECT *
FROM GIAOVIEN
WHERE  YEAR(curdate()) - YEAR(NGSINH) BETWEEN 25 AND 35
