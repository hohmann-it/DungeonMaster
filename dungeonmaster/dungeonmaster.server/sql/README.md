# Die DungeonMaster Datenbank

Die beiden unten genannten Prozesse werden auch in der Entwicklung von DungeonMaster genutzt. Die Änderungen finden beim Entwickler direkt auf der Datenbank statt und werden dann mittels Script gesichert. Dieses Backup wird dann beim Aufsetzen der Datenbank wieder verwendet.

## Datenbank aufsetzen/resetten

Das Script `setupDB.sql` setzt die Datenbank für DungeonMaster auf.
Usage: 

`psql -U <superuser> -d postgres -f .\setupDB.sql`

Unter Windows kannst du auch `setupDB.cmd` benutzen.

Eine bestehende Datenbank wird in diesem Prozess gelöscht.

## Datenbank sichern

Die Datenbank kann mittels folgendem Command gesichert werden:

`pg_dump --clean --create --blobs --if-exists --inserts dungeonmaster > backup.sql`

Dabei werden `DROP IF-EXISTS` verwendet und die Daten per `INSERT` statt `COPY` gesichert. Somit kann das generierte Backup-Script resetten, sowie auf anderen Datenbanksystemen genutzt werden.
