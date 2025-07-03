USE CaseStudy_4;

-- =========================
-- Drop tables if exist (for reruns)
-- =========================
IF OBJECT_ID('Attendance') IS NOT NULL DROP TABLE Attendance;
IF OBJECT_ID('GradeScale') IS NOT NULL DROP TABLE GradeScale;
IF OBJECT_ID('Enrollment') IS NOT NULL DROP TABLE Enrollment;
IF OBJECT_ID('teaches') IS NOT NULL DROP TABLE teaches;
IF OBJECT_ID('courseSchedule') IS NOT NULL DROP TABLE courseSchedule;
IF OBJECT_ID('course') IS NOT NULL DROP TABLE course;
IF OBJECT_ID('classRoom') IS NOT NULL DROP TABLE classRoom;
IF OBJECT_ID('Department') IS NOT NULL DROP TABLE Department;
IF OBJECT_ID('Professor') IS NOT NULL DROP TABLE Professor;
IF OBJECT_ID('student') IS NOT NULL DROP TABLE student;

-- =========================
-- Students
-- =========================
CREATE TABLE student(
    studendId INT PRIMARY KEY,
    studentName VARCHAR(200) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    dateOfBirth DATE,
    email VARCHAR(100) NOT NULL
);

INSERT INTO student (studendId, studentName, gender, dateOfBirth, email) VALUES
(1, 'Zeyad Mohamed', 'Male', '2003-04-05', 'zeyad.m@university.edu'),
(2, 'Layla Hassan', 'Female', '2004-07-22', 'layla.h@university.edu'),
(3, 'Omar Farouk', 'Male', '2002-11-10', 'omar.f@university.edu'),
(4, 'Maya Khaled', 'Female', '2005-02-18', 'maya.k@university.edu'),
(5, 'Youssef Adel', 'Male', '2003-03-30', 'youssef.a@university.edu'),
(6, 'Sara Nour', 'Female', '2004-06-01', 'sara.n@university.edu'),
(7, 'Kareem Tarek', 'Male', '2003-09-14', 'kareem.t@university.edu'),
(8, 'Nada Fathy', 'Female', '2005-12-05', 'nada.f@university.edu'),
(9, 'Ali Zaki', 'Male', '2002-05-25', 'ali.z@university.edu'),
(10, 'Jana Mostafa', 'Female', '2004-10-09', 'jana.m@university.edu');

SELECT * FROM student;

-- =========================
-- Professors
-- =========================
CREATE TABLE Professor (
    professorId INT PRIMARY KEY,
    professorName VARCHAR(200) NOT NULL,
    professorEmail VARCHAR(200) NOT NULL,
    professorOfficeNumber INT NOT NULL
);

INSERT INTO Professor (ProfessorID, ProfessorName, ProfessorEmail, ProfessorOfficeNumber) VALUES
(1, 'Dr. Ahmed ElSherif', 'a.elsherif@university.edu', 101),
(2, 'Dr. Rania Hegazy', 'r.hegazy@university.edu', 102),
(3, 'Dr. Tarek Saleh', 't.saleh@university.edu', 103),
(4, 'Dr. Mona Youssef', 'm.youssef@university.edu', 104),
(5, 'Dr. Karim Nabil', 'k.nabil@university.edu', 105);

SELECT * FROM Professor;

-- =========================
-- Departments
-- =========================
CREATE TABLE Department (
    DepartmentName VARCHAR(200) PRIMARY KEY,
    HeadProfessorID INT,
    CONSTRAINT FK_Department_HeadProfessor FOREIGN KEY (HeadProfessorID)
        REFERENCES Professor(ProfessorID)
);

INSERT INTO Department (DepartmentName, HeadProfessorID) VALUES
('Computer Science', 1),
('Information Systems', 2),
('Software Engineering', 3),
('Artificial Intelligence', 4),
('Data Science', 5);

SELECT * FROM Department;

-- =========================
-- Classrooms
-- =========================
CREATE TABLE classRoom (
    roomNumber INT PRIMARY KEY,
    capacity INT NOT NULL,
    bulding VARCHAR(100) NOT NULL
);

INSERT INTO classRoom (roomNumber, capacity, bulding) VALUES
(101, 50, 'Engineering Building'),
(102, 45, 'Science Block'),
(103, 60, 'Main Hall'),
(104, 40, 'Technology Wing'),
(105, 55, 'Innovation Hub'),
(201, 70, 'Computer Science Building'),
(202, 35, 'Data Science Center'),
(203, 80, 'AI Institute'),
(204, 30, 'Software Lab'),
(205, 65, 'Information Systems Hall');

SELECT * FROM classRoom;

-- =========================
-- Courses
-- =========================
CREATE TABLE course (
    courseCode INT PRIMARY KEY,
    courseTitle VARCHAR(100) NOT NULL,
    CreditHours INT NOT NULL,
    Departmentname VARCHAR(200),
    CONSTRAINT Department_Name FOREIGN KEY (Departmentname)
        REFERENCES Department(DepartmentName)
);

INSERT INTO course (courseCode, courseTitle, CreditHours, Departmentname) VALUES
(101, 'Introduction to Programming', 3, 'Computer Science'),
(102, 'Database Systems', 4, 'Information Systems'),
(103, 'Software Design Patterns', 3, 'Software Engineering'),
(104, 'Machine Learning Fundamentals', 4, 'Artificial Intelligence'),
(105, 'Big Data Analytics', 4, 'Data Science'),
(201, 'Algorithms & Data Structures', 3, 'Computer Science'),
(202, 'Network Security', 3, 'Information Systems'),
(203, 'Mobile App Development', 4, 'Software Engineering'),
(204, 'Natural Language Processing', 4, 'Artificial Intelligence'),
(205, 'Data Visualization', 3, 'Data Science');

SELECT * FROM course;

-- =========================
-- Teaches
-- =========================
CREATE TABLE teaches (
    teachesID INT PRIMARY KEY,
    professor_id INT,
    semester INT NOT NULL,
    CourseCode INT,
    CONSTRAINT professor_ID FOREIGN KEY (professor_id)
        REFERENCES Professor (professorId),
    CONSTRAINT course_code FOREIGN KEY (CourseCode)
        REFERENCES course (courseCode)
);

INSERT INTO teaches (teachesID, professor_id, semester, CourseCode) VALUES
(1001, 1, 1, 101),
(1002, 1, 2, 201),
(1003, 2, 1, 102),
(1004, 2, 2, 202),
(1005, 3, 1, 103),
(1006, 3, 2, 203),
(1007, 4, 1, 104),
(1008, 4, 2, 204),
(1009, 5, 1, 105),
(1010, 5, 2, 205);

SELECT * FROM teaches;

-- =========================
-- Enrollment
-- =========================
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseCode INT,
    grade INT NOT NULL,
    CONSTRAINT FK_Student_ID FOREIGN KEY (StudentID)
        REFERENCES student (studendId),
    CONSTRAINT FK_Course_Code FOREIGN KEY (CourseCode)
        REFERENCES course (courseCode)
);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseCode, grade) VALUES
(1, 1, 101, 85),
(2, 1, 201, 78),
(3, 2, 102, 90),
(4, 2, 202, 88),
(5, 3, 103, 75),
(6, 3, 203, 82),
(7, 4, 104, 95),
(8, 4, 204, 89),
(9, 5, 105, 80),
(10, 5, 205, 85),
(11, 6, 101, 77),
(12, 6, 201, 91),
(13, 7, 102, 83),
(14, 7, 202, 79),
(15, 8, 103, 88),
(16, 8, 203, 74),
(17, 9, 104, 92),
(18, 9, 204, 84),
(19, 10, 105, 76),
(20, 10, 205, 90);

SELECT * FROM Enrollment;

-- =========================
-- courseSchedule (NEW)
-- =========================
CREATE TABLE courseSchedule (
    scheduleID INT PRIMARY KEY IDENTITY(1,1),
    courseCode INT NOT NULL,
    roomNumber INT NOT NULL,
    dayOfWeek VARCHAR(20) NOT NULL,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    semester INT NOT NULL,
    FOREIGN KEY (courseCode) REFERENCES course(courseCode),
    FOREIGN KEY (roomNumber) REFERENCES classRoom(roomNumber)
);

INSERT INTO courseSchedule (courseCode, roomNumber, dayOfWeek, startTime, endTime, semester) VALUES
(101, 101, 'Sunday', '09:00', '11:00', 1),
(201, 102, 'Tuesday', '10:00', '12:00', 2),
(102, 103, 'Monday', '11:00', '13:00', 1),
(202, 104, 'Wednesday', '09:00', '11:00', 2),
(103, 105, 'Sunday', '13:00', '15:00', 1),
(203, 201, 'Tuesday', '12:00', '14:00', 2),
(104, 202, 'Monday', '10:00', '12:00', 1),
(204, 203, 'Thursday', '09:00', '11:00', 2),
(105, 204, 'Wednesday', '11:00', '13:00', 1),
(205, 205, 'Sunday', '15:00', '17:00', 2);

SELECT * FROM courseSchedule;

-- =========================
-- Attendance (NEW)
-- =========================
CREATE TABLE Attendance (
    attendanceID INT PRIMARY KEY IDENTITY(1,1),
    studentID INT NOT NULL,
    scheduleID INT NOT NULL,
    attendanceDate DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (studentID) REFERENCES student(studendId),
    FOREIGN KEY (scheduleID) REFERENCES courseSchedule(scheduleID)
);

INSERT INTO Attendance (studentID, scheduleID, attendanceDate, status) VALUES
(1, 1, '2025-03-01', 'Present'),
(2, 1, '2025-03-01', 'Absent'),
(3, 2, '2025-03-03', 'Present'),
(4, 2, '2025-03-03', 'Present'),
(5, 3, '2025-03-04', 'Late'),
(6, 3, '2025-03-04', 'Present');

SELECT * FROM Attendance;

-- =========================
-- GradeScale (NEW)
-- =========================
CREATE TABLE GradeScale (
    gradeLetter VARCHAR(2) PRIMARY KEY,
    minScore INT NOT NULL,
    maxScore INT NOT NULL
);

INSERT INTO GradeScale (gradeLetter, minScore, maxScore) VALUES
('A', 90, 100),
('B', 80, 89),
('C', 70, 79),
('D', 60, 69),
('F', 0, 59);

SELECT * FROM GradeScale;
