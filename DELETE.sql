USE testdb;
DELETE FROM t1;

-- delete rows from t1 where id = 1
DELETE FROM t1 WHERE id = 1;

-- delete rows from t1 using LIMIT
DELETE FROM t1 LIMIT 1;

-- you can also use the TRUNCATE statement
TRUNCATE TABLE t2; 

-- DELETE is a DML command — it removes rows one by one, logs each deletion, and can be rolled back if inside a transaction. You can filter with WHERE to target specific rows.
-- TRUNCATE is a DDL command — it drops and recreates the table internally, wiping everything all at once without logging individual rows. That's why it's faster, can't be rolled back, and resets