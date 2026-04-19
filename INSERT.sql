-- create database
CREATE DATABASE IF NOT EXISTS testdb;

-- create table
USE testdb;
CREATE TABLE t1 (id INT, first_name VARCHAR(20));

SHOW COLUMNS FROM t1;
-- or
DESC t1; # DESC = describe

-- insert valuse to t1
INSERT INTO t1 VALUES (1, 'Ahmed'); # ordered tuple of values

-- inserting multiple val
INSERT INTO t1 VALUES (2, 'Aya'), (3, 'John');

SELECT * FROM t1;

-- create a table t2 based on t1
CREATE TABLE t2 LIKE t1; # same structure as t1

-- insert values into table t2 from t1
INSERT INTO t2 SELECT * FROM t1;
-- INSERT INTO t2 SELECT id, first_name FROM t1; use this if i want to insert specific columns

-- insert values into table t2 from t1 with column names
INSERT INTO t2 (id, first_name) VALUES ('10', 'Tamer');
INSERT INTO t2 (first_name, id) VALUES ('Hany', '11');
-- INSERT INTO t2 (id, first_name) SELECT id, first_name FROM t1;

SELECT * from t2;

-- insert into table t2 using SET
INSERT INTO t2 SET id = 4, first_name = 'basel';

-- insert into table t2 using ROW()
INSERT INTO t2 VALUES ROW(5, 'mohamed');

-- insert into table t1 using ON DUPLICATE KEY UPDATE
INSERT INTO t1 VALUES (1, 'ali') ON DUPLICATE KEY UPDATE first_name = 'ali';