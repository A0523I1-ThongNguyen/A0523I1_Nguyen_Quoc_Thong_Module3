-- from DATABASE QuanLySinhVien

-- BT 4
-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subject.*
from subject
where credit in (select max(credit) from subject);

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.

select s.* , m.Mark 'Diem Thi Tot Nhat'
from subject s
join Mark m 
on s.SubId = m.SubId
where m.Mark in (select max(Mark) from Mark);

-- 3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.StudentID ,s.StudentName,avg(m.Mark) as mark
from Student s 
join Mark m 
on s.StudentID=m.StudentID
group by s.StudentID,s.StudentName
order by mark desc;

select s.StudentID,s.StudentName,avg(m.Mark) as mark
from Student s 
join Mark m 
on s.StudentID=m.StudentID
group by s.StudentID,s.StudentName
order by mark desc;
