\echo ''\echo ''\echo '=========Create zaubermaterial table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE zaubermaterial
    (
        zaubermaterial_id bigint NOT NULL
      , fk_zauber         bigint
      , fk_ersatz         bigint DEFAULT NULL
      , fk_gegenstand     bigint NOT NULL
      , anzahl            decimal NOT NULL
      , wird_verbraucht   boolean NOT NULL DEFAULT FALSE
    )
;

ALTER TABLE zaubermaterial OWNER TO dungeonmaster
;

CREATE SEQUENCE zaubermaterial_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zaubermaterial_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE zaubermaterial_id_seq OWNED BY zaubermaterial.zaubermaterial_id;
ALTER TABLE ONLY zaubermaterial ALTER COLUMN zaubermaterial_id SET DEFAULT nextval('zaubermaterial_id_seq'::regclass)
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT zaubermaterial_pkey PRIMARY KEY (zaubermaterial_id)
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES zauber(zauber_id) NOT VALID
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT fk_ersatz FOREIGN KEY (fk_ersatz) REFERENCES zaubermaterial(zaubermaterial_id) NOT VALID
;

CREATE OR REPLACE PROCEDURE dd.insert_zaubermaterial(
IN in_zauber          text,
IN in_gegenstand      text,
IN in_fk_ersatz_id    numeric DEFAULT null,
IN in_anzahl          numeric DEFAULT 1,
IN in_wird_verbraucht boolean DEFAULT false
) LANGUAGE 'sql'
AS
$BODY$
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

$BODY$;
ALTER
PROCEDURE insert_zaubermaterial
(
text, text,numeric, numeric, boolean
) OWNER TO dungeonmaster;