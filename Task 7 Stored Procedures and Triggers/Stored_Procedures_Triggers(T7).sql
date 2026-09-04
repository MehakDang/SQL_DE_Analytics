-- Task 7: Stored Procedures & Triggers
USE student_performance;

CREATE TABLE Student_Audit (
    Audit_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_id INT,
    Student_name VARCHAR(50),
    Action_Type VARCHAR(20),
    Old_Marks INT,
    New_Marks INT,
    Changed_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE student_audit;

-- Creating Stored Procedure
DELIMITER //
CREATE PROCEDURE GetStudentsByMarks(IN min_marks INT)
BEGIN
    SELECT *
    FROM Students
    WHERE Marks >= min_marks
    ORDER BY Marks DESC;
END //
DELIMITER ;
CALL GetStudentsByMarks(90);

-- Creating UPDATE Trigger
DELIMITER //
CREATE TRIGGER trg_student_marks_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    IF OLD.Marks <> NEW.Marks THEN
        INSERT INTO Student_Audit
        (Student_ID, Student_Name, Action_Type, Old_Marks, New_Marks)
        VALUES
        (OLD.Student_id, OLD.Student_name, 'UPDATE', OLD.Marks, NEW.Marks);
    END IF;
END //
DELIMITER ;

-- Testing the Trigger
UPDATE Students
SET Marks = 90
WHERE Student_id = 1183;

SELECT * 
FROM student_audit
WHERE Student_id = 1183;

-- Viewing All Audit Records
SELECT *
FROM Student_Audit
ORDER BY Changed_At DESC;

-- Creating INSERT Trigger
DELIMITER //
CREATE TRIGGER trg_student_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Student_Audit
    (Student_ID, Student_Name, Action_Type, Old_Marks, New_Marks)
    VALUES
    (NEW.Student_id, NEW.Student_name, 'INSERT', NULL, NEW.Marks);
END //
DELIMITER ;

SELECT COUNT(*) AS Total_Students
FROM Students;

INSERT INTO Students
(Student_id, Student_name, Department, Branch, Semester, Marks, Exam_date)
VALUES
(5001, 'Student_5001', 'Engineering', 'CSE', 5, 68, '2025-01-10');

SELECT *
FROM Student_Audit
WHERE Student_id = 5001;

-- Viewing Audit Log
SELECT *
FROM Student_Audit
ORDER BY Changed_At DESC;

SHOW TRIGGERS;