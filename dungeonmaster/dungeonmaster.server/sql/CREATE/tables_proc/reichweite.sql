\echo ''\echo ''\echo '=========Create reichweite table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE reichweite
    (
        reichweite_id bigint NOT NULL
      , typ_lang         text NOT NULL
      , typ_kurz         text NOT NULL
      , beschreibung     text DEFAULT NULL
    )
;

ALTER TABLE reichweite OWNER TO dungeonmaster
;

CREATE SEQUENCE reichweite_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE reichweite_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE reichweite_id_seq OWNED BY reichweite.reichweite_id;
ALTER TABLE ONLY reichweite ALTER COLUMN reichweite_id SET DEFAULT nextval('reichweite_id_seq'::regclass)
;

ALTER TABLE ONLY reichweite ADD CONSTRAINT reichweite_pkey PRIMARY KEY (reichweite_id)
;

CREATE OR REPLACE PROCEDURE insert_reichweite
(
IN in_typ_lang text,
IN in_typ_kurz text,
IN in_beschreibung text DEFAULT NULL
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.reichweite
    ( typ_lang
      , typ_kurz, beschreibung
    )
    VALUES
    ( in_typ_lang
      , in_typ_kurz, in_beschreibung
    )
;

$BODY$;
ALTER
PROCEDURE insert_reichweite
(
text, text, text
) OWNER TO dungeonmaster;