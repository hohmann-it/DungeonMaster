-- Do initialization
SET statement_timeout                   = 0;
SET lock_timeout                        = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding                     = 'UTF8';
SET standard_conforming_strings         = on;
SELECT
       pg_catalog.set_config('search_path', '', false)
;

SET check_function_bodies = false;
SET xmloption             = content;
SET client_min_messages   = warning;
SET row_security          = off;
-- Forcibly disconnect all users
SELECT
       pg_terminate_backend(pid)
FROM
       pg_stat_activity
WHERE
       datname = 'dungeonmaster'
;

-- Drop any existing database
DROP DATABASE
IF EXISTS dungeonmaster;
    DROP USER
    IF EXISTS dungeonmaster;
        CREATE USER dungeonmaster WITH PASSWORD 'Ra9tai6fa';
        -- Create the new database
        CREATE DATABASE dungeonmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';
        -- Change owner to dungeonmaster
        ALTER DATABASE dungeonmaster OWNER TO dungeonmaster;
        -- Connect to database
        \connect dungeonmaster
        -- Do initialization
        SET statement_timeout                   = 0;
        SET lock_timeout                        = 0;
        SET idle_in_transaction_session_timeout = 0;
        SET client_encoding                     = 'UTF8';
        SET standard_conforming_strings         = on;
        SELECT
               pg_catalog.set_config('search_path', '', false)
        ;
        
        SET check_function_bodies = false;
        SET xmloption             = content;
        SET client_min_messages   = warning;
        SET row_security          = off;
        -- Add comment to database
        COMMENT ON DATABASE dungeonmaster
    IS
        'The dungeonmaster core database';
        -- Set default tablespace & acces method
        SET default_tablespace          = '';
        SET default_table_access_method = heap;
        -- Create Charaktere Table
        CREATE TABLE public.charaktere
                     (
                                  charakter_id bigint NOT NULL
                                , klasse       text
                                , name         text NOT NULL
                     )
        ;
        
        ALTER TABLE public.charaktere OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.charakter_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.charakter_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.charakter_id_seq OWNED BY public.charaktere.charakter_id;
        ALTER TABLE ONLY public.charaktere ALTER COLUMN charakter_id SET DEFAULT nextval('public.charakter_id_seq'::regclass)
        ;
        
        -- Create Zauber Table
        CREATE TABLE public.zauber
                     (
                                  zauber_id            bigint NOT NULL
                                , name                 text NOT NULL
                                , zeitaufwand          integer NOT NULL
                                , fk_zeitaufwand_typ   bigint NOT NULL
                                , reichweite           integer NOT NULL
                                , fk_reichweite_typ    bigint NOT NULL
                                , wirkungsdauer        integer NOT NULL
                                , fk_wirkungsdauer_typ bigint NOT NULL
                                , beschreibung         text NOT NULL
                                , hoehere_grade        text
                                , grad                 integer NOT NULL
                                , fk_typ               bigint NOT NULL
                     )
        ;
        
        ALTER TABLE public.zauber OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauber_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauber_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauber_id_seq OWNED BY public.zauber.zauber_id;
        ALTER TABLE ONLY public.zauber ALTER COLUMN zauber_id SET DEFAULT nextval('public.zauber_id_seq'::regclass)
        ;
        
        --Create Zaubertyp Table
        CREATE TABLE public.zaubertyp
                     (
                                  zaubertyp_id bigint NOT NULL
                                , typ          text NOT NULL
                                , kategorie    text
                     )
        ;
        
        ALTER TABLE public.zaubertyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zaubertyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zaubertyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zaubertyp_id_seq OWNED BY public.zaubertyp.zaubertyp_id;
        ALTER TABLE ONLY public.zaubertyp ALTER COLUMN zaubertyp_id SET DEFAULT nextval('public.zaubertyp_id_seq'::regclass)
        ;
        
        -- Create Zeitaufwandtyp Table
        CREATE TABLE public.zeitaufwandtyp
                     (
                                  zeitaufwandtyp_id bigint NOT NULL
                                , typ               text NOT NULL
                     )
        ;
        
        ALTER TABLE public.zeitaufwandtyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zeitaufwandtyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zeitaufwandtyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zeitaufwandtyp_id_seq OWNED BY public.zeitaufwandtyp.zeitaufwandtyp_id;
        ALTER TABLE ONLY public.zeitaufwandtyp ALTER COLUMN zeitaufwandtyp_id SET DEFAULT nextval('public.zeitaufwandtyp_id_seq'::regclass)
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Krieger'
                    , 'Roland
'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Magier'
                    , 'Jens'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Barde'
                    , 'Rittersporn'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Namenloser Held'
                    , 'Namenlos'
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Verzauberung'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Bannzauber'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Hervorrufung'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Beschwörung'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Verwandlung'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Erkenntniszauberei'
                    , ''
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Illusion'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Nekromantie'
                    , NULL
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Aktion'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Bonusaktion'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Minuten'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Reaktion, die du ausführst, wenn du von einem Angriff getroffen oder Ziel des Zaubers "Magisches Geschoss" wirst'
               )
        ;
        
        ALTER TABLE ONLY public.charaktere ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id)
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id)
        ;
        
        ALTER TABLE ONLY public.zaubertyp ADD CONSTRAINT zaubertyp_pkey PRIMARY KEY (zaubertyp_id)
        ;
        
        ALTER TABLE ONLY public.zeitaufwandtyp ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id)
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_zaubertyp FOREIGN KEY (fk_typ) REFERENCES public.zaubertyp(zaubertyp_id) NOT VALID
        ;