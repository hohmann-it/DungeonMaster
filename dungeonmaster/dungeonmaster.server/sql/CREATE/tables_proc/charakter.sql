\echo ''\echo ''\echo '=========Create character table & procedure========='\echo ''\echo ''
SET SCHEMA 'od';
CREATE TABLE charaktere
    (
        charakter_id BIGINT NOT NULL
      , klasse       TEXT
      , name         TEXT NOT NULL
    )
;

ALTER TABLE charaktere OWNER TO dungeonmaster
;

CREATE SEQUENCE charakter_id_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE charakter_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE charakter_id_seq OWNED BY charaktere.charakter_id;
ALTER TABLE ONLY charaktere ALTER COLUMN charakter_id SET DEFAULT nextval('charakter_id_seq'::regclass)
;

ALTER TABLE ONLY charaktere ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id)
;

CREATE OR REPLACE PROCEDURE insert_charakter
(
  IN in_klasse text
, IN in_name   text
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO od.charaktere
    ( klasse
      , name
    )
    VALUES
    ( in_klasse
      , in_name
    )
;

$BODY$;
ALTER
PROCEDURE insert_charakter
(
  text
, text
) OWNER TO dungeonmaster;