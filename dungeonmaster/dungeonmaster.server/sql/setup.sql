-- Database: dungeonmaster

DROP DATABASE IF EXISTS dungeonmaster;

CREATE DATABASE dungeonmaster
    WITH
    OWNER = dungeonmaster
    ENCODING = 'UTF8'
    LC_COLLATE = 'German_Germany.1252'
    LC_CTYPE = 'German_Germany.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE dungeonmaster
    IS 'The dungeonmaster database';
    
-- Table: public.characters

DROP TABLE IF EXISTS public.characters;

CREATE TABLE IF NOT EXISTS public.characters
(
    character_id integer NOT NULL,
    class "char",
    name "char" NOT NULL,
    CONSTRAINT "Characters_pkey" PRIMARY KEY (character_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.characters
    OWNER to dungeonmaster;
