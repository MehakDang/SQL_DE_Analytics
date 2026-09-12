# Task 8: Star Schema Data Modeling

## Objective

Design and implement a **Star Schema** for a student performance data warehouse using Fact and Dimension tables.

## Database

- **Database:** `student_analytics_dw`
- **Fact Table:** `Fact_Student_Performance`
- **Dimension Tables:**
  - `Dim_Student`
  - `Dim_Course`
  - `Dim_Department`
  - `Dim_Date`

## Key Implementation

### Fact Table

`Fact_Student_Performance` stores measurable student performance data:

- Marks
- Attendance
- Grade

### Dimension Tables

- **Dim_Student** – Student details such as name, branch, and semester.
- **Dim_Course** – Course information.
- **Dim_Department** – Department information.
- **Dim_Date** – Date, year, month, and quarter details.

## Star Schema Design

The Fact table acts as the central table and is connected to the Dimension tables using **Foreign Keys**.

The schema was created and visualized using the **EER Diagram in MySQL Workbench**.

## SQL Analysis

A SQL JOIN query was used to combine the Fact and Dimension tables and retrieve meaningful student performance information.

Example:

```sql
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
```
## Result
Successfully designed a Star Schema.
Created and populated Fact and Dimension tables.
Established relationships using Primary and Foreign Keys.
Successfully tested the schema using SQL JOINs.

## Tools & Technologies
MySQL
MySQL Workbench
SQL
Data Warehousing
