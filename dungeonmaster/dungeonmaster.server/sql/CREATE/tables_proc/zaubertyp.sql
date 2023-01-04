\echo ''\echo ''\echo '=========Create zaubertyp table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE zaubertyp
    (
        zaubertyp_id bigint NOT NULL
      , typ          text NOT NULL
      , kategorie    text
      , beschreibung text
    )
;

ALTER TABLE zaubertyp OWNER TO dungeonmaster
;

CREATE SEQUENCE zaubertyp_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zaubertyp_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE zaubertyp_id_seq OWNED BY zaubertyp.zaubertyp_id;
ALTER TABLE ONLY zaubertyp ALTER COLUMN zaubertyp_id SET DEFAULT nextval('zaubertyp_id_seq'::regclass)
;

ALTER TABLE ONLY zaubertyp ADD CONSTRAINT zaubertyp_pkey PRIMARY KEY (zaubertyp_id)
;

CREATE OR REPLACE PROCEDURE insert_zaubertyp
(
  IN in_typ          text
, IN in_kategorie    text DEFAULT NULL
, IN in_beschreibung text DEFAULT NULL
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.zaubertyp
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
PROCEDURE insert_zaubertyp
(
  text
, text, text
) OWNER TO dungeonmaster;