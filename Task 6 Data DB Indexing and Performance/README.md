#Task 6: Database Indexing & Performance
📌 ##Objective

Optimize SQL query performance using database indexing, EXPLAIN, and EXPLAIN ANALYZE.

🗄️ ##Database
Database: student_performance
Table: Students
Records: 4,000
Tool: MySQL Workbench

##Indexes Created
CREATE INDEX idx_branch ON Students(branch);
CREATE INDEX idx_marks ON Students(marks);

⚡##Performance Analysis
Query	Before Index	After Index
branch = 'CSE'	4,000 rows	~1,000 rows
marks >= 90	4,000 rows	722 rows

Before indexing, MySQL performed a full table scan (ALL). After indexing, it used ref and range index scans.

📊 ##EXPLAIN ANALYZE
For marks >= 90:
Index: idx_marks
Actual Rows: 722
Actual Time: 0.362–1.72 ms
Method: Index Range Scan

#Key Takeaway
Indexing reduces unnecessary table scans and improves query efficiency by enabling faster data retrieval.

##Technologies
MySQL | MySQL Workbench | SQL | Indexing | EXPLAIN | EXPLAIN ANALYZE

📁 ##Files
DB indexing & performance(T6).sql — SQL implementation
Indexing.jpg — Task 6 poster
