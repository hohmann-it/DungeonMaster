\echo ''\echo ''\echo '=========Create gegenstandtyp table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE gegenstandtyp
    (
        gegenstandtyp_id bigint NOT NULL
      , typ              text NOT NULL
    )
;

ALTER TABLE gegenstandtyp OWNER TO dungeonmaster
;

CREATE SEQUENCE gegenstandtyp_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE gegenstandtyp_id OWNER TO dungeonmaster
;

ALTER SEQUENCE gegenstandtyp_id OWNED BY gegenstandtyp.gegenstandtyp_id;
ALTER TABLE ONLY gegenstandtyp ALTER COLUMN gegenstandtyp_id SET DEFAULT nextval('gegenstandtyp_id'::regclass)
;

ALTER TABLE ONLY gegenstandtyp ADD CONSTRAINT gegenstandtyp_pkey PRIMARY KEY (gegenstandtyp_id)
;

CREATE OR REPLACE PROCEDURE insert_gegenstandtyp
(
IN in_typ text
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.gegenstandtyp
    ( typ
    )
    VALUES
    ( in_typ
    )
;

$BODY$;
ALTER
PROCEDURE insert_wirkungsdauertyp
(
text
) OWNER TO dungeonmaster;