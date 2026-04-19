-- OUTPUT OF SELECT IS ALWAYS A RELATIONAL DB (TABLE)

SELECT 1+1; # can be used as print

SELECT 'Hello, SQL';  # '' to read a string value

SELECT 1, 'Test'; # multi type DATA

SELECT 'Hello, SQL' AS Greetings; #alias (nickname for columns)

SELECT "\'This is a quoted text\'";

SELECT "This is a single quote \' and this is a doublequote \" ";

-- arithmetic
SELECT 1 + 2;

SELECT 5 % 2;

-- boolean
SELECT 1 = 2;

SELECT 1 <> 2; #does not equal

SELECT 'Hello, SQL' = 'Hello, SQL';

SELECT 'hello, sql' = 'Hello, SQL'; # not case senstive

# Like used in comparing strings

SELECT 'Hello, SQL' LIKE 'Hello, SQL'; # not case senstive

SELECT 'Hello, SQL' LIKE 'Hello, %'; # % can replace any number of characters

SELECT 'Hello, SQL' LIKE 'L%';

SELECT 'Hello, SQL' LIKE '%L';

SELECT 'Hello, SQL' LIKE '%LL%';

# _ can replace one char only

-- charactersets and collations
SELECT 'a' =  'ä';
SELECT 'a' LIKE 'ä';

SELECT 'a' =  'ä' COLLATE utf8mb4_german2_ci; #override the default mysql behavior
SELECT 'a' LIKE 'ä' COLLATE utf8mb4_german2_ci;

SELECT 'a' like  'ä' COLLATE utf8mb4_cs_0900_as_cs;

-- built-in functions and operators 

SELECT abs(-5);
SELECT ASCII('a'), ASCII('ä');
SELECT ASCII('ab'); #RETURN THE FIRST LETTER
SELECT CHAR(97); #DOES NOT WORK RIGHT
SELECT CHAR(ASCII('d'));

-- date and time functions
SELECT ADDDATE('2022-12-08', 24);
SELECT 
    ADDDATE('2022-12-08', 24),
    DAY('2022-12-08'),
    DAYNAME('2022-12-08'),
    MONTH('2022-12-08'),
    MONTHNAME('2022-12-08');
    
SELECT CURDATE(); # CURRENT DATE

-- string functions
SELECT CONCAT('my', 'name', 'is', 'prince');
SELECT CONCAT_WS(' ', 'my', 'name', 'is', 'prince'); #CONCAT WITH SEPERATOR
SELECT LENGTH('ahmed');
SELECT LENGTH(CONCAT_WS(' ', 'my', 'name', 'is', 'prince'));
SELECT LOWER('AHMED');
SELECT LEFT('This is the a text', 10); # 10 char from left
SELECT RIGHT('This is the a text', 10);
SELECT SUBSTR('This is a long text', 6, 10);
SELECT TRIM('  bar   ');
SELECT TRIM(LEADING 'x' FROM 'xbarx');
SELECT TRIM(TRAILING 'x' FROM 'xbarx');
SELECT TRIM(BOTH 'x' FROM 'xbarx');

SELECT TRUE, FALSE;
SELECT 'b' IN ('a' , 'b', 'c', 'd', 'e', 'f');
SELECT 'b' NOT IN ('a' , 'b', 'c', 'd', 'e', 'f');
SELECT instr("abcdefg", "f") IS TRUE;
SELECT instr("abcdefg", "x") IS TRUE;
SELECT ISNULL(NULL);
SELECT ISNULL(1/0); #UNDEF = NULL
SELECT ISNULL(''); #EMPTY STRING

SELECT 5 between 1 AND 10;

SELECT IF(5 > 4, "TRUE", "FALSE"); #TERNARY OPERATOR

-- assignment operator SET using := and = 
-- assignment operator SELECT using :=
SET @var5 := 5;
SET @vara = 'a';
SELECT @var5, @vara, @var10 := 10;

SELECT @var11 = 11; -- null

-- select from tables

SELECT actor_id FROM sakila.actor;  # without from it reads actor_id as a variable
SELECT count(actor_id) FROM	sakila.actor;
SELECT DISTINCT actor_id FROM sakila.actor;
SELECT first_name FROM sakila.actor;

USE sakila;
SELECT actor_id, first_name FROM actor; #Multiple values
SELECT actor_id, LEFT(first_name,3) FROM actor;
SELECT actor_id, first_name FROM actor LIMIT 5;
SELECT actor_id, first_name FROM actor LIMIT 5, 10;
SELECT actor_id, first_name, 'dummy text' FROM actor LIMIT 5; # when the valuse match duumy test is inseted in a new column
SELECT * FROM actor;
SELECT *, 'Dummy_text' FROM actor;

-- table stmt
TABLE actor; # similar to SELECT * FROM actor

SELECT 
    actor_id  AS "Actor ID",
    CONCAT(LOWER(first_name), ' ', LOWER(last_name)) AS "Actor Full Name",
    last_update AS "Last updated"
FROM
    actor; # use built-in functions
    
    -- sorting 

SELECT actor_id, first_name, last_name, last_update FROM actor;
SELECT actor_id, first_name, last_name, last_update FROM actor ORDER BY first_name;
SELECT actor_id, first_name, last_name, last_update FROM actor ORDER BY last_name;
SELECT rental_id, rental_date FROM rental ORDER BY rental_date;
SELECT actor_id, first_name, last_name, last_update FROM actor ORDER BY first_name, last_name; # by first name and if similar the use lastname

-- union

(SELECT actor_id, first_name FROM actor LIMIT 5, 10)
UNION 
(SELECT actor_id, first_name FROM actor LIMIT 50 , 10);

-- where clause
SELECT * FROM film_text;
SELECT * FROM film_text WHERE film_id < 10;
SELECT * FROM film_text WHERE film_id between 16 and 90;
SELECT * FROM film_text WHERE length(title) < 10;
SELECT * FROM film_text WHERE title LIKE "Ar%";
SELECT * FROM film_text WHERE title LIKE "Ar%" and film_id > 38;
SELECT * FROM film_text WHERE locate("drama", description);
SELECT *, locate("drama", description) FROM film_text WHERE locate("drama", description);

-- group by

SELECT customer_id, count(rental_id) FROM rental group by customer_id;
SELECT customer_id, count(rental_id) FROM rental group by customer_id ORDER BY count(rental_id) DESC;

-- Having 
SELECT customer_id, sum(amount) FROM payment GROUP BY customer_id HAVING sum(amount) > 150 ORDER BY sum(amount) DESC; 

-- joins
# INNER JOIN: Returns only rows where there's a match in both tables.
# LEFT JOIN: Returns all rows from the left table, with matching rows from the right.  Non-matching right side → NULL.
# RIGHT JOIN: Returns all rows from the right table, with matching rows from the left. Non-matching left side → NULL.
# FULL OUTER JOIN: Returns all rows from both tables. Where there's no match on either side → NULL.

SELECT category_id, name FROM category;
SELECT film_id, category_id  FROM film_category;

SELECT film_category.film_id, category.category_id, category.name FROM category
INNER JOIN film_category
ON film_category.category_id = category.category_id;

SELECT fc.film_id, c.category_id, c.name FROM category AS c
INNER JOIN film_category AS fc
ON fc.category_id  = c.category_id;

SELECT fc.film_id, c.category_id, c.name FROM category AS c
INNER JOIN film_category AS fc
USING (category_id);

SELECT fc.film_id, c.category_id, c.name FROM category AS c
LEFT JOIN film_category AS fc
USING (category_id);

SELECT fc.film_id, c.category_id, c.name FROM category AS c
RIGHT JOIN film_category AS fc
USING (category_id);

-- join 3 tables

SELECT fc.film_id, f.title, c.category_id, c.name FROM category AS c
INNER JOIN film_category AS fc
ON fc.category_id  = c.category_id
INNER JOIN film AS f
ON f.film_id = fc.film_id;

-- VIEW: A virtual table based on a SELECT query. Doesn't store data itself, just stores the query definition.

CREATE VIEW vw_file_genre
AS
SELECT fc.film_id, f.title AS "Film Name", c.name AS "Genre" FROM category AS c
INNER JOIN film_category AS fc
ON fc.category_id  = c.category_id
INNER JOIN film AS f
ON f.film_id = fc.film_id;

SELECT * FROM sakila.vw_file_genre
