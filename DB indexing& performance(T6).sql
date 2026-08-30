CREATE DATABASE student_performance;
USE student_performance;
CREATE TABLE Students (
    Student_id INT PRIMARY KEY,
    Student_name VARCHAR(50),
    Department VARCHAR(30),
    Branch VARCHAR(20),
    Semester INT,
    Marks INT,
    Exam_date DATE
);
-- Generate 4,000 student records
SET SESSION cte_max_recursion_depth = 5000;
INSERT INTO Students
(Student_id, Student_name, Department, Branch, Semester, Marks, Exam_date)
WITH RECURSIVE Numbers AS (
    SELECT 1001 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 5000
)
SELECT
    n AS Student_id,
    CONCAT('Student_', n) AS Student_name,
    'Engineering' AS Department,
    CASE MOD(n, 4)
        WHEN 0 THEN 'CSE'
        WHEN 1 THEN 'ECE'
        WHEN 2 THEN 'ME'
        WHEN 3 THEN 'Civil'
    END AS branch,
    1 + MOD(n, 8) AS semester,
    40 + MOD(n * 7, 61) AS marks,
    CASE MOD(n, 4)
        WHEN 0 THEN '2025-01-10'
        WHEN 1 THEN '2025-01-11'
        WHEN 2 THEN '2025-01-12'
        WHEN 3 THEN '2025-01-13'
    END AS Exam_date
FROM Numbers;

EXPLAIN
SELECT *
FROM Students
WHERE branch = 'CSE';

CREATE INDEX idx_branch
ON Students(branch);

-- Checking query execution after indexing
EXPLAIN
SELECT *
FROM Students
WHERE branch = 'CSE';

EXPLAIN ANALYZE
SELECT *
FROM Students
WHERE branch = 'CSE';

-- Before indexing marks
EXPLAIN
SELECT *
FROM Students
WHERE marks >= 90;

-- Creating index on marks
CREATE INDEX idx_marks
ON Students(marks);

SHOW INDEX FROM Students;

-- After indexing marks
EXPLAIN
SELECT *
FROM Students
WHERE marks >= 90;

-- Analyzing indexed marks query
EXPLAIN ANALYZE
SELECT *
FROM Students
WHERE marks >= 90;