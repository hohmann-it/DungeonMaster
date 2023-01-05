--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

DROP DATABASE IF EXISTS dungeonmaster;
--
-- Name: dungeonmaster; Type: DATABASE; Schema: -; Owner: dungeonmaster
--

CREATE DATABASE dungeonmaster WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'German_Germany.1252';


ALTER DATABASE dungeonmaster OWNER TO dungeonmaster;

\connect dungeonmaster

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

--
-- Name: DATABASE dungeonmaster; Type: COMMENT; Schema: -; Owner: dungeonmaster
--

COMMENT ON DATABASE dungeonmaster IS 'The dungeonmaster core database';


--
-- Name: dd; Type: SCHEMA; Schema: -; Owner: dungeonmaster
--

CREATE SCHEMA dd;


ALTER SCHEMA dd OWNER TO dungeonmaster;

--
-- Name: od; Type: SCHEMA; Schema: -; Owner: dungeonmaster
--

CREATE SCHEMA od;


ALTER SCHEMA od OWNER TO dungeonmaster;

--
-- Name: insert_gegenstand(text, text, numeric, numeric, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_gegenstand(IN in_name text, IN in_beschreibung text, IN in_wert numeric, IN in_gewicht numeric, IN in_typ text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.gegenstand
    ( name
      , beschreibung
      , wert
      , gewicht
      , fk_gegenstand_typ
    )
    VALUES
    ( in_name
      , in_beschreibung
      , in_wert
      , in_gewicht
      , (
            SELECT
                gegenstandtyp_id
            FROM
                dd.gegenstandtyp
            WHERE
                typ = in_typ
        )
    )
;

$$;


ALTER PROCEDURE dd.insert_gegenstand(IN in_name text, IN in_beschreibung text, IN in_wert numeric, IN in_gewicht numeric, IN in_typ text) OWNER TO dungeonmaster;

--
-- Name: insert_gegenstandtyp(text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_gegenstandtyp(IN in_typ text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.gegenstandtyp
    ( typ
    )
    VALUES
    ( in_typ
    )
;

$$;


ALTER PROCEDURE dd.insert_gegenstandtyp(IN in_typ text) OWNER TO dungeonmaster;

--
-- Name: insert_reichweite(text, text, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_reichweite(IN in_typ_lang text, IN in_typ_kurz text, IN in_beschreibung text DEFAULT NULL::text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.reichweite
    ( typ_lang
      , typ_kurz, beschreibung
    )
    VALUES
    ( in_typ_lang
      , in_typ_kurz, in_beschreibung
    )
;

$$;


ALTER PROCEDURE dd.insert_reichweite(IN in_typ_lang text, IN in_typ_kurz text, IN in_beschreibung text) OWNER TO dungeonmaster;

--
-- Name: insert_schule(text, text, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_schule(IN in_typ text, IN in_kategorie text DEFAULT NULL::text, IN in_beschreibung text DEFAULT NULL::text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.schule
    ( typ
      , kategorie
      , beschreibung
    )
    VALUES
    ( in_typ
      , in_kategorie
      , in_beschreibung
    )
;

$$;


ALTER PROCEDURE dd.insert_schule(IN in_typ text, IN in_kategorie text, IN in_beschreibung text) OWNER TO dungeonmaster;

--
-- Name: insert_wirkungsdauer(text, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_wirkungsdauer(IN in_typ text, IN in_beschreibung text DEFAULT NULL::text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.wirkungsdauer
    ( typ
      , beschreibung
    )
    VALUES
    ( in_typ
      , in_beschreibung
    )
;

$$;


ALTER PROCEDURE dd.insert_wirkungsdauer(IN in_typ text, IN in_beschreibung text) OWNER TO dungeonmaster;

--
-- Name: insert_zauber(text, integer, text, integer, text, integer, text, text, text, text, boolean, boolean, boolean, integer, boolean, boolean); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_zauber(IN in_name text, IN in_zeitaufwand integer, IN in_zeitaufwandtyp text, IN in_reichweite integer, IN in_reichweitetyp_kurz text, IN in_wirkungsdauer integer, IN in_wirkungsdauertyp text, IN in_beschreibung text, IN in_hoehere_grade text, IN in_schule text, IN in_verbal boolean, IN in_gestik boolean, IN in_material boolean, IN in_grad integer, IN in_ritual boolean DEFAULT false, IN in_konzentration boolean DEFAULT false)
    LANGUAGE sql
    AS $$
INSERT INTO dd.zauber
    ( name
      , zeitaufwand
      , fk_zeitaufwand_typ
      , reichweite
      , fk_reichweite
      , wirkungsdauer
      , fk_wirkungsdauer
      , beschreibung
      , hoehere_grade
      , grad
      , fk_schule
      , verbal
      , gestik
      , material
      , ritual
	  , konzentration
    )
SELECT
    in_name
  , in_zeitaufwand
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            dd.zeitaufwandtyp
        WHERE
            typ = in_zeitaufwandtyp
    )
  , in_reichweite
  , (
        SELECT
            reichweite_id
        FROM
            dd.reichweite
        WHERE
            typ_kurz = in_reichweitetyp_kurz
    )
  , in_wirkungsdauer
  , (
        SELECT
            wirkungsdauer_id
        FROM
            dd.wirkungsdauer
        WHERE
            typ = in_wirkungsdauertyp
    )
  , in_beschreibung
  , in_hoehere_grade
  , in_grad
  , (
        SELECT
            schule_id
        FROM
            dd.schule
        WHERE
            typ = in_schule
    )
  , in_verbal
  , in_gestik
  , in_material
  , in_ritual
  , in_konzentration
;

$$;


ALTER PROCEDURE dd.insert_zauber(IN in_name text, IN in_zeitaufwand integer, IN in_zeitaufwandtyp text, IN in_reichweite integer, IN in_reichweitetyp_kurz text, IN in_wirkungsdauer integer, IN in_wirkungsdauertyp text, IN in_beschreibung text, IN in_hoehere_grade text, IN in_schule text, IN in_verbal boolean, IN in_gestik boolean, IN in_material boolean, IN in_grad integer, IN in_ritual boolean, IN in_konzentration boolean) OWNER TO dungeonmaster;

--
-- Name: insert_zaubermaterial(text, text, numeric, numeric, boolean); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_zaubermaterial(IN in_zauber text, IN in_gegenstand text, IN in_fk_ersatz_id numeric DEFAULT NULL::numeric, IN in_anzahl numeric DEFAULT 1, IN in_wird_verbraucht boolean DEFAULT false)
    LANGUAGE sql
    AS $$
INSERT INTO dd.zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_gegenstand
      , anzahl
      , wird_verbraucht
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        from
            dd.zauber
        WHERE
            name = in_zauber
    )
  , in_fk_ersatz_id
  , (
        SELECT
            gegenstand_id
        from
            dd.gegenstand
        WHERE
            name               LIKE (in_gegenstand)
            AND fk_gegenstand_typ =
            (
                SELECT
                    gegenstandtyp_id
                FROM
                    dd.gegenstandtyp
                WHERE
                    typ = 'Zaubermaterial'
            )
    )
  , in_anzahl
  , in_wird_verbraucht
    )
;

$$;


ALTER PROCEDURE dd.insert_zaubermaterial(IN in_zauber text, IN in_gegenstand text, IN in_fk_ersatz_id numeric, IN in_anzahl numeric, IN in_wird_verbraucht boolean) OWNER TO dungeonmaster;

--
-- Name: insert_zeitaufwandtyp(text, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.insert_zeitaufwandtyp(IN in_typ text, IN in_beschreibung text DEFAULT NULL::text)
    LANGUAGE sql
    AS $$
INSERT INTO dd.zeitaufwandtyp
    ( typ
      , beschreibung
    )
    VALUES
    ( in_typ
      , in_beschreibung
    )
;

$$;


ALTER PROCEDURE dd.insert_zeitaufwandtyp(IN in_typ text, IN in_beschreibung text) OWNER TO dungeonmaster;

--
-- Name: update_zaubermaterial_ersatz(text, text, text); Type: PROCEDURE; Schema: dd; Owner: dungeonmaster
--

CREATE PROCEDURE dd.update_zaubermaterial_ersatz(IN in_zaubername text, IN in_gegenstand text, IN in_ersatz_gegenstand text)
    LANGUAGE sql
    AS $$
UPDATE
    dd.zaubermaterial
SET fk_ersatz=
    (
        SELECT
            zaubermaterial_id
        FROM
            dd.zaubermaterial
        WHERE
            fk_gegenstand =
            (
                SELECT
                    gegenstand_id
                from
                    dd.gegenstand
                WHERE
                    name =in_ersatz_gegenstand
            )
    )
WHERE
    fk_gegenstand =
    (
        SELECT
            gegenstand_id
        from
            dd.gegenstand
        WHERE
            name =in_gegenstand
    )
    AND fk_zauber=
    (
        SELECT
            zauber_id
        FROM
            dd.zauber
        WHERE
            name = in_zaubername
    )
	AND fk_ersatz IS NULL
;

$$;


ALTER PROCEDURE dd.update_zaubermaterial_ersatz(IN in_zaubername text, IN in_gegenstand text, IN in_ersatz_gegenstand text) OWNER TO dungeonmaster;

--
-- Name: insert_charakter(text, text); Type: PROCEDURE; Schema: od; Owner: dungeonmaster
--

CREATE PROCEDURE od.insert_charakter(IN in_klasse text, IN in_name text)
    LANGUAGE sql
    AS $$
INSERT INTO od.charaktere
    ( klasse
      , name
    )
    VALUES
    ( in_klasse
      , in_name
    )
;

$$;


ALTER PROCEDURE od.insert_charakter(IN in_klasse text, IN in_name text) OWNER TO dungeonmaster;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: gegenstand; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.gegenstand (
    gegenstand_id bigint NOT NULL,
    name text NOT NULL,
    beschreibung text NOT NULL,
    wert numeric NOT NULL,
    gewicht numeric NOT NULL,
    fk_gegenstand_typ bigint NOT NULL
);


ALTER TABLE dd.gegenstand OWNER TO dungeonmaster;

--
-- Name: gegenstand_id; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.gegenstand_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.gegenstand_id OWNER TO dungeonmaster;

--
-- Name: gegenstand_id; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.gegenstand_id OWNED BY dd.gegenstand.gegenstand_id;


--
-- Name: gegenstandtyp; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.gegenstandtyp (
    gegenstandtyp_id bigint NOT NULL,
    typ text NOT NULL
);


ALTER TABLE dd.gegenstandtyp OWNER TO dungeonmaster;

--
-- Name: gegenstandtyp_id; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.gegenstandtyp_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.gegenstandtyp_id OWNER TO dungeonmaster;

--
-- Name: gegenstandtyp_id; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.gegenstandtyp_id OWNED BY dd.gegenstandtyp.gegenstandtyp_id;


--
-- Name: reichweite; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.reichweite (
    reichweite_id bigint NOT NULL,
    typ_lang text NOT NULL,
    typ_kurz text NOT NULL,
    beschreibung text
);


ALTER TABLE dd.reichweite OWNER TO dungeonmaster;

--
-- Name: reichweite_id_seq; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.reichweite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.reichweite_id_seq OWNER TO dungeonmaster;

--
-- Name: reichweite_id_seq; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.reichweite_id_seq OWNED BY dd.reichweite.reichweite_id;


--
-- Name: schule; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.schule (
    schule_id bigint NOT NULL,
    typ text NOT NULL,
    kategorie text,
    beschreibung text
);


ALTER TABLE dd.schule OWNER TO dungeonmaster;

--
-- Name: schule_id_seq; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.schule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.schule_id_seq OWNER TO dungeonmaster;

--
-- Name: schule_id_seq; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.schule_id_seq OWNED BY dd.schule.schule_id;


--
-- Name: wirkungsdauer; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.wirkungsdauer (
    wirkungsdauer_id bigint NOT NULL,
    typ text NOT NULL,
    beschreibung text
);


ALTER TABLE dd.wirkungsdauer OWNER TO dungeonmaster;

--
-- Name: wirkungsdauer_id; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.wirkungsdauer_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.wirkungsdauer_id OWNER TO dungeonmaster;

--
-- Name: wirkungsdauer_id; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.wirkungsdauer_id OWNED BY dd.wirkungsdauer.wirkungsdauer_id;


--
-- Name: zauber; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.zauber (
    zauber_id bigint NOT NULL,
    name text NOT NULL,
    zeitaufwand integer NOT NULL,
    fk_zeitaufwand_typ bigint NOT NULL,
    reichweite integer NOT NULL,
    fk_reichweite bigint NOT NULL,
    wirkungsdauer integer NOT NULL,
    fk_wirkungsdauer bigint NOT NULL,
    beschreibung text NOT NULL,
    hoehere_grade text,
    grad integer NOT NULL,
    fk_schule bigint NOT NULL,
    verbal boolean NOT NULL,
    gestik boolean NOT NULL,
    material boolean NOT NULL,
    ritual boolean DEFAULT false NOT NULL,
    konzentration boolean DEFAULT false NOT NULL
);


ALTER TABLE dd.zauber OWNER TO dungeonmaster;

--
-- Name: zauber_id_seq; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.zauber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.zauber_id_seq OWNER TO dungeonmaster;

--
-- Name: zauber_id_seq; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.zauber_id_seq OWNED BY dd.zauber.zauber_id;


--
-- Name: zaubermaterial; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.zaubermaterial (
    zaubermaterial_id bigint NOT NULL,
    fk_zauber bigint,
    fk_ersatz bigint,
    fk_gegenstand bigint NOT NULL,
    anzahl numeric NOT NULL,
    wird_verbraucht boolean DEFAULT false NOT NULL
);


ALTER TABLE dd.zaubermaterial OWNER TO dungeonmaster;

--
-- Name: zaubermaterial_id_seq; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.zaubermaterial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.zaubermaterial_id_seq OWNER TO dungeonmaster;

--
-- Name: zaubermaterial_id_seq; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.zaubermaterial_id_seq OWNED BY dd.zaubermaterial.zaubermaterial_id;


--
-- Name: zeitaufwandtyp; Type: TABLE; Schema: dd; Owner: dungeonmaster
--

CREATE TABLE dd.zeitaufwandtyp (
    zeitaufwandtyp_id bigint NOT NULL,
    typ text NOT NULL,
    beschreibung text
);


ALTER TABLE dd.zeitaufwandtyp OWNER TO dungeonmaster;

--
-- Name: zeitaufwandtyp_id_seq; Type: SEQUENCE; Schema: dd; Owner: dungeonmaster
--

CREATE SEQUENCE dd.zeitaufwandtyp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dd.zeitaufwandtyp_id_seq OWNER TO dungeonmaster;

--
-- Name: zeitaufwandtyp_id_seq; Type: SEQUENCE OWNED BY; Schema: dd; Owner: dungeonmaster
--

ALTER SEQUENCE dd.zeitaufwandtyp_id_seq OWNED BY dd.zeitaufwandtyp.zeitaufwandtyp_id;


--
-- Name: charaktere; Type: TABLE; Schema: od; Owner: dungeonmaster
--

CREATE TABLE od.charaktere (
    charakter_id bigint NOT NULL,
    klasse text,
    name text NOT NULL
);


ALTER TABLE od.charaktere OWNER TO dungeonmaster;

--
-- Name: charakter_id_seq; Type: SEQUENCE; Schema: od; Owner: dungeonmaster
--

CREATE SEQUENCE od.charakter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE od.charakter_id_seq OWNER TO dungeonmaster;

--
-- Name: charakter_id_seq; Type: SEQUENCE OWNED BY; Schema: od; Owner: dungeonmaster
--

ALTER SEQUENCE od.charakter_id_seq OWNED BY od.charaktere.charakter_id;


--
-- Name: gegenstand gegenstand_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.gegenstand ALTER COLUMN gegenstand_id SET DEFAULT nextval('dd.gegenstand_id'::regclass);


--
-- Name: gegenstandtyp gegenstandtyp_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.gegenstandtyp ALTER COLUMN gegenstandtyp_id SET DEFAULT nextval('dd.gegenstandtyp_id'::regclass);


--
-- Name: reichweite reichweite_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.reichweite ALTER COLUMN reichweite_id SET DEFAULT nextval('dd.reichweite_id_seq'::regclass);


--
-- Name: schule schule_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.schule ALTER COLUMN schule_id SET DEFAULT nextval('dd.schule_id_seq'::regclass);


--
-- Name: wirkungsdauer wirkungsdauer_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.wirkungsdauer ALTER COLUMN wirkungsdauer_id SET DEFAULT nextval('dd.wirkungsdauer_id'::regclass);


--
-- Name: zauber zauber_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber ALTER COLUMN zauber_id SET DEFAULT nextval('dd.zauber_id_seq'::regclass);


--
-- Name: zaubermaterial zaubermaterial_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zaubermaterial ALTER COLUMN zaubermaterial_id SET DEFAULT nextval('dd.zaubermaterial_id_seq'::regclass);


--
-- Name: zeitaufwandtyp zeitaufwandtyp_id; Type: DEFAULT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zeitaufwandtyp ALTER COLUMN zeitaufwandtyp_id SET DEFAULT nextval('dd.zeitaufwandtyp_id_seq'::regclass);


--
-- Name: charaktere charakter_id; Type: DEFAULT; Schema: od; Owner: dungeonmaster
--

ALTER TABLE ONLY od.charaktere ALTER COLUMN charakter_id SET DEFAULT nextval('od.charakter_id_seq'::regclass);


--
-- Data for Name: gegenstand; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.gegenstand VALUES (1, 'Abakus', 'Ein Abakus (Mehrzahl Abakusse oder Abaki) ist ein einfaches mechanisches Rechenhilfsmittel. Es enthält Kugeln, meist Holz- oder Glasperlen; beim vergleichbaren Rechenbrett kommen auch Münzen (Rechenpfennige) oder Rechensteine (Calculi) zum Einsatz. Je nach Ausführung wird auch die Bezeichnung Zählrahmen oder Rechenrahmen verwendet. ', 200, 2, 4);
INSERT INTO dd.gegenstand VALUES (2, 'Alchemistenfeuer (Flasche)', 'Diese zähe, klebrige Flüssigkeit entzündet sich, wenn sie in Kontakt mit Luft kommt. Als Aktion kannst du das Fläschchen bis zu 6m weit werfen, wo es beim Aufprall zerspringt. Führe einen Fernkampfangriff gegen ein Objekt oder eine Kreatur aus, wobei das Alchemistenfeuer als improvisierte Waffe behandelt wird. Bei einem Treffer erleidet das Ziel zu Beginn jedes seiner Züge 1W4 Feuerschaden. Eine Kreatur kann diesen Schaden beenden, indem es eine Aktion aufwendet und einen Geschicklichkeitswurf gegen SG10 ablegt, um die Flammen zu löschen.', 5000, 2, 4);
INSERT INTO dd.gegenstand VALUES (3, 'Angelausrüstung', 'Diese Zusammenstellung beinhaltet eine Angelrute, Angelschnur, Korkschwimmer, Stahlhaken, Bleigewichte, Seidenköder und engmaschiges Netz.', 100, 4, 4);
INSERT INTO dd.gegenstand VALUES (4, 'Kristall', 'Ein arkaner Fokus ist ein spezieller Gegenstand wie eine Kristallkugel, ein Edelstein, ein Stab, ein besonders gearbeiteter Stecken, ein zauberstabartiges Stück aus Holz oder ein ähnlicher Gegenstand, der dazu entworfen wurde, die Kraft von arkanen Zaubern zu bündeln. Ein Zauberer, Hexenmeister oder Magier kann einen solchen Gegenstand als Zauberfokus verwenden, wie es im Kapitel 10 "Zauber wirken" beschrieben wird.', 1000, 1, 9);
INSERT INTO dd.gegenstand VALUES (5, 'Kugel', 'Ein arkaner Fokus ist ein spezieller Gegenstand wie eine Kristallkugel, ein Edelstein, ein Stab, ein besonders gearbeiteter Stecken, ein zauberstabartiges Stück aus Holz oder ein ähnlicher Gegenstand, der dazu entworfen wurde, die Kraft von arkanen Zaubern zu bündeln. Ein Zauberer, Hexenmeister oder Magier kann einen solchen Gegenstand als Zauberfokus verwenden, wie es im Kapitel 10 "Zauber wirken" beschrieben wird.', 2000, 3, 9);
INSERT INTO dd.gegenstand VALUES (6, 'Rute', 'Ein arkaner Fokus ist ein spezieller Gegenstand wie eine Kristallkugel, ein Edelstein, ein Stab, ein besonders gearbeiteter Stecken, ein zauberstabartiges Stück aus Holz oder ein ähnlicher Gegenstand, der dazu entworfen wurde, die Kraft von arkanen Zaubern zu bündeln. Ein Zauberer, Hexenmeister oder Magier kann einen solchen Gegenstand als Zauberfokus verwenden, wie es im Kapitel 10 "Zauber wirken" beschrieben wird.', 1000, 2, 9);
INSERT INTO dd.gegenstand VALUES (7, 'Stab', 'Ein arkaner Fokus ist ein spezieller Gegenstand wie eine Kristallkugel, ein Edelstein, ein Stab, ein besonders gearbeiteter Stecken, ein zauberstabartiges Stück aus Holz oder ein ähnlicher Gegenstand, der dazu entworfen wurde, die Kraft von arkanen Zaubern zu bündeln. Ein Zauberer, Hexenmeister oder Magier kann einen solchen Gegenstand als Zauberfokus verwenden, wie es im Kapitel 10 "Zauber wirken" beschrieben wird.', 500, 4, 9);
INSERT INTO dd.gegenstand VALUES (8, 'Zauberstab', 'Ein arkaner Fokus ist ein spezieller Gegenstand wie eine Kristallkugel, ein Edelstein, ein Stab, ein besonders gearbeiteter Stecken, ein zauberstabartiges Stück aus Holz oder ein ähnlicher Gegenstand, der dazu entworfen wurde, die Kraft von arkanen Zaubern zu bündeln. Ein Zauberer, Hexenmeister oder Magier kann einen solchen Gegenstand als Zauberfokus verwenden, wie es im Kapitel 10 "Zauber wirken" beschrieben wird.', 1000, 1, 9);
INSERT INTO dd.gegenstand VALUES (9, 'Behälter (Armbrustbolzen)', 'Dieser hölzerne Kasten fasst bis zu 20 Armbrustbolzen', 100, 1, 4);
INSERT INTO dd.gegenstand VALUES (10, 'Behälter (Karten oder Schriftrollen)', 'Dieser zylindrische Lederbehälter kann bis zu zehn zusammengerollte Blatt Papier oder bis zu 5 zusammengerollte Blatt Pergament enthalten.', 100, 1, 4);
INSERT INTO dd.gegenstand VALUES (11, 'Brechstange', 'Verwendest du eine Brechstange als Hebel, bist du im Vorteil bei entsprechenden Stärkewürfen', 200, 5, 4);
INSERT INTO dd.gegenstand VALUES (12, 'Buch', 'Ein Buch könnte Poesie, geschichtliche Aufzeichnungen, Informationen über ein bestimmtes Fachgebiet, Diagramme und Notizen zu gnomischen Apparaturen oder jeglichem anderen Inhalt enthalten, den man mit Text und Zeichnungen festhalten kann. Ein Buch mit Zaubersprüchen ist ein Zauberbuch und separater Gegenstand.', 2500, 5, 4);
INSERT INTO dd.gegenstand VALUES (13, 'Decke', 'Eine dicke, gesteppte Decke, die dich bei kaltem Wetter warm hält.', 50, 3, 4);
INSERT INTO dd.gegenstand VALUES (14, 'Drei-Schritt-Stange (3m)', 'Also ich hab alles durchsucht und konnte nicht herausfinden, was das sein soll. Vielleicht was für Pferde?', 50, 7, 4);
INSERT INTO dd.gegenstand VALUES (15, 'Holzstab', 'Ein druidischer Fokus kann ein Mistel- oder Stechpalmenzweig sein, ein Stab oder Zepter aus Eibe oder einem anderen besonderen Holz, ein Stab, der ganz aus einem lebenden Baum gezogen wurde, oder ein Totemobjekt mit Federn, Fell, Knochen und Zähnen von heiligen Tieren. Ein Druide kann ein solches Objekt als Zauberfokus verwenden.', 500, 4, 10);
INSERT INTO dd.gegenstand VALUES (16, 'Eibenzauberstab', 'Ein druidischer Fokus kann ein Mistel- oder Stechpalmenzweig sein, ein Stab oder Zepter aus Eibe oder einem anderen besonderen Holz, ein Stab, der ganz aus einem lebenden Baum gezogen wurde, oder ein Totemobjekt mit Federn, Fell, Knochen und Zähnen von heiligen Tieren. Ein Druide kann ein solches Objekt als Zauberfokus verwenden.', 1000, 2, 10);
INSERT INTO dd.gegenstand VALUES (17, 'Mistelzweigsprössling', 'Ein druidischer Fokus kann ein Mistel- oder Stechpalmenzweig sein, ein Stab oder Zepter aus Eibe oder einem anderen besonderen Holz, ein Stab, der ganz aus einem lebenden Baum gezogen wurde, oder ein Totemobjekt mit Federn, Fell, Knochen und Zähnen von heiligen Tieren. Ein Druide kann ein solches Objekt als Zauberfokus verwenden.', 100, 0, 10);
INSERT INTO dd.gegenstand VALUES (18, 'Totem', 'Ein druidischer Fokus kann ein Mistel- oder Stechpalmenzweig sein, ein Stab oder Zepter aus Eibe oder einem anderen besonderen Holz, ein Stab, der ganz aus einem lebenden Baum gezogen wurde, oder ein Totemobjekt mit Federn, Fell, Knochen und Zähnen von heiligen Tieren. Ein Druide kann ein solches Objekt als Zauberfokus verwenden.', 100, 0, 10);
INSERT INTO dd.gegenstand VALUES (19, 'Eimer', 'Fassungsvermögen: 3 Gallonen Flüssigkeit, 1/2 Kubikfuß fest ', 5, 2, 4);
INSERT INTO dd.gegenstand VALUES (20, 'Eisenkeil', 'Ein gewöhnlicher Eisenkeil', 10, 0.5, 4);
INSERT INTO dd.gegenstand VALUES (21, 'Enterhaken', 'Ein Enterhaken wie er bei Piraten Verwendung Findet.', 200, 4, 4);
INSERT INTO dd.gegenstand VALUES (22, 'Fackel', 'Eine Fackel brennt eine Stunde lang und liefert im Umkreis von 6m helles Licht sowie in weiteren 6m Abstand dämmriges Licht. Wenn du mit der Fackel einen Nahkampfangriff ausführst und triffst, verursachst du 1 Punkt Feuerschaden.', 1, 1, 4);
INSERT INTO dd.gegenstand VALUES (42, 'Emblem', 'Ein Abzeichen, auch Emblem genannt, ist ein Erkennungszeichen aus Stoff, Kunststoff und/oder Metall, das in Form von Aufnähern, Anstecknadeln, Schulterklappen, Schilden und ähnlichem bestehen kann. Es kann eine Tätigkeit, eine Funktion, einen Rang bzw. Dienstgrad, eine erbrachte Leistung oder die Zugehörigkeit zu einer Gemeinschaft (z. B. Stadt, Gruppe, Stamm, Verein, Organisation, Meinung) anzeigen oder auch der Zierde und dem Schmuck dienen. ', 500, 0, 12);
INSERT INTO dd.gegenstand VALUES (23, 'Fangeisen (Falle)', 'Wenn du sie mit deiner Aktion aufstellst, bildet diese Falle einen sägezahnförmigen Stahlring, der zuschnappt, wenn eine Kreatur auf eine Druckplatte in der Mitte tritt. Die Falle ist mit einer schweren Kette an einem unbeweglichen Objekt befestigt, z. B. an einem Baum oder einem in den Boden gerammten Spieß. Eine Kreatur, die auf die Platte tritt, muss einen Rettungswurf von SG13 (Geschicklichkeit) bestehen oder 1W4 durchbohrenden Schaden erleiden und sich nicht mehr bewegen. Danach ist die Kreatur in ihrer Bewegung durch die Länge der Kette (in der Regel 3 Fuß) eingeschränkt, bis sie sich aus der Falle befreien kann. Eine Kreatur kann ihre Aktion nutzen, um einen SG13 Stärkecheck zu machen, um sich selbst oder eine andere Kreatur in ihrer Reichweite zu befreien, wenn er erfolgreich ist. Jede misslungene Prüfung fügt der gefangenen Kreatur 1 durchdringenden Schaden zu.', 500, 25, 4);
INSERT INTO dd.gegenstand VALUES (24, 'Fass', 'Ein Fass – auch Tonne oder Gebinde genannt – ist ein aus Holz oder Metall hergestellter, walzenförmiger (zylindrischer), oft gebauchter Behälter. Ein Fass besitzt entweder eine kleine Öffnung, das Spundloch, für die Befüllung und die Entleerung der Flüssigkeit oder ist einseitig ganz offen und kann mit einem Deckel versehen werden. Diese zweite Fassart dient eher der Aufbewahrung von festen oder pulverförmigen Stoffen. ', 200, 70, 4);
INSERT INTO dd.gegenstand VALUES (25, 'Fernglas', 'Objekte, die durch ein Fernrohr betrachtet werden, werden auf das Doppelte ihrer Größe vergrößert. ', 100000, 1, 4);
INSERT INTO dd.gegenstand VALUES (26, 'Becher', 'Becher sind Trinkgefäße in Form eines Zylinders oder umgekehrten Kegelstumpfes (Sturzbecher) ohne Fuß und Henkel, im Allgemeinen aus einem anderen Material als Glas gefertigt.', 2, 1, 4);
INSERT INTO dd.gegenstand VALUES (27, 'Tonhumpen', 'Ein Humpen – auch Bierkrug, Bierseidel, Krügel, Schnelle – ist ein deckelloses oder mit einem Klappdeckel versehenes Trinkgefäß. Weitere Bezeichnungen sind „Bierbembel“ oder „Steinkrug“', 2, 1, 4);
INSERT INTO dd.gegenstand VALUES (28, 'Flaschenzug', 'Bestehend aus Seilen, Rollen und einem Holzblock, an dem ein Haken befestigt ist, dient der Flaschenzug dazu, bis zu 4x höheres Gewicht anzuheben, als dies ohne ihn möglich wäre.', 100, 5, 4);
INSERT INTO dd.gegenstand VALUES (29, 'Gegengift (Phiole)', 'Eine Kreatur, die diese Phiole mit Flüssigkeit trinkt, ist für die nächste Stunde bei ihren Rettungswürfen gegen Gifte im Vorteil. Untote und Konstrukte können diesen Vorteil nicht erhalten.', 500, 0, 4);
INSERT INTO dd.gegenstand VALUES (30, 'Armbrustbolzen', 'Ein Bolzen ist ein Geschoss, das mit einer Armbrust verschossen wird. Bolzen sind in der Regel deutlich kürzer als Pfeile und bei der heutigen Sportarmbrust seltener gefiedert. Deshalb ist ihre Flugbahn weniger stabil und die effektive Reichweite einer Armbrust geringer als beispielsweise die eines Langbogens. Wegen der durch eine Auszugsmechanik möglichen beherrschbar hohen Zuggewichte fliegen Bolzen jedoch schneller als Pfeile, sie sind schwerer und verursachen mit der so höheren kinetischen Energie mehr Schaden.', 5, 0.075, 11);
INSERT INTO dd.gegenstand VALUES (31, 'Blasrohrpfeil', 'Gescohss, dass mit einem Blasrohr abgeschossen wird.', 2, 0.02, 11);
INSERT INTO dd.gegenstand VALUES (32, 'Pfeil', 'Ein Pfeil ist das Wurfgeschoss eines Bogens. Es handelt sich um eine Form der Fern- oder Distanzwaffe. Er besteht meist aus Pfeilspitze, einem zylindrischen Pfeilschaft und am anderen Ende Befiederung und Nocke zur Aufnahme der Bogensehne oder Wurfvorrichtung.', 5, 0.05, 11);
INSERT INTO dd.gegenstand VALUES (33, 'Schleuderkugel', 'Die Zwille (auch Zwackel, Zwuschel, Flitsche, Fletsche, Zwistel, Zwiesel, Zwischperl, Kartzi, Katschi, Schlatsche, Kreuzbergschleuder, Spatzenschießer, Zwockel, Gambel, Schlatte, Schplick, Steinschleuder oder einfach Schleuder) ist eine einfache mechanische Waffe, mit der diese Munition verschossen werden kann. ', 0.2, 0.075, 11);
INSERT INTO dd.gegenstand VALUES (34, 'Gift, einfach (Phiole)', 'Du kannst das Gift in diesem Gefäß verwenden, um als Aktion eine Hieb- oder Stichwaffe oder 3 Geschosse zu vergiften. Eine Kreatur, die von einer vergifteten Waffe oder einem vergifteten Geschoss getroffen wird, muss einen Konstitutionsrettungswurf gegen SG10 ablegen oder nimmt 1W4 Giftschaden. Ist das Gift erst einmal aufgetragen, behält es seine Wirksamkeit für 1 Minute, bevor es eintrocknet.', 10000, 0, 4);
INSERT INTO dd.gegenstand VALUES (35, 'Glasflasche', 'Die Glasflasche ist die verbreitete Form des Behälterglases und hat die geeigneten Eigenschaften wie guten Produktschutz und die Möglichkeit des Recyclings. Die Bruchsicherheit wird durch optimierte Formen erhöht. Besondere Glasflaschen tragen am unteren Rand oder auf dem Boden eine Reihe Kennzeichen, aus denen Ort und Zeitpunkt der Herstellung erkennbar sind.', 200, 2, 4);
INSERT INTO dd.gegenstand VALUES (36, 'Glocke', 'Eine Glocke ist ein kelchförmiges, halbkugelförmiges oder zylindrisches Gefäß aus gegossenem Metall, geschmiedetem Metallblech, Holz oder einem anderen Material, das zu den Aufschlagidiophonen mit bestimmter Tonhöhe gehört. Sie wird am stummen Scheitelpunkt fixiert, die für den Klang der Glocke maßgeblichen Schwingungen erreichen ihr Maximum am Rand.', 100, 0, 4);
INSERT INTO dd.gegenstand VALUES (37, 'Hammer', 'Ein Hammer ist ein händisch angetriebenes Werkzeug, das unter Nutzung seiner beschleunigten Masse (meist) schwere Schläge auf Körper ausübt. Bei von Hand geführten Hämmern wird dieser je nach seiner Masse und genutzter Stiellänge nach dem Heben (Ausholen) aus dem Hand-, Ellbogen- oder Schultergelenk – oder bei beidhändigem Halten aus dem Oberkörper – heraus beschleunigt.', 100, 3, 4);
INSERT INTO dd.gegenstand VALUES (38, 'Handschellen', 'Diese Metallfesseln können eine kleine oder mittlere Kreatur fesseln. Um den Fesseln zu entkommen, musst du einen SG20 Geschicklichkeits-Check bestehen. Um sie zu brechen, musst du einen SG20 Stärke-Test bestehen. Zu jedem Satz Fesseln gehört ein Schlüssel. Ohne den Schlüssel kann eine Kreatur, die sich mit Diebeswerkzeugen auskennt, das Schloss der Fesseln mit einem erfolgreichen SG15 Geschicklichkeits-Check knacken. Fesseln haben 15 Trefferpunkte. ', 200, 6, 4);
INSERT INTO dd.gegenstand VALUES (39, 'Heilerausrüstung', 'Dieses Kit ist ein Lederbeutel, der Verbände, Salben und Schienen enthält. Das Set hat zehn Verwendungsmöglichkeiten. Als Aktion kannst du eine Verwendung des Kits nutzen, um eine Kreatur zu stabilisieren, die 0 Trefferpunkte hat, ohne dass du eine Weisheitsprüfung (Medizin) ablegen musst. ', 500, 3, 4);
INSERT INTO dd.gegenstand VALUES (40, 'Gegengift (Phiole)', 'Das Antidot oder Antidoton ist ein (stoffliches) Gegenmittel zu Giften, Toxinen, Medikamenten oder anderen Substanzen, die auf einen Organismus Einfluss nehmen. ', 100, 5, 4);
INSERT INTO dd.gegenstand VALUES (41, 'Amulett', 'Ein Amulett ist ein tragbarer Gegenstand, dem magische Kräfte zugeschrieben werden, mit denen er Glück bringen (energetische, sakramentale Wirkung) und vor Schaden schützen (apotropäische Wirkung) soll. In seiner glückbringenden Eigenschaft und meist größerer Ausführung wird es auch als Talisman bezeichnet. Das Amulett hat mit seiner magischen Wirkung Parallelen zur Votivgabe. Während die Votivgabe typischerweise an einem geeignet erscheinenden Ort hinterlegt wird, dient das Amulett dazu, am Körper oder in einer Tasche mitgeführt zu werden. Abgesehen von seinem zugedachten magischen Aspekt kann das Amulett auch sichtbar als Schmuckstück oder als Zeichen der Zugehörigkeit zu einer meist religiösen Gemeinschaft getragen werden.', 500, 1, 12);
INSERT INTO dd.gegenstand VALUES (43, 'Reliquie', 'Eine Reliquie ist als Gegenstand kultischer religiöser Verehrung ein irdischer Überrest der Körper oder Körperteile von Heiligen oder ein Überbleibsel des jeweiligen persönlichen Besitzes. Eine Sonderform der Reliquien sind „Berührungsreliquien“, Gegenstände, mit denen Heilige zu Lebzeiten in Berührung kamen oder gekommen sein sollen. ', 500, 2, 12);
INSERT INTO dd.gegenstand VALUES (44, 'Heiltrank', 'Ein Charakter, der die magische rote Flüssigkeit in diesem Fläschchen trinkt, erhält 2W4 + 2 Trefferpunkte zurück. Einen Trank zu trinken oder zu verabreichen erfordert eine Aktion. ', 5000, 0.5, 4);
INSERT INTO dd.gegenstand VALUES (45, 'Kaufmannswaage', 'Zur Waage gehören ein Gegengewicht, Schalen und ein passendes Sortiment an Gewichten bis zu 2 Pfund. Mit ihr kannst du das genaue Gewicht von kleinen Gegenständen wie rohen Edelmetallen oder Handelswaren messen, um ihren Wert zu bestimmen. ', 500, 3, 4);
INSERT INTO dd.gegenstand VALUES (46, 'Kerze', 'Eine Kerze ist ein Leuchtmittel aus Wachs, Stearin, Paraffin, Talg oder Walrat mit einem Docht in der Mitte, das mit offener Flamme brennend Licht und Wärme gibt, romantisierend als Kerzenschein bezeichnet. Neben der Verwendung als Licht- und Wärmespender werden Kerzen in deutlich geringerem Maß auch als Zeitmesser (Kerzenuhr) und vermeintliches Heilmittel (Ohrkerze) eingesetzt. ', 1, 0, 4);
INSERT INTO dd.gegenstand VALUES (47, 'Kette (3m)', 'Eine Kette hat 10 Trefferpunkte. Sie kann mit einem erfolgreichen Stärkewurf gegen SG20 gesprengt werden.', 500, 10, 4);
INSERT INTO dd.gegenstand VALUES (48, 'Kiste', 'Eine Kiste ist ein offener oder auch geschlossener Behälter zur Beförderung und Lagerung von Gegenständen. Sie besteht aus Metall, Kunststoff oder Holz. Gemeinsames Merkmal aller Kisten ist eine Eignung zum Stapeln bei gleicher Grundfläche.', 500, 25, 4);
INSERT INTO dd.gegenstand VALUES (49, 'Kleidung, fein', 'Feine Kleidung für die Kreature von Welt', 1500, 6, 4);
INSERT INTO dd.gegenstand VALUES (50, 'Kleidung, gewöhnlich', 'Normale Kleidung, wie sie beispielsweise ein Bauer trägt.', 500, 3, 4);
INSERT INTO dd.gegenstand VALUES (51, 'Kleidung, Kostüm', 'Ein spezielles Kostüm, beispielsweise eine Uniform oder Verkleidung.', 500, 4, 4);
INSERT INTO dd.gegenstand VALUES (52, 'Kleidung, Reise', 'Reisekleidung, bequem und robust.', 200, 4, 4);
INSERT INTO dd.gegenstand VALUES (53, 'Kletterausrüstung', 'Eine Kletterausrüstung besteht aus speziellen Haken, Schuhspitzen, Handschuhen und einem Klettergurt. Als Aktion kannst du du die Kletterausrüstung nutzen, um dich in einer Wand zu verankern. Von dem Punkt, an dem du dich verankert hast, kannst du nicht tiefer als 7,5m fallen und dich nicht weiter als 7,5m entfernen, ohne die Verankerung zu lösen.', 2500, 12, 4);
INSERT INTO dd.gegenstand VALUES (54, 'Kletterhaken', 'Als Kletterhaken bezeichnet man bei Abenteurern und beim Baumklettern die Geräte, mit denen ein Absturz verhindert werden soll. Du kannst hiermit klettern.', 5, 0.25, 4);
INSERT INTO dd.gegenstand VALUES (55, 'Köcher', 'Der Köcher umfasst bis zu 20 Pfeile.', 100, 1, 4);
INSERT INTO dd.gegenstand VALUES (56, 'Korb', 'Ein Korb ist ein geflochtener Behälter, meist aus hölzernem, biegsamen Material, zum Transport und Lagern von Lasten oder Material.', 40, 2, 4);
INSERT INTO dd.gegenstand VALUES (57, 'Krähenfüße', 'Als Aktion kannst du die Krähenfüße in diesem Beutel über einen Bereich mit höchstens 1,5m Seitenlänge verteilen. Jede Kreatur, die den Bereich betritt, muss einen erfolgreichen Geschicklichkeitsrettungswurf gegen SG15 ablegen oder sie erleidet 1 Punkt Stichschaden und ihre Bewegung ist beendet. Erleidet sie diesen Schaden, ist die Bewegungsrate der Kreatur um 3m verringert, bis sie mindestens 1 Trefferpunkt wiedererlangt. Eine Kreatur, die sich nur mit halber Bewegungsrate durch den Bereich bewegt, muss keinen Rettungswurf ablegen. Fliegende Kreaturen werden von Krähenfüßen nicht beeinflusst.', 100, 2, 4);
INSERT INTO dd.gegenstand VALUES (58, 'Kreide', 'Schreibkreide ist ein Material zum Beschreiben von rauen Untergründen, vorrangig Tafeln. Dabei hinterlässt sie kleine Partikel, die locker an der Tafel haften bleiben und leicht wieder abgewischt werden können', 1, 0, 4);
INSERT INTO dd.gegenstand VALUES (59, 'Lampe', 'Eine Lampe verbreitet helles Licht in einem Radius von 4,5m und dämmriges Licht im Umkreis von weiteren 9m. Ab dem Entfachen brennt die Lampe mit einem Fläschchen Öl für 6 Stunden.', 50, 1, 4);
INSERT INTO dd.gegenstand VALUES (60, 'Laterne, abdeckbar', 'Eine Kapuzenlaterne spendet helles Licht in einem Radius von 9m und schwaches Licht für weitere 9m. Einmal angezündet, brennt sie 6 Stunden lang mit einem Fläschchen Öl. Als Aktion kannst du die Kapuze aufsetzen und das Licht der Laterne in einem Umkreis von 1,5 Metern auf dämmriges Licht reduzieren.', 500, 2, 4);
INSERT INTO dd.gegenstand VALUES (61, 'Laterne, blendend', 'Eine Blendlaterne wirft einen 18m langen Kegel hellen Lichts, der weitere 18m in dämmriges Licht taucht. Einmal entfacht, brennt die Laterne mit einem Fläschchen Öl für 6 Stunden.', 1000, 2, 4);
INSERT INTO dd.gegenstand VALUES (62, 'Leiter (3m)', 'Gewöhnliche Leiter mit 3m Länge.', 10, 25, 4);
INSERT INTO dd.gegenstand VALUES (63, 'Materialkomponentenbeutel', 'Ein Materialkomponentenbeutel ist eine kleine, wasserdichte Ledergürteltasche. In ihm befinden sich in separaten Fächern all jene Materialien und anderen speziellen Gegenstände, die du zum Wirken deiner Zauber benötigst. Komponenten, die in der Beschreibung des Zaubers mit Kosten aufgeführt sind, sind nicht im Beutel enthalten.', 25000, 2, 4);
INSERT INTO dd.gegenstand VALUES (64, 'Metallkügelchen', 'Als Aktion kannst du die kleinen Metallkugelkn auf einer Fläche verschütten, die höchstens 3m pro Seite misst. Eine Kreatur, die sich über die bedeckte Fläche (die eben sein muss) bewegt, muss einen erfolgreichen Geschicklichkeitswurf gegen SG10 ablegen, um nicht hinzufallen und dne Zustand liegend zu erhalten. Eine Kreatur, die sich nur mit halber Bewegungsrate durch diesen Bereich bewegt, muss keinen Rettungswurf ablegen.', 100, 2, 4);
INSERT INTO dd.gegenstand VALUES (65, 'Öl (Flasche)', 'Öl wird üblicherweise in tönernen Flaschen verkauft, die 0,5 Liter enthalten. Als Aktion kannst du das Öl auf eine Kreatur innerhalb von 1,5m schütten oder es bis zu 6m weit werfen, wo das Fläschchen beim Aufprall zerbricht. In beiden Fällen führst du einen Fernkampfangriff gegen das Objekt oder die Kreatur aus, wobei das Ölfläschchen als improvisierte Waffe behandelt wird. Bei einem Treffer ist das Ziel mit Öl benetzt. Erleidet es Feuerschaden, bevor das Öl eintrocknet (nach 1 Minute), fügt ihm das Öl weitere 5 Punkte Feuerschaden zu. Du kannst ein Fläschchen auch auf dem Boden ausleeren und eine Fläche von 1,5m x 1,5m mit Öl bedecken, vorausgesetzt der Boden ist eben. Wird es entzündet, brennt das Öl für 2 Runden und fügt jeder Kreatur, die den Bereich betritt oder ihren Zug in diesem beendet, 5 Punkte Feuerschaden zu.', 10, 1, 4);
INSERT INTO dd.gegenstand VALUES (66, 'Papier, Blatt', 'Papier ist ein flächiger Werkstoff, der im Wesentlichen aus Fasern pflanzlicher Herkunft besteht und durch Entwässerung einer Fasersuspension auf einem Sieb gebildet wird. Das entstehende Faservlies wird verdichtet und getrocknet.', 20, 0, 4);
INSERT INTO dd.gegenstand VALUES (67, 'Parfüm (Phiole)', 'Ein Parfüm ist ein meist flüssiges Gemisch aus Alkohol und Riechstoffen, das der Erzeugung angenehmer Gerüche dienen soll.', 500, 0, 4);
INSERT INTO dd.gegenstand VALUES (68, 'Pergament, Blatt', 'Pergament ist eine nicht gegerbte, nur leicht bearbeitete Tierhaut, die seit dem Altertum unter anderem als Beschreibstoff verwendet wird. Pergament ist damit ein Vorläufer des Papiers. Pergament wird meist aus Häuten von Kälbern, Ziegen oder Schafen hergestellt. Hierbei erfahren die geweichten und enthaarten Tierhäute (auch als „Blöße“ bezeichnet) aufgespannt eine Lufttrocknung. Hierin unterscheidet sich diese Form der Behandlung von Tierhaut vom Gerben.', 10, 0, 4);
INSERT INTO dd.gegenstand VALUES (69, 'Phiole', 'Eine Phiole ist ein birnenförmiges Glasgefäß mit langem, engem Hals, das von Alchemisten benutzt wird.', 100, 0, 4);
INSERT INTO dd.gegenstand VALUES (70, 'Rammbock, tragbar', 'Du kannst eine tragbare Ramme benutzen, um Türen aufzubrechen. Wenn du das tust, erhältst du einen Bonus von +4 auf die Stärkeprüfung. Ein anderer Charakter kann dir bei der Benutzung des Rammbocks helfen, wodurch du einen Vorteil bei dieser Prüfung erhältst. ', 400, 35, 4);
INSERT INTO dd.gegenstand VALUES (71, 'Ration (1 Tag)', 'Rationen bestehen aus getrocknetem Essen, das für lange Reisen geeignet ist. Darunter findet man Dörrfleisch, Trockenfrüchte, Nüsse und Hartkäse.', 50, 2, 4);
INSERT INTO dd.gegenstand VALUES (72, 'Reisegeschirr', 'Diese Blechdose enthält eine Tasse und einfaches Besteck. Die Dose wird zusammengeklemmt und eine Seite kann als Kochtopf und die andere als Teller oder flache Schale verwendet werden. ', 20, 1, 4);
INSERT INTO dd.gegenstand VALUES (73, 'Roben', 'Der Begriff Robe bezeichnet festlich-gravitätische Kleidungsstücke von sehr unterschiedlicher Form und Zweckbestimmung, darunter insbesondere die weiten, mantelartigen Gewänder, die in vielen Reichen der Welt als Amtstracht von Priestern, Gelehrten und Klerikern getragen werden. Außerdem werden bodenlange, einteilige Frauenkleider so bezeichnet.', 100, 4, 4);
INSERT INTO dd.gegenstand VALUES (74, 'Rucksack', 'Rucksack mit einer Traglast von max. 30 Pfund.', 200, 5, 4);
INSERT INTO dd.gegenstand VALUES (75, 'Sack', 'Sack mit einer Traglast von max. 30 Pfund.', 1, 0.5, 4);
INSERT INTO dd.gegenstand VALUES (76, 'Sanduhr', 'Dieses Stundenglas dient zur genauen Zeitmessung.', 2500, 1, 4);
INSERT INTO dd.gegenstand VALUES (77, 'Säure (Phiole)', 'Als Aktion kannst du den Inhalt dieser Phiole auf eine Kreatur in einem Umkreis von 1,5m spritzen oder die Phiole bis zu 6m weit werfen, wobei sie beim Aufprall zerschmettert. In beiden Fällen führst du einen Fernkampfangriff gegen eine Kreatur oder ein Objekt aus, wobei du die Säure wie eine improvisierte Waffe behandelst. Bei einem Treffer erleidet das Ziel 2W6 Säureschaden. ', 2500, 1, 4);
INSERT INTO dd.gegenstand VALUES (78, 'Schaufel', 'Eine Schaufel ist ein Werkzeug zum Aufnehmen und Bewegen von Lockermaterialien', 200, 5, 4);
INSERT INTO dd.gegenstand VALUES (79, 'Schlafsack', 'Ein Schlafsack ist eine Hülle zum Schlafen, die den Körper mit Ausnahme von Kopf oder Gesicht (je nach Modell) umschließt. Der Oberstoff besteht je nach Verwendungszweck aus Leinen, Baumwolle, Vliesstoffen oder Seide und ist zur Wärmedämmung traditionell mit Daunen gefüttert. ', 100, 7, 4);
INSERT INTO dd.gegenstand VALUES (80, 'Schloss', 'Mit dem Schloss wird ein Schlüssel mitgeliefert. Ohne den Schlüssel kann eine Kreatur, die sich mit Diebeswerkzeug auskennt, dieses Schloss mit einem erfolgreichen SG15 Geschicklichkeitstest knacken. Dein GM kann entscheiden, dass bessere Schlösser für höhere Preise erhältlich sind. ', 1000, 1, 4);
INSERT INTO dd.gegenstand VALUES (81, 'Schreibfeder', 'Die Schreibfeder (auch Zeichenfeder) ist ein Schreib- und Zeichengerät. Mit der Feder wird zumeist Tinte auf Papier, Pappe, Pergament, Stoff oder andere Beschreibstoffe aufgetragen. Die Feder wird zur besseren Handhabung von einem Federhalter gehalten. ', 2, 0, 4);
INSERT INTO dd.gegenstand VALUES (82, 'Seife', 'Unter Seife wird im allgemeinen Sprachgebrauch ein festes Reinigungsmittel verstanden, das zur Reinigung der Hände und des Körpers benutzt wird.', 2, 0, 4);
INSERT INTO dd.gegenstand VALUES (83, 'Seil aus Hanf (15m)', 'Seile, ob aus Hanf oder Seide gefertigt, haben 2 Trefferpunkte und können mit einem Stärkewurf gegen SG17 zerrissen werden.', 100, 10, 4);
INSERT INTO dd.gegenstand VALUES (84, 'Seil aus Seide (15m)', 'Seile, ob aus Hanf oder Seide gefertigt, haben 2 Trefferpunkte und können mit einem Stärkewurf gegen SG17 zerrissen werden.', 1000, 5, 4);
INSERT INTO dd.gegenstand VALUES (85, 'Siegelring', 'Ein Siegelring ist ein Ring, der als Stempelsiegel dient und als Symbol der Macht und Autorität gilt. Er wird überwiegend als Zeichen für die Zusammengehörigkeit und die Identifikation mit der Herkunft getragen.', 500, 0, 4);
INSERT INTO dd.gegenstand VALUES (86, 'Signalpfeife', 'Als Signalpfeife werden verschiedene Typen von Pfeifen und Flöten eingesetzt, mit denen sich mit wenig Kraftaufwand relativ laute und gut hörbare Töne produzieren lassen.', 5, 0, 4);
INSERT INTO dd.gegenstand VALUES (87, 'Spitzhacke', 'Der Pickel, auch Picke, Spitzhacke, Pickhacke, auch Krampen genannt, ist ein Handwerkzeug mit zwei Spitzen, die paarig entgegengesetzt an einem Stiel ansetzen. Er dient zur Arbeit mit Stein, sowohl am blanken Fels, als auch in der Erde, während die flache Hacke/Harke zum Arbeiten im Boden dient.', 200, 10, 4);
INSERT INTO dd.gegenstand VALUES (88, 'Spiegel, Stahl', 'Ein Spiegel ist eine reflektierende Fläche – glatt genug, dass reflektiertes Licht nach dem Reflexionsgesetz seine Parallelität behält und somit ein Abbild entstehen kann.', 500, 0, 4);
INSERT INTO dd.gegenstand VALUES (89, 'Beutel', 'Ein Stoff- oder Lederbeutel fasst (neben anderen Dingen) bis zu 20 Schleuderkugeln oder 50 Blasrohrpfeile. Ein Materialkomponentenbeutel, wie ihn ein Zauberer verwendet, ist ein separater Gegenstand.', 50, 1, 4);
INSERT INTO dd.gegenstand VALUES (90, 'Tinte (Flasche, 30ml)', 'Tinte ist eine intensiv gefärbte und färbende Flüssigkeit. Zum händischen Auftragen mit Federkielen, Pinseln oder Füllfederhaltern beim Schreiben, in der Kalligrafie und beim Zeichnen.', 1000, 0, 4);
INSERT INTO dd.gegenstand VALUES (91, 'Tonkrug', 'Der Krug (aus Ton) ist ein mit einem senkrechten Henkel und manchmal mit einem Deckel versehenes bauchiges oder zylindrisches Gefäß, das der Aufnahme, dem Transport, der Lagerung und der Entnahme von Flüssigkeiten dient.', 2, 4, 4);
INSERT INTO dd.gegenstand VALUES (92, 'Topf (Eisen)', 'Ein Kochtopf ist in der Küche ein Gefäß zum Garen von Speisen.', 200, 10, 4);
INSERT INTO dd.gegenstand VALUES (93, 'Trinkschlauch', 'Der Trinkschlauch ist ein Trinkgefäß, das von Abenteurern beim Camping und auf Reisen genutzt wird. Er besteht aus Leder.', 20, 0, 4);
INSERT INTO dd.gegenstand VALUES (94, 'Vergrößerungsglas', 'Diese Linse ermöglicht einen genaueren Blick auf kleine Objekte. Sie ist auch nützlich als Ersatz für Feuerstein und Stahl, wenn du Feuer entfachen willst. Um ein Feuer mit einer Lupe zu entfachen, muss das Licht so hell wie das Sonnenlicht sein, um es zu fokussieren, Zunder muss entzündet werden, und es dauert etwa 5 Minuten, bis das Feuer brennt. Ein Vergrößerungsglas gewährt einen Vorteil bei jeder Fähigkeitsprüfung, um einen kleinen oder sehr detaillierten Gegenstand zu begutachten oder zu untersuchen. ', 10000, 0, 4);
INSERT INTO dd.gegenstand VALUES (95, 'Vorschlaghammer', 'Ein Vorschlaghammer, auch Schlegel, Massa, Mottek, Bello, Jakob, Jackl, Lehmann oder Maker genannt, ist ein aus einem Hammerkopf, auch kurz Kopf genannt, und einem Stiel bestehendes Handwerkzeug. Wegen des Gewichtes seines Kopfes von 5 kg und mehr wird er beidhändig geführt und dient vor allem für grobe Arbeiten wie z.B. deine Mama.', 200, 10, 4);
INSERT INTO dd.gegenstand VALUES (96, 'Weihwasser (Flasche)', 'Als Aktion kannst du den Inhalt dieses Fläschchens auf eine Kreatur im Umkreis von 1,5m spritzen oder es bis zu 6m weit werfen, wobei es beim Aufprall zerbricht. In beiden Fällen führst du einen Fernkampfangriff gegen eine Zielkreatur aus, wobei du das Weihwasser wie eine improvisierte Waffe behandelst. Wenn das Ziel ein Unhold oder Untoter ist, erleidet es 2W6 Strahlenschaden. Ein Kleriker oder Paladin kann Weihwasser durch ein spezielles Ritual herstellen. Das Ritual dauert 1 Stunde, verbraucht Silberpulver im Wert von 25 GM und erfordert einen Zauberslot der Stufe 1. ', 2500, 1, 4);
INSERT INTO dd.gegenstand VALUES (97, 'Wetzstein', 'Ein Wetzstein ist ein aus mineralischen Bestandteilen zusammengesetzter flacher Stein zum Schleifen und Schärfen von Werkzeugen bzw. Klingen, insbesondere von Sensen, Sichten, Sicheln oder Messern. ', 1, 1, 4);
INSERT INTO dd.gegenstand VALUES (98, 'Zauberbuch', 'Unverzichtbar für Magier ist das Zauberbuch aus ledergebundenen 100 leeren Pergamentseiten.', 5000, 3, 4);
INSERT INTO dd.gegenstand VALUES (99, 'Zelt (2 Personen)', 'Ein einfacher und tragbarer Leinenunterschlupf, in dem zwei Personen übernachten können.', 200, 20, 4);
INSERT INTO dd.gegenstand VALUES (100, 'Zunderkästchen', 'Dieses kleine Kästchen enthält Feuerstein, Stahl und Zunder (in der Regel Stoff, der leicht mit Öl getränkt ist), um ein Feuer entfachen zu können. Zum Amzünden einer Fackel oder einem ähnlichen mit Brennstoff versehenen Gegenstand, benötigt man eine Aktion. Jedes andere Feuer zu entfachen, dauert 1 Minute.', 50, 1, 4);
INSERT INTO dd.gegenstand VALUES (101, 'winziger weißer Stoffstreifen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (102, 'Stück Fell', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (103, 'Stab aus Bernstein', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (104, 'Kristall', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (105, 'Glas', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (106, 'Fledermausfell', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (107, 'Tropfen Pech', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (108, 'Stück Kohle', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (109, 'Schlangenzunge', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (110, 'Honigwabe', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (111, 'Tropfen süßes Öl', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (112, 'winzige Kugel aus Fledermauskot', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (113, 'Schwefel', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (114, 'Talg', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (115, 'Eisenpulver', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (116, 'Schwungfeder eines beliebigen Vogels', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (117, 'kleiner Silberspiegel', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (118, 'Perle', '', 100, 0, 8);
INSERT INTO dd.gegenstand VALUES (119, 'Eulenfeder', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (120, 'Glühwürmchen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (121, 'Leuchtmoos', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (122, 'Stück gehärtetes Leder', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (123, 'kleines, gerades Stück Eisen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (124, 'Miniaturumhang', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (125, 'kleines Pergament mit heiligem Text', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (126, 'Prise Sand', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (127, 'Rosenblüten', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (128, 'Grille', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (129, 'Platinring', '', 50, 0, 8);
INSERT INTO dd.gegenstand VALUES (130, 'heiliges Symbol', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (131, 'Tropfen Weihwasser', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (132, 'Tropfen Bitumen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (133, 'Spinne', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (134, 'Spinnweben', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (135, 'Prise Ruß', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (136, 'Salz', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (137, 'Stück Phosphor', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (138, 'Bergulmenholz', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (139, 'Wimper, die von Gummiarabikum umschlossen ist', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (140, 'speziell gekennzeichnetes Stöckchen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (141, 'Knochen', '', 0, 0, 8);
INSERT INTO dd.gegenstand VALUES (142, 'Symbole', '', 2500, 0, 8);
INSERT INTO dd.gegenstand VALUES (143, 'Diamanten', '', 30000, 0, 8);


--
-- Data for Name: gegenstandtyp; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.gegenstandtyp VALUES (1, 'Rüstung');
INSERT INTO dd.gegenstandtyp VALUES (2, 'Schild');
INSERT INTO dd.gegenstandtyp VALUES (3, 'Waffe');
INSERT INTO dd.gegenstandtyp VALUES (4, 'Abenteuerausrüstung');
INSERT INTO dd.gegenstandtyp VALUES (5, 'Werkzeug');
INSERT INTO dd.gegenstandtyp VALUES (6, 'Rüstung');
INSERT INTO dd.gegenstandtyp VALUES (7, 'Verpflegung');
INSERT INTO dd.gegenstandtyp VALUES (8, 'Zaubermaterial');
INSERT INTO dd.gegenstandtyp VALUES (9, 'Arkaner Fokus');
INSERT INTO dd.gegenstandtyp VALUES (10, 'Druidischer Fokus');
INSERT INTO dd.gegenstandtyp VALUES (11, 'Geschosse');
INSERT INTO dd.gegenstandtyp VALUES (12, 'Heiliges Symbol');
INSERT INTO dd.gegenstandtyp VALUES (13, 'Sonstiges');


--
-- Data for Name: reichweite; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.reichweite VALUES (1, 'Meter', 'm', 'Die übliche Reichweitenangabe in Metern.');
INSERT INTO dd.reichweite VALUES (2, 'Selbst', 'Selbst', 'Nur auf dich selbst anwendbarer Zauber.');
INSERT INTO dd.reichweite VALUES (3, 'Selbst (Würfel mit 4,5m Seitenlänge)', 'Selbst (Würfel)', 'Flächeneffekt, wobei eine Seite des Würfels am Zauberurpsrungspunkt endet.');
INSERT INTO dd.reichweite VALUES (4, 'Selbst (Radius von 4,5m)', 'Selbst (Radius)', 'Flächeneffekt, wobei eine Sphäre um den Zauberursprungspunkt entsteht.');
INSERT INTO dd.reichweite VALUES (5, 'Selbst (Kegel von 4,5m)', 'Selbst (Kegel)', 'Flächeneffekt, wobei ein Kegel mit dem Zauberursprungspunkt am spitzen Ende entsteht.');
INSERT INTO dd.reichweite VALUES (6, 'Berührung', 'Berührung', 'Direkte Berührung einer Kreatur oder Oberfläche');


--
-- Data for Name: schule; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.schule VALUES (1, 'Verzauberungen', NULL, 'Verzauberungen beeinflussen den Verstand einer Person und manipulieren oder kontrollieren ihr Verhalten. Sie können Feinde zwingen, den Zauberwirker als Freund zu betrachten, Kreaturen zu einer bestimmten Handlungsweise bewegen oder diese sogar in eine Marionette des Zaubernden verwandeln.');
INSERT INTO dd.schule VALUES (2, 'Bannzauber', NULL, 'Bannzauber sind schützender Natur, doch können manche von ihnen auch offensiv eingesetzt werden. Sie erschaffen magische Barrieren, heben schädigende Effekte auf oder verbannen Kreaturen auf andere Existenzebenen.');
INSERT INTO dd.schule VALUES (3, 'Hervorrufungszauber', NULL, 'Hervorrufungszauber manipulieren magische Energie, um einen gewünschten Effekt zu erzeugen. Einige erschaffen Blitze oder Feuer. Andere kanalisieren Energie, um Wunden zu heilen.');
INSERT INTO dd.schule VALUES (4, 'Beschwörungszauber', NULL, 'Beschwörungszauber transportieren Gegenstände und Kreaturen von einem Ort an einen anderen. Einige rufen Kreaturen oder Gegenstände herbei, während andere es dem Zauberwirker erlauben, sich zu teleportieren. Manche Beschwörungszauber erschaffen Gegenstände oder Effekte aus dem Nichts.');
INSERT INTO dd.schule VALUES (5, 'Verwandlungszauber', NULL, 'Verwandlungszauber verändern die Eigenschaften von Kreaturen, Gegenständen oder einer ganzen Umgebung. Sie sind in der Lage, einen Gegner in eine harmlose Kreatur zu verwandeln, einen Verbündeten stärker zu machen, einen Gegenstand auf Befehl des Zauberwirkers zu bewegen oder die Heilungsfähigkeiten einer Kreatur so zu beschleunigen, dass sie sich schnell von ihren Wunden erholt.');
INSERT INTO dd.schule VALUES (6, 'Erkenntniszauberei', NULL, 'Erkenntniszauber offenbaren Informationen, sei es ein lange vergessenes Geheimnis, ein Blick in die Zukunft, die Position verborgener Gegenstände, die Wahrheit hinter einer Illusion oder die Vision weit entfernter Personen oder Orte.');
INSERT INTO dd.schule VALUES (7, 'Illusionszauber', NULL, 'Illusionszauber täuschen die Sinne und verwirren die Gedanken. Sie lassen eine Kreatur Dinge sehen, die gar nicht da sind, oder Dinge übersehen, die es wirklich gibt. Sie rufen Phantomlaute hervor oder Erinnerungen an Ereignisse, die nie passiert sind. Einige Illusionen erschaffen Trugbilder, die jeder sehen kann, aber die perfidesten pflanzen ein Bild direkt in den Verstand einer Kreatur.');
INSERT INTO dd.schule VALUES (8, 'Nekromantiezauber', NULL, 'Nekromantiezauber lenken die Energien von Leben und Tod. Sie vermögen einer anderen Kreatur die Lebenskraft zu entziehen und der eigenen hinzuzufügen., Untote zu erschaffen, oder sogar die Toten zum Leben zu erwecken. Es ist keine gute Tat, Untote mittels Nekromantie zu erschaffen, und nur böse Zauberer wenden solche Magie regelmäßig an.');


--
-- Data for Name: wirkungsdauer; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.wirkungsdauer VALUES (1, 'Runden', NULL);
INSERT INTO dd.wirkungsdauer VALUES (2, 'Minuten', NULL);
INSERT INTO dd.wirkungsdauer VALUES (3, 'Stunden', NULL);
INSERT INTO dd.wirkungsdauer VALUES (4, 'Unmittelbar', 'Viele Zauber sind unmittelbar. Sie verletzen, heilen, erschaffen oder verändern eine Kreatur oder einen Gegenstand auf eine Weise, die nicht gebannt werden kann, weil ihre Magie nur für einen Augenblick existiert.');
INSERT INTO dd.wirkungsdauer VALUES (5, 'Minuten, Konzentration', NULL);
INSERT INTO dd.wirkungsdauer VALUES (6, 'Stunden, Konzentration', NULL);


--
-- Data for Name: zauber; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.zauber VALUES (1, 'Befehl', 1, 1, 18, 1, 1, 1, 'Du gibst einer Kreatur in Reichweite, die du sehen kannst, einen Befehl von einem Wort. Das Ziel muss einen Weisheitsrettungs- wurf ablegen, sonst befolgt es den Befehl in seinem nächsten Zug. Der Zauber hat keine Auswirkungen, wenn das Ziel untot ist, wenn es deine Sprache nicht versteht oder wenn dein Befehl ihm unmittelbar schaden würde. Es folgen einige typische Befehle und ihre Auswirkungen. Du kannst andere Befehle als die geben, die hier beschrieben sind. Wenn du dies tust, entscheidet der SL, wie sich das Ziel verhält. Wenn das Ziel deinem Befehl nicht folgen kann, endet der Zauber. Komm. Das Ziel bewegt sich auf dem kürzesten und direktes- ten Weg auf dich zu und beendet seinen Zug wenn es sich dir auf 1,5 Meter angenähert hat. Fallenlassen. Das Ziel lässt fallen, was es in den Händen hält und beendet dann seinen Zug. Flieh. Das Ziel verbringt seinen Zug damit, sich auf die schnellste verfügbare Weise von dir weg zu bewegen. Krieche. Das Ziel erhält den Zustand liegend und beendet seinen Zug. Stopp. Das Ziel bewegt sich nicht und führt keine Aktionen aus. Eine fliegende Kreatur bleibt in der Luft, wenn sie dazu imstande ist. Wenn sie sich bewegen muss, um in der Luft zu blei- ben, dann bewegt sie sich die Mindestentfernung, die notwendig ist, um nicht abzustürzen.', 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter von- einander entfernt sein, wenn du den Zauber auf sie wirkst.', 1, 1, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (2, 'Beistand', 1, 1, 9, 1, 8, 3, 'Dein Zauber stärkt die Entschlossenheit und Zähigkeit deiner Verbündeten. Wähle bis zu drei Kreaturen in Reichweite. Die maximalen und aktuellen Trefferpunkte aller Ziele steigen für die Wirkungsdauer um 5.', 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigen die Trefferpunkte des Ziels um zusätzlich 5 für jeden Zauberplatz-Grad über dem zweiten.', 2, 2, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (3, 'Blitz', 1, 1, 30, 1, 0, 4, 'Ein Blitz in Gestalt einer Linie mit 30 Metern Länge und 1,5 Metern Breite bricht in eine Richtung deiner Wahl aus dir hervor. Jede Kreatur in der Linie muss einen Geschicklichkeits- rettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 8W6 Blitzschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Der Blitz entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.', 3, 3, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (4, 'Brennende Hände', 1, 1, 0, 5, 0, 4, 'Du streckst die Hände aus, mit sich berührenden Daumen und ausgebreiteten Fingern, und eine dünne Fläche aus Feuer schießt aus deinen ausgestreckten Fingerspitzen. Jede Kreatur in einem Kegel von 4,5 Metern muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 3W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.', 1, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (5, 'Donnerwoge', 1, 1, 0, 3, 0, 4, 'Eine Welle von donnernder Gewalt geht von dir aus. Jede Kreatur in einem 4, 50-m-Würfel muss einen Rettungswurf (Konstitution) ablegen. Bei einem Fehlschlag nimmt sie 2W8 Schallschaden und wird von der Wirkkraft des Zaubers 3 m von dir weggescho- ben. Bei erfolgreichem Rettungswurf erleidet die Kreatur nur die Hälfte des Schadens und wird nicht geschoben. Zusätzlich werden ungesicherte Gegenstände, die sich vollständig innerhalb des Wir- kungsbereichs befinden, automatisch 3 m von dir weggeschoben und der Zauber erzeugt einen Donnerschlag, der in einer Distanz von bis zu 90 m noch hörbar ist.', 'Wenn du beim Wirken dieses Zaubers einen Zauberplatz von Grad 2 oder höher verwendest, erhöht sich der Schaden um 1W8 für jeden Zauberplatzgrad über 1.', 1, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (6, 'Dunkelheit', 1, 1, 18, 1, 10, 2, 'Magische Dunkelheit breitet sich von einem Punkt deiner Wahl in Reichweite aus und füllt für die Wirkungsdauer eine Sphäre mit einem Radius von 4,5 Metern. Die Dunkelheit kann sich auch um Ecken ausbreiten. Kreaturen mit Dunkelsicht können nicht durch diese Dunkelheit blicken, und nichtmagisches Licht kann sie nicht erhellen. Wenn der Punkt, den du wählst, ein Gegenstand ist, den du hältst oder der getragen oder in der Hand gehalten werden kann, dann breitet sich die Dunkelheit von dem Gegenstand aus und bewegt sich mit ihm. Wenn die Quelle der Dunkelheit vollständig mit einem undurchsichtigen Gegenstand, wie einer Schüssel oder einem Helm bedeckt wird, blockiert das die Dunkelheit. Wenn sich der Bereich des Zaubers mit einem Bereich aus Licht überschneidet, das mit einem Zauber des 2. Grades oder darunter erschaffen worden ist, wird der Zauber, der das Licht erschaffen hat, aufgehoben.', NULL, 2, 3, true, false, true, false, true);
INSERT INTO dd.zauber VALUES (7, 'Einflüsterung', 1, 1, 9, 1, 8, 3, 'Du schlägst eine Vorgehensweise vor (in maximal ein oder zwei Sätzen) und beeinflusst auf magische Weise eine Kreatur deiner Wahl in Reichweite, die du sehen kannst und die dich hören und verstehen kann. Kreaturen, die nicht bezaubert werden können, sind immun gegen diesen Effekt. Diese Einflüsterung muss auf eine Weise for- muliert werden, die die Vorgehensweise sinnvoll erscheinen lässt. Wenn du die Kreatur aufforderst, sich zu erstechen, sich in einen Speer zu werfen, sich anzuzünden oder etwas anderes zu tun, das ihm schadet, negiert das den Effekt des Zaubers automatisch. Das Ziel muss einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf folgt es der Verhaltensweise, die du beschrieben hast, nach seinen Möglichkeiten. Die vorge- schlagene Vorgehensweise kann für die gesamte Wirkungsdauer anhalten. Wenn die Vorgehensweise in kürzerer Zeit abgeschlos- sen werden kann, endet der Zauber, wenn das Ziel das getan hat, was es tun sollte. Du kannst auch bestimmte Bedingungen bestimmen, die eine besondere Aktivität während der Wirkungs- dauer auslösen. Beispielsweise könntest du vorschlagen, dass eine Ritterin dem ersten Bettler, den sie trifft, ihr Schlachtross schenkt. Wenn die Bedingung nicht erfüllt wird, ehe der Zauber endet, dann wird die Handlung nicht ausgeführt. Wenn du oder einer deiner Gefährten das Ziel verletzt, endet der Zauber.', NULL, 2, 3, true, false, true, false, true);
INSERT INTO dd.zauber VALUES (8, 'Feenfeuer', 1, 1, 18, 1, 1, 2, 'Jeder Gegenstand in einem Würfel mit 6 Metern Kantenlänge in Reichweite wird von blauem, grünen oder violettem Licht umgeben (deine Wahl). Alle Kreaturen, die sich in dem Bereich aufhalten, wenn der Zauber gewirkt wird, werden ebenfalls von Licht umge- ben, wenn sie einen Geschicklichkeitsrettungswurf nicht schaffen. Für die Wirkungsdauer geben Gegenstände und betroffene Krea- turen dämmriges Licht in einem Radius von 3 Metern ab. Angriffswürfe gegen betroffene Kreaturen oder Gegenstände haben Vorteil, wenn der Angreifer sie sehen kann, und die betrof- fenen Kreaturen oder Gegenstände können keinen Nutzen aus Unsichtbarkeit ziehen.', NULL, 1, 3, true, false, false, false, true);
INSERT INTO dd.zauber VALUES (9, 'Feuerball', 1, 1, 45, 1, 0, 4, 'Ein heller Lichtblitz fährt aus deinem deutenden Finger zu einem Punkt in Reichweite deiner Wahl und erblüht mit einem lauten Brüllen zu einer Explosion aus Flammen. Alle Kreatu- ren in einem Radius von 6 Metern, der um den Punkt zentriert ist, müssen einen Geschicklichkeitswurf ablegen. Bei einem misslungenen Rettungswurf erleidet ein Ziel 8W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer kann sich um Ecken ausbreiten. Das Feuer entzün- det alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.', 3, 3, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (10, 'Flammenkugel', 1, 1, 18, 1, 1, 2, 'Eine Sphäre aus Feuer mit einem Durchmesser von 1,5 Metern erscheint in einem nicht besetzten Bereich deiner Wahl in Reich- weite und hält für die Wirkungsdauer an. Jede Kreatur, die ihren Zug innerhalb von 1,5 Metern um die Sphäre beendet, muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem miss- lungenen Rettungswurf erleidet die Kreatur 2W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Als Aktion kannst du die Sphäre bis zu 9 Meter bewegen. Wenn du eine Kreatur mit der Sphäre rammst, muss sie einen Rettungswurf gegen den Schaden der Sphäre ablegen, und die Bewegung der Sphäre endet in diesem Zug. Wenn du die Sphäre bewegst, kannst du sie über Hindernisse lenken, die bis zu 1,5 Meter hoch sind und sie über Gräben von bis zu 3 Metern Breite springen lassen. Die Sphäre entzündet brennbare Gegenstände, die nicht getragen oder in der Hand gehalten werden, und gibt in einem Radius von 6 Metern helles Licht und in einem Radius von weiteren 6 Metern dämmriges Licht ab.', 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem zweiten um 1W6.', 2, 4, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (11, 'Fliegen', 1, 1, 0, 6, 10, 2, 'Du berührst eine bereitwillige Kreatur. Das Ziel erhält für die Wirkungsdauer eine Flug-Bewegungsrate von 18 Metern. Wenn der Zauber endet fällt das Ziel zu Boden, wenn es noch in der Luft ist, es sei denn, es kann den Sturz abfangen.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem dritten auf eine zusätzliche Kreatur wirken.', 3, 3, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (12, 'Gebet der Heilung', 10, 3, 9, 1, 0, 4, 'Bis zu sechs Kreaturen deiner Wahl in Reichweite, die du sehen kannst, erhalten jeweils 2W8 + deinen Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 3. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem zweiten um 1W8.', 2, 3, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (13, 'Göttliche Führung', 1, 1, 0, 6, 1, 2, 'Du berührst eine bereitwillige Kreatur. Einmal ehe der Zauber endet kann das Ziel einen W4 würfeln und das Ergebnis auf einen Attributswurf seiner Wahl addieren. Es kann den Würfel vor oder nach dem Attributswurf werfen. Dann endet der Zauber.', NULL, 0, 6, true, true, false, false, true);
INSERT INTO dd.zauber VALUES (14, 'Heilendes Wort', 1, 2, 18, 1, 0, 4, 'Eine Kreatur deiner Wahl in Reichweite, die du sehen kannst, erhält 1W4 + dein Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 2. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem ersten um 1W4.', 1, 3, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (15, 'Heilige Flamme', 1, 1, 18, 1, 0, 4, 'Flammengleiches Licht senkt sich auf eine Kreatur in Reich- weite, die du sehen kannst, herab. Die Kreatur muss einen Geschicklichkeitsrettungswurf schaffen, sonst erleidet sie 1W8 gleißenden Schaden. Bei diesem Rettungswurf erhält das Ziel keinen Vorteil aus Deckung. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.', NULL, 0, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (16, 'Heiligtum', 1, 2, 9, 1, 1, 2, 'Du schützt eine Kreatur in Reichweite vor Angriffen. Bis der Zau- ber endet, müssen alle Kreaturen, die die geschützte Kreatur mit einem Angriff oder einem schädigenden Zauber attackieren wol- len, zunächst einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf muss die Kreatur ein neues Ziel wählen, sonst verliert sie den Angriff oder Zauber. Der Zauber schützt die Kreatur nicht vor Flächeneffekten, wie der Explosion eines Feuerballs. Wenn die geschützte Kreatur einen Angriff macht oder einen Zauber wirkt, der eine gegnerische Kreatur betrifft, endet dieser Zauber.', NULL, 0, 3, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (17, 'Identifizieren', 1, 3, 0, 6, 0, 4, 'Du wählst einen Gegenstand, den du während des Wirkens die- ses Zaubers berühren musst. Wenn es sich um einen magischen Gegenstand oder ein anderweitig mit Magie erfülltes Objekt handelt, erfährst du, welche Eigenschaften es hat, wie du sie nut- zen kannst, ob der Gegenstand eine Einstimmung erforderlich macht und wie viele Ladungen er hat. Du erfährst, ob Zauber auf dem Gegenstand liegen und um welche es sich handelt. Wenn der Gegenstand durch einen Zauber erschaffen wurde, erfährst du, um welchen Zauber es sich handelt. Wenn du stattdessen eine Kreatur berührst, während du den Zauber wirkst, dann erfährst du, welche Zauber das Ziel augen- blicklich beeinflussen.', NULL, 1, 6, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (18, 'Kältestrahl', 1, 1, 18, 1, 0, 4, 'Ein eisiger Strahl aus blau-weißem Licht schießt auf eine Krea- tur in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet die Kreatur 1W8 Kälte- schaden, und ihre Bewegungsrate wird bis zum Beginn deines nächsten Zugs um 3 Meter verringert. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.', NULL, 0, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (19, 'Lenkendes Geschoss', 1, 1, 36, 1, 1, 1, 'Ein Lichtblitz schießt auf eine Kreatur deiner Wahl in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet das Ziel 4W6 gleißenden Schaden, und der nächste Angriffswurf, der vor Ende deines nächsten Zuges gegen das Ziel durchgeführt wird, hat einen Vorteil, weil mystisches Licht das Ziel zum Schimmern bringt.', 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.', 1, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (20, 'Leuchtfeuer der Hoffnung', 1, 1, 9, 1, 1, 2, 'Zauber schenkt Hoffnung und Lebenskraft. Wähle eine beliebige Anzahl von Kreaturen in Reichweite. Für die Wirkungsdauer haben sie alle einen Vorteil auf Weisheitsrettungswürfe und Rettungswürfe gegen Tod, und erhalten durch jede Heilung die maximale Anzahl von Trefferpunkten.', NULL, 3, 2, true, true, false, false, true);
INSERT INTO dd.zauber VALUES (21, 'Licht', 1, 1, 0, 6, 1, 3, 'Du berührst einen Gegenstand, der in keiner Dimension größer als 3 Meter ist. Bis der Zauber endet, strahlt dieser Gegenstand in einem Radius von 6 Metern helles Licht und in einem zusätz- lichen Radius von 6 Metern dämmriges Licht ab. Das Licht kann jede Farbe haben, die du willst. Wenn der Gegenstand mit etwas bedeckt wird, das vollkommen undurchsichtig ist, wird das Licht blockiert. Der Zauber endet wenn du ihn erneut wirkst oder als Aktion beendest. Wenn du einen Gegenstand als Ziel auswählst, den eine feindliche Kreatur trägt oder in der Hand hält, muss die Kreatur einen Geschicklichkeitsrettungswurf schaffen, um dem Zauber auszuweichen.', NULL, 0, 3, true, false, true, false, false);
INSERT INTO dd.zauber VALUES (22, 'Magie bannen', 1, 1, 36, 1, 0, 4, 'Wähle eine Kreatur, einen Gegenstand oder einen magischen Effekt in Reichweite. Jeder Zauber des 3. Grades oder darunter, der auf dem Ziel liegt, endet. Für jeden Zauber des 4. Grades oder höher, der auf dem Ziel liegt, mache einen Attributswurf mit deinem Attribut zum Zauberwirken. Der SG ist 10 + die Stufe des Zaubers. Bei einem erfolgreichen Wurf endet der Zauber.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Ranges oder höher wirkst, wird der Effekt von Zaubern auf dem Ziel beendet, wenn ihr Grad gleich oder niedri- ger als der Grad des Zauberplatzes ist, den du verwendet hast.', 3, 2, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (23, 'Magie entdecken', 1, 1, 0, 2, 10, 2, 'Für die Wirkungsdauer spürst du die Anwesenheit von Magie im Umkreis von 9 Metern um dich. Wenn du Magie auf diese Weise spürst, kannst du deine Aktion verwenden, um eine schwache Aura um eine sichtbare beliebige Kreatur oder einen Gegenstand im Wirkungsbereich zu sehen, der magisch ist, und die Schule der Magie in Erfahrung zu bringen, wenn es eine gibt. Der Zauber kann die meisten Barrieren durchdringen, wird aber von 30 Zenti- metern Stein, 2,5 Zentimetern gewöhnlicher Metalle, einer dünnen Schicht Blei oder 90 Zentimetern Holz oder Erde blockiert.', NULL, 1, 6, true, true, false, false, true);
INSERT INTO dd.zauber VALUES (24, 'Magierhand', 1, 1, 9, 1, 1, 2, 'Eine gespenstische, schwebende Hand erscheint an einem Punkt deiner Wahl in Reichweite. Die Hand bleibt für die Wirkungs- dauer bestehen oder bis du sie mit einer Aktion wegschickst. Die Hand verschwindet, wenn sie sich weiter als 9 Meter von dir ent- fernt oder du den Zauber noch einmal wirkst. Du kannst eine Aktion verwenden, um die Hand zu kontrollieren. Du kannst die Hand verwenden, um Gegenstände zu manipulieren, verschlossene Türen oder Behälter zu öffnen, einen Gegenstand aus einem geöffneten Behälter zu holen oder ihn zu verstauen, oder den Inhalt einer Phiole auszugießen. Du kannst die Hand immer wenn du sie verwendest bis zu 9 Meter weit bewegen. Die Hand kann nicht angreifen, keine magischen Gegenstände aktivieren oder mehr als 10 Pfund tragen.', NULL, 0, 4, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (25, 'Magierrüstung', 1, 1, 0, 6, 8, 3, 'Du berührst eine bereitwillige Kreatur, die keine Rüstung trägt. Eine schützende magische Energie umgibt sie bis der Zauber endet. Die Basis-Rüstungsklasse des Ziels entspricht 13 + Geschicklichkeitsmodifikator. Der Zauber endet, wenn das Ziel Rüstung anlegt oder du den Zauber mit einer Aktion aufhebst.', NULL, 1, 2, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (26, 'Magisches Geschoss', 1, 1, 36, 1, 0, 4, 'Du erschaffst drei leuchtende Pfeile aus magischer Energie. Jeder Pfeil trifft eine Kreatur deiner Wahl in Reichweite, die du sehen kannst. Ein Pfeil fügt dem Ziel 1W4 +1 Energieschaden zu. Die Pfeile schlagen alle gleichzeitig ein, und du kannst sie auf eine oder mehrere Kreaturen aufteilen.', 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann erschafft der Zauber für jeden Zauberplatz-Grad über dem ersten einen weiteren Pfeil.', 1, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (27, 'Massen-Heilendes Wort', 1, 2, 18, 1, 0, 4, 'Wenn du Worte der Wiederherstellung rufst, erhalten bis zu sechs Kreaturen deiner Wahl, die du sehen kannst und die sich in Reichweite befinden, 1W4 + deinen Zaubermodifikator Treffer- punkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.', 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem dritten um 1W4.', 3, 3, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (28, 'Nebelschritt', 1, 2, 0, 2, 0, 4, 'Du wirst kurz von einem silbrigen Nebel umgeben und telepor- tierst dich bis zu 9 Meter in einen nicht besetzten Bereich, den du sehen kannst.', NULL, 2, 3, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (29, 'Person bezaubern', 1, 1, 9, 1, 1, 3, 'Du versuchst einen Humanoiden in Reichweite, den du sehen kannst, zu bezaubern. Das Ziel muss einen Weisheitsrettungswurf ablegen, was es mit Vorteil tut, wenn du oder deine Gefährten gegen es kämpfen. Wenn es den Rettungswurf nicht schafft, wird es von dir bezaubert bis der Zauber endet, oder du oder einer deiner Gefährten etwas tut, um ihm zu schaden. Die bezauberte Kreatur betrachtet dich als freundschaftliche Bekanntschaft. Wenn der Zauber endet, weiß die Kreatur, dass sie von dir bezau- bert worden ist.', 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter von- einander entfernt sein, wenn du den Zauber auf sie wirkst.', 1, 1, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (30, 'Person festhalten', 1, 1, 18, 1, 1, 2, 'Wähle einen Humanoiden in Reichweite, den du sehen kannst. Das Ziel muss einen Weisheitsrettungswurf ablegen, um nicht für die Wirkungsdauer gelähmt zu werden. Zu Beginn eines jeden seiner Züge, kann das Ziel einen weiteren Weisheitsrettungswurf ablegen. Bei einem Erfolg endet der Zauber für das Ziel.', 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem zweiten auf eine zusätzliche humanoide Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter voneinander entfernt sein, wenn du den Zauber auf sie wirkst.', 2, 1, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (31, 'Resistenz', 1, 1, 0, 6, 1, 2, 'Du berührst eine bereitwillige Kreatur. Einmal, ehe der Zauber endet, kann das Ziel einen W4 würfeln und das Ergebnis auf einen Rettungswurf seiner Wahl addieren. Es kann den Würfel vor oder nach dem Rettungswurf werfen. Dann endet der Zauber.', NULL, 0, 2, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (32, 'Schild', 1, 4, 0, 2, 1, 1, 'Eine unsichtbare Barriere aus magischer Energie erscheint und schützt dich. Bis zum Beginn deines nächsten Zugs hast du einen Bonus von +5 auf deine Rüstungsklasse, auch gegen den auslö- senden Angriff, und erleidest keinen Schaden durch den Zauber Magisches Geschoss.', NULL, 1, 2, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (33, 'Schild des Glaubens', 1, 2, 18, 1, 10, 2, 'Ein schimmerndes Feld erscheint und umhüllt eine Kreatur dei- ner Wahl in Reichweite. Es gewährt ihr für die Wirkungsdauer einen Bonus von +2 auf RK.', NULL, 1, 2, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (34, 'Schlaf', 1, 1, 27, 1, 1, 2, 'Dieser Zauber versetzt Kreaturen in magischen Schlaf. Wirf 5W8, das Ergebnis ist die Gesamtzahl von Trefferpunkten an Kreatu- ren, die dieser Zauber beeinflussen kann. Kreaturen innerhalb von 6 Metern um einen Punkt deiner Wahl in Reichweite werden betroffen, in aufsteigender Reihenfolge nach ihren aktuellen Tref- ferpunkten (bewusstlose Kreaturen werden ignoriert). Beginnend mit der Kreatur mit den niedrigsten aktuellen Trefferpunkten werden alle Kreaturen, die von diesem Zauber betroffen werden, bewusstlos bis der Zauber endet, der Schla- fende Schaden erleidet oder jemand eine Aktion verwendet, um den Schlafenden zu schütteln oder zu ohrfeigen. Ziehe die Trefferpunkte der Kreatur von der Gesamtsumme ab, ehe du mit der nächsten Kreatur mit den niedrigsten Trefferpunkten wei- termachst. Die Trefferpunkte einer Kreatur müssen gleich oder niedriger als die verbleibenden Gesamttrefferpunkte sein, damit sie betroffen wird. Untote und Kreaturen, die nicht bezaubert werden können, sind von diesem Zauber nicht betroffen.', 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann würfelst du zusätzliche 2W8 für jeden Zauberplatz-Grad über dem ersten.', 1, 1, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (35, 'Schockgriff', 1, 1, 0, 6, 0, 4, 'Blitze springen aus deinen Händen und verpassen einer Kreatur, die du zu berühren versuchst, einen Schock. Führe einen Nah- kampf-Zauberangriff gegen das Ziel durch. Du hast einen Vorteil beim Angriffswurf, wenn das Ziel Rüstung trägt, die aus Metall besteht. Bei einem Treffer erleidet die Kreatur 1W8 Blitzschaden und kann bis zum Beginn deines nächsten Zuges keine Reaktionen durchführen. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.', NULL, 0, 3, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (36, 'Schützendes Band', 1, 1, 0, 6, 1, 3, 'Dieser Zauber schützt eine bereitwillige Kreatur, die du berührst und erschafft eine magische Verbindung zwischen dir und dem Ziel bis der Zauber endet. Solange sich das Ziel innerhalb von 18 Metern um dich befindet, erhält es einen Bonus von +1 auf RK und Rettungswürfe und hat Resistenz gegen alle Schadensarten. Außerdem erleidest du jedes Mal, wenn das Ziel Schaden erleidet die gleiche Menge an Schaden. Der Zauber endet, wenn du auf 0 Trefferpunkte fällst oder wenn du und das Ziel weiter als 18 Meter auseinander sind. Er endet auch, wenn der Zauber erneut auf einen der beiden Beteiligten gewirkt wird. Du kannst den Zauber als Aktion aufheben.', NULL, 2, 3, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (38, 'Schutz vor Energie', 1, 1, 0, 6, 1, 3, 'Du rufst Geister, die dich beschützen. Sie huschen für die Wir- kungsdauer in einer Entfernung von 4,5 Metern um dich herum. Wenn du guter oder neutraler Gesinnung bist, erscheint ihre gespenstische Form engelsgleisch oder feenartig (deine Wahl). Wenn du böser Gesinnung bist, erscheinen sie unholder Natur. Wenn du diesen Zauber wirkst, kannst du eine beliebige Anzahl von Kreaturen, die du sehen kannst, festlegen, die nicht von dem Zauber betroffen sind. Die Bewegungsrate von Kreaturen ist im Bereich des Zaubers halbiert, und wenn die Kreatur das erste Mal in einem Zug den Bereich betritt oder ihren Zug dort beginnt, muss sie einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet die Kreatur 3W8 Gleißenden Schaden (wenn du guter oder neutraler Gesinnung bist) oder 3W8 Nekrotischen Schaden (wenn du böser Gesinnung bist). Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W8.', 3, 2, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (39, 'Schwache Genesung', 1, 1, 0, 6, 0, 4, 'Du berührst eine Kreatur und kannst entweder eine Krankheit beenden, an der sie leidet, oder einen Zustand, den sie erlitten hat. Dieser Zustand kann blind, gelähmt, taub oder vergiftet sein.', NULL, 2, 2, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (43, 'Sprachen verstehen', 1, 1, 0, 2, 1, 3, 'Für die Wirkungsdauer verstehst du die wörtliche Bedeutung jeglicher gesprochener Sprache, die du hörst. Du kannst auch jede geschriebene Sprache lesen, die du sehen kannst, doch musst du die Oberfläche berühren, auf der die Worte geschrieben sind. Es dauert ungefähr eine Minute, eine Seite Text zu lesen. Der Zauber hilft nicht bei der Entschlüsselung von Geheim- botschaften in einem Text oder Glyphen, wie arkane Sigillen, die nicht Teil einer geschriebenen Sprache sind.', NULL, 1, 6, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (46, 'Taschenspielerei', 1, 1, 3, 1, 1, 3, 'Dieser Zauber ist ein kleinerer magischer Trick, den Zauberlehrlinge zum Üben verwenden. Du kannst einen der folgenden magischen Effekte in Reichweite erschaffen: 1. Du erschaffst einen sofortigen, harmlosen sensorischen Effekt, wie einen Funkenregen, einen Windhauch, schwache Musik oder einen eigenartigen Geruch. 2. Du kannst augenblicklich eine Kerze, eine Fackel oder ein klei- nes Lagerfeuer entzünden oder löschen. 3. Du kannst einen Gegenstand, der nicht größer ist als ein Würfel mit 30 Zentimeter Kantenlänge, sofort reinigen oder beschmutzen. 4. Du kannst bis zu einen Würfel mit 30 Zentimeter Kantenlänge an Nahrung oder nicht lebender Materie für eine Stunde abkühlen, aufwärmen oder würzen. 5. Du lässt für eine Stunde eine Farbe, ein kleines Mal oder ein Symbol auf einem Gegenstand oder einer Oberfläche erscheinen. 6. Du erschaffst einen nichtmagischen kleinen Gegenstand oder ein Trugbild, das in deine Hand passt und bis zum Ende deines nächsten Zugs anhält. Wenn du diesen Zauber mehrmals wirkst, kannst du bis zu drei der nicht sofortigen Effekte gleichzeitig aktiviert haben, und du kannst solche Effekte als Aktion aufheben.', NULL, 0, 5, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (47, 'Thaumaturgie', 1, 1, 9, 1, 1, 2, 'Du manifestierst ein kleines Wunder, ein Zeichen übernatür- licher Macht, in Reichweite. Du kannst einen der folgenden magischen Effekte in Reichweite erschaffen: 1. Deine Stimme dröhnt für 1 Minute dreimal so laut wie normal. 2. Du lässt Flammen flackern, heller oder dunkler werden oder die Farbe wechseln. All dies hält 1 Minute an. 3. Du erzeugst für 1 Minute harmlose Erschütterungen im Boden. 4. Du erschaffst ein kurzes Geräusch, das von einem Punkt deiner Wahl in Reichweite ertönt, wie das Grollen von Donner, den Ruf eines Raben oder ein unheilvolles Flüstern. 5. Du lässt eine nicht verriegelte Tür oder ein Fenster auffliegen oder zuschlagen. 6. Du änderst für 1 Minute das Aussehen deiner Augen. Wenn du diesen Zauber mehrmals wirkst, kannst du bis zu drei der nicht sofortigen Effekte gleichzeitig aktiviert haben, und du kannst solche Effekte als Aktion aufheben.', NULL, 0, 5, true, false, false, false, false);
INSERT INTO dd.zauber VALUES (50, 'Vorahnung', 1, 3, 0, 2, 0, 4, 'Indem du Stöckchen mit Juwelenintarsien wirfst, mit Drachenwürfeln würfelst, reich verzierte Karten auslegst oder ein anderes Weissagungswerkzeug verwendest, erhältst du ein Omen von einer außerweltlichen Wesenheit über die Folgen einer bestimmten Handlungsweise, die du für die nächsten 30 Minuten planst. Der SL wählt eines der folgenden möglichen Omen: 1. Wohl, für gute Folgen. 2. Weh, für schlechte Folgen. 3. Wohl und Weh, für sowohl gute als auch schlechte Folgen. 4. Nichts, bei Folgen, die weder besonders gut noch schlecht sind. Der Zauber nimmt keine Rücksicht auf mögliche Umstände, die das Ergebnis verändern könnten, wie das Wirken zusätzlicher Zauber oder den Verlust eines Gefährten. Wenn du den Zauber zweimal oder öfter wirkst, ehe du deine nächste Lange Rast abschließt, besteht eine kumulative Chance von 25 Prozent für jeden Zauber nach dem ersten, dass du ein zufälliges Ergebnis bekommst. Der SL macht diesen Wurf verdeckt.', NULL, 2, 6, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (51, 'Waffe des Glaubens', 1, 2, 18, 1, 1, 2, 'Du erschaffst eine schwebende, gespenstische Waffe in Reich- weite, die für die Wirkungsdauer anhält oder bis du den Zauber erneut wirkst. Wenn du den Zauber wirkst, kannst du einen Nahkampfangriff gegen eine Kreatur innerhalb von 1,5 Metern zur Waffe durchführen. Bei einem Treffer erleidet das Ziel 1W8 + deinen Zaubermodifikator als Energieschaden. Als Bonusaktion in deinem Zug kannst du die Waffe bis zu 4 Meter weit bewegen und den Angriff gegen eine Kreatur inner- halb von 1,5 Metern um sie wiederholen. Diese Waffe kann jede Form annehmen, die du willst. Kleriker von Gottheiten, die mit einer bestimmten Waffe assoziiert sind (wie St. Cuthbert, der für seinen Streitkolben bekannt ist, und Thor für seinen Hammer) lassen den Effekt des Zaubers wie diese Waffe aussehen.', 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem zweiten um 1W8.', 2, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (52, 'Wiederbeleben', 1, 1, 0, 6, 0, 4, 'Du berührst eine Kreatur, die innerhalb der letzten Minute gestorben ist. Die Kreatur kehrt mit 1 Trefferpunkt zum Leben zurück. Dieser Zauber kann keine Kreaturen zum Leben erwecken, die an Altersschwäche gestorben sind oder denen Kör- perteile fehlen.', NULL, 3, 8, true, true, true, false, false);
INSERT INTO dd.zauber VALUES (53, 'Wunden heilen', 1, 1, 0, 6, 0, 4, 'Eine Kreatur, die du berührst, erhält eine Anzahl von Treffer- punkten gleich 1W8 + deinem Zaubermodifikator zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 2. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem ersten um 1W8.', 1, 3, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (54, 'Wunden verursachen', 1, 1, 0, 6, 0, 4, 'Mache einen Nahkampfangriff gegen eine Kreatur innerhalb deiner Reichweite. Bei einem Treffer erleidet das Ziel 3W10 Nek- rotischen Schaden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W10.', 1, 8, true, true, false, false, false);
INSERT INTO dd.zauber VALUES (40, 'Segnen', 1, 1, 9, 1, 1, 2, 'Du segnest bis zu drei Kreaturen deiner Wahl in Reichweite. Immer wenn ein Ziel einen Angriffs- oder Rettungswurf macht, bis der Zauber endet, kann es einen W4 werfen und das Ergebnis auf den Angriffswurf oder Rettungswurf addieren.', 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken.', 1, 1, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (44, 'Stille', 1, 1, 36, 1, 10, 2, 'Für die Wirkungsdauer kann kein Geräusch in einer Sphäre mit 6 Metern Radius entstehen oder sie durchdringen. Die Sphäre ist um einen Punkt in Reichweite zentriert, den du auswählst. Jede Kreatur und jeder Gegenstand, der sich vollständig in der Sphäre aufhält, ist immun gegen Schallschaden, und Kreaturen sind Taub, solange sie sich in ihrem Inneren befinden. Einen Zauber zu wirken, der eine verbale Komponente hat, ist in der Sphäre nicht möglich.', NULL, 2, 7, true, true, false, false, true);
INSERT INTO dd.zauber VALUES (41, 'Spinnenklettern', 1, 1, 0, 6, 1, 3, 'Bis der Zauber endet, erhält eine bereitwillige Kreatur, die du berührst, die Fähigkeit sich an senkrechten Oberflächen nach oben, unten oder zur Seite zu bewegen, sowie kopfüber von der Decke zu hängen, während sie die Hände frei behält. Das Ziel erhält außerdem eine Klettern-Bewegungsrate gleich ihrer nor- malen Bewegungsrate.', NULL, 2, 5, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (42, 'Spinnennetz', 1, 1, 18, 1, 1, 3, 'Du beschwörst eine Masse aus dichten, klebrigen Netzen an einem Punkt in Reichweite deiner Wahl. Die Netze füllen für die Wirkungsdauer einen Würfel mit 6 Metern Kantenlänge. Die Netze sind schwieriges Gelände und ein leicht verschleiertes Gebiet. Wenn die Netze nicht zwischen zwei festen Gegenständen (wie Mauern oder Bäumen) verankert oder über einen Fußboden, eine Mauer oder die Decke gespannt sind, dann fällt das beschworene Netz in sich selbst zusammen, und der Zauber endet zu Beginn deines nächsten Zuges. Netze, die über eine flache Oberfläche ausgebreitet sind, haben eine Tiefe von 1,5 Metern. Alle Krea- turen, die ihren Zug in den Netzen beginnen oder sie während ihres Zuges betreten, müssen einen Geschicklichkeitsrettungs- wurf ablegen. Bei einem misslungenen Rettungswurf ist die Kreatur festgesetzt, solange sie sich in den Netzen aufhält. Eine Kreatur, die von den Netzen festgesetzt ist, kann einen Stärke- wurf gegen deinen Zauberrettungswurf-SG ablegen. Wenn sie erfolgreich ist, ist sie nicht mehr festgesetzt. Die Netze sind brennbar. Jeder Würfel von Netzen mit 1,5 Metern Kantenlänge, der mit Feuer in Kontakt kommt, verbrennt innerhalb von 1 Runde, was allen Kreaturen, die ihren Zug im Feuer beginnen, 2W4 Feuerschaden zufügt.', NULL, 2, 4, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (48, 'Unsichtbarkeit', 1, 1, 0, 6, 1, 3, 'Eine Kreatur, die du berührst, wird unsichtbar bis der Zauber endet. Alles, was das Ziel trägt oder in der Hand hält wird unsichtbar, solange es sich am Körper des Ziels befindet. Der Zauber endet für ein Ziel, das angreift oder einen Zauber wirkt.', 'Wenn du diesen Zauber mit einem Zau- berplatz des 3. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem zweiten auf eine zusätzliche Kreatur wirken.', 2, 7, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (37, 'Schutzgeister', 1, 1, 0, 4, 10, 2, 'Du rufst Geister, die dich beschützen. Sie huschen für die Wir- kungsdauer in einer Entfernung von 4,5 Metern um dich herum. Wenn du guter oder neutraler Gesinnung bist, erscheint ihre gespenstische Form engelsgleisch oder feenartig (deine Wahl). Wenn du böser Gesinnung bist, erscheinen sie unholder Natur. Wenn du diesen Zauber wirkst, kannst du eine beliebige Anzahl von Kreaturen, die du sehen kannst, festlegen, die nicht von dem Zauber betroffen sind. Die Bewegungsrate von Kreaturen ist im Bereich des Zaubers halbiert, und wenn die Kreatur das erste Mal in einem Zug den Bereich betritt oder ihren Zug dort beginnt, muss sie einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet die Kreatur 3W8 Gleißenden Schaden (wenn du guter oder neutraler Gesinnung bist) oder 3W8 Nekrotischen Schaden (wenn du böser Gesinnung bist). Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden.', 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W8.', 3, 4, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (45, 'Tanzende Lichter', 1, 1, 36, 1, 1, 2, 'Du erschaffst bis zu vier fackelgroße Lichter in Reichweite, die du wie Fackeln, Laternen oder leuchtende Kugeln erscheinen lassen kannst und die für die Wirkungsdauer in der Luft schweben. Du kannst die vier Lichter auch in einer leuchtenden, vage humanoi- den Mittelgroßen Gestalt vereinen. Welche Gestalt du auch wählst, jedes Licht strahlt dämmriges Licht in einem Radius von 3 Metern aus. Als Bonusaktion kannst du die Lichter in deinem Zug bis zu 18 Meter an einen neuen Punkt innerhalb der Reichweite bewe- gen. Ein Licht darf sich nicht weiter als 6 Meter von einem anderen Licht entfernen, das mit diesem Zauber erschaffen wurde, und es verschwindet wenn es die Reichweite des Zaubers verlässt.', NULL, 0, 3, true, true, true, false, true);
INSERT INTO dd.zauber VALUES (49, 'Verschwimmen', 1, 1, 0, 2, 1, 2, 'Dein Körper wird verschwommen, wechselhaft und wabernd für alle, die dich sehen können. Für die Wirkungsdauer haben alle Kreaturen Nachteil bei Angriffswürfen gegen dich. Ein Angreifer ist immun gegen diesen Effekt, wenn er sich nicht auf seine Sicht verlässt wie bei Blindsicht, oder er durch Illusionen blicken kann wie bei Wahrer Blick.', NULL, 2, 7, true, false, false, false, true);


--
-- Data for Name: zaubermaterial; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.zaubermaterial VALUES (1, 2, NULL, 101, 1, false);
INSERT INTO dd.zaubermaterial VALUES (2, 6, NULL, 106, 1, false);
INSERT INTO dd.zaubermaterial VALUES (4, NULL, NULL, 108, 1, false);
INSERT INTO dd.zaubermaterial VALUES (3, 6, 4, 107, 1, false);
INSERT INTO dd.zaubermaterial VALUES (5, 7, NULL, 109, 1, false);
INSERT INTO dd.zaubermaterial VALUES (7, NULL, NULL, 111, 1, false);
INSERT INTO dd.zaubermaterial VALUES (6, 7, 7, 110, 1, false);
INSERT INTO dd.zaubermaterial VALUES (8, 9, NULL, 112, 1, false);
INSERT INTO dd.zaubermaterial VALUES (9, 9, NULL, 113, 1, false);
INSERT INTO dd.zaubermaterial VALUES (10, 10, NULL, 114, 1, false);
INSERT INTO dd.zaubermaterial VALUES (11, 10, NULL, 113, 1, false);
INSERT INTO dd.zaubermaterial VALUES (12, 10, NULL, 115, 1, false);
INSERT INTO dd.zaubermaterial VALUES (13, 11, NULL, 116, 1, false);
INSERT INTO dd.zaubermaterial VALUES (14, 16, NULL, 117, 1, false);
INSERT INTO dd.zaubermaterial VALUES (15, 17, NULL, 118, 1, false);
INSERT INTO dd.zaubermaterial VALUES (16, 17, NULL, 119, 1, false);
INSERT INTO dd.zaubermaterial VALUES (18, NULL, NULL, 120, 1, false);
INSERT INTO dd.zaubermaterial VALUES (17, 21, 18, 121, 1, false);
INSERT INTO dd.zaubermaterial VALUES (19, 25, NULL, 122, 1, false);
INSERT INTO dd.zaubermaterial VALUES (20, 30, NULL, 123, 1, false);
INSERT INTO dd.zaubermaterial VALUES (21, 31, NULL, 124, 1, false);
INSERT INTO dd.zaubermaterial VALUES (22, 33, NULL, 125, 1, false);
INSERT INTO dd.zaubermaterial VALUES (23, 34, NULL, 126, 1, false);
INSERT INTO dd.zaubermaterial VALUES (25, NULL, NULL, 127, 1, false);
INSERT INTO dd.zaubermaterial VALUES (24, 34, 25, 128, 1, false);
INSERT INTO dd.zaubermaterial VALUES (26, 36, NULL, 129, 1, false);
INSERT INTO dd.zaubermaterial VALUES (27, 37, NULL, 130, 1, false);
INSERT INTO dd.zaubermaterial VALUES (28, 40, NULL, 131, 1, false);
INSERT INTO dd.zaubermaterial VALUES (29, 41, NULL, 132, 1, false);
INSERT INTO dd.zaubermaterial VALUES (30, 41, NULL, 133, 1, false);
INSERT INTO dd.zaubermaterial VALUES (31, 42, NULL, 134, 1, false);
INSERT INTO dd.zaubermaterial VALUES (32, 43, NULL, 135, 1, false);
INSERT INTO dd.zaubermaterial VALUES (33, 43, NULL, 136, 1, false);
INSERT INTO dd.zaubermaterial VALUES (34, 45, NULL, 120, 1, false);
INSERT INTO dd.zaubermaterial VALUES (35, NULL, NULL, 138, 1, false);
INSERT INTO dd.zaubermaterial VALUES (36, NULL, NULL, 137, 1, false);
INSERT INTO dd.zaubermaterial VALUES (37, 48, NULL, 139, 1, false);
INSERT INTO dd.zaubermaterial VALUES (39, NULL, NULL, 142, 1, false);
INSERT INTO dd.zaubermaterial VALUES (40, NULL, NULL, 140, 1, false);
INSERT INTO dd.zaubermaterial VALUES (38, 50, 39, 141, 1, false);
INSERT INTO dd.zaubermaterial VALUES (41, 52, NULL, 143, 1, false);


--
-- Data for Name: zeitaufwandtyp; Type: TABLE DATA; Schema: dd; Owner: dungeonmaster
--

INSERT INTO dd.zeitaufwandtyp VALUES (1, 'Aktion', 'Eine gewöhnliche Aktion');
INSERT INTO dd.zeitaufwandtyp VALUES (2, 'Bonusaktion', 'Ein Zauber, der mit einer Bonusaktion gewirkt wird, ist besonders schnell. Wende für einen solchen Spruch in deinem Zug eine Bonusaktion auf, vorausgesetzt dass du in diesem noch keine genutzt hast. Du kannst keinen anderen Zauber in diesem Zug wirken, außer einem Zaubertrick mit einem Zeitaufwand von einer Aktion.');
INSERT INTO dd.zeitaufwandtyp VALUES (3, 'Minuten', 'Bestimmte Zauber (auch Rituale) erfordern mehr Zeit, um sie zu wirken: Minuten oder sogar Stunden. Verwendest du einen Spruch mit einem längeren Zeitaufwand als eine Aktion oder Reaktion, musst du in jedem Zug, den du den Zauber wirkst, deine Aktion darauf verwenden und die ganze Zeit über deine Konzentration aufrechterhalten. Wird deine Konzentration unterbrochen, scheitert der Zauber, aber du verbrauchst keinen Zauberplatz. Wenn du den Spruch erneut wirken willst, musst du von vorn beginnen.');
INSERT INTO dd.zeitaufwandtyp VALUES (4, 'Reaktion', 'Einige Zauber können als Reaktion gewirkt werden. Sie erfordern nur einen Sekundenbruchteil der Konzentration und stellen die Antwort auf ein bestimmtes Ereignis dar. Wenn ein Zauber als Reaktion gewirkt werden kann, ist in seiner Beschreibung angegeben, zu welchem Zeitpunkt dies genau möglich ist.');


--
-- Data for Name: charaktere; Type: TABLE DATA; Schema: od; Owner: dungeonmaster
--

INSERT INTO od.charaktere VALUES (1, 'Krieger', 'Roland');
INSERT INTO od.charaktere VALUES (2, 'Magier', 'Jens');
INSERT INTO od.charaktere VALUES (3, 'Barde', 'Rittersporn');
INSERT INTO od.charaktere VALUES (4, 'Namenloser Held', 'Namenlos');


--
-- Name: gegenstand_id; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.gegenstand_id', 143, true);


--
-- Name: gegenstandtyp_id; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.gegenstandtyp_id', 13, true);


--
-- Name: reichweite_id_seq; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.reichweite_id_seq', 6, true);


--
-- Name: schule_id_seq; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.schule_id_seq', 8, true);


--
-- Name: wirkungsdauer_id; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.wirkungsdauer_id', 6, true);


--
-- Name: zauber_id_seq; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.zauber_id_seq', 1, false);


--
-- Name: zaubermaterial_id_seq; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.zaubermaterial_id_seq', 41, true);


--
-- Name: zeitaufwandtyp_id_seq; Type: SEQUENCE SET; Schema: dd; Owner: dungeonmaster
--

SELECT pg_catalog.setval('dd.zeitaufwandtyp_id_seq', 4, true);


--
-- Name: charakter_id_seq; Type: SEQUENCE SET; Schema: od; Owner: dungeonmaster
--

SELECT pg_catalog.setval('od.charakter_id_seq', 4, true);


--
-- Name: gegenstand gegenstand_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.gegenstand
    ADD CONSTRAINT gegenstand_pkey PRIMARY KEY (gegenstand_id);


--
-- Name: gegenstandtyp gegenstandtyp_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.gegenstandtyp
    ADD CONSTRAINT gegenstandtyp_pkey PRIMARY KEY (gegenstandtyp_id);


--
-- Name: reichweite reichweite_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.reichweite
    ADD CONSTRAINT reichweite_pkey PRIMARY KEY (reichweite_id);


--
-- Name: schule schule_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.schule
    ADD CONSTRAINT schule_pkey PRIMARY KEY (schule_id);


--
-- Name: wirkungsdauer wirkungsdauer_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.wirkungsdauer
    ADD CONSTRAINT wirkungsdauer_pkey PRIMARY KEY (wirkungsdauer_id);


--
-- Name: zauber zauber_name_key; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT zauber_name_key UNIQUE (name);


--
-- Name: zauber zauber_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id);


--
-- Name: zaubermaterial zaubermaterial_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zaubermaterial
    ADD CONSTRAINT zaubermaterial_pkey PRIMARY KEY (zaubermaterial_id);


--
-- Name: zeitaufwandtyp zeitaufwandtyp_pkey; Type: CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zeitaufwandtyp
    ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id);


--
-- Name: charaktere charaktere_pkey; Type: CONSTRAINT; Schema: od; Owner: dungeonmaster
--

ALTER TABLE ONLY od.charaktere
    ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id);


--
-- Name: zaubermaterial fk_ersatz; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zaubermaterial
    ADD CONSTRAINT fk_ersatz FOREIGN KEY (fk_ersatz) REFERENCES dd.zaubermaterial(zaubermaterial_id) NOT VALID;


--
-- Name: gegenstand fk_gegenstand_typ; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.gegenstand
    ADD CONSTRAINT fk_gegenstand_typ FOREIGN KEY (fk_gegenstand_typ) REFERENCES dd.gegenstandtyp(gegenstandtyp_id) NOT VALID;


--
-- Name: zauber fk_reichweite; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT fk_reichweite FOREIGN KEY (fk_reichweite) REFERENCES dd.reichweite(reichweite_id) NOT VALID;


--
-- Name: zauber fk_schule; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT fk_schule FOREIGN KEY (fk_schule) REFERENCES dd.schule(schule_id) NOT VALID;


--
-- Name: zauber fk_wirkungsdauer; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT fk_wirkungsdauer FOREIGN KEY (fk_wirkungsdauer) REFERENCES dd.wirkungsdauer(wirkungsdauer_id) NOT VALID;


--
-- Name: zaubermaterial fk_zauber; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zaubermaterial
    ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES dd.zauber(zauber_id) NOT VALID;


--
-- Name: zauber fk_zeitaufwand_typ; Type: FK CONSTRAINT; Schema: dd; Owner: dungeonmaster
--

ALTER TABLE ONLY dd.zauber
    ADD CONSTRAINT fk_zeitaufwand_typ FOREIGN KEY (fk_zeitaufwand_typ) REFERENCES dd.zeitaufwandtyp(zeitaufwandtyp_id) NOT VALID;


--
-- PostgreSQL database dump complete
--

