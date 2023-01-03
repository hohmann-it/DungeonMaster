\echo ''\echo ''\echo '=========Create wirkungsdauertyp table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE wirkungsdauertyp
    (
        wirkungsdauertyp_id bigint NOT NULL
      , typ                 text NOT NULL
    )
;

ALTER TABLE wirkungsdauertyp OWNER TO dungeonmaster
;

CREATE SEQUENCE wirkungsdauertyp_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE wirkungsdauertyp_id OWNER TO dungeonmaster
;

ALTER SEQUENCE wirkungsdauertyp_id OWNED BY wirkungsdauertyp.wirkungsdauertyp_id;
ALTER TABLE ONLY wirkungsdauertyp ALTER COLUMN wirkungsdauertyp_id SET DEFAULT nextval('wirkungsdauertyp_id'::regclass)
;

ALTER TABLE ONLY wirkungsdauertyp ADD CONSTRAINT wirkungsdauertyp_pkey PRIMARY KEY (wirkungsdauertyp_id)
;

CREATE OR REPLACE PROCEDURE insert_wirkungsdauertyp
(
  IN in_typ       text
) LANGUAGE 'sql'
AS
$BODY$
INSERT INTO dd.wirkungsdauertyp
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