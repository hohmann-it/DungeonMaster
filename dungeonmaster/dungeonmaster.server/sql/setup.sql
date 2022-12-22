-- Do initialization

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Forcibly disconnect all users
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = 'dungeonmaster';

-- Drop any existing database
DROP DATABASE IF EXISTS dungeonmaster;

DROP USER IF EXISTS dungeonmaster;

CREATE USER dungeonmaster WITH PASSWORD 'Ra9tai6fa';

-- Create the new database
CREATE DATABASE dungeonmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';

-- Change owner to dungeonmaster
ALTER DATABASE dungeonmaster OWNER TO dungeonmaster;

-- Connect to database
\connect dungeonmaster

-- Do initialization
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Add comment to database
COMMENT ON DATABASE dungeonmaster IS 'The dungeonmaster core database';

-- Set default tablespace & acces method
SET default_tablespace = '';
SET default_table_access_method = heap;


-- Create Charaktere Table
CREATE TABLE public.charaktere (
    charakter_id bigint NOT NULL,
    klasse text,
    name text NOT NULL
);
ALTER TABLE public.charaktere OWNER TO dungeonmaster;

CREATE SEQUENCE public.charakter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.charakter_id_seq OWNER TO dungeonmaster;

ALTER SEQUENCE public.charakter_id_seq OWNED BY public.charaktere.charakter_id;

ALTER TABLE ONLY public.charaktere ALTER COLUMN charakter_id SET DEFAULT nextval('public.charakter_id_seq'::regclass);

-- Create Zauber Table

CREATE TABLE public.zauber (
    zauber_id bigint NOT NULL,
    name text NOT NULL,
    zeitaufwand integer NOT NULL,
    fk_zeitaufwand_typ bigint NOT NULL,
    reichweite integer NOT NULL,
    fk_reichweite_typ bigint NOT NULL,
    wirkungsdauer integer NOT NULL,
    fk_wirkungsdauer_typ bigint NOT NULL,
    beschreibung text NOT NULL,
    hoehere_grade text,
    grad integer NOT NULL,
    fk_typ bigint NOT NULL
);
ALTER TABLE public.zauber OWNER TO dungeonmaster;

CREATE SEQUENCE public.zauber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.zauber_id_seq OWNER TO dungeonmaster;

ALTER SEQUENCE public.zauber_id_seq OWNED BY public.zauber.zauber_id;

ALTER TABLE ONLY public.zauber ALTER COLUMN zauber_id SET DEFAULT nextval('public.zauber_id_seq'::regclass);

--Create Zaubertyp Table

CREATE TABLE public.zaubertyp (
    zaubertyp_id bigint NOT NULL,
    typ text NOT NULL,
    kategorie text
);
ALTER TABLE public.zaubertyp OWNER TO dungeonmaster;

CREATE SEQUENCE public.zaubertyp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.zaubertyp_id_seq OWNER TO dungeonmaster;

ALTER SEQUENCE public.zaubertyp_id_seq OWNED BY public.zaubertyp.zaubertyp_id;

ALTER TABLE ONLY public.zaubertyp ALTER COLUMN zaubertyp_id SET DEFAULT nextval('public.zaubertyp_id_seq'::regclass);

-- Create Zeitaufwandtyp Table

CREATE TABLE public.zeitaufwandtyp (
    zeitaufwandtyp_id bigint NOT NULL,
    typ text NOT NULL
);
ALTER TABLE public.zeitaufwandtyp OWNER TO dungeonmaster;

CREATE SEQUENCE public.zeitaufwandtyp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE public.zeitaufwandtyp_id_seq OWNER TO dungeonmaster;

ALTER SEQUENCE public.zeitaufwandtyp_id_seq OWNED BY public.zeitaufwandtyp.zeitaufwandtyp_id;

ALTER TABLE ONLY public.zeitaufwandtyp ALTER COLUMN zeitaufwandtyp_id SET DEFAULT nextval('public.zeitaufwandtyp_id_seq'::regclass);

-- Set auto increment for PK columns



--
-- TOC entry 3339 (class 0 OID 16401)
-- Dependencies: 214
-- Data for Name: charaktere; Type: TABLE DATA; Schema: public; Owner: dungeonmaster
--

INSERT INTO public.charaktere (charakter_id, klasse, name) VALUES (1, 'Krieger', 'Roland
');
INSERT INTO public.charaktere (charakter_id, klasse, name) VALUES (2, 'Magier', 'Jens');
INSERT INTO public.charaktere (charakter_id, klasse, name) VALUES (3, 'Barde', 'Rittersporn');
INSERT INTO public.charaktere (charakter_id, klasse, name) VALUES (4, 'Namenloser Held', 'Namenlos');


--
-- TOC entry 3341 (class 0 OID 16437)
-- Dependencies: 216
-- Data for Name: zauber; Type: TABLE DATA; Schema: public; Owner: dungeonmaster
--



--
-- TOC entry 3342 (class 0 OID 16464)
-- Dependencies: 217
-- Data for Name: zaubertyp; Type: TABLE DATA; Schema: public; Owner: dungeonmaster
--

INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (2, 'Verzauberung', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (3, 'Bannzauber', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (4, 'Hervorrufung', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (5, 'Beschwörung', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (6, 'Verwandlung', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (7, 'Erkenntniszauberei', '');
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (8, 'Illusion', NULL);
INSERT INTO public.zaubertyp (zaubertyp_id, typ, kategorie) VALUES (9, 'Nekromantie', NULL);


--
-- TOC entry 3343 (class 0 OID 16477)
-- Dependencies: 218
-- Data for Name: zeitaufwandtyp; Type: TABLE DATA; Schema: public; Owner: dungeonmaster
--

INSERT INTO public.zeitaufwandtyp (zeitaufwandtyp_id, typ) VALUES (10, 'Aktion');
INSERT INTO public.zeitaufwandtyp (zeitaufwandtyp_id, typ) VALUES (11, 'Bonusaktion');
INSERT INTO public.zeitaufwandtyp (zeitaufwandtyp_id, typ) VALUES (12, 'Minuten');
INSERT INTO public.zeitaufwandtyp (zeitaufwandtyp_id, typ) VALUES (13, 'Reaktion, die du ausführst, wenn du von einem Angriff getroffen oder Ziel des Zaubers "Magisches Geschoss" wirst');


--
-- TOC entry 3189 (class 2606 OID 16405)
-- Name: charaktere Characters_pkey; Type: CONSTRAINT; Schema: public; Owner: dungeonmaster
--

ALTER TABLE ONLY public.charaktere
    ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id);


--
-- TOC entry 3191 (class 2606 OID 16444)
-- Name: zauber zauber_pkey; Type: CONSTRAINT; Schema: public; Owner: dungeonmaster
--

ALTER TABLE ONLY public.zauber
    ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id);


--
-- TOC entry 3193 (class 2606 OID 16468)
-- Name: zaubertyp zaubertyp_pkey; Type: CONSTRAINT; Schema: public; Owner: dungeonmaster
--

ALTER TABLE ONLY public.zaubertyp
    ADD CONSTRAINT zaubertyp_pkey PRIMARY KEY (zaubertyp_id);


--
-- TOC entry 3195 (class 2606 OID 16481)
-- Name: zeitaufwandtyp zeitaufwandtyp_pkey; Type: CONSTRAINT; Schema: public; Owner: dungeonmaster
--

ALTER TABLE ONLY public.zeitaufwandtyp
    ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id);


--
-- TOC entry 3196 (class 2606 OID 16472)
-- Name: zauber fk_zaubertyp; Type: FK CONSTRAINT; Schema: public; Owner: dungeonmaster
--

ALTER TABLE ONLY public.zauber
    ADD CONSTRAINT fk_zaubertyp FOREIGN KEY (fk_typ) REFERENCES public.zaubertyp(zaubertyp_id) NOT VALID;


-- Completed on 2022-12-22 16:19:28

--
-- PostgreSQL database dump complete
--

