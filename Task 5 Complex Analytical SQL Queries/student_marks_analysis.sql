CREATE DATABASE Students;
USE Students;

CREATE TABLE Student_info(
	Std_Id INT PRIMARY KEY ,
    Std_Name VARCHAR(50),
    Department VARCHAR(20),
    BRANCH Varchar(10),
    Semester INT,
    Marks INT,
    Exam_date DATE
);
INSERT INTO Student_info
(Std_Id, Std_Name, Department, Branch, Semester, Marks, Exam_date)
VALUES
(123, 'Aman', 'Engineering', 'CSE', 5, 85, '2026-06-10'),
(456,'Anushka', 'Engineering', 'CSE', 5, 92, '2026-06-10'),
(789, 'Ishan', 'Engineering', 'ECE', 5, 82, '2026-06-11'),
(960, 'Jayasha', 'Engineering', 'ECE', 5, 91, '2026-06-11'),
(678, 'Khushi', 'Engineering', 'ME', 5, 76, '2026-06-12'),
(702, 'Mehak', 'Engineering', 'ECE', 5, 82, '2026-06-11'),
(345, 'Paras', 'Engineering', 'CSE', 5, 85, '2026-06-10'),
(654, 'Madhav', 'Engineering', 'ME', 5, 56, '2026-06-12'),
(987, 'Vanshika', 'Engineering', 'CSE' , 5, 88, '2026-06-10'),
(910, 'Yashika', 'Engineering', 'Civil' , 5, 88, '2026-06-13');
SELECT * FROM Student_info;

-- 1. ROW_NUMBER()
SELECT
    Std_Id,
    Std_Name,
    Department,
    Branch,
    Marks,
    ROW_NUMBER() OVER (
		PARTITION BY Branch
        ORDER BY marks DESC
    ) AS Row_Num
FROM Student_info;

-- 2. DENSE_RANK()
SELECT
    Std_Id,
    Std_Name,
    Department,
    Branch,
    Marks,
    DENSE_RANK() OVER (
        PARTITION BY branch
        ORDER BY marks DESC
    ) AS Marks_Rank
FROM Student_info;

-- 3. LAG()
SELECT
    Std_Id,
    Std_Name,
    Department,
    Branch,
    Marks,
    LAG(marks) OVER (
        PARTITION BY branch
        ORDER BY marks DESC
    ) AS Previous_Marks
FROM Student_info;

-- 4. LEAD()
SELECT
    Std_Id,
    Std_Name,
    Department,
    Branch,
    Marks,
    LEAD(marks) OVER (
        PARTITION BY branch
        ORDER BY marks DESC
    ) AS next_marks
FROM Student_info;

-- 5. CTE
WITH DepartmentAverage AS (
    SELECT
        Department,
        Branch,
        ROUND(AVG(marks), 2) AS Average_Marks
    FROM Student_info
    GROUP BY Department, Branch
)
SELECT
    Department,
    Branch,
    Average_Marks
FROM DepartmentAverage;

-- 6. CTE + DENSE_RANK()
WITH BranchAverage AS (
    SELECT
        Branch,
        ROUND(AVG(marks), 2) AS Average_Marks
    FROM Student_info
    GROUP BY Branch
)
SELECT
    Branch,
    Average_Marks,
    DENSE_RANK() OVER (
        ORDER BY Average_Marks DESC
    ) AS Branch_Rank
FROM BranchAverage
ORDER BY Branch_Rank;