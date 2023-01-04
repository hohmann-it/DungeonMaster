\echo ''\echo ''\echo '=========Create schule table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE schule
    (
        schule_id bigint NOT NULL
      , typ          text NOT NULL
      , kategorie    text
      , beschreibung text
    )
;

ALTER TABLE schule OWNER TO dungeonmaster
;

CREATE SEQUENCE schule_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE schule_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE schule_id_seq OWNED BY schule.schule_id;
ALTER TABLE ONLY schule ALTER COLUMN schule_id SET DEFAULT nextval('schule_id_seq'::regclass)
;

ALTER TABLE ONLY schule ADD CONSTRAINT schule_pkey PRIMARY KEY (schule_id)
;

CREATE OR REPLACE PROCEDURE insert_schule
(
  IN in_typ          text
, IN in_kategorie    text DEFAULT NULL
, IN in_beschreibung text DEFAULT NULL
) LANGUAGE 'sql'
AS
$BODY$
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

$BODY$;
ALTER
PROCEDURE insert_schule
(
  text
, text, text
) OWNER TO dungeonmaster;