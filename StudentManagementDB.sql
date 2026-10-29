CREATE DATABASE StudentManagementDB;
GO

USE StudentManagementDB;
GO

CREATE TABLE Courses (
   CourseID int PRIMARY KEY IDENTITY(1,1),
   CourseName varchar(100) NOT NULL,
   Duration varchar(50),
   Department varchar(100)
);

CREATE TABLE Students (
   StudentID int PRIMARY KEY IDENTITY(1,1),
   FullName varchar(100) NOT NULL,
   Email varchar(100) UNIQUE,
   Phone varchar(15),
   Address varchar(255),
   DateOfBirth datetime,
   Gender varchar(10),
   EnrollmentDate datetime,
   CourseID int FOREIGN KEY REFERENCES Courses(CourseID),
   IsActive bit DEFAULT 1
);

CREATE TABLE Subjects (
   SubjectID int PRIMARY KEY IDENTITY(1,1),
   SubjectName varchar(100),
   CourseID int FOREIGN KEY REFERENCES Courses(CourseID),
   Semester int
);

CREATE TABLE Marks (
   MarkID int PRIMARY KEY IDENTITY(1,1),
   StudentID int FOREIGN KEY REFERENCES Students(StudentID),
   SubjectID int FOREIGN KEY REFERENCES Subjects(SubjectID),
   Semester int,
   MarksObtained decimal(5,2),
   TotalMarks decimal(5,2),
   ExamDate datetime
);

CREATE TABLE Attendance (
   AttendanceID int PRIMARY KEY IDENTITY(1,1),
   StudentID int FOREIGN KEY REFERENCES Students(StudentID),
   SubjectID int FOREIGN KEY REFERENCES Subjects(SubjectID),
   Date datetime,
   Status varchar(10)
);

CREATE TABLE Admin (
   AdminID int PRIMARY KEY IDENTITY(1,1),
   Username varchar(50),
   PasswordHash varchar(100)
);

-- Seed Admin
-- SHA256 of 'admin' is 8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918
INSERT INTO Admin (Username, PasswordHash) VALUES ('admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918');

-- Seed Courses
INSERT INTO Courses (CourseName, Duration, Department) VALUES
('B.Tech Computer Science', '4 Years', 'Engineering'),
('B.Sc Information Technology', '3 Years', 'Science'),
('MBA', '2 Years', 'Management');

-- Seed Subjects
INSERT INTO Subjects (SubjectName, CourseID, Semester) VALUES
('Data Structures', 1, 1),
('Database Management', 1, 2),
('Software Engineering', 2, 1);

-- Seed Students
INSERT INTO Students (FullName, Email, Phone, Address, DateOfBirth, Gender, EnrollmentDate, CourseID, IsActive) VALUES
('John Doe', 'john@example.com', '1234567890', '123 Main St', '2000-01-01', 'Male', GETDATE(), 1, 1),
('Jane Smith', 'jane@example.com', '0987654321', '456 Oak St', '2001-02-02', 'Female', GETDATE(), 2, 1);
