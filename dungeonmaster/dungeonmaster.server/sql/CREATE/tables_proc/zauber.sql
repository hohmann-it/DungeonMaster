\echo ''\echo ''\echo '=========Create zauber table & procedure========='\echo ''\echo ''
SET SCHEMA 'dd';
CREATE TABLE zauber
    (
        zauber_id            bigint NOT NULL
      , name                 text UNIQUE NOT NULL
      , zeitaufwand          integer NOT NULL
      , fk_zeitaufwand_typ   bigint NOT NULL
      , reichweite           integer NOT NULL
      , fk_reichweite_typ    bigint NOT NULL
      , wirkungsdauer        integer NOT NULL
      , fk_wirkungsdauer_typ bigint NOT NULL
      , beschreibung         text NOT NULL
      , hoehere_grade        text
      , grad                 integer NOT NULL
      , fk_zauber_typ        bigint NOT NULL
      , verbal               boolean NOT NULL
      , gestik               boolean NOT NULL
      , material             boolean NOT NULL
      , ritual               boolean NOT NULL DEFAULT FALSE
     )
;

ALTER TABLE zauber OWNER TO dungeonmaster
;

CREATE SEQUENCE zauber_id_seq
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zauber_id_seq OWNER TO dungeonmaster
;

ALTER SEQUENCE zauber_id_seq OWNED BY zauber.zauber_id;
ALTER TABLE ONLY zauber ALTER COLUMN zauber_id SET DEFAULT nextval('zauber_id_seq'::regclass)
;

ALTER TABLE ONLY zauber ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id)
;

ALTER TABLE ONLY zauber ADD CONSTRAINT fk_zauber_typ FOREIGN KEY (fk_zauber_typ) REFERENCES zaubertyp(zaubertyp_id) NOT VALID
;

ALTER TABLE ONLY zauber ADD CONSTRAINT fk_reichweite_typ FOREIGN KEY (fk_reichweite_typ) REFERENCES reichweitetyp(reichweitetyp_id) NOT VALID
;

ALTER TABLE ONLY zauber ADD CONSTRAINT fk_wirkungsdauer_typ FOREIGN KEY (fk_wirkungsdauer_typ) REFERENCES wirkungsdauertyp(wirkungsdauertyp_id) NOT VALID
;

ALTER TABLE ONLY zauber ADD CONSTRAINT fk_zeitaufwand_typ FOREIGN KEY (fk_zeitaufwand_typ) REFERENCES zeitaufwandtyp(zeitaufwandtyp_id) NOT VALID
;

CREATE OR REPLACE PROCEDURE dd.insert_zauber(
IN in_name               text,
IN in_zeitaufwand        integer,
IN in_zeitaufwandtyp     text,
IN in_reichweite         integer,
IN in_reichweitetyp_kurz text,
IN in_wirkungsdauer      integer,
IN in_wirkungsdauertyp   text,
IN in_beschreibung       text,
IN in_hoehere_grade      text,
IN in_zaubertyp          text,
IN in_verbal             boolean,
IN in_gestik             boolean,
IN in_material           boolean,
IN in_grad               integer,
IN in_ritual             boolean DEFAULT FALSE)
LANGUAGE 'sql'
AS $BODY$
INSERT INTO dd.zauber
    ( name
      , zeitaufwand
      , fk_zeitaufwand_typ
      , reichweite
      , fk_reichweite_typ
      , wirkungsdauer
      , fk_wirkungsdauer_typ
      , beschreibung
      , hoehere_grade
      , grad
      , fk_zauber_typ
      , verbal
      , gestik
      , material
      , ritual
    )
SELECT
    in_name
  , in_zeitaufwand
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            dd.zeitaufwandtyp
        WHERE
            typ = in_zeitaufwandtyp
    )
  , in_reichweite
  , (
        SELECT
            reichweitetyp_id
        FROM
            dd.reichweitetyp
        WHERE
            typ_kurz = in_reichweitetyp_kurz
    )
  , in_wirkungsdauer
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            dd.wirkungsdauertyp
        WHERE
            typ = in_wirkungsdauertyp
    )
  , in_beschreibung
  , in_hoehere_grade
  , in_grad
  , (
        SELECT
            zaubertyp_id
        FROM
            dd.zaubertyp
        WHERE
            typ = in_zaubertyp
    )
  , in_verbal
  , in_gestik
  , in_material
  , in_ritual
;

$BODY$;
ALTER PROCEDURE dd.insert_zauber(text, integer, text, integer, text, integer, text, text, text, text, boolean, boolean, boolean, integer, boolean)
OWNER TO dungeonmaster;