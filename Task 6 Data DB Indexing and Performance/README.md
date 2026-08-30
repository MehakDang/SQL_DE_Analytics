# Task 6: Database Indexing & Performance

## Objective

Optimize SQL query performance using database indexing and analyze query execution plans using `EXPLAIN` and `EXPLAIN ANALYZE`.

## Database Details

- Database: `student_performance`
- Table: `Students`
- Records: 4,000
- DBMS: MySQL
- Tool: MySQL Workbench

## Table Structure

The `Students` table contains the following columns:

`student_id`, `student_name`, `department`, `branch`, `semester`, `marks`, `exam_date`

## Indexing

Indexes were created on the `branch` and `marks` columns to improve query performance.

```sql
CREATE INDEX idx_branch ON Students(branch);
CREATE INDEX idx_marks ON Students(marks);
