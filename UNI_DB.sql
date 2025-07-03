use CaseStudy_4 ;

create table student(
	studendId int primary key,
	studentName varchar(200) not null ,
	gender varchar(20) not null,
	dateOfBirth date ,
	email varchar(100) not null,
);

insert into student (studendId , studentName , gender , dateOfBirth , email ) values
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

select * from student 

create table professor (
	professorId int primary key , 
	professorName varchar(200) not null,
	professorEmail varchar(200) not null,
	professorOfficeNumber int not null,
);

INSERT INTO Professor (ProfessorID, ProfessorName, ProfessorEmail, ProfessorOfficeNumber) VALUES
(1, 'Dr. Ahmed ElSherif', 'a.elsherif@university.edu', 101),
(2, 'Dr. Rania Hegazy', 'r.hegazy@university.edu', 102),
(3, 'Dr. Tarek Saleh', 't.saleh@university.edu', 103),
(4, 'Dr. Mona Youssef', 'm.youssef@university.edu', 104),
(5, 'Dr. Karim Nabil', 'k.nabil@university.edu', 105);

select * from professor

create table Department (
	DepartmentName varchar(200) primary key,
	HeadProfessorID INT,
    CONSTRAINT FK_Department_HeadProfessor FOREIGN KEY (HeadProfessorID)
        REFERENCES Professor(ProfessorID)
);

INSERT INTO Department (DepartmentName, HeadProfessorID) VALUES
('Computer Science', 1),   -- Dr. Ahmed ElSherif
('Information Systems', 2),-- Dr. Rania Hegazy
('Software Engineering', 3),-- Dr. Tarek Saleh
('Artificial Intelligence', 4), -- Dr. Mona Youssef
('Data Science', 5);       -- Dr. Karim Nabil

select * from department 

create table classRoom (
	roomNumber int primary key,
	capacity int not null, 
	bulding varchar(100) not null
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

select * from classRoom

create table course (
	courseCode int primary key , 
	courseTitle varchar(100) not null, 
	CreditHours int not null ,
	Departmentname varchar (200) , 
	CONSTRAINT  Department_Name FOREIGN KEY (Departmentname)
		REFERENCES department(DepartmentName)
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

create table teaches (
	 teachesID int primary key ,
	 professor_id int , 
	 constraint professor_ID foreign key (professor_id)
		references professor (professorId),
	semester int not null,
	CourseCode int , 
	constraint course_code foreign key (courseCode)
		references course (courseCode),
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

select * from teaches

create table Enrollment(
	EnrollmentID int primary key , 
	StudentID int ,
	constraint FK_Student_ID foreign key (StudentID)
		references student (studendId),
	CourseCode int ,
	constraint FK_Course_Code foreign key (CourseCode)
		references course (courseCode),
	grade int not null,
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

select * from Enrollment

-- fadel courseSchuale 