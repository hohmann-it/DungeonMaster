\echo ''\echo ''\echo '=========Create zeitaufwandtyp table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE zeitaufwandtyp
    (
        zeitaufwandtyp_id bigint NOT NULL
      , typ               text NOT NULL
    )
;

ALTER TABLE zeitaufwandtyp OWNER TO dungeonmaster
;

CREATE SEQUENCE zeitaufwandtyp_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zeitaufwandtyp_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE zeitaufwandtyp_id_seq OWNED BY zeitaufwandtyp.zeitaufwandtyp_id;
ALTER TABLE ONLY zeitaufwandtyp ALTER COLUMN zeitaufwandtyp_id SET DEFAULT nextval('zeitaufwandtyp_id_seq'::regclass)
;

ALTER TABLE ONLY zeitaufwandtyp ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id)
;

CREATE OR REPLACE PROCEDURE insert_zeitaufwandtyp
(
  IN in_typ       text
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.zeitaufwandtyp
    ( typ
    )
    VALUES
    ( in_typ
    )
;

$BODY$;
ALTER
PROCEDURE insert_zeitaufwandtyp
(
  text
) OWNER TO dungeonmaster;