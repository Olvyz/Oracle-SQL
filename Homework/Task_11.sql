CREATE TABLE friends AS (SELECT employee_id id, first_name name, last_name surname FROM employees WHERE commission_pct IS NOT NULL);

ALTER TABLE friends ADD (email VARCHAR2(40) DEFAULT NULL); 

ALTER TABLE friends MODIFY (email VARCHAR2(40) DEFAULT 'no email');

INSERT INTO friends (id, name, surname) VALUES (200,'Ivan', 'Navi');

ALTER TABLE friends RENAME COLUMN id TO friends_id;

DROP TABLE friends;

CREATE TABLE friends (
id INTEGER, 
name VARCHAR2(20), 
surname VARCHAR2(40), 
email VARCHAR2(40), 
salary NUMBER(6) DEFAULT 0, 
city VARCHAR2(40), 
birthday DATE DEFAULT TO_DATE('01-JAN-1990', 'DD-MON-YYYY'));

INSERT INTO friends VALUES (100,'Ivan', 'Navi','rrrrr@ddd.com', 12000, 'Roma', '12-MAR-1985');
INSERT INTO friends (id, name, surname, email, city) VALUES (200,'Navi', 'Ivan','aaaaa@ddd.com', 'Roma');
COMMIT;

ALTER TABLE friends DROP COLUMN salary;

ALTER TABLE friends SET UNUSED COLUMN email;

ALTER TABLE friends SET UNUSED COLUMN birthday;

ALTER TABLE friends DROP UNUSED COLUMNS;

ALTER TABLE friends READ ONLY;

INSERT INTO friends VALUES (300,'Avin', 'Niva', 'Roma');

TRUNCATE TABLE friends;

DROP TABLE friends;
