DROP DATABASE IF EXISTS testdb;
CREATE DATABASE IF NOT EXISTS testdb;

-- unique constraint

-- create table

USE testdb;

DROP TABLE IF EXISTS t1;

CREATE TABLE t1 (
    id INT UNIQUE, # integer unique values only
    first_name VARCHAR(20)
    );
DESC t1;

INSERT INTO t1 VALUES (1, 'ahmed'), (2, 'aya'), (3, 'john');

-- insert a row with the same id 
INSERT INTO t1 VALUES (1, 'ali'); # error because id already exist

-- other ways to define unique constraint
CREATE TABLE t2 (
    id INT, 
    first_name VARCHAR(20),
    UNIQUE (id)
    );
DESC t2;

CREATE TABLE t3 (
    id INT, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id)
    );
DESC t3;

-- auto increment
CREATE TABLE t4 (
    id INT AUTO_INCREMENT, # automatically generates a unique integer for each new row incrementing by 1 each time.
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id)
    );
    
-- insert a row without id
INSERT INTO t4 (first_name) VALUES ('ahmed');
TABLE t4;
INSERT INTO t4 (first_name) VALUES ('sami'), ('aya');

-- insert a row with id
INSERT INTO t4 VALUES (10, 'ali');
INSERT INTO t4 (first_name) VALUES ('hasan');
# in this case it allows you to insert values with id but it will start increminting from last id inserted

-- check constraints
CREATE TABLE t5 (
    id INT AUTO_INCREMENT, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id),
    CHECK (LENGTH(first_name) > 4) # used in data validation
    );
    
-- primay and foreign keys
# primary: uniquely identifies each row in a table Can't be NULL or duplicate
#foreign: a column that references the primary key of another table, creating a link between the two

CREATE TABLE t6 (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id)
    );

-- another way to define primary key
CREATE TABLE t6 (
    id INT AUTO_INCREMENT, 
    first_name VARCHAR(20),
    CONSTRAINT id_unique UNIQUE (id),
    PRIMARY KEY (id)
    );
    
INSERT INTO t6 (first_name) VALUES ('ahmed'), ('ali'), ('aya');
TABLE t6;

-- create a table t7 with foreign key
CREATE TABLE t7 (
    id INT, 
    class VARCHAR(20),
    FOREIGN KEY (id) REFERENCES t6(id)
    );
# foreign key is a constraint because i can't add id in t7 that doesn't exist in t6 where id is a primary key
TABLE t7;

INSERT INTO t7 
VALUES  (1, 'Math'), 
        (1, 'English'), 
        (2, 'Math'), 
        (3, 'Science'),
        (3, 'Math');        
TABLE t7;

DROP TABLE t1;
DROP TABLE t2;
DROP TABLE t3;
DROP TABLE t4;
DROP TABLE t5;

-- reverse engineer in mysql workbench
