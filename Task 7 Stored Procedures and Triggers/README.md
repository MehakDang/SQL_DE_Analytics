# Task 7: Stored Procedures & Triggers

## Objective
To automate database operations using **Stored Procedures and Triggers** and maintain an **Audit Log** for tracking student data changes.

## Database
- **Database:** `student_performance`
- **Table:** `Students`
- **Audit Table:** `Student_Audit`

## Key Implementations

### 1. Stored Procedure
Created `GetStudentsByMarks()` to retrieve students whose marks are greater than or equal to a specified value.

```sql
CALL GetStudentsByMarks(90);

### 2. UPDATE Trigger
Created `trg_student_marks_update` to automatically record changes in student marks.

The trigger stores:
- Student ID
- Old Marks
- New Marks
- Action Type
- Timestamp

### 3. INSERT Trigger
Created `trg_student_insert` to automatically record newly inserted students in the audit log.

## Results
- Stored procedure successfully retrieved students with **Marks ≥ 90**.
- UPDATE trigger successfully recorded marks changes.
- INSERT trigger successfully recorded new student entries.
- Audit log maintained **old/new marks, action type, and timestamp**.

## Tools & Technologies
- MySQL
- MySQL Workbench
- SQL
- Stored Procedures
- Triggers

## Files
- `Task_7_Stored_Procedures_Triggers.sql` — Complete SQL implementation
- `Task7png` — Task summary and results
