CREATE DATABASE student_analytics_dw;
USE student_analytics_dw;

CREATE TABLE Dim_Date(
	Date_ID INT PRIMARY KEY,
    Full_Date DATE,
    Year INT,
    Month INT,
    Quarter INT
);
CREATE TABLE Dim_Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Branch VARCHAR(50),
    Semester INT
);
CREATE TABLE Dim_Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Department VARCHAR(50)
);
CREATE TABLE Dim_Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100)
);
CREATE TABLE Fact_Student_Performance (
    Performance_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Department_ID INT,
    Date_ID INT,
    Marks INT,
    Attendance DECIMAL(5,2),
    Grade VARCHAR(5),

    FOREIGN KEY (Student_ID) REFERENCES Dim_Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Dim_Course(Course_ID),
    FOREIGN KEY (Department_ID) REFERENCES Dim_Department(Department_ID),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID)
);
INSERT INTO Dim_Date (Date_ID, Full_Date, Year, Month, Quarter)
VALUES
(1, '2025-01-10', 2025, 1, 1),
(2, '2025-01-11', 2025, 1, 1),
(3, '2025-01-12', 2025, 1, 1),
(4, '2025-01-13', 2025, 1, 1);

INSERT INTO Dim_Student (Student_ID, Student_Name, Branch, Semester)
VALUES
(1001, 'Student_1001', 'CSE', 5),
(1002, 'Student_1002', 'ECE', 5),
(1003, 'Student_1003', 'ME', 5),
(1004, 'Student_1004', 'Civil', 5);

INSERT INTO Dim_Course (Course_ID, Course_Name, Department)
VALUES
(101, 'Database Management Systems', 'CSE'),
(102, 'Data Structures', 'CSE'),
(103, 'Computer Networks', 'CSE'),
(104, 'Operating Systems', 'CSE');

INSERT INTO Dim_Department (Department_ID, Department_Name)
VALUES
(1, 'Computer Science Engineering'),
(2, 'Electronics and Communication Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Civil Engineering');

INSERT INTO Fact_Student_Performance
(Performance_ID, Student_ID, Course_ID, Department_ID, Date_ID, Marks, Attendance, Grade)
VALUES
(1, 1001, 101, 1, 1, 92, 95.50, 'A'),
(2, 1002, 102, 2, 2, 85, 89.00, 'B'),
(3, 1003, 103, 3, 3, 78, 82.50, 'C'),
(4, 1004, 104, 4, 4, 91, 94.00, 'A');

SHOW TABLES;
SELECT * FROM Fact_Student_Performance;

SELECT
    s.Student_Name,
    s.Branch,
    c.Course_Name,
    d.Department_Name,
    dt.Full_Date,
    f.Marks,
    f.Attendance,
    f.Grade
FROM Fact_Student_Performance f
JOIN Dim_Student s
    ON f.Student_ID = s.Student_ID
JOIN Dim_Course c
    ON f.Course_ID = c.Course_ID
JOIN Dim_Department d
    ON f.Department_ID = d.Department_ID
JOIN Dim_Date dt
    ON f.Date_ID = dt.Date_ID;

