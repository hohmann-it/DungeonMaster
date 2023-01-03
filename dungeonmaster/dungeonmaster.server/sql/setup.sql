CALL dd.insert_zauber('Test',1,'Aktion',18,'m',0,'Unmittelbar',
NULL,
NULL,
'Hervorrufung', TRUE
, TRUE
, TRUE, 3 );
CALL dd.insert_zauber('Magierhand',1,'Aktion',9,'m',1,'Minuten',
'Eine gespenstische, schwebende Hand erscheint an einem Punkt deiner Wahl in Reichweite. Die Hand bleibt für die Wirkungs- dauer bestehen oder bis du sie mit einer Aktion wegschickst. Die Hand verschwindet, wenn sie sich weiter als 9 Meter von dir ent- fernt oder du den Zauber noch einmal wirkst. Du kannst eine Aktion verwenden, um die Hand zu kontrollieren. Du kannst die Hand verwenden, um Gegenstände zu manipulieren, verschlossene Türen oder Behälter zu öffnen, einen Gegenstand aus einem geöffneten Behälter zu holen oder ihn zu verstauen, oder den Inhalt einer Phiole auszugießen. Du kannst die Hand immer wenn du sie verwendest bis zu 9 Meter weit bewegen. Die Hand kann nicht angreifen, keine magischen Gegenstände aktivieren oder mehr als 10 Pfund tragen.',
NULL,
'Beschwörung', TRUE
, TRUE
, FALSE, 0 );

  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Beschwörung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Magierrüstung'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 8
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Du berührst eine bereitwillige Kreatur, die keine Rüstung trägt. Eine schützende magische Energie umgibt sie bis der Zauber endet. Die Basis-Rüstungsklasse des Ziels entspricht 13 + Geschicklichkeitsmodifikator. Der Zauber endet, wenn das Ziel Rüstung anlegt oder du den Zauber mit einer Aktion aufhebst.'
  , NULL
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Magisches Geschoss'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 36
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Du erschaffst drei leuchtende Pfeile aus magischer Energie. Jeder Pfeil trifft eine Kreatur deiner Wahl in Reichweite, die du sehen kannst. Ein Pfeil fügt dem Ziel 1W4 +1 Energieschaden zu. Die Pfeile schlagen alle gleichzeitig ein, und du kannst sie auf eine oder mehrere Kreaturen aufteilen.'
  , 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann erschafft der Zauber für jeden Zauberplatz-Grad über dem ersten einen weiteren Pfeil.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Massen-Heilendes Wort'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Bonusaktion'
    )
  , 18
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Wenn du Worte der Wiederherstellung rufst, erhalten bis zu sechs Kreaturen deiner Wahl, die du sehen kannst und die sich in Reichweite befinden, 1W4 + deinen Zaubermodifikator Treffer- punkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem dritten um 1W4.'
  , 3
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , FALSE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Nebelschritt'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Bonusaktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Du wirst kurz von einem silbrigen Nebel umgeben und telepor- tierst dich bis zu 9 Meter in einen nicht besetzten Bereich, den du sehen kannst.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Beschwörung'
    )
  , TRUE
  , FALSE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Person bezaubern'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 9
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Du versuchst einen Humanoiden in Reichweite, den du sehen kannst, zu bezaubern. Das Ziel muss einen Weisheitsrettungswurf ablegen, was es mit Vorteil tut, wenn du oder deine Gefährten gegen es kämpfen. Wenn es den Rettungswurf nicht schafft, wird es von dir bezaubert bis der Zauber endet, oder du oder einer deiner Gefährten etwas tut, um ihm zu schaden. Die bezauberte Kreatur betrachtet dich als freundschaftliche Bekanntschaft. Wenn der Zauber endet, weiß die Kreatur, dass sie von dir bezau- bert worden ist.'
  , 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter von- einander entfernt sein, wenn du den Zauber auf sie wirkst.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verzauberung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Person festhalten'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 18
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Wähle einen Humanoiden in Reichweite, den du sehen kannst. Das Ziel muss einen Weisheitsrettungswurf ablegen, um nicht für die Wirkungsdauer gelähmt zu werden. Zu Beginn eines jeden seiner Züge, kann das Ziel einen weiteren Weisheitsrettungswurf ablegen. Bei einem Erfolg endet der Zauber für das Ziel.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem zweiten auf eine zusätzliche humanoide Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter voneinander entfernt sein, wenn du den Zauber auf sie wirkst.'
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verzauberung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Resistenz'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Du berührst eine bereitwillige Kreatur. Einmal, ehe der Zauber endet, kann das Ziel einen W4 würfeln und das Ergebnis auf einen Rettungswurf seiner Wahl addieren. Es kann den Würfel vor oder nach dem Rettungswurf werfen. Dann endet der Zauber.'
  , NULL
  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schild'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Reaktionen'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Runden'
    )
  , 'Eine unsichtbare Barriere aus magischer Energie erscheint und schützt dich. Bis zum Beginn deines nächsten Zugs hast du einen Bonus von +5 auf deine Rüstungsklasse, auch gegen den auslö- senden Angriff, und erleidest keinen Schaden durch den Zauber Magisches Geschoss.'
  , NULL
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Schild des Glaubens'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Bonusaktion'
    )
  , 18
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 10
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Ein schimmerndes Feld erscheint und umhüllt eine Kreatur dei- ner Wahl in Reichweite. Es gewährt ihr für die Wirkungsdauer einen Bonus von +2 auf RK.'
  , NULL
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schlaf'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 27
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten'
    )
  , 'Dieser Zauber versetzt Kreaturen in magischen Schlaf. Wirf 5W8, das Ergebnis ist die Gesamtzahl von Trefferpunkten an Kreatu- ren, die dieser Zauber beeinflussen kann. Kreaturen innerhalb von 6 Metern um einen Punkt deiner Wahl in Reichweite werden betroffen, in aufsteigender Reihenfolge nach ihren aktuellen Tref- ferpunkten (bewusstlose Kreaturen werden ignoriert). Beginnend mit der Kreatur mit den niedrigsten aktuellen Trefferpunkten werden alle Kreaturen, die von diesem Zauber betroffen werden, bewusstlos bis der Zauber endet, der Schla- fende Schaden erleidet oder jemand eine Aktion verwendet, um den Schlafenden zu schütteln oder zu ohrfeigen. Ziehe die Trefferpunkte der Kreatur von der Gesamtsumme ab, ehe du mit der nächsten Kreatur mit den niedrigsten Trefferpunkten wei- termachst. Die Trefferpunkte einer Kreatur müssen gleich oder niedriger als die verbleibenden Gesamttrefferpunkte sein, damit sie betroffen wird. Untote und Kreaturen, die nicht bezaubert werden können, sind von diesem Zauber nicht betroffen.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann würfelst du zusätzliche 2W8 für jeden Zauberplatz-Grad über dem ersten.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verzauberung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schockgriff'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Blitze springen aus deinen Händen und verpassen einer Kreatur, die du zu berühren versuchst, einen Schock. Führe einen Nah- kampf-Zauberangriff gegen das Ziel durch. Du hast einen Vorteil beim Angriffswurf, wenn das Ziel Rüstung trägt, die aus Metall besteht. Bei einem Treffer erleidet die Kreatur 1W8 Blitzschaden und kann bis zum Beginn deines nächsten Zuges keine Reaktionen durchführen. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.'
  , NULL
  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schützendes Band'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Dieser Zauber schützt eine bereitwillige Kreatur, die du berührst und erschafft eine magische Verbindung zwischen dir und dem Ziel bis der Zauber endet. Solange sich das Ziel innerhalb von 18 Metern um dich befindet, erhält es einen Bonus von +1 auf RK und Rettungswürfe und hat Resistenz gegen alle Schadensarten. Außerdem erleidest du jedes Mal, wenn das Ziel Schaden erleidet die gleiche Menge an Schaden. Der Zauber endet, wenn du auf 0 Trefferpunkte fällst oder wenn du und das Ziel weiter als 18 Meter auseinander sind. Er endet auch, wenn der Zauber erneut auf einen der beiden Beteiligten gewirkt wird. Du kannst den Zauber als Aktion aufheben.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schutzgeister'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst (Radius)'
    )
  , 10
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Du rufst Geister, die dich beschützen. Sie huschen für die Wir- kungsdauer in einer Entfernung von 4,5 Metern um dich herum. Wenn du guter oder neutraler Gesinnung bist, erscheint ihre gespenstische Form engelsgleisch oder feenartig (deine Wahl). Wenn du böser Gesinnung bist, erscheinen sie unholder Natur. Wenn du diesen Zauber wirkst, kannst du eine beliebige Anzahl von Kreaturen, die du sehen kannst, festlegen, die nicht von dem Zauber betroffen sind. Die Bewegungsrate von Kreaturen ist im Bereich des Zaubers halbiert, und wenn die Kreatur das erste Mal in einem Zug den Bereich betritt oder ihren Zug dort beginnt, muss sie einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet die Kreatur 3W8 Gleißenden Schaden (wenn du guter oder neutraler Gesinnung bist) oder 3W8 Nekrotischen Schaden (wenn du böser Gesinnung bist). Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W8.'
  , 3
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Beschwörung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Schutz vor Energie'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Du rufst Geister, die dich beschützen. Sie huschen für die Wir- kungsdauer in einer Entfernung von 4,5 Metern um dich herum. Wenn du guter oder neutraler Gesinnung bist, erscheint ihre gespenstische Form engelsgleisch oder feenartig (deine Wahl). Wenn du böser Gesinnung bist, erscheinen sie unholder Natur. Wenn du diesen Zauber wirkst, kannst du eine beliebige Anzahl von Kreaturen, die du sehen kannst, festlegen, die nicht von dem Zauber betroffen sind. Die Bewegungsrate von Kreaturen ist im Bereich des Zaubers halbiert, und wenn die Kreatur das erste Mal in einem Zug den Bereich betritt oder ihren Zug dort beginnt, muss sie einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet die Kreatur 3W8 Gleißenden Schaden (wenn du guter oder neutraler Gesinnung bist) oder 3W8 Nekrotischen Schaden (wenn du böser Gesinnung bist). Bei einem erfolgreichen Rettungswurf erleidet die Kreatur den halben Schaden.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W8.'
  , 3
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Schwache Genesung'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Du berührst eine Kreatur und kannst entweder eine Krankheit beenden, an der sie leidet, oder einen Zustand, den sie erlitten hat. Dieser Zustand kann blind, gelähmt, taub oder vergiftet sein.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Bannzauber'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Segnen'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 9
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Du segnest bis zu drei Kreaturen deiner Wahl in Reichweite. Immer wenn ein Ziel einen Angriffs- oder Rettungswurf macht, bis der Zauber endet, kann es einen W4 werfen und das Ergebnis auf den Angriffswurf oder Rettungswurf addieren.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verzauberung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Spinnenklettern'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden, Konzentration'
    )
  , 'Bis der Zauber endet, erhält eine bereitwillige Kreatur, die du berührst, die Fähigkeit sich an senkrechten Oberflächen nach oben, unten oder zur Seite zu bewegen, sowie kopfüber von der Decke zu hängen, während sie die Hände frei behält. Das Ziel erhält außerdem eine Klettern-Bewegungsrate gleich ihrer nor- malen Bewegungsrate.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verwandlung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Spinnennetz'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 18
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden, Konzentration'
    )
  , 'Du beschwörst eine Masse aus dichten, klebrigen Netzen an einem Punkt in Reichweite deiner Wahl. Die Netze füllen für die Wirkungsdauer einen Würfel mit 6 Metern Kantenlänge. Die Netze sind schwieriges Gelände und ein leicht verschleiertes Gebiet. Wenn die Netze nicht zwischen zwei festen Gegenständen (wie Mauern oder Bäumen) verankert oder über einen Fußboden, eine Mauer oder die Decke gespannt sind, dann fällt das beschworene Netz in sich selbst zusammen, und der Zauber endet zu Beginn deines nächsten Zuges. Netze, die über eine flache Oberfläche ausgebreitet sind, haben eine Tiefe von 1,5 Metern. Alle Krea- turen, die ihren Zug in den Netzen beginnen oder sie während ihres Zuges betreten, müssen einen Geschicklichkeitsrettungs- wurf ablegen. Bei einem misslungenen Rettungswurf ist die Kreatur festgesetzt, solange sie sich in den Netzen aufhält. Eine Kreatur, die von den Netzen festgesetzt ist, kann einen Stärke- wurf gegen deinen Zauberrettungswurf-SG ablegen. Wenn sie erfolgreich ist, ist sie nicht mehr festgesetzt. Die Netze sind brennbar. Jeder Würfel von Netzen mit 1,5 Metern Kantenlänge, der mit Feuer in Kontakt kommt, verbrennt innerhalb von 1 Runde, was allen Kreaturen, die ihren Zug im Feuer beginnen, 2W4 Feuerschaden zufügt.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Beschwörung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Sprachen verstehen'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Für die Wirkungsdauer verstehst du die wörtliche Bedeutung jeglicher gesprochener Sprache, die du hörst. Du kannst auch jede geschriebene Sprache lesen, die du sehen kannst, doch musst du die Oberfläche berühren, auf der die Worte geschrieben sind. Es dauert ungefähr eine Minute, eine Seite Text zu lesen. Der Zauber hilft nicht bei der Entschlüsselung von Geheim- botschaften in einem Text oder Glyphen, wie arkane Sigillen, die nicht Teil einer geschriebenen Sprache sind.'
  , NULL
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Erkenntniszauberei'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Stille'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 36
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 10
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Für die Wirkungsdauer kann kein Geräusch in einer Sphäre mit 6 Metern Radius entstehen oder sie durchdringen. Die Sphäre ist um einen Punkt in Reichweite zentriert, den du auswählst. Jede Kreatur und jeder Gegenstand, der sich vollständig in der Sphäre aufhält, ist immun gegen Schallschaden, und Kreaturen sind Taub, solange sie sich in ihrem Inneren befinden. Einen Zauber zu wirken, der eine verbale Komponente hat, ist in der Sphäre nicht möglich.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Illusion'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Tanzende Lichter'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 36
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Du erschaffst bis zu vier fackelgroße Lichter in Reichweite, die du wie Fackeln, Laternen oder leuchtende Kugeln erscheinen lassen kannst und die für die Wirkungsdauer in der Luft schweben. Du kannst die vier Lichter auch in einer leuchtenden, vage humanoi- den Mittelgroßen Gestalt vereinen. Welche Gestalt du auch wählst, jedes Licht strahlt dämmriges Licht in einem Radius von 3 Metern aus. Als Bonusaktion kannst du die Lichter in deinem Zug bis zu 18 Meter an einen neuen Punkt innerhalb der Reichweite bewe- gen. Ein Licht darf sich nicht weiter als 6 Meter von einem anderen Licht entfernen, das mit diesem Zauber erschaffen wurde, und es verschwindet wenn es die Reichweite des Zaubers verlässt.'
  , NULL
  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Taschenspielerei'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 3
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden'
    )
  , 'Dieser Zauber ist ein kleinerer magischer Trick, den Zauberlehrlinge zum Üben verwenden. Du kannst einen der folgenden magischen Effekte in Reichweite erschaffen: 1. Du erschaffst einen sofortigen, harmlosen sensorischen Effekt, wie einen Funkenregen, einen Windhauch, schwache Musik oder einen eigenartigen Geruch. 2. Du kannst augenblicklich eine Kerze, eine Fackel oder ein klei- nes Lagerfeuer entzünden oder löschen. 3. Du kannst einen Gegenstand, der nicht größer ist als ein Würfel mit 30 Zentimeter Kantenlänge, sofort reinigen oder beschmutzen. 4. Du kannst bis zu einen Würfel mit 30 Zentimeter Kantenlänge an Nahrung oder nicht lebender Materie für eine Stunde abkühlen, aufwärmen oder würzen. 5. Du lässt für eine Stunde eine Farbe, ein kleines Mal oder ein Symbol auf einem Gegenstand oder einer Oberfläche erscheinen. 6. Du erschaffst einen nichtmagischen kleinen Gegenstand oder ein Trugbild, das in deine Hand passt und bis zum Ende deines nächsten Zugs anhält. Wenn du diesen Zauber mehrmals wirkst, kannst du bis zu drei der nicht sofortigen Effekte gleichzeitig aktiviert haben, und du kannst solche Effekte als Aktion aufheben.'
  , NULL
  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verwandlung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Thaumaturgie'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 9
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten'
    )
  , 'Du manifestierst ein kleines Wunder, ein Zeichen übernatür- licher Macht, in Reichweite. Du kannst einen der folgenden magischen Effekte in Reichweite erschaffen: 1. Deine Stimme dröhnt für 1 Minute dreimal so laut wie normal. 2. Du lässt Flammen flackern, heller oder dunkler werden oder die Farbe wechseln. All dies hält 1 Minute an. 3. Du erzeugst für 1 Minute harmlose Erschütterungen im Boden. 4. Du erschaffst ein kurzes Geräusch, das von einem Punkt deiner Wahl in Reichweite ertönt, wie das Grollen von Donner, den Ruf eines Raben oder ein unheilvolles Flüstern. 5. Du lässt eine nicht verriegelte Tür oder ein Fenster auffliegen oder zuschlagen. 6. Du änderst für 1 Minute das Aussehen deiner Augen. Wenn du diesen Zauber mehrmals wirkst, kannst du bis zu drei der nicht sofortigen Effekte gleichzeitig aktiviert haben, und du kannst solche Effekte als Aktion aufheben.'
  , NULL
  , 0
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Verwandlung'
    )
  , TRUE
  , FALSE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Unsichtbarkeit'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Stunden, Konzentration'
    )
  , 'Eine Kreatur, die du berührst, wird unsichtbar bis der Zauber endet. Alles, was das Ziel trägt oder in der Hand hält wird unsichtbar, solange es sich am Körper des Ziels befindet. Der Zauber endet für ein Ziel, das angreift oder einen Zauber wirkt.'
  , 'Wenn du diesen Zauber mit einem Zau- berplatz des 3. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem zweiten auf eine zusätzliche Kreatur wirken.'
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Illusion'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Verschwimmen'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten, Konzentration'
    )
  , 'Dein Körper wird verschwommen, wechselhaft und wabernd für alle, die dich sehen können. Für die Wirkungsdauer haben alle Kreaturen Nachteil bei Angriffswürfen gegen dich. Ein Angreifer ist immun gegen diesen Effekt, wenn er sich nicht auf seine Sicht verlässt wie bei Blindsicht, oder er durch Illusionen blicken kann wie bei Wahrer Blick.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Illusion'
    )
  , TRUE
  , FALSE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Vorahnung'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Minuten'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Selbst'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Indem du Stöckchen mit Juwelenintarsien wirfst, mit Dra- chenwürfeln würfelst, reich verzierte Karten auslegst oder ein anderes Weissagungswerkzeug verwendest, erhältst du ein Omen von einer außerweltlichen Wesenheit über die Folgen einer bestimmten Handlungsweise, die du für die nächsten 30 Minuten planst. Der SL wählt eines der folgenden möglichen Omen: 1. Wohl, für gute Folgen. 2. Weh, für schlechte Folgen. 3. Wohl und Weh, für sowohl gute als auch schlechte Folgen. 4. Nichts, bei Folgen, die weder besonders gut noch schlecht sind. Der Zauber nimmt keine Rücksicht auf mögliche Umstände, die das Ergebnis verändern könnten, wie das Wirken zusätzlicher Zauber oder den Verlust eines Gefährten. Wenn du den Zauber zweimal oder öfter wirkst, ehe du deine nächste Lange Rast abschließt, besteht eine kumulative Chance von 25 Prozent für jeden Zauber nach dem ersten, dass du ein zufälliges Ergebnis bekommst. Der SL macht diesen Wurf verdeckt.'
  , NULL
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Erkenntniszauberei'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Waffe des Glaubens'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Bonusaktion'
    )
  , 18
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'm'
    )
  , 1
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Minuten'
    )
  , 'Du erschaffst eine schwebende, gespenstische Waffe in Reich- weite, die für die Wirkungsdauer anhält oder bis du den Zauber erneut wirkst. Wenn du den Zauber wirkst, kannst du einen Nahkampfangriff gegen eine Kreatur innerhalb von 1,5 Metern zur Waffe durchführen. Bei einem Treffer erleidet das Ziel 1W8 + deinen Zaubermodifikator als Energieschaden. Als Bonusaktion in deinem Zug kannst du die Waffe bis zu 4 Meter weit bewegen und den Angriff gegen eine Kreatur inner- halb von 1,5 Metern um sie wiederholen. Diese Waffe kann jede Form annehmen, die du willst. Kleriker von Gottheiten, die mit einer bestimmten Waffe assoziiert sind (wie St. Cuthbert, der für seinen Streitkolben bekannt ist, und Thor für seinen Hammer) lassen den Effekt des Zaubers wie diese Waffe aussehen.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem zweiten um 1W8.'
  , 2
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Wiederbeleben'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Du berührst eine Kreatur, die innerhalb der letzten Minute gestorben ist. Die Kreatur kehrt mit 1 Trefferpunkt zum Leben zurück. Dieser Zauber kann keine Kreaturen zum Leben erwecken, die an Altersschwäche gestorben sind oder denen Kör- perteile fehlen.'
  , NULL
  , 3
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Nekromantie'
    )
  , TRUE
  , TRUE
  , TRUE
;

INSERT INTO zauber
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
    )
SELECT
    'Wunden heilen'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Eine Kreatur, die du berührst, erhält eine Anzahl von Treffer- punkten gleich 1W8 + deinem Zaubermodifikator zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.'
  , 'Wenn du diesen Zauber mit einem Zau- berplatz des 2. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem ersten um 1W8.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Hervorrufung'
    )
  , TRUE
  , TRUE
  , FALSE
;

INSERT INTO zauber
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
    )
SELECT
    'Wunden verursachen'
  , 1
  , (
        SELECT
            zeitaufwandtyp_id
        FROM
            zeitaufwandtyp
        WHERE
            typ = 'Aktion'
    )
  , 0
  , (
        SELECT
            reichweitetyp_id
        FROM
            reichweitetyp
        WHERE
            typ_kurz = 'Berührung'
    )
  , 0
  , (
        SELECT
            wirkungsdauertyp_id
        FROM
            wirkungsdauertyp
        WHERE
            typ = 'Unmittelbar'
    )
  , 'Mache einen Nahkampfangriff gegen eine Kreatur innerhalb deiner Reichweite. Bei einem Treffer erleidet das Ziel 3W10 Nek- rotischen Schaden.'
  , 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W10.'
  , 1
  , (
        SELECT
            zaubertyp_id
        FROM
            zaubertyp
        WHERE
            typ = 'Nekromantie'
    )
  , TRUE
  , TRUE
  , FALSE
;

-- Create zauberkomponente Table
\echo '=========Create table zauberkomponente=========';
\echo '...';
CREATE TABLE zauberkomponente
    (
        zauberkomponente_id     bigint NOT NULL
      , fk_zauber               bigint NOT NULL
      , fk_zauberkomponente_typ bigint NOT NULL
    )
;

ALTER TABLE zauberkomponente OWNER TO dungeonmaster
;

CREATE SEQUENCE zauberkomponente_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zauberkomponente_id OWNER TO dungeonmaster
;

ALTER SEQUENCE zauberkomponente_id OWNED BY zauberkomponente.zauberkomponente_id;
ALTER TABLE ONLY zauberkomponente ALTER COLUMN zauberkomponente_id SET DEFAULT nextval('zauberkomponente_id'::regclass)
;

ALTER TABLE ONLY zauberkomponente ADD CONSTRAINT zauberkomponente_pkey PRIMARY KEY (zauberkomponente_id)
;

ALTER TABLE ONLY zauberkomponente ADD CONSTRAINT fk_zauberkomponente_typ FOREIGN KEY (fk_zauberkomponente_typ) REFERENCES zauberkomponentetyp(zauberkomponentetyp_id) NOT VALID
;

ALTER TABLE ONLY zauberkomponente ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES zauber(zauber_id) NOT VALID
;

\echo '=========Insert into table zauberkomponente=========';
\echo '...';
INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Befehl'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Beistand'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Beistand'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Beistand'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Blitz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Blitz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Blitz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Brennende Hände'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Brennende Hände'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Donnerwoge'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Donnerwoge'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Dunkelheit'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Dunkelheit'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Einflüsterung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Einflüsterung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Feenfeuer'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Feuerball'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Feuerball'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Feuerball'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Flammenkugel'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Flammenkugel'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Flammenkugel'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Fliegen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Fliegen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Fliegen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Gebet der Heilung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Göttliche Führung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Göttliche Führung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heilendes Wort'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heilige Flamme'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heilige Flamme'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heiligtum'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heiligtum'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Heiligtum'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Identifizieren'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Identifizieren'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Identifizieren'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Kältestrahl'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Kältestrahl'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Lenkendes Geschoss'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Lenkendes Geschoss'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Leuchtfeuer der Hoffnung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Leuchtfeuer der Hoffnung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Licht'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Licht'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magie bannen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magie bannen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magie entdecken'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magie entdecken'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magierhand'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magierhand'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magierrüstung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magierrüstung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magierrüstung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magisches Geschoss'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Magisches Geschoss'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Massen-Heilendes Wort'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Nebelschritt'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Person bezaubern'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Person bezaubern'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Person festhalten'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Person festhalten'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Person festhalten'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Resistenz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Resistenz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Resistenz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schild'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schild'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schild des Glaubens'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schild des Glaubens'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schild des Glaubens'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schlaf'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schlaf'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schlaf'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schockgriff'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schockgriff'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schützendes Band'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schützendes Band'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schützendes Band'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schutzgeister'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schutzgeister'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schutzgeister'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schutz vor Energie'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schutz vor Energie'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schwache Genesung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Schwache Genesung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Segnen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Segnen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Segnen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnenklettern'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnenklettern'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnenklettern'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnennetz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnennetz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Spinnennetz'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Sprachen verstehen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Sprachen verstehen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Sprachen verstehen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Stille'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Sprachen verstehen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Tanzende Lichter'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Tanzende Lichter'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Tanzende Lichter'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Taschenspielerei'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Taschenspielerei'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Thaumaturgie'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Unsichtbarkeit'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Unsichtbarkeit'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Unsichtbarkeit'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Verschwimmen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Vorahnung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Vorahnung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Vorahnung'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Waffe des Glaubens'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Waffe des Glaubens'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wiederbeleben'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wiederbeleben'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wiederbeleben'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'M'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wunden heilen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wunden heilen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wunden verursachen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'V'
    )
    )
;

INSERT INTO zauberkomponente
    ( fk_zauber
      , fk_zauberkomponente_typ
    )
    VALUES
    (
    (
        SELECT
            zauber_id
        FROM
            zauber
        WHERE
            name = 'Wunden verursachen'
    )
  , (
        SELECT
            zauberkomponentetyp_id
        FROM
            zauberkomponentetyp
        WHERE
            typ_kurz = 'G'
    )
    )
;

-- Create Material Table
\echo '=========Create table material=========';
\echo '...';
CREATE TABLE material
    (
        material_id bigint NOT NULL
      , name        text NOT NULL
    )
;

ALTER TABLE material OWNER TO dungeonmaster
;

CREATE SEQUENCE material_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE material_id OWNER TO dungeonmaster
;

ALTER SEQUENCE material_id OWNED BY material.material_id;
ALTER TABLE ONLY material ALTER COLUMN material_id SET DEFAULT nextval('material_id'::regclass)
;

ALTER TABLE ONLY material ADD CONSTRAINT material_pkey PRIMARY KEY (material_id)
;

\echo '=========Insert into table material=========';
\echo '...';
INSERT INTO material
    ( name
    )
    VALUES
    ( 'winziger weißer Stoffstreifen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Stück Fell'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Stab aus Bernstein'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Kristall'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Glas'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Fledermausfell'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Tropfen Pech'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Stück Kohle'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Schlangenzunge'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Honigwabe'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Tropfen süßes Öl'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'winzige Kugel aus Fledermauskot'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Schwefel'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Talg'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Eisenpulver'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Schwungfeder eines beliebigen Vogels'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'kleiner Silberspiegel'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Perle im Wert von mindestens 100 GM'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Eulenfeder'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Glühwürmchen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Leuchtmoos'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Stück gehärtetes Leder'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'kleines, gerades Stück Eisen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Miniaturumhang'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'kleines Pergament mit heiligem Text'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Prise Sand'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Rosenblüten'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Grille'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Paar Platinringe im Wert von jeweils 50 GM'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'heiliges Symbol'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Tropfen Weihwasser'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Tropfen Bitumen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Spinne'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Spinnweben'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Prise Ruß'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Salz'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Stück Phosphor'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Bergulmenholz'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Wimper, die von Gummiarabikum umschlossen ist'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'speziell gekennzeichnetes Stöckchen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Knochen'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Symbole im Wert von 25 GM'
    )
;

INSERT INTO material
    ( name
    )
    VALUES
    ( 'Diamanten im Wert von mindestens 300 GM'
    )
;

-- Create Zaubermaterial Table
\echo '=========Create table zaubermaterial=========';
;
\echo '...';
;
CREATE TABLE zaubermaterial
    (
        zaubermaterial_id bigint NOT NULL
      , fk_zauber         bigint NOT NULL
      , fk_ersatz         bigint
      , fk_material       bigint NOT NULL
      , anzahl            int NOT NULL
      , ersatz            boolean NOT NULL
    )
;

ALTER TABLE zaubermaterial OWNER TO dungeonmaster
;

CREATE SEQUENCE zaubermaterial_id
START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE zaubermaterial_id OWNER TO dungeonmaster
;

ALTER SEQUENCE zaubermaterial_id OWNED BY zaubermaterial.zaubermaterial_id;
ALTER TABLE ONLY zaubermaterial ALTER COLUMN zaubermaterial_id SET DEFAULT nextval('zaubermaterial_id'::regclass)
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT zaubermaterial_pkey PRIMARY KEY (zaubermaterial_id)
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES zauber(zauber_id) NOT VALID
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT fk_material FOREIGN KEY (fk_material) REFERENCES material(material_id) NOT VALID
;

ALTER TABLE ONLY zaubermaterial ADD CONSTRAINT fk_ersatz FOREIGN KEY (fk_ersatz) REFERENCES zaubermaterial(zaubermaterial_id) NOT VALID
;

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

