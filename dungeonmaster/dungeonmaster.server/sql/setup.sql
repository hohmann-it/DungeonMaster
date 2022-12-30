-- Do initialization
\echo '=========Initializing DB settings=========';
\echo '...';
SET statement_timeout                   = 0;
SET lock_timeout                        = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding                     = 'UTF8';
SET standard_conforming_strings         = on;
SELECT
       pg_catalog.set_config('search_path', '', false)
;

SET check_function_bodies = false;
SET xmloption             = content;
SET client_min_messages   = warning;
SET row_security          = off;
-- Forcibly disconnect all users
\echo '=========Disconnecting user dungeonmaster=========';
\echo '...';
SELECT
       pg_terminate_backend(pid)
FROM
       pg_stat_activity
WHERE
       datname = 'dungeonmaster'
;

-- Drop any existing database
\echo '=========Drop database dungeonmaster if exists=========';
\echo '...';
DROP DATABASE
IF EXISTS dungeonmaster;
    \echo '=========Drop user dungeonmaster if exists=========';
    \echo '...';
    DROP USER
    IF EXISTS dungeonmaster;
        \echo '=========Create dungeonmaster user=========';
        \echo '...';
        CREATE USER dungeonmaster WITH PASSWORD :'password';
        -- Create the new database
        \echo '=========Create dungeonmaster user=========';
        \echo '...';
        
        CREATE DATABASE dungeonmaster WITH TEMPLATE = template0 ENCODING = 'UTF8';
        \echo '=========Change owner of dungeonmaster database to dungeonmaster user=========';
        \echo '...';
        -- Change owner to dungeonmaster
        ALTER DATABASE dungeonmaster OWNER TO dungeonmaster;
        -- Connect to database
        \echo '=========Connect to dungeonmaster database=========';
        \echo '...';
        \connect dungeonmaster
        -- Do initialization
        \echo '=========Initializing db settings=========';
        \echo '...';
        SET statement_timeout                   = 0;
        SET lock_timeout                        = 0;
        SET idle_in_transaction_session_timeout = 0;
        SET client_encoding                     = 'UTF8';
        SET standard_conforming_strings         = on;
        SELECT
               pg_catalog.set_config('search_path', '', false)
        ;
        
        SET check_function_bodies = false;
        SET xmloption             = content;
        SET client_min_messages   = warning;
        SET row_security          = off;
        -- Add comment to database
        COMMENT ON DATABASE dungeonmaster
    IS
        'The dungeonmaster core database';
        -- Set default tablespace & acces method
        SET default_tablespace          = '';
        SET default_table_access_method = heap;
        -- Create Charaktere Table
        \echo '=========Create table charaktere=========';
        \echo '...';
        CREATE TABLE public.charaktere
                     (
                                  charakter_id bigint NOT NULL
                                , klasse       text
                                , name         text NOT NULL
                     )
        ;
        
        ALTER TABLE public.charaktere OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.charakter_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.charakter_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.charakter_id_seq OWNED BY public.charaktere.charakter_id;
        ALTER TABLE ONLY public.charaktere ALTER COLUMN charakter_id SET DEFAULT nextval('public.charakter_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.charaktere ADD CONSTRAINT charaktere_pkey PRIMARY KEY (charakter_id)
        ;
        
        \echo '=========Insert into table charaktere=========';
        \echo '...';
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Krieger'
                    , 'Roland
'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Magier'
                    , 'Jens'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Barde'
                    , 'Rittersporn'
               )
        ;
        
        INSERT INTO public.charaktere
               ( klasse
                    , name
               )
               VALUES
               ( 'Namenloser Held'
                    , 'Namenlos'
               )
        ;
        
        --Create Zaubertyp Table
        \echo '=========Create table zaubertyp=========';
        \echo '...';
        CREATE TABLE public.zaubertyp
                     (
                                  zaubertyp_id bigint NOT NULL
                                , typ          text NOT NULL
                                , kategorie    text
                     )
        ;
        
        ALTER TABLE public.zaubertyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zaubertyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zaubertyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zaubertyp_id_seq OWNED BY public.zaubertyp.zaubertyp_id;
        ALTER TABLE ONLY public.zaubertyp ALTER COLUMN zaubertyp_id SET DEFAULT nextval('public.zaubertyp_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.zaubertyp ADD CONSTRAINT zaubertyp_pkey PRIMARY KEY (zaubertyp_id)
        ;
        
        \echo '=========Insert into table zaubertyp=========';
        \echo '...';
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Verzauberung'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Bannzauber'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Hervorrufung'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Beschwörung'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Verwandlung'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Erkenntniszauberei'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Illusion'
                    , NULL
               )
        ;
        
        INSERT INTO public.zaubertyp
               ( typ
                    , kategorie
               )
               VALUES
               ( 'Nekromantie'
                    , NULL
               )
        ;
        
        -- Create Zeitaufwandtyp Table
        \echo '=========Create table zeitaufwandtyp=========';
        \echo '...';
        CREATE TABLE public.zeitaufwandtyp
                     (
                                  zeitaufwandtyp_id bigint NOT NULL
                                , typ               text NOT NULL
                     )
        ;
        
        ALTER TABLE public.zeitaufwandtyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zeitaufwandtyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zeitaufwandtyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zeitaufwandtyp_id_seq OWNED BY public.zeitaufwandtyp.zeitaufwandtyp_id;
        ALTER TABLE ONLY public.zeitaufwandtyp ALTER COLUMN zeitaufwandtyp_id SET DEFAULT nextval('public.zeitaufwandtyp_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.zeitaufwandtyp ADD CONSTRAINT zeitaufwandtyp_pkey PRIMARY KEY (zeitaufwandtyp_id)
        ;
        
        \echo '=========Insert into table zeitaufwandtyp=========';
        \echo '...';
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Aktion'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Bonusaktion'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Minuten'
               )
        ;
        
        INSERT INTO public.zeitaufwandtyp
               ( typ
               )
               VALUES
               ( 'Reaktionen'
               )
        ;
        
        -- Create Reichweitetyp Table
        \echo '=========Create table reichweitetyp=========';
        \echo '...';
        CREATE TABLE public.reichweitetyp
                     (
                                  reichweitetyp_id bigint NOT NULL
                                , typ_lang         text NOT NULL
                                , typ_kurz         text NOT NULL
                     )
        ;
        
        ALTER TABLE public.reichweitetyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.reichweitetyp_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.reichweitetyp_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.reichweitetyp_id_seq OWNED BY public.reichweitetyp.reichweitetyp_id;
        ALTER TABLE ONLY public.reichweitetyp ALTER COLUMN reichweitetyp_id SET DEFAULT nextval('public.reichweitetyp_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.reichweitetyp ADD CONSTRAINT reichweitetyp_pkey PRIMARY KEY (reichweitetyp_id)
        ;
        
        \echo '=========Insert into table reichweitetyp=========';
        \echo '...';
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Meter'
                    , 'm'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst'
                    , 'Selbst'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst (Würfel mit 4,5m Seitenlänge)'
                    , 'Selbst (Würfel)'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst (Radius von 4,5m)'
                    , 'Selbst (Radius)'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Selbst (Kegel von 4,5m)'
                    , 'Selbst (Kegel)'
               )
        ;
        
        INSERT INTO public.reichweitetyp
               ( typ_lang
                    , typ_kurz
               )
               VALUES
               ( 'Berührung'
                    , 'Berührung'
               )
        ;
        
        -- Create Wirkungsdauertyp Table
        \echo '=========Create table wirkungsdauertyp=========';
        \echo '...';
        CREATE TABLE public.wirkungsdauertyp
                     (
                                  wirkungsdauertyp_id bigint NOT NULL
                                , typ                 text NOT NULL
                     )
        ;
        
        ALTER TABLE public.wirkungsdauertyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.wirkungsdauertyp_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.wirkungsdauertyp_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.wirkungsdauertyp_id OWNED BY public.wirkungsdauertyp.wirkungsdauertyp_id;
        ALTER TABLE ONLY public.wirkungsdauertyp ALTER COLUMN wirkungsdauertyp_id SET DEFAULT nextval('public.wirkungsdauertyp_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.wirkungsdauertyp ADD CONSTRAINT wirkungsdauertyp_pkey PRIMARY KEY (wirkungsdauertyp_id)
        ;
        
        \echo '=========Insert into table wirkungsdauertyp=========';
        \echo '...';
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Runden'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Minuten'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Stunden'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Unmittelbar'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Minuten, Konzentration'
               )
        ;
        
        INSERT INTO public.wirkungsdauertyp
               ( typ
               )
               VALUES
               ( 'Stunden, Konzentration'
               )
        ;
        
        -- Create zauberkomponentetyp Table
        \echo '=========Create table zauberkomponentetyp=========';
        \echo '...';
        CREATE TABLE public.zauberkomponentetyp
                     (
                                  zauberkomponentetyp_id bigint NOT NULL
                                , typ_kurz               text NOT NULL
                                , typ_lang               text NOT NULL
                     )
        ;
        
        ALTER TABLE public.zauberkomponentetyp OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauberkomponentetyp_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauberkomponentetyp_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauberkomponentetyp_id OWNED BY public.zauberkomponentetyp.zauberkomponentetyp_id;
        ALTER TABLE ONLY public.zauberkomponentetyp ALTER COLUMN zauberkomponentetyp_id SET DEFAULT nextval('public.zauberkomponentetyp_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zauberkomponentetyp ADD CONSTRAINT zauberkomponentetyp_pkey PRIMARY KEY (zauberkomponentetyp_id)
        ;
        
        \echo '=========Insert into table zauberkomponentetyp=========';
        \echo '...';
        INSERT INTO public.zauberkomponentetyp
               ( typ_kurz
                    , typ_lang
               )
               VALUES
               ( 'V'
                    , 'Verbalkomponente'
               )
        ;
        
        INSERT INTO public.zauberkomponentetyp
               ( typ_kurz
                    , typ_lang
               )
               VALUES
               ( 'G'
                    , 'Gestenkomponente'
               )
        ;
        
        INSERT INTO public.zauberkomponentetyp
               ( typ_kurz
                    , typ_lang
               )
               VALUES
               ( 'M'
                    , 'Materialkomponente'
               )
        ;
        
        -- Create Zauber Table
        \echo '=========Create table zauber=========';
        \echo '...';
        CREATE TABLE public.zauber
                     (
                                  zauber_id            bigint NOT NULL
                                , name                 text NOT NULL
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
                     )
        ;
        
        ALTER TABLE public.zauber OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauber_id_seq
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauber_id_seq OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauber_id_seq OWNED BY public.zauber.zauber_id;
        ALTER TABLE ONLY public.zauber ALTER COLUMN zauber_id SET DEFAULT nextval('public.zauber_id_seq'::regclass)
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT zauber_pkey PRIMARY KEY (zauber_id)
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_zauber_typ FOREIGN KEY (fk_zauber_typ) REFERENCES public.zaubertyp(zaubertyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_reichweite_typ FOREIGN KEY (fk_reichweite_typ) REFERENCES public.reichweitetyp(reichweitetyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_wirkungsdauer_typ FOREIGN KEY (fk_wirkungsdauer_typ) REFERENCES public.wirkungsdauertyp(wirkungsdauertyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauber ADD CONSTRAINT fk_zeitaufwand_typ FOREIGN KEY (fk_zeitaufwand_typ) REFERENCES public.zeitaufwandtyp(zeitaufwandtyp_id) NOT VALID
        ;
        
        \echo '=========Insert into table zauber=========';
        \echo '...';
        INSERT INTO public.zauber
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
               )
        SELECT
               'Befehl'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Runden'
               )
             , 'Du gibst einer Kreatur in Reichweite, die du sehen kannst, einen Befehl von einem Wort. Das Ziel muss einen Weisheitsrettungs- wurf ablegen, sonst befolgt es den Befehl in seinem nächsten Zug. Der Zauber hat keine Auswirkungen, wenn das Ziel untot ist, wenn es deine Sprache nicht versteht oder wenn dein Befehl ihm unmittelbar schaden würde. Es folgen einige typische Befehle und ihre Auswirkungen. Du kannst andere Befehle als die geben, die hier beschrieben sind. Wenn du dies tust, entscheidet der SL, wie sich das Ziel verhält. Wenn das Ziel deinem Befehl nicht folgen kann, endet der Zauber. Komm. Das Ziel bewegt sich auf dem kürzesten und direktes- ten Weg auf dich zu und beendet seinen Zug wenn es sich dir auf 1,5 Meter angenähert hat. Fallenlassen. Das Ziel lässt fallen, was es in den Händen hält und beendet dann seinen Zug. Flieh. Das Ziel verbringt seinen Zug damit, sich auf die schnellste verfügbare Weise von dir weg zu bewegen. Krieche. Das Ziel erhält den Zustand liegend und beendet seinen Zug. Stopp. Das Ziel bewegt sich nicht und führt keine Aktionen aus. Eine fliegende Kreatur bleibt in der Luft, wenn sie dazu imstande ist. Wenn sie sich bewegen muss, um in der Luft zu blei- ben, dann bewegt sie sich die Mindestentfernung, die notwendig ist, um nicht abzustürzen.'
             , 'Wenn du diesen Zauber mit einem Zauber- platz des 2. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem ersten auf eine zusätzliche Kreatur wirken. Die Kreaturen dürfen nicht weiter als 9 Meter von- einander entfernt sein, wenn du den Zauber auf sie wirkst.'
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Verzauberung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Beistand'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 8
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Stunden'
               )
             , 'Dein Zauber stärkt die Entschlossenheit und Zähigkeit deiner Verbündeten. Wähle bis zu drei Kreaturen in Reichweite. Die maximalen und aktuellen Trefferpunkte aller Ziele steigen für die Wirkungsdauer um 5.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigen die Trefferpunkte des Ziels um zusätzlich 5 für jeden Zauberplatz-Grad über dem zweiten.'
             , 2
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Blitz'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 30
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Ein Blitz in Gestalt einer Linie mit 30 Metern Länge und 1,5 Metern Breite bricht in eine Richtung deiner Wahl aus dir hervor. Jede Kreatur in der Linie muss einen Geschicklichkeits- rettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 8W6 Blitzschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Der Blitz entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.'
             , 3
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Brennende Hände'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst (Kegel)'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Du streckst die Hände aus, mit sich berührenden Daumen und ausgebreiteten Fingern, und eine dünne Fläche aus Feuer schießt aus deinen ausgestreckten Fingerspitzen. Jede Kreatur in einem Kegel von 4,5 Metern muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf erleidet das Ziel 3W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer entzündet alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.'
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Donnerwoge'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst (Würfel)'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Eine Welle von donnernder Gewalt geht von dir aus. Jede Kreatur in einem 4, 50-m-Würfel muss einen Rettungswurf (Konstitution) ablegen. Bei einem Fehlschlag nimmt sie 2W8 Schallschaden und wird von der Wirkkraft des Zaubers 3 m von dir weggescho- ben. Bei erfolgreichem Rettungswurf erleidet die Kreatur nur die Hälfte des Schadens und wird nicht geschoben. Zusätzlich werden ungesicherte Gegenstände, die sich vollständig innerhalb des Wir- kungsbereichs befinden, automatisch 3 m von dir weggeschoben und der Zauber erzeugt einen Donnerschlag, der in einer Distanz von bis zu 90 m noch hörbar ist.'
             , 'Wenn du beim Wirken dieses Zaubers einen Zauberplatz von Grad 2 oder höher verwendest, erhöht sich der Schaden um 1W8 für jeden Zauberplatzgrad über 1.'
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Dunkelheit'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Magische Dunkelheit breitet sich von einem Punkt deiner Wahl in Reichweite aus und füllt für die Wirkungsdauer eine Sphäre mit einem Radius von 4,5 Metern. Die Dunkelheit kann sich auch um Ecken ausbreiten. Kreaturen mit Dunkelsicht können nicht durch diese Dunkelheit blicken, und nichtmagisches Licht kann sie nicht erhellen. Wenn der Punkt, den du wählst, ein Gegenstand ist, den du hältst oder der getragen oder in der Hand gehalten werden kann, dann breitet sich die Dunkelheit von dem Gegenstand aus und bewegt sich mit ihm. Wenn die Quelle der Dunkelheit vollständig mit einem undurchsichtigen Gegenstand, wie einer Schüssel oder einem Helm bedeckt wird, blockiert das die Dunkelheit. Wenn sich der Bereich des Zaubers mit einem Bereich aus Licht überschneidet, das mit einem Zauber des 2. Grades oder darunter erschaffen worden ist, wird der Zauber, der das Licht erschaffen hat, aufgehoben.'
             , NULL
             , 2
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Einflüsterung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 8
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Stunden, Konzentration'
               )
             , 'Du schlägst eine Vorgehensweise vor (in maximal ein oder zwei Sätzen) und beeinflusst auf magische Weise eine Kreatur deiner Wahl in Reichweite, die du sehen kannst und die dich hören und verstehen kann. Kreaturen, die nicht bezaubert werden können, sind immun gegen diesen Effekt. Diese Einflüsterung muss auf eine Weise for- muliert werden, die die Vorgehensweise sinnvoll erscheinen lässt. Wenn du die Kreatur aufforderst, sich zu erstechen, sich in einen Speer zu werfen, sich anzuzünden oder etwas anderes zu tun, das ihm schadet, negiert das den Effekt des Zaubers automatisch. Das Ziel muss einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf folgt es der Verhaltensweise, die du beschrieben hast, nach seinen Möglichkeiten. Die vorge- schlagene Vorgehensweise kann für die gesamte Wirkungsdauer anhalten. Wenn die Vorgehensweise in kürzerer Zeit abgeschlos- sen werden kann, endet der Zauber, wenn das Ziel das getan hat, was es tun sollte. Du kannst auch bestimmte Bedingungen bestimmen, die eine besondere Aktivität während der Wirkungs- dauer auslösen. Beispielsweise könntest du vorschlagen, dass eine Ritterin dem ersten Bettler, den sie trifft, ihr Schlachtross schenkt. Wenn die Bedingung nicht erfüllt wird, ehe der Zauber endet, dann wird die Handlung nicht ausgeführt. Wenn du oder einer deiner Gefährten das Ziel verletzt, endet der Zauber.'
             , NULL
             , 2
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Feenfeuer'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Jeder Gegenstand in einem Würfel mit 6 Metern Kantenlänge in Reichweite wird von blauem, grünen oder violettem Licht umgeben (deine Wahl). Alle Kreaturen, die sich in dem Bereich aufhalten, wenn der Zauber gewirkt wird, werden ebenfalls von Licht umge- ben, wenn sie einen Geschicklichkeitsrettungswurf nicht schaffen. Für die Wirkungsdauer geben Gegenstände und betroffene Krea- turen dämmriges Licht in einem Radius von 3 Metern ab. Angriffswürfe gegen betroffene Kreaturen oder Gegenstände haben Vorteil, wenn der Angreifer sie sehen kann, und die betrof- fenen Kreaturen oder Gegenstände können keinen Nutzen aus Unsichtbarkeit ziehen.'
             , NULL
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Feuerball'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 45
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Ein heller Lichtblitz fährt aus deinem deutenden Finger zu einem Punkt in Reichweite deiner Wahl und erblüht mit einem lauten Brüllen zu einer Explosion aus Flammen. Alle Kreatu- ren in einem Radius von 6 Metern, der um den Punkt zentriert ist, müssen einen Geschicklichkeitswurf ablegen. Bei einem misslungenen Rettungswurf erleidet ein Ziel 8W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Das Feuer kann sich um Ecken ausbreiten. Das Feuer entzün- det alle brennbaren Gegenstände im Bereich, die nicht getragen oder in der Hand gehalten werden.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 4. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem dritten um 1W6.'
             , 3
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Flammenkugel'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Eine Sphäre aus Feuer mit einem Durchmesser von 1,5 Metern erscheint in einem nicht besetzten Bereich deiner Wahl in Reich- weite und hält für die Wirkungsdauer an. Jede Kreatur, die ihren Zug innerhalb von 1,5 Metern um die Sphäre beendet, muss einen Geschicklichkeitsrettungswurf ablegen. Bei einem miss- lungenen Rettungswurf erleidet die Kreatur 2W6 Feuerschaden, halb so viel Schaden bei einem erfolgreichen Rettungswurf. Als Aktion kannst du die Sphäre bis zu 9 Meter bewegen. Wenn du eine Kreatur mit der Sphäre rammst, muss sie einen Rettungswurf gegen den Schaden der Sphäre ablegen, und die Bewegung der Sphäre endet in diesem Zug. Wenn du die Sphäre bewegst, kannst du sie über Hindernisse lenken, die bis zu 1,5 Meter hoch sind und sie über Gräben von bis zu 3 Metern Breite springen lassen. Die Sphäre entzündet brennbare Gegenstände, die nicht getragen oder in der Hand gehalten werden, und gibt in einem Radius von 6 Metern helles Licht und in einem Radius von weiteren 6 Metern dämmriges Licht ab.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 3. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem zweiten um 1W6.'
             , 2
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Beschwörung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Fliegen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Du berührst eine bereitwillige Kreatur. Das Ziel erhält für die Wirkungsdauer eine Flug-Bewegungsrate von 18 Metern. Wenn der Zauber endet fällt das Ziel zu Boden, wenn es noch in der Luft ist, es sei denn, es kann den Sturz abfangen.'
             , 'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Grades oder höher wirkst, dann kannst du den Zauber für jeden Zauberplatz-Grad über dem dritten auf eine zusätzliche Kreatur wirken.'
             , 3
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Verwandlung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Gebet der Heilung'
             , 10
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Minuten'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Bis zu sechs Kreaturen deiner Wahl in Reichweite, die du sehen kannst, erhalten jeweils 2W8 + deinen Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.'
             , 'Wenn du diesen Zauber mit einem Zau- berplatz des 3. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem zweiten um 1W8.'
             , 2
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Göttliche Führung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Du berührst eine bereitwillige Kreatur. Einmal ehe der Zauber endet kann das Ziel einen W4 würfeln und das Ergebnis auf einen Attributswurf seiner Wahl addieren. Es kann den Würfel vor oder nach dem Attributswurf werfen. Dann endet der Zauber.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Erkenntniszauberei'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Heilendes Wort'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Eine Kreatur deiner Wahl in Reichweite, die du sehen kannst, erhält 1W4 + dein Zaubermodifikator Trefferpunkte zurück. Der Zauber hat keine Auswirkungen auf Untote oder Konstrukte.'
             , 'Wenn du diesen Zauber mit einem Zau- berplatz des 2. Grades oder höher wirkst, dann steigt die Heilung für jeden Zauberplatz-Grad über dem ersten um 1W4.'
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Heilige Flamme'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Flammengleiches Licht senkt sich auf eine Kreatur in Reich- weite, die du sehen kannst, herab. Die Kreatur muss einen Geschicklichkeitsrettungswurf schaffen, sonst erleidet sie 1W8 gleißenden Schaden. Bei diesem Rettungswurf erhält das Ziel keinen Vorteil aus Deckung. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Heiligtum'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten'
               )
             , 'Du schützt eine Kreatur in Reichweite vor Angriffen. Bis der Zau- ber endet, müssen alle Kreaturen, die die geschützte Kreatur mit einem Angriff oder einem schädigenden Zauber attackieren wol- len, zunächst einen Weisheitsrettungswurf ablegen. Bei einem misslungenen Rettungswurf muss die Kreatur ein neues Ziel wählen, sonst verliert sie den Angriff oder Zauber. Der Zauber schützt die Kreatur nicht vor Flächeneffekten, wie der Explosion eines Feuerballs. Wenn die geschützte Kreatur einen Angriff macht oder einen Zauber wirkt, der eine gegnerische Kreatur betrifft, endet dieser Zauber.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Identifizieren'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Minuten'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Du wählst einen Gegenstand, den du während des Wirkens die- ses Zaubers berühren musst. Wenn es sich um einen magischen Gegenstand oder ein anderweitig mit Magie erfülltes Objekt handelt, erfährst du, welche Eigenschaften es hat, wie du sie nut- zen kannst, ob der Gegenstand eine Einstimmung erforderlich macht und wie viele Ladungen er hat. Du erfährst, ob Zauber auf dem Gegenstand liegen und um welche es sich handelt. Wenn der Gegenstand durch einen Zauber erschaffen wurde, erfährst du, um welchen Zauber es sich handelt. Wenn du stattdessen eine Kreatur berührst, während du den Zauber wirkst, dann erfährst du, welche Zauber das Ziel augen- blicklich beeinflussen.'
             , NULL
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Erkenntniszauberei'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Kältestrahl'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Ein eisiger Strahl aus blau-weißem Licht schießt auf eine Krea- tur in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet die Kreatur 1W8 Kälte- schaden, und ihre Bewegungsrate wird bis zum Beginn deines nächsten Zugs um 3 Meter verringert. Der Schaden dieses Zaubers steigt um 1W8, wenn du die 5. Stufe (2W8), die 11. Stufe (3W8) und die 17. Stufe (4W8) erreichst.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Lenkendes Geschoss'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 36
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Runden'
               )
             , 'Ein Lichtblitz schießt auf eine Kreatur deiner Wahl in Reichweite zu. Lege einen Fernkampf-Zauberangriff gegen das Ziel ab. Bei einem Treffer erleidet das Ziel 4W6 gleißenden Schaden, und der nächste Angriffswurf, der vor Ende deines nächsten Zuges gegen das Ziel durchgeführt wird, hat einen Vorteil, weil mystisches Licht das Ziel zum Schimmern bringt.'
             , 'Wenn du diesen Zauber mit einem Zauberplatz des 2. Grades oder höher wirkst, dann steigt der Schaden für jeden Zauberplatz-Grad über dem ersten um 1W6.'
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Leuchtfeuer der Hoffnung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Zauber schenkt Hoffnung und Lebenskraft. Wähle eine beliebige Anzahl von Kreaturen in Reichweite. Für die Wirkungsdauer haben sie alle einen Vorteil auf Weisheitsrettungswürfe und Rettungswürfe gegen Tod, und erhalten durch jede Heilung die maximale Anzahl von Trefferpunkten.'
             , NULL
             , 3
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Licht'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Stunden'
               )
             , 'Du berührst einen Gegenstand, der in keiner Dimension größer als 3 Meter ist. Bis der Zauber endet, strahlt dieser Gegenstand in einem Radius von 6 Metern helles Licht und in einem zusätz- lichen Radius von 6 Metern dämmriges Licht ab. Das Licht kann jede Farbe haben, die du willst. Wenn der Gegenstand mit etwas bedeckt wird, das vollkommen undurchsichtig ist, wird das Licht blockiert. Der Zauber endet wenn du ihn erneut wirkst oder als Aktion beendest. Wenn du einen Gegenstand als Ziel auswählst, den eine feindliche Kreatur trägt oder in der Hand hält, muss die Kreatur einen Geschicklichkeitsrettungswurf schaffen, um dem Zauber auszuweichen.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Magie bannen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 36
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Unmittelbar'
               )
             , 'Wähle eine Kreatur, einen Gegenstand oder einen magischen Effekt in Reichweite. Jeder Zauber des 3. Grades oder darunter, der auf dem Ziel liegt, endet. Für jeden Zauber des 4. Grades oder höher, der auf dem Ziel liegt, mache einen Attributswurf mit deinem Attribut zum Zauberwirken. Der SG ist 10 + die Stufe des Zaubers. Bei einem erfolgreichen Wurf endet der Zauber.'
             , 'Wenn du diesen Zauber mit einem Zau- berplatz des 4. Ranges oder höher wirkst, wird der Effekt von Zaubern auf dem Ziel beendet, wenn ihr Grad gleich oder niedri- ger als der Grad des Zauberplatzes ist, den du verwendet hast.'
             , 3
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Magie entdecken'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten, Konzentration'
               )
             , 'Für die Wirkungsdauer spürst du die Anwesenheit von Magie im Umkreis von 9 Metern um dich. Wenn du Magie auf diese Weise spürst, kannst du deine Aktion verwenden, um eine schwache Aura um eine sichtbare beliebige Kreatur oder einen Gegenstand im Wirkungsbereich zu sehen, der magisch ist, und die Schule der Magie in Erfahrung zu bringen, wenn es eine gibt. Der Zauber kann die meisten Barrieren durchdringen, wird aber von 30 Zenti- metern Stein, 2,5 Zentimetern gewöhnlicher Metalle, einer dünnen Schicht Blei oder 90 Zentimetern Holz oder Erde blockiert.'
             , NULL
             , 1
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Erkenntniszauberei'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Magierhand'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
                      WHERE
                             typ = 'Minuten'
               )
             , 'Eine gespenstische, schwebende Hand erscheint an einem Punkt deiner Wahl in Reichweite. Die Hand bleibt für die Wirkungs- dauer bestehen oder bis du sie mit einer Aktion wegschickst. Die Hand verschwindet, wenn sie sich weiter als 9 Meter von dir ent- fernt oder du den Zauber noch einmal wirkst. Du kannst eine Aktion verwenden, um die Hand zu kontrollieren. Du kannst die Hand verwenden, um Gegenstände zu manipulieren, verschlossene Türen oder Behälter zu öffnen, einen Gegenstand aus einem geöffneten Behälter zu holen oder ihn zu verstauen, oder den Inhalt einer Phiole auszugießen. Du kannst die Hand immer wenn du sie verwendest bis zu 9 Meter weit bewegen. Die Hand kann nicht angreifen, keine magischen Gegenstände aktivieren oder mehr als 10 Pfund tragen.'
             , NULL
             , 0
             , (
                      SELECT
                             zaubertyp_id
                      FROM
                             public.zaubertyp
                      WHERE
                             typ = 'Beschwörung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Magierrüstung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 8
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Magisches Geschoss'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 36
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Massen-Heilendes Wort'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Nebelschritt'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Beschwörung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Person bezaubern'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verzauberung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Person festhalten'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verzauberung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Resistenz'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schild'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Reaktionen'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schild des Glaubens'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schlaf'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 27
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verzauberung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schockgriff'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schützendes Band'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schutzgeister'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst (Radius)'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Beschwörung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schutz vor Energie'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Schwache Genesung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Bannzauber'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Segnen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verzauberung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Spinnenklettern'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verwandlung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Spinnennetz'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Beschwörung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Sprachen verstehen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Erkenntniszauberei'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Stille'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 36
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 10
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Illusion'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Tanzende Lichter'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 36
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Taschenspielerei'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 3
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verwandlung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Thaumaturgie'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 9
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Verwandlung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Unsichtbarkeit'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Illusion'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Verschwimmen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Illusion'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Vorahnung'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Minuten'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Selbst'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Erkenntniszauberei'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Waffe des Glaubens'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Bonusaktion'
               )
             , 18
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'm'
               )
             , 1
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Wiederbeleben'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Nekromantie'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Wunden heilen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Hervorrufung'
               )
        ;
        
        INSERT INTO public.zauber
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
               )
        SELECT
               'Wunden verursachen'
             , 1
             , (
                      SELECT
                             zeitaufwandtyp_id
                      FROM
                             public.zeitaufwandtyp
                      WHERE
                             typ = 'Aktion'
               )
             , 0
             , (
                      SELECT
                             reichweitetyp_id
                      FROM
                             public.reichweitetyp
                      WHERE
                             typ_kurz = 'Berührung'
               )
             , 0
             , (
                      SELECT
                             wirkungsdauertyp_id
                      FROM
                             public.wirkungsdauertyp
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
                             public.zaubertyp
                      WHERE
                             typ = 'Nekromantie'
               )
        ;
        
        -- Create zauberkomponente Table
        \echo '=========Create table zauberkomponente=========';
        \echo '...';
        CREATE TABLE public.zauberkomponente
                     (
                                  zauberkomponente_id     bigint NOT NULL
                                , fk_zauber               bigint NOT NULL
                                , fk_zauberkomponente_typ bigint NOT NULL
                     )
        ;
        
        ALTER TABLE public.zauberkomponente OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zauberkomponente_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zauberkomponente_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zauberkomponente_id OWNED BY public.zauberkomponente.zauberkomponente_id;
        ALTER TABLE ONLY public.zauberkomponente ALTER COLUMN zauberkomponente_id SET DEFAULT nextval('public.zauberkomponente_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT zauberkomponente_pkey PRIMARY KEY (zauberkomponente_id)
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT fk_zauberkomponente_typ FOREIGN KEY (fk_zauberkomponente_typ) REFERENCES public.zauberkomponentetyp(zauberkomponentetyp_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zauberkomponente ADD CONSTRAINT fk_zauber FOREIGN KEY (fk_zauber) REFERENCES public.zauber(zauber_id) NOT VALID
        ;
        
        \echo '=========Insert into table zauberkomponente=========';
        \echo '...';
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Befehl'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Beistand'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Beistand'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Beistand'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Blitz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Blitz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Blitz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Brennende Hände'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Brennende Hände'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Donnerwoge'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Donnerwoge'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Dunkelheit'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Dunkelheit'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Einflüsterung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Einflüsterung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Feenfeuer'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Feuerball'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Feuerball'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Feuerball'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Flammenkugel'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Flammenkugel'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Flammenkugel'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Fliegen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Fliegen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Fliegen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Gebet der Heilung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Göttliche Führung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Göttliche Führung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heilendes Wort'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heilige Flamme'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heilige Flamme'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heiligtum'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heiligtum'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Heiligtum'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Identifizieren'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Identifizieren'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Identifizieren'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Kältestrahl'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Kältestrahl'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Lenkendes Geschoss'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Lenkendes Geschoss'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Leuchtfeuer der Hoffnung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Leuchtfeuer der Hoffnung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Licht'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Licht'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magie bannen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magie bannen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magie entdecken'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magie entdecken'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magierhand'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magierhand'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magierrüstung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magierrüstung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magierrüstung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magisches Geschoss'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Magisches Geschoss'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Massen-Heilendes Wort'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Nebelschritt'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Person bezaubern'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Person bezaubern'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Person festhalten'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Person festhalten'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Person festhalten'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Resistenz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Resistenz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Resistenz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schild'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schild'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schild des Glaubens'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schild des Glaubens'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schild des Glaubens'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schlaf'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schlaf'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schlaf'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schockgriff'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schockgriff'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schützendes Band'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schützendes Band'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schützendes Band'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schutzgeister'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schutzgeister'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schutzgeister'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schutz vor Energie'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schutz vor Energie'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schwache Genesung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Schwache Genesung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Segnen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Segnen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Segnen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnenklettern'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnenklettern'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnenklettern'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnennetz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnennetz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Spinnennetz'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Sprachen verstehen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Sprachen verstehen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Sprachen verstehen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Stille'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Sprachen verstehen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Tanzende Lichter'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Tanzende Lichter'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Tanzende Lichter'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Taschenspielerei'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Taschenspielerei'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Thaumaturgie'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Unsichtbarkeit'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Unsichtbarkeit'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Unsichtbarkeit'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Verschwimmen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Vorahnung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Vorahnung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Vorahnung'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Waffe des Glaubens'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Waffe des Glaubens'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wiederbeleben'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wiederbeleben'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wiederbeleben'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'M'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wunden heilen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wunden heilen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wunden verursachen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'V'
               )
               )
        ;
        
        INSERT INTO public.zauberkomponente
               ( fk_zauber
                    , fk_zauberkomponente_typ
               )
               VALUES
               (
               (
                      SELECT
                             zauber_id
                      FROM
                             public.zauber
                      WHERE
                             name = 'Wunden verursachen'
               )
             , (
                      SELECT
                             zauberkomponentetyp_id
                      FROM
                             public.zauberkomponentetyp
                      WHERE
                             typ_kurz = 'G'
               )
               )
        ;
        
        -- Create Material Table
        \echo '=========Create table material=========';
        \echo '...';
        CREATE TABLE public.material
                     (
                                  material_id bigint NOT NULL
                                , name        text NOT NULL
                     )
        ;
        
        ALTER TABLE public.material OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.material_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.material_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.material_id OWNED BY public.material.material_id;
        ALTER TABLE ONLY public.material ALTER COLUMN material_id SET DEFAULT nextval('public.material_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.material ADD CONSTRAINT material_pkey PRIMARY KEY (material_id)
        ;
        
        \echo '=========Insert into table material=========';
        \echo '...';
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'winziger weißer Stoffstreifen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Stück Fell'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Stab aus Bernstein'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Kristall'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Glas'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'winziger weißer Stoffstreifen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Fledermausfell'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Tropfen Pech'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Stück Kohle'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Schlangenzunge'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Honigwabe'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Tropfen Speiseöl'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'winzige Kugel aus Fledermauskot'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Schwefel'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Talg'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Schwungfeder eines beliebigen Vogels'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'kleiner Silberspiegel'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Perle im Wert von mindestens 100 GM'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Eulenfeder'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Glühwürmchen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Leuchtmoos'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Stück gehärtetes Leder'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'kleines, gerades Stück Eisen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Miniaturumhang'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'kleines Pergament mit heiligem Text'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Prise Sand'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Rosenblüten'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Grille'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Paar Platinringe im Wert von jeweils 50 GM'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'heiliges Symbol'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Tropfen Weihwasser'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Tropfen Bitumen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Spinne'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Spinnweben'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Prise Ruß'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Salz'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Stück Phosphor'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Bergulmenholz'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Glühwürmchen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Wimper, die von Gummiarabikum umschlossen ist'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'speziell gekennzeichnetes Stöckchen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Knochen'
               )
        ;
        
        INSERT INTO public.material
               ( name
               )
               VALUES
               ( 'Symbole im Wert von 25 GM'
               )
        ;
        
        INSERT INTO public.material
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
        CREATE TABLE public.zaubermaterial
                     (
                                  zaubermaterial_id   bigint NOT NULL
                                , fk_zauberkomponente bigint NOT NULL
                                , ersatz              bigint NOT NULL
                                , fk_material         bigint NOT NULL
                                , anzahl              int NOT NULL
                     )
        ;
        
        ALTER TABLE public.zaubermaterial OWNER TO dungeonmaster
        ;
        
        CREATE SEQUENCE public.zaubermaterial_id
        START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
        ALTER TABLE public.zaubermaterial_id OWNER TO dungeonmaster
        ;
        
        ALTER SEQUENCE public.zaubermaterial_id OWNED BY public.zaubermaterial.zaubermaterial_id;
        ALTER TABLE ONLY public.zaubermaterial ALTER COLUMN zaubermaterial_id SET DEFAULT nextval('public.zaubermaterial_id'::regclass)
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT zaubermaterial_pkey PRIMARY KEY (zaubermaterial_id)
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT fk_zauberkomponente FOREIGN KEY (fk_zauberkomponente) REFERENCES public.zauberkomponente(zauberkomponente_id) NOT VALID
        ;
        
        ALTER TABLE ONLY public.zaubermaterial ADD CONSTRAINT fk_material FOREIGN KEY (fk_material) REFERENCES public.material(material_id) NOT VALID
        ;
        
        \echo '=========Insert into table zaubermaterial=========';
        \echo '...';
