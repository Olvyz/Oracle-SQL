CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);

INSERT INTO locations2 VALUES (4000, '1254 Via Coca Cola', 101010, 'Roma', NULL, 'IT');
INSERT INTO locations2 VALUES (4100, '1254 Via Pepsi', 010101, 'Roma', NULL, 'IT');
COMMIT;

INSERT INTO locations2 VALUES (4100+100, LOWER('2114 ChaRAde RUe'), 102121, INITCAP('paris'), NULL, (SELECT country_id FROM countries WHERE country_name = 'France'));
INSERT INTO locations2 VALUES (4100+200, UPPER('2114 ChaRAde RUe'), 102121, INITCAP('paris'), NULL, (SELECT country_id FROM countries WHERE country_name = 'France'));
COMMIT;

INSERT INTO locations2 (location_id, street_address, postal_code, city, state_province, country_id)
(SELECT * FROM locations WHERE LENGTH(state_province) > 9);
COMMIT;

CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);

INSERT ALL
WHEN 1=1 THEN
INTO locations2 VALUES (location_id, street_address, postal_code, city, state_province, country_id)
WHEN (city IN (SELECT l.city FROM locations l JOIN countries c ON (l.country_id = c.country_id) JOIN regions r ON (c.region_id = r.region_id)
WHERE r.region_name = 'Europe')) THEN
INTO locations4europe (location_id, street_address, city, country_id) VALUES (location_id, street_address, city, country_id)
SELECT * FROM locations;
COMMIT;

UPDATE locations2 SET postal_code = 999999 WHERE postal_code IS NULL;
ROLLBACK;

UPDATE locations2 SET postal_code = (SELECT postal_code FROM locations WHERE location_id = 2600) WHERE postal_code IS NULL;
COMMIT;

DELETE FROM locations2 WHERE country_id = 'IT';
SAVEPOINT s1;

UPDATE locations2 SET street_address = 'Sezam st. 18' WHERE location_id > 2500;
SAVEPOINT s2;

DELETE FROM locations2 WHERE street_address = 'Sezam st. 18';
ROLLBACK TO SAVEPOINT s1;
COMMIT;
