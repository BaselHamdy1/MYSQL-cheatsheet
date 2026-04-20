# MySQL Cheatsheet

A practical SQL reference organized by topic. Each file is a self-contained cheatsheet with working examples.

## Topics

- `SELECT.sql` — queries, filtering, joins, views, group by, having, union
- `INSERT.sql` — insert syntax, on duplicate key, copy from table
- `UPDATE.sql` — update with where, limit, order by
- `DELETE.sql` — delete vs truncate
- `CONSTRAINT.sql` — unique, check, primary key, foreign key, auto increment
- `INDEXES.sql` — create/drop index, explain query plan
- `TRANSACTION.sql` — commit, rollback, savepoints
- `CONTROL_FLOW.sql` — if, case, loops
- `STORED_OBJECTS.sql` — procedures, functions, triggers, views

## Usage

Run any file directly in MySQL Workbench or via CLI:
```bash
mysql -u root -p < SELECT.sql
```

> Tested on MySQL 8.x
