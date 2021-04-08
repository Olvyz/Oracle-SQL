CREATE TABLE test200 (
id INTEGER,
name1 VARCHAR2(20),
name2 VARCHAR2(20),
address1 VARCHAR2(20),
address2 VARCHAR2(20));

UPDATE test200 SET &col = &colval WHERE id = &val_id;

SELECT * FROM test200
WHERE name1 = '&&val1' AND name2 = '&val1'
AND address1 = '&&val2' AND address2 = '&val2';

UNDEFINE val1;

UNDEFINE val2;