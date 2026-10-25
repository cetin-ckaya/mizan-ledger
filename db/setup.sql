-- Creates the MIZAN application user (schema) with least-privilege grants.
-- Run once as SYSTEM, connected to the pluggable database:
--   sql system/<password>@localhost:1521/FREEPDB1
--   @db/setup.sql
-- To start over: DROP USER mizan CASCADE;

SET VERIFY OFF

ACCEPT girilen_sifre CHAR PROMPT 'Password for mizan user: ' HIDE

CREATE USER mizan IDENTIFIED BY "&girilen_sifre";

GRANT CREATE TABLE, CREATE SESSION, CREATE SEQUENCE, CREATE TRIGGER, CREATE PROCEDURE, CREATE VIEW TO mizan;

ALTER USER mizan QUOTA UNLIMITED ON USERS;
