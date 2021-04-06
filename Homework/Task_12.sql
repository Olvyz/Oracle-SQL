CREATE TABLE address (
id INTEGER CONSTRAINT ad_id UNIQUE,
country VARCHAR2(30),
city VARCHAR2(20));

CREATE TABLE friends(
id INTEGER,
name VARCHAR2(20),
email VARCHAR2(20),
address_id INTEGER REFERENCES address(id) ON DELETE SET NULL,
birthday DATE,
CHECK (LENGTH(name) > 3));

CREATE UNIQUE INDEX ind1 ON friends(id);

ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);

CREATE INDEX fr_email ON friends(email);

ALTER TABLE friends MODIFY (email CONSTRAINT fr_email_nn NOT NULL);

DROP TABLE friends;

DROP TABLE address;
