# MySQL Cheatsheet

A structured, topic-by-topic SQL reference built while learning MySQL 8.0. Each file is a self-contained script with working examples and inline comments explaining the *why*, not just the *what*. Uses the [Sakila sample database](https://dev.mysql.com/doc/sakila/en/) for realistic query examples.

---

## Repository Structure

| File | Topic | Key Concepts |
|---|---|---|
| `DDL.sql` | Data Definition Language | `CREATE`, `DROP`, `ALTER`, `RENAME`, views |
| `INSERT.sql` | Inserting Data | Single/multi-row insert, `SET`, `ROW()`, `ON DUPLICATE KEY UPDATE` |
| `SELECT.sql` | Querying Data | Filtering, sorting, joins, aggregation, views, built-in functions |
| `UPDATE.sql` | Updating Data | `WHERE`, `LIMIT`, `ORDER BY` with update |
| `DELETE.sql` | Deleting Data | `DELETE` vs `TRUNCATE` |
| `CONSTRAINT.sql` | Constraints | `UNIQUE`, `CHECK`, `PRIMARY KEY`, `FOREIGN KEY`, `AUTO_INCREMENT` |
| `INDEXES.sql` | Indexes | Creating/dropping indexes, `EXPLAIN` query plan |
| `TRANSACTIONS.sql` | Transactions | `COMMIT`, `ROLLBACK`, `autocommit`, ACID properties |
| `CONTROL_FLOW.sql` | Control Flow | `IF`, `CASE WHEN`, `WHILE`, stored functions |
| `STORED OBJECTS.sql` | Stored Objects | Procedures, functions, triggers |
| `Sakila/` | Sample Database | Schema and data files for the Sakila database |

---

## Topics Covered

### DDL — Data Definition Language
Creating and modifying database structure.
- `CREATE DATABASE`, `DROP DATABASE`
- `CREATE TABLE` with column types, `NULL`/`NOT NULL`, `DEFAULT`
- `ALTER TABLE` — add/drop/modify/rename columns
- `CREATE TABLE ... LIKE` and `CREATE TABLE ... AS SELECT`
- `CREATE VIEW`, `ALTER VIEW`, `DROP VIEW`

### INSERT
All ways to insert rows into a table.
- Basic `INSERT INTO ... VALUES`
- Multi-row insert
- Insert from another table using `SELECT`
- `INSERT ... SET` syntax
- `INSERT ... VALUES ROW()`
- `ON DUPLICATE KEY UPDATE` for upsert behavior

### SELECT
The most comprehensive file — covers the full query lifecycle.
- Arithmetic, boolean expressions, string literals
- `LIKE` with `%` and `_` wildcards
- Character sets and `COLLATE`
- Built-in functions: `ABS`, `ASCII`, `CONCAT`, `LENGTH`, `LOWER`, `SUBSTR`, `TRIM`, `ADDDATE`, `CURDATE`
- User variables with `:=` and `SET`
- `LIMIT`, `ORDER BY`, `DISTINCT`, `UNION`
- `WHERE` with `BETWEEN`, `IN`, `LIKE`, `LOCATE`
- `GROUP BY`, `HAVING`
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` using `ON` and `USING`
- Multi-table joins (3 tables)
- Creating and querying `VIEW`s

### UPDATE
Modifying existing rows safely.
- `UPDATE ... SET ... WHERE`
- `LIMIT` to cap affected rows
- `ORDER BY` combined with `LIMIT` for targeted updates

### DELETE
Removing rows from tables.
- `DELETE FROM ... WHERE`
- `DELETE ... LIMIT`
- `TRUNCATE` vs `DELETE` — behavioral and performance differences

### CONSTRAINT
Enforcing data integrity at the schema level.
- `UNIQUE` — inline, table-level, and named with `CONSTRAINT`
- `AUTO_INCREMENT` — behavior when mixing manual and auto IDs
- `CHECK` — row-level data validation
- `PRIMARY KEY` — inline and table-level definition
- `FOREIGN KEY` — referential integrity between tables

### INDEXES
Speeding up reads with indexes.
- Inline index definition at table creation
- `CREATE INDEX` and `DROP INDEX`
- `EXPLAIN` — reading the query execution plan to verify index usage

### TRANSACTIONS
Grouping operations into atomic units.
- `START TRANSACTION`, `COMMIT`, `ROLLBACK`
- `SET autocommit = 0` for session-level control
- ACID properties explained: Atomicity, Consistency, Isolation, Durability

### CONTROL FLOW
Conditional logic inside SQL and stored routines.
- `IF()` as a ternary operator in `SELECT`
- `CASE WHEN THEN ELSE END` for multi-branch logic
- `IF ... ELSE ... END IF` inside stored functions
- `WHILE` loop inside stored procedures
- `DELIMITER $$` for multi-statement routine definitions

### STORED OBJECTS
Reusable database-side logic.
- Stored procedures and functions

---

## Setup

### Prerequisites
- MySQL 8.0
- MySQL Workbench (optional, recommended)

### Load the Sakila Database
The `SELECT.sql` and `CONTROL_FLOW.sql` files query the Sakila database. Load it first:

```bash
mysql -u root -p < Sakila/sakila-schema.sql
mysql -u root -p < Sakila/sakila-data.sql
```

### Run Any Cheatsheet File
```bash
mysql -u root -p < SELECT.sql
```

Or open any `.sql` file directly in MySQL Workbench and execute it.

---

## Notes

- All scripts are written for **MySQL 8.x**. Some syntax (e.g. `TABLE t1`, `VALUES ROW()`) is not compatible with older versions.
- The `testdb` database is created and dropped within scripts that need it — safe to run repeatedly.
- Inline comments (`--` and `#`) explain non-obvious behavior throughout each file.
