\echo ''\echo ''\echo '=========Disconnect all users========='\echo ''\echo ''
SELECT
    pg_terminate_backend(pid)
FROM
    pg_stat_activity
WHERE
    datname = 'dungeonmaster'
;

\echo ''\echo ''\echo '=========Drop & Create========='\echo ''\echo ''
DROP DATABASE
IF EXISTS dungeonmaster;
DROP USER
IF EXISTS dungeonmaster;
CREATE USER dungeonmaster WITH PASSWORD :'password';
CREATE DATABASE dungeonmaster WITH ENCODING = 'UTF8';
ALTER DATABASE dungeonmaster OWNER TO dungeonmaster;
\connect dungeonmaster
CREATE SCHEMA dd;
CREATE SCHEMA od;
GRANT USAGE ON SCHEMA dd TO dungeonmaster;
GRANT USAGE ON SCHEMA od TO dungeonmaster;
DROP SCHEMA IF EXISTS public;
SET statement_timeout                   = 0;
SET lock_timeout                        = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding                     = 'UTF8';
SET standard_conforming_strings         = on;
SET check_function_bodies               = false;
SET xmloption                           = content;
SET client_min_messages                 = warning;
SET row_security                        = off;
SET default_tablespace                  = '';
SET default_table_access_method         = heap;
SELECT
    pg_catalog.set_config('search_path', '', false)
;

COMMENT ON DATABASE dungeonmaster IS 'The dungeonmaster core database';