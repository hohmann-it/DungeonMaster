\echo '=========Insert into table zaubermaterial=========';
\echo '...';
INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name LIKE ('Beistand')
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Stoffstreifen%'
    )
  , 1
  , FALSE
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name LIKE ('Dunkelheit')
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Fledermausfell%'
    )
  , 1
  , FALSE
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name LIKE ('Dunkelheit')
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Stück Kohle%'
    )
  , 1
  , TRUE
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name LIKE ('Dunkelheit')
    )
  , (
        SELECT
            zaubermaterial_id
        FROM
            zaubermaterial
        WHERE
            ersatz
            AND fk_zauber =
            (
                SELECT
                    zauber_id
                FROM
                    zauber
                WHERE
                    name LIKE ('Dunkelheit')
            )
            AND fk_material =
            (
                SELECT
                    material_id
                FROM
                    material
                WHERE
                    name LIKE '%Stück Kohle%'
            )
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Tropfen Pech%'
    )
  , 1
  , FALSE
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Dunkelheit')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Schlangenzunge%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Einflüsterung')
            and zkt.typ_kurz ='M'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Honigwabe%'
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Tropfen süßes Öl%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Feuerball')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%winzige Kugel aus Fledermauskot%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Flammenkugel')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Talg%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Flammenkugel')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Schwefel%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Flammenkugel')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Eisenpulver%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Fliegen')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Schwungfeder%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Heiligtum')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%kleiner Silberspiegel%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Identifizieren')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Perle im Wert von mindestens 100 GM%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Identifizieren')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Eulenfeder%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Licht')
            and zkt.typ_kurz ='M'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Leuchtmoos%'
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Glühwürmchen%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Magierrüstung')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%gehärtetes Leder%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Person festhalten')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%kleines, gerades Stück Eisen%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Resistenz')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Miniaturumhang%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Schild des Glaubens')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%kleines Pergament mit heiligem Text%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Schlaf')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Prise Sand%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Schlaf')
            and zkt.typ_kurz ='M'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Grille%'
    )
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Rosenblüten%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Schützendes Band')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Paar Platinringe im Wert von jeweils 50 GM%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Schutzgeister')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%heiliges Symbol%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Segnen')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Tropfen Weihwasser%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Spinnenklettern')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Tropfen Bitumen%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Spinnenklettern')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Spinne%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Spinnennetz')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Spinnweben%'
    )
  , 3
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Sprachen verstehen')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Prise Ruß%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Sprachen verstehen')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Salz%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Tanzende Lichter')
            and zkt.typ_kurz ='M'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Glühwürmchen%'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Bergulmenholz%'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Phosphor%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Unsichtbarkeit')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Wimper, die von Gummiarabikum umschlossen ist%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Vorahnung')
            and zkt.typ_kurz ='M'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Knochen%'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Symbole im Wert von 25 GM%'
    )
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%speziell gekennzeichnetes Stöckchen%'
    )
  , 1
    )
;

INSERT INTO zaubermaterial
    ( fk_zauber
      , fk_ersatz
      , fk_material
      , anzahl
      , ersatz
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name          LIKE ('Wiederbeleben')
            and zkt.typ_kurz ='M'
    )
  , NULL
  , NULL
  , (
        SELECT
            material_id
        FROM
            material
        WHERE
            name LIKE '%Diamanten im Wert von mindestens 300 GM%'
    )
  , 1
    )
;