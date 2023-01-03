\echo ''\echo ''\echo '=========Populating od.charakter========='\echo ''\echo ''
CALL od.insert_charakter('Krieger', 'Roland');
CALL od.insert_charakter('Magier', 'Jens');
CALL od.insert_charakter('Barde', 'Rittersporn');
CALL od.insert_charakter('Namenloser Held', 'Namenlos');
\echo ''\echo ''\echo '=========Populating dd.zaubertyp========='\echo ''\echo ''
CALL dd.insert_zaubertyp('Verzauberung');
CALL dd.insert_zaubertyp('Bannzauber');
CALL dd.insert_zaubertyp('Hervorrufung');
CALL dd.insert_zaubertyp('Beschwörung');
CALL dd.insert_zaubertyp('Verwandlung');
CALL dd.insert_zaubertyp('Erkenntniszauberei');
CALL dd.insert_zaubertyp('Illusion');
CALL dd.insert_zaubertyp('Nekromantie');
\echo ''\echo ''\echo '=========Populating dd.zeitaufwandtyp========='\echo ''\echo ''
CALL dd.insert_zeitaufwandtyp('Aktion');
CALL dd.insert_zeitaufwandtyp('Bonusaktion');
CALL dd.insert_zeitaufwandtyp('Minuten');
CALL dd.insert_zeitaufwandtyp('Reaktionen');
\echo ''\echo ''\echo '=========Populating dd.reichweitetyp========='\echo ''\echo ''
CALL dd.insert_reichweitetyp('Meter', 'm');
CALL dd.insert_reichweitetyp('Selbst', 'Selbst');
CALL dd.insert_reichweitetyp('Selbst (Würfel mit 4,5m Seitenlänge)', 'Selbst (Würfel)');
CALL dd.insert_reichweitetyp('Selbst (Radius von 4,5m)', 'Selbst (Radius)');
CALL dd.insert_reichweitetyp('Selbst (Kegel von 4,5m)','Selbst (Kegel)');
CALL dd.insert_reichweitetyp('Berührung', 'Berührung');
\echo ''\echo ''\echo '=========Populating dd.wirkungsdauertyp========='\echo ''\echo ''
CALL dd.insert_wirkungsdauertyp('Runden');
CALL dd.insert_wirkungsdauertyp('Minuten');
CALL dd.insert_wirkungsdauertyp('Stunden');
CALL dd.insert_wirkungsdauertyp('Unmittelbar');
CALL dd.insert_wirkungsdauertyp('Minuten, Konzentration');
CALL dd.insert_wirkungsdauertyp('Stunden, Konzentration');
\echo ''\echo ''\echo '=========Populating dd.zauber========='\echo ''\echo ''
CALL dd.insert_zauber('Befehl',1,'Aktion',18,'m',1,'Runden',
'Du gibst einer Kreatur in Reichweite, die du sehen kannst, einen Befehl von einem Wort. Das Ziel muss einen Weisheitsrettungs- wurf ablegen, sonst befolgt es den Befehl in seinem nächsten Zug. Der Zauber hat keine Auswirkungen, wenn das Ziel untot ist, wenn es deine Sprache nicht versteht oder wenn dein Befehl ihm unmittelbar schaden würde. Es folgen einige typische Befehle und ihre Auswirkungen. Du kannst andere Befehle als die geben, die hier beschrieben sind. Wenn du dies tust, entscheidet der SL, wie sich das Ziel verhält. Wenn das Ziel deinem Befehl nicht folgen kann, endet der Zauber. Komm. Das Ziel bewegt sich auf dem kürzesten und direktes- ten Weg auf dich zu und beendet seinen Zug wenn es sich dir auf 1,5 Meter angenähert hat. Fallenlassen. Das Ziel lässt fallen, was es in den Händen hält und beendet dann seinen Zug. Flieh. Das Ziel verbringt seinen Zug damit, sich auf die schnellste verfügbare Weise von dir weg zu bewegen. Krieche. Das Ziel erhält den Zustand liegend und beendet seinen Zug. Stopp. Das Ziel bewegt sich nicht und führt keine Aktionen aus. Eine fliegende Kreatur bleibt in der Luft, wenn sie dazu imstande ist. Wenn sie sich bewegen muss, um in der Luft zu blei- ben, dann bewegt sie sich die Mindestentfernung, die notwendig ist, um nicht abzustürzen.',
'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter von- einander entfernt sein, wenn du den Zauber auf sie wirkst.',
'Verzauberung', TRUE
, FALSE
, FALSE, 1 );
CALL dd.insert_zauber('Beistand',1,'Aktion',9,'m',8,'Stunden',
'Dein Zauber stärkt die Entschlossenheit und Zähigkeit deiner Verbündeten. Wähle bis zu drei Kreaturen in Reichweite. Die maximalen und aktuellen Trefferpunkte aller Ziele steigen für die Wirkungsdauer um 5.',
'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigen die Trefferpunkte des Ziels um zusätzlich 5 für jeden Zauberplatz-Grad über dem zweiten.',
'Bannzauber', TRUE
, TRUE
, TRUE, 2 );
CALL dd.insert_zauber('Blitz',1,'Aktion',30,'m',0,'Unmittelbar',
'Ein Blitz in Gestalt einer Linie mit 30 Metern Länge und 1,5 Metern Breite bricht in eine Richtung deiner Wahl aus dir hervor. Jede Kreatur in der Linie muss einen Geschicklichkeits- rettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 8W6 Blitzschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Der Blitz entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.',
'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.',
'Hervorrufung', TRUE
, TRUE
, TRUE, 3 );
CALL dd.insert_zauber('Brennende Hände',1,'Aktion',0,'Selbst (Kegel)',0,'Unmittelbar',
'Du streckst die Hände aus, mit sich berührenden Daumen und ausgebreiteten Fingern, und eine dünne Fläche aus Feuer schießt aus deinen ausgestreckten Fingerspitzen. Jede Kreatur in einem Kegel von 4,5 Metern muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 3W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.',
'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.',
'Hervorrufung', TRUE
, TRUE
, FALSE, 1 );
CALL dd.insert_zauber('Donnerwoge',1,'Aktion',0,'Selbst (Würfel)',0,'Unmittelbar',
'Eine Welle von donnernder Gewalt geht von dir aus. Jede Kreatur in einem 4, 50-m-Würfel muss einen Rettungswurf (Konstitution) ablegen. Bei einem Fehlschlag nimmt sie 2W8 Schallschaden und wird von der Wirkkraft des Zaubers 3 m von dir weggescho- ben. Bei erfolgreichem Rettungswurf erleidet die Kreatur nur die Hälfte des Schadens und wird nicht geschoben. Zusätzlich werden ungesicherte Gegenstände, die sich vollständig innerhalb des Wir- kungsbereichs befinden, automatisch 3 m von dir weggeschoben und der Zauber erzeugt einen Donnerschlag, der in einer Distanz von bis zu 90 m noch hörbar ist.',
'Wenn du beim Wirken dieses Zaubers einen Zauberplatz von Grad 2 oder höher verwendest, erhöht sich der Schaden um 1W8 für jeden Zauberplatzgrad über 1.',
'Hervorrufung', TRUE
, TRUE
, FALSE, 1 );
CALL dd.insert_zauber('Dunkelheit',1,'Aktion',18,'m',10,'Minuten, Konzentration',
'Magische Dunkelheit breitet sich von einem Punkt deiner Wahl in Reichweite aus und füllt für die Wirkungsdauer eine Sphäre mit einem Radius von 4,5 Metern. Die Dunkelheit kann sich auch um Ecken ausbreiten. Kreaturen mit Dunkelsicht können nicht durch diese Dunkelheit blicken, und nichtmagisches Licht kann sie nicht erhellen. Wenn der Punkt, den du wählst, ein Gegenstand ist, den du hältst oder der getragen oder in der Hand gehalten werden kann, dann breitet sich die Dunkelheit von dem Gegenstand aus und bewegt sich mit ihm. Wenn die Quelle der Dunkelheit vollständig mit einem undurchsichtigen Gegenstand, wie einer Schüssel oder einem Helm bedeckt wird, blockiert das die Dunkelheit. Wenn sich der Bereich des Zaubers mit einem Bereich aus Licht überschneidet, das mit einem Zauber des 2. Grades oder darunter erschaffen worden ist, wird der Zauber, der das Licht erschaffen hat, aufgehoben.',
NULL,
'Hervorrufung', TRUE
, FALSE
, TRUE, 2 );
CALL dd.insert_zauber('Einflüsterung',1,'Aktion',9,'m',8,'Stunden, Konzentration',
'Du schlägst eine Vorgehensweise vor (in maximal ein oder zwei Sätzen) und beeinflusst auf magische Weise eine Kreatur deiner Wahl in Reichweite, die du sehen kannst und die dich hören und verstehen kann. Kreaturen, die nicht bezaubert werden können, sind immun gegen diesen Effekt. Diese Einflüsterung muss auf eine Weise for- muliert werden, die die Vorgehensweise sinnvoll erscheinen lässt. Wenn du die Kreatur aufforderst, sich zu erstechen, sich in einen Speer zu werfen, sich anzuzünden oder etwas anderes zu tun, das ihm schadet, negiert das den Effekt des Zaubers automatisch. Das Ziel muss einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf folgt es der Verhaltensweise, die du beschrieben hast, nach seinen Möglichkeiten. Die vorge- schlagene Vorgehensweise kann für die gesamte Wirkungsdauer anhalten. Wenn die Vorgehensweise in kürzerer Zeit abgeschlos- sen werden kann, endet der Zauber, wenn das Ziel das getan hat, was es tun sollte. Du kannst auch bestimmte Bedingungen bestimmen, die eine besondere Aktivität während der Wirkungs- dauer auslösen. Beispielsweise könntest du vorschlagen, dass eine Ritterin dem ersten Bettler, den sie trifft, ihr Schlachtross schenkt. Wenn die Bedingung nicht erfüllt wird, ehe der Zauber endet, dann wird die Handlung nicht ausgeführt. Wenn du oder einer deiner Gefährten das Ziel verletzt, endet der Zauber.',
NULL,
'Hervorrufung', TRUE
, FALSE
, TRUE, 2 );
CALL dd.insert_zauber('Feenfeuer',1,'Aktion',18,'m',1,'Minuten, Konzentration',
'Jeder Gegenstand in einem Würfel mit 6 Metern Kantenlänge in Reichweite wird von blauem, grünen oder violettem Licht umgeben (deine Wahl). Alle Kreaturen, die sich in dem Bereich aufhalten, wenn der Zauber gewirkt wird, werden ebenfalls von Licht umge- ben, wenn sie einen Geschicklichkeitsrettungswurf nicht schaffen. Für die Wirkungsdauer geben Gegenstände und betroffene Krea- turen dämmriges Licht in einem Radius von 3 Metern ab. Angriffswürfe gegen betroffene Kreaturen oder Gegenstände haben Vorteil, wenn der Angreifer sie sehen kann, und die betrof- fenen Kreaturen oder Gegenstände können keinen Nutzen aus Unsichtbarkeit ziehen.',
NULL,
'Hervorrufung', TRUE
, FALSE
, FALSE, 1 );
CALL dd.insert_zauber('Feuerball',1,'Aktion',45,'m',0,'Unmittelbar',
'Ein heller Lichtblitz fährt aus deinem deutenden Finger zu einem Punkt in Reichweite deiner Wahl und erblüht mit einem lauten Brüllen zu einer Explosion aus Flammen. Alle Kreatu- ren in einem Radius von 6 Metern, der um den Punkt zentriert ist, müssen einen Geschicklichkeitswurf ablegen. Bei einem misslungenen Rettungswurf erleidet ein Ziel 8W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer kann sich um Ecken ausbreiten. Das Feuer entzün- det alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.',
'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.',
'Hervorrufung', TRUE
, TRUE
, TRUE, 3 );
CALL dd.insert_zauber('Flammenkugel',1,'Aktion',18,'m',0,'Minuten, Konzentration',
'Eine Sphäre aus Feuer mit einem Durchmesser von 1,5 Metern erscheint in einem nicht besetzten Bereich deiner Wahl in Reich- weite und hält für die Wirkungsdauer an. Jede Kreatur, die ihren Zug innerhalb von 1,5 Metern um die Sphäre beendet, muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem miss- lungenen Rettungswurf erleidet die Kreatur 2W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Als Aktion kannst du die Sphäre bis zu 9 Meter bewegen. Wenn du eine Kreatur mit der Sphäre rammst, muss sie einen Rettungswurf gegen den Schaden der Sphäre ablegen, und die Bewegung der Sphäre endet in diesem Zug. Wenn du die Sphäre bewegst, kannst du sie über Hindernisse lenken, die bis zu 1,5 Meter hoch sind und sie über Gräben von bis zu 3 Metern Breite springen lassen. Die Sphäre entzündet brennbare Gegenstände, die nicht getragen oder in der Hand gehalten werden, und gibt in einem Radius von 6 Metern helles Licht und in einem Radius von weiteren 6 Metern dämmriges Licht ab.',
'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem zweiten um 1W6.',
'Beschwörung', TRUE
, TRUE
, TRUE, 2 );
CALL dd.insert_zauber('Fliegen',1,'Aktion',0,'Berührung',10,'Minuten, Konzentration',
'Du berührst eine bereitwillige Kreatur. Das Ziel erhält für die Wirkungsdauer eine Flug-Bewegungsrate von 18 Metern. Wenn der Zauber endet fällt das Ziel zu Boden, wenn es noch in der Luft ist, es sei denn, es kann den Sturz abfangen.',
'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem dritten auf eine zusätzliche Kreatur wirken.',
'Hervorrufung', TRUE
, TRUE
, TRUE, 3 );
CALL dd.insert_zauber('Gebet der Heilung',10,'Aktion',9,'m',0,'Unmittelbar',
'Bis zu sechs Kreaturen deiner Wahl in Reichweite, die du sehen kannst, erhalten jeweils 2W8 + deinen Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.',
'Wenn du diesen Zauber mit einem Zau- berplatz des 3. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem zweiten um 1W8.',
'Hervorrufung', TRUE
, FALSE
, FALSE, 2 );
CALL dd.insert_zauber('Göttliche Führung',1,'Aktion',0,'Berührung',0,'Minuten, Konzentration',
'Du berührst eine bereitwillige Kreatur. Einmal ehe der Zauber endet kann das Ziel einen W4 würfeln und das Ergebnis auf einen Attributswurf seiner Wahl addieren. Es kann den Würfel vor oder nach dem Attributswurf werfen. Dann endet der Zauber.',
NULL,
'Erkenntniszauberei', TRUE
, TRUE
, FALSE, 0 );
CALL dd.insert_zauber('Heilendes Wort',1,'Bonusaktion',18,'m',0,'Unmittelbar',
'Eine Kreatur deiner Wahl in Reichweite, die du sehen kannst, erhält 1W4 + dein Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.',
'Wenn du diesen Zauber mit einem Zau- berplatz des 2. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem ersten um 1W4.',
'Hervorrufung', TRUE
, FALSE
, FALSE, 1 );
CALL dd.insert_zauber('Heilige Flamme',1,'Aktion',18,'m',0,'Unmittelbar',
'Flammengleiches Licht senkt sich auf eine Kreatur in Reich- weite, die du sehen kannst, herab. Die Kreatur muss einen Geschicklichkeitsrettungswurf schaffen, sonst erleidet sie 1W8 gleißenden Schaden. Bei diesem Rettungswurf erhält das Ziel keinen Vorteil aus Deckung. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.',
NULL,
'Hervorrufung', TRUE
, TRUE
, FALSE, 0 );
CALL dd.insert_zauber('Heiligtum',1,'Bonusaktion',9,'m',1,'Minuten',
'Du schützt eine Kreatur in Reichweite vor Angriffen. Bis der Zau- ber endet, müssen alle Kreaturen, die die geschützte Kreatur mit einem Angriff oder einem schädigenden Zauber attackieren wol- len, zunächst einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf muss die Kreatur ein neues Ziel wählen, sonst verliert sie den Angriff oder Zauber. Der Zauber schützt die Kreatur nicht vor Flächeneffekten, wie der Explosion eines Feuerballs. Wenn die geschützte Kreatur einen Angriff macht oder einen Zauber wirkt, der eine gegnerische Kreatur betrifft, endet dieser Zauber.',
NULL,
'Hervorrufung', TRUE
, TRUE
, TRUE, 0 );
CALL dd.insert_zauber('Identifizieren',1,'Minuten',0,'Berührung',0,'Unmittelbar',
'Du wählst einen Gegenstand, den du während des Wirkens die- ses Zaubers berühren musst. Wenn es sich um einen magischen Gegenstand oder ein anderweitig mit Magie erfülltes Objekt handelt, erfährst du, welche Eigenschaften es hat, wie du sie nut- zen kannst, ob der Gegenstand eine Einstimmung erforderlich macht und wie viele Ladungen er hat. Du erfährst, ob Zauber auf dem Gegenstand liegen und um welche es sich handelt. Wenn der Gegenstand durch einen Zauber erschaffen wurde, erfährst du, um welchen Zauber es sich handelt. Wenn du stattdessen eine Kreatur berührst, während du den Zauber wirkst, dann erfährst du, welche Zauber das Ziel augen- blicklich beeinflussen.',
NULL,
'Erkenntniszauberei', TRUE
, TRUE
, TRUE, 1 );
CALL dd.insert_zauber('Kältestrahl',1,'Aktion',18,'m',0,'Unmittelbar',
'Ein eisiger Strahl aus blau-weißem Licht schießt auf eine Krea- tur in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet die Kreatur 1W8 Kälte- schaden, und ihre Bewegungsrate wird bis zum Beginn deines nächsten Zugs um 3 Meter verringert. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.',
NULL,
'Hervorrufung', TRUE
, TRUE
, FALSE, 0 );
CALL dd.insert_zauber('Lenkendes Geschoss',1,'Aktion',36,'m',1,'Runden',
'Ein Lichtblitz schießt auf eine Kreatur deiner Wahl in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet das Ziel 4W6 gleißenden Schaden, und der nächste Angriffswurf, der vor Ende deines nächsten Zuges gegen das Ziel durchgeführt wird, hat einen Vorteil, weil mystisches Licht das Ziel zum Schimmern bringt.',
'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.',
'Hervorrufung', TRUE
, TRUE
, FALSE, 1 );
CALL dd.insert_zauber('Leuchtfeuer der Hoffnung',1,'Aktion',9,'m',1,'Minuten, Konzentration',
'Zauber schenkt Hoffnung und Lebenskraft. Wähle eine beliebige Anzahl von Kreaturen in Reichweite. Für die Wirkungsdauer haben sie alle einen Vorteil auf Weisheitsrettungswürfe und Rettungswürfe gegen Tod, und erhalten durch jede Heilung die maximale Anzahl von Trefferpunkten.',
NULL,
'Bannzauber', TRUE
, TRUE
, FALSE, 3 );
CALL dd.insert_zauber('Licht',1,'Aktion',0,'Berührung',1,'Stunden',
'Du berührst einen Gegenstand, der in keiner Dimension größer als 3 Meter ist. Bis der Zauber endet, strahlt dieser Gegenstand in einem Radius von 6 Metern helles Licht und in einem zusätz- lichen Radius von 6 Metern dämmriges Licht ab. Das Licht kann jede Farbe haben, die du willst. Wenn der Gegenstand mit etwas bedeckt wird, das vollkommen undurchsichtig ist, wird das Licht blockiert. Der Zauber endet wenn du ihn erneut wirkst oder als Aktion beendest. Wenn du einen Gegenstand als Ziel auswählst, den eine feindliche Kreatur trägt oder in der Hand hält, muss die Kreatur einen Geschicklichkeitsrettungswurf schaffen, um dem Zauber auszuweichen.',
NULL,
'Hervorrufung', TRUE
, FALSE
, TRUE, 0 );
CALL dd.insert_zauber('Magie bannen',1,'Aktion',36,'m',0,'Unmittelbar',
'Wähle eine Kreatur, einen Gegenstand oder einen magischen Effekt in Reichweite. Jeder Zauber des 3. Grades oder darunter, der auf dem Ziel liegt, endet. Für jeden Zauber des 4. Grades oder höher, der auf dem Ziel liegt, mache einen Attributswurf mit deinem Attribut zum Zauberwirken. Der SG ist 10 + die Stufe des Zaubers. Bei einem erfolgreichen Wurf endet der Zauber.',
'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Ranges oder höher wirkst, wird der Effekt von Zaubern auf dem Ziel beendet, wenn ihr Grad gleich oder niedri- ger als der Grad des Zauberplatzes ist, den du verwendet hast.',
'Bannzauber', TRUE
, TRUE
, FALSE, 3 );
CALL dd.insert_zauber('Magie entdecken',1,'Aktion',0,'Selbst',10,'Minuten, Konzentration',
'Für die Wirkungsdauer spürst du die Anwesenheit von Magie im Umkreis von 9 Metern um dich. Wenn du Magie auf diese Weise spürst, kannst du deine Aktion verwenden, um eine schwache Aura um eine sichtbare beliebige Kreatur oder einen Gegenstand im Wirkungsbereich zu sehen, der magisch ist, und die Schule der Magie in Erfahrung zu bringen, wenn es eine gibt. Der Zauber kann die meisten Barrieren durchdringen, wird aber von 30 Zenti- metern Stein, 2,5 Zentimetern gewöhnlicher Metalle, einer dünnen Schicht Blei oder 90 Zentimetern Holz oder Erde blockiert.',
NULL,
'Erkenntniszauberei', TRUE
, TRUE
, FALSE, 1 );
CALL dd.insert_zauber('Magierhand',1,'Aktion',9,'m',1,'Minuten',
'Eine gespenstische, schwebende Hand erscheint an einem Punkt deiner Wahl in Reichweite. Die Hand bleibt für die Wirkungs- dauer bestehen oder bis du sie mit einer Aktion wegschickst. Die Hand verschwindet, wenn sie sich weiter als 9 Meter von dir ent- fernt oder du den Zauber noch einmal wirkst. Du kannst eine Aktion verwenden, um die Hand zu kontrollieren. Du kannst die Hand verwenden, um Gegenstände zu manipulieren, verschlossene Türen oder Behälter zu öffnen, einen Gegenstand aus einem geöffneten Behälter zu holen oder ihn zu verstauen, oder den Inhalt einer Phiole auszugießen. Du kannst die Hand immer wenn du sie verwendest bis zu 9 Meter weit bewegen. Die Hand kann nicht angreifen, keine magischen Gegenstände aktivieren oder mehr als 10 Pfund tragen.',
NULL,
'Beschwörung', TRUE
, TRUE
, FALSE, 0 );