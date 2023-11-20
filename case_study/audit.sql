select s.StudentId , s.StudentName, avg(m.Mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId;

select avg(m.Mark) as 'dtb all student'
from student s join mark m on s.StudentId = m.StudentId;

-- Yêu cầu hiển thị tên sinh viên và điểm trung bình tương ứng, chỉ hiển thị các bạn có điểm trung bình lớn hơn 5 thì làm thế nào?

select s.StudentId , s.StudentName, avg(m.Mark)
from student s join mark m on s.StudentId = m.StudentId
group by s.StudentId
having avg(m.Mark) >5;
-- FROM -> WHERE -> GROUP BY -> SELECT -> HAVING.

-- Hiển thị danh sách sinh viên và lớp học tương ứng thì làm thế nào (hai bảng Student và Class có cột chung ClassID)?

select s.StudentId , s.StudentName,c.ClassName
from student s join class c on c.ClassID = s.ClassId;