CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);

CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
select s.StudentId,s.StudentName,avg(m.Mark)
from student s
join mark m on s.StudentId = m.StudentId
group by s.StudentId;

CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO Class
VALUES (4, 'A1', '2008-03-05', 1);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Trang', 'my', '0123123123', 0, 2);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Trang1', 'my', '0123123123', 0, 2);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (3, 1, 8, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 7, 8, 1),
       (1, 6, 10, 2),
       (2, 3, 12, 1);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 5, 3, 1);


select * from Student
where substring_index(StudentName," ",-1) like "h%";

-- 1 . Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select s.*
from Student s
where StudentName like 't%';

-- 2.Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from Class
where month(StartDate)=12;

-- 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from Subject 
where Credit >=3 and Credit <=5;

-- 4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update Student 
set ClassID=2
where(StudentID=1);


-- 5. Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName, sub.SubName , m.Mark -- select s.StudentNAme  'hoc ',sub.SubName as 'mon hoc',m.Mark as 'mark'
from Student s join Mark m on  s.StudentID = m.StudentId
join Subject sub on sub.SubId = m.SubId
order by m.Mark desc , s.StudentName asc;