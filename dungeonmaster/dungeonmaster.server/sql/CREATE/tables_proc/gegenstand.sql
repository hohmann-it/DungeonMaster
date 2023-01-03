\echo ''\echo ''\echo '=========Create gegenstand table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE gegenstand
    (
        gegenstand_id     bigint NOT NULL
      , name              text NOT NULL
      , beschreibung      text NOT NULL
      , wert              decimal NOT NULL
      , gewicht           decimal NOT NULL
      , fk_gegenstand_typ bigint NOT NULL
    )
;

ALTER TABLE gegenstand OWNER TO dungeonmaster
;

CREATE SEQUENCE gegenstand_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE gegenstand_id OWNER TO dungeonmaster
;

ALTER SEQUENCE gegenstand_id OWNED BY gegenstand.gegenstand_id;
ALTER TABLE ONLY gegenstand ALTER COLUMN gegenstand_id SET DEFAULT nextval('gegenstand_id'::regclass)
;

ALTER TABLE ONLY gegenstand ADD CONSTRAINT gegenstand_pkey PRIMARY KEY (gegenstand_id)
;

ALTER TABLE ONLY gegenstand ADD CONSTRAINT fk_gegenstand_typ FOREIGN KEY (fk_gegenstand_typ) REFERENCES gegenstandtyp(gegenstandtyp_id) NOT VALID
;

CREATE OR REPLACE PROCEDURE dd.insert_gegenstand(
IN in_name         text,
IN in_beschreibung text,
IN in_wert         numeric,
IN in_gewicht      numeric,
IN in_typ          text)
LANGUAGE 'sql'
AS $BODY$
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

$BODY$;
ALTER
PROCEDURE insert_gegenstand
(
text, text, numeric, numeric,text
) OWNER TO dungeonmaster;