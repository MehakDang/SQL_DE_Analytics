# SQL for Data Engineering & Analytics

A hands-on SQL project covering **analytical queries, database performance, automation, and data warehouse modeling** using MySQL.

---

## 📌 Tasks Completed

### 🔹 Task 5 — Complex Analytical SQL Queries
Applied advanced SQL techniques for student performance analysis.
**Concepts:**
- `ROW_NUMBER()`
- `DENSE_RANK()`
- `LAG()` & `LEAD()`
- Common Table Expressions (CTEs)
- CTE + `DENSE_RANK()`
- `GROUP BY`, `AVG()`, `ROUND()`
- `PARTITION BY` & `ORDER BY`
---

### 🔹 Task 6 — Database Indexing & Performance
Improved query performance using database indexing and analyzed execution plans.
**Key Work:**
- Created indexes on `Branch` and `Marks`
- Compared query performance before and after indexing
- Used `EXPLAIN` and `EXPLAIN ANALYZE`
- Worked with a 4,000-record student dataset
---

### 🔹 Task 7 — Stored Procedures & Triggers
Implemented database automation and change tracking.
**Key Work:**
- Created `GetStudentsByMarks()` stored procedure
- Created `Student_Audit` table
- Implemented `INSERT` and `UPDATE` triggers
- Maintained an audit log for student data changes
---

### 🔹 Task 8 — Star Schema Data Modeling
Designed a **Star Schema** for a student performance data warehouse.
**Schema:**
- ⭐ `Fact_Student_Performance`
- `Dim_Student`
- `Dim_Course`
- `Dim_Department`
- `Dim_Date`

Created relationships using **Primary Keys and Foreign Keys** and validated the model using SQL JOIN queries and an EER diagram.
---

## 🛠️ Skills & Technologies

**MySQL | SQL | MySQL Workbench | Data Warehousing | Query Optimization | Analytical SQL**
---

## 📂 Project Structure

```text
SQL-for-Data-Engineering-and-Analytics/
│
├── Task 5 - Complex Analytical SQL Queries/
├── Task 6 Data DB Indexing and Performance/
├── Task 7 Stored Procedures and Triggers/
└── Task 8 - Star Schema Data Modeling/
```

## 🎯 Key Learning Outcomes
-Advanced SQL querying and analytical functions
-Query optimization using indexes
-Database automation with procedures and triggers
-Audit logging and data tracking
-Star Schema and dimensional data modeling
-Writing SQL for data analysis and data engineering workflows
