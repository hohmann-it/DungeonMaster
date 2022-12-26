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
        
        ALTER TABLE ONLY public.charaktere ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id)
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
                                , fk_zauber_typ        bigint NOT NULL
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
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id)
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
        
        ALTER TABLE ONLY public.zaubertyp ADD CONSTRAINT zaubertyp_pkey PRIMARY KEY (zaubertyp_id)
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
        
        ALTER TABLE ONLY public.zeitaufwandtyp ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id)
        ;
        
        -- Create Reichweitetyp Table
        CREATE TABLE public.reichweitetyp
                     (
                                  reichweitetyp_id bigint NOT NULL
                                , typ_lang         text NOT NULL
                                , typ_kurz         text NOT NULL
                     )
        ;
        
        ALTER TABLE public.reichweitetyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.reichweitetyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.reichweitetyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.reichweitetyp_id_seq OWNED BY public.reichweitetyp.reichweitetyp_id;
        ALTER TABLE ONLY public.reichweitetyp ALTER COLUMN reichweitetyp_id SET DEFAULT nextval('public.reichweitetyp_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.reichweitetyp ADD CONSTRAINT reichweitetyp_pkey PRIMARY KEY (reichweitetyp_id)
        ;
        
        -- Create Wirkungsdauertyp Table
        CREATE TABLE public.wirkungsdauertyp
                     (
                                  wirkungsdauertyp_id bigint NOT NULL
                                , typ                 text NOT NULL
                     )
        ;
        
        ALTER TABLE public.wirkungsdauertyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.wirkungsdauertyp_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.wirkungsdauertyp_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.wirkungsdauertyp_id OWNED BY public.wirkungsdauertyp.wirkungsdauertyp_id;
        ALTER TABLE ONLY public.wirkungsdauertyp ALTER COLUMN wirkungsdauertyp_id SET DEFAULT nextval('public.wirkungsdauertyp_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.wirkungsdauertyp ADD CONSTRAINT wirkungsdauertyp_pkey PRIMARY KEY (wirkungsdauertyp_id)
        ;
        
        -- Create zauberkomponentetyp Table
        CREATE TABLE public.zauberkomponentetyp
                     (
                                  zauberkomponentetyp_id bigint NOT NULL
                                , typ_kurz               text NOT NULL
                                , typ_lang               text NOT NULL
                     )
        ;
        
        ALTER TABLE public.zauberkomponentetyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauberkomponentetyp_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauberkomponentetyp_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauberkomponentetyp_id OWNED BY public.zauberkomponentetyp.zauberkomponentetyp_id;
        ALTER TABLE ONLY public.zauberkomponentetyp ALTER COLUMN zauberkomponentetyp_id SET DEFAULT nextval('public.zauberkomponentetyp_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zauberkomponentetyp ADD CONSTRAINT zauberkomponentetyp_pkey PRIMARY KEY (zauberkomponentetyp_id)
        ;
        
        -- Create zauberkomponente Table
        CREATE TABLE public.zauberkomponente
                     (
                                  zauberkomponente_id     bigint NOT NULL
                                , fk_zauber               bigint NOT NULL
                                , fk_zauberkomponente_typ bigint NOT NULL
                     )
        ;
        
        ALTER TABLE public.zauberkomponente OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauberkomponente_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauberkomponente_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauberkomponente_id OWNED BY public.zauberkomponente.zauberkomponente_id;
        ALTER TABLE ONLY public.zauberkomponente ALTER COLUMN zauberkomponente_id SET DEFAULT nextval('public.zauberkomponente_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT zauberkomponente_pkey PRIMARY KEY (zauberkomponente_id)
        ;
        
        -- Create Material Table
        CREATE TABLE public.material
                     (
                                  material_id bigint NOT NULL
                                , name        text NOT NULL
                     )
        ;
        
        ALTER TABLE public.material OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.material_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.material_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.material_id OWNED BY public.material.material_id;
        ALTER TABLE ONLY public.material ALTER COLUMN material_id SET DEFAULT nextval('public.material_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.material ADD CONSTRAINT material_pkey PRIMARY KEY (material_id)
        ;
        
        -- Create Zauberzaubermaterial Table
        CREATE TABLE public.zaubermaterial
                     (
                                  zaubermaterial_id   bigint NOT NULL
                                , fk_zauberkomponente bigint NOT NULL
                                , ersatz              bigint NOT NULL
                                , fk_material         bigint NOT NULL
                                , anzahl              int NOT NULL
                     )
        ;
        
        ALTER TABLE public.zaubermaterial OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zaubermaterial_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zaubermaterial_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zaubermaterial_id OWNED BY public.zaubermaterial.zaubermaterial_id;
        ALTER TABLE ONLY public.zaubermaterial ALTER COLUMN zaubermaterial_id SET DEFAULT nextval('public.zaubermaterial_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT zaubermaterial_pkey PRIMARY KEY (zaubermaterial_id)
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT fk_zauberkomponente FOREIGN KEY (fk_zauberkomponente) REFERENCES public.zauberkomponente(zauberkomponente_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT fk_material FOREIGN KEY (fk_material) REFERENCES public.material(material_id) NOT VALID
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
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Meter'
                    , 'm'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst'
                    , 'Selbst'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst (Würfel mit 4,5m Seitenlänge)'
                    , 'Selbst (Würfel)'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst (Radius von 4,5m)'
                    , 'Selbst (Radius)'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Berührung'
                    , 'Berührung'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Runden'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Stunden'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Unmittelbar'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Konzentration, bis zu 10 Minuten'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Konzentration, bis zu 8 Stunden'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Konzentration, bis zu 1 Minute'
               )
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_zauber_typ FOREIGN KEY (fk_zauber_typ) REFERENCES public.zaubertyp(zaubertyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_reichweite_typ FOREIGN KEY (fk_reichweite_typ) REFERENCES public.reichweitetyp(reichweitetyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_wirkungsdauer_typ FOREIGN KEY (fk_wirkungsdauer_typ) REFERENCES public.wirkungsdauertyp(wirkungsdauertyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_zeitaufwand_typ FOREIGN KEY (fk_zeitaufwand_typ) REFERENCES public.zeitaufwandtyp(zeitaufwandtyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT fk_zauberkomponente_typ FOREIGN KEY (fk_zauberkomponente_typ) REFERENCES public.zauberkomponentetyp(zauberkomponentetyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES public.zauber(zauber_id) NOT VALID
        ;