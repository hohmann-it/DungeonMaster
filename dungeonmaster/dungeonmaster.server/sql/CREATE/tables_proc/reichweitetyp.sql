\echo ''\echo ''\echo '=========Create reichweitetyp table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE reichweitetyp
    (
        reichweitetyp_id bigint NOT NULL
      , typ_lang         text NOT NULL
      , typ_kurz         text NOT NULL
    )
;

ALTER TABLE reichweitetyp OWNER TO dungeonmaster
;

CREATE SEQUENCE reichweitetyp_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE reichweitetyp_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE reichweitetyp_id_seq OWNED BY reichweitetyp.reichweitetyp_id;
ALTER TABLE ONLY reichweitetyp ALTER COLUMN reichweitetyp_id SET DEFAULT nextval('reichweitetyp_id_seq'::regclass)
;

ALTER TABLE ONLY reichweitetyp ADD CONSTRAINT reichweitetyp_pkey PRIMARY KEY (reichweitetyp_id)
;

CREATE OR REPLACE PROCEDURE insert_reichweitetyp
(
IN in_typ_lang text,
IN in_typ_kurz text
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.reichweitetyp
    ( typ_lang
      , typ_kurz
    )
    VALUES
    ( in_typ_lang
      , in_typ_kurz
    )
;

$BODY$;
ALTER
PROCEDURE insert_reichweitetyp
(
text, text
) OWNER TO dungeonmaster;