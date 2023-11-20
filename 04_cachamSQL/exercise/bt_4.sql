-- BT 4 > databas quanlysinhvien
-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subject.*
from subject
where credit in (select max(credit) from subject);

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
-- cach 1 : dung truy van con
select s.SubId ,s.SubName, m.Mark 'Diem Thi Tot Nhat'
from subject s
join Mark m
on s.SubId = m.SubId
where m.Mark in (select max(Mark) from Mark);

select  s.SubId ,s.SubName,m.Mark 'Diem Thi Tot Nhat'
from subject s
join Mark m
on s.SubId = m.SubId -- kết hợp thông tin từ hai bảng và trả về các môn học có điểm thi cao nhất.
join student st on st.StudentId = m.StudentId -- tại sao phải join bảng student mới select student.StudentName dc?
where m.Mark in (select max(Mark) from Mark);

-- cach 2: 
SELECT s.SubName, MAX(m.Mark) AS MaxMark
FROM Subject s
JOIN Mark m ON s.SubId = m.SubId
GROUP BY s.SubName;

-- cach 3: dung giam dan desc + limit
select s.SubId ,s.SubName, m.Mark 'Diem Thi Tot Nhat'
from subject s
join Mark m
on s.SubId = m.SubId
order by m.Mark desc
limit 2;

-- 3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.* ,avg(m.Mark) as mark
from Student s 
join Mark m 
on s.StudentID=m.StudentID
group by s.StudentID
order by mark desc;

select s.StudentID,s.StudentName,avg(m.Mark) as mark
from Student s 
join Mark m 
on s.StudentID=m.StudentID
group by s.StudentID,s.StudentName
order by mark desc;

insert into mark(markID,SubID,StudentID,Mark) -- bảng con mark phải tạo SubID , StudentID trùng với bảng cha  student + subject 
values (199,4,8,15);