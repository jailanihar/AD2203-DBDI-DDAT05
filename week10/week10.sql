-- SQL statements can be broken to five categories.
-- 1. Data Definition Language (DDL) - CREATE, DROP, ALTER, TRUNCATE
-- 2. Data Manipulation Language (DML) - INSERT, UPDATE, DELETE
-- 3. Data Query Language (DQL) - SELECT
-- 4. Data Control Language (DCL) - GRANT, REVOKE
-- 5. Transaction Control Language (TCL) - COMMIT, SAVEPOINT, ROLLBACK

-- Data Definition Language (DDL)

CREATE DATABASE dbdi_week10;

SHOW DATABASES;

USE dbdi_week10;

CREATE TABLE week10 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    topic VARCHAR(255)
);

SHOW TABLES;

DESCRIBE week10;

ALTER TABLE week10 ADD learning_objectives TEXT;

ALTER TABLE week10 ADD (abc INT, def DECIMAL, ghi DATETIME);

ALTER TABLE week10 CHANGE def jkl DECIMAL(5,2) AFTER topic;

ALTER TABLE week10 RENAME COLUMN ghi TO mno;

ALTER TABLE week10 ADD pqr TINYINT, RENAME COLUMN abc TO stu, MODIFY COLUMN topic VARCHAR(100);

ALTER TABLE week10 DROP COLUMN pqr;

ALTER TABLE week10 DROP COLUMN jkl, DROP COLUMN learning_objectives, DROP COLUMN stu, DROP COLUMN mno;

-- This is not part of DDL, this is part of Data Manipulation Language (DML)
INSERT INTO week10(topic) VALUES ('Alphabet'), ('Counting'), ('Phonics');

-- This is not part of DDL, this is part of Data Query Language (DQL)
SELECT * FROM week10;

-- Continue on DDL
TRUNCATE TABLE week10;

DROP TABLE week10;

DROP DATABASE dbdi_week10;

