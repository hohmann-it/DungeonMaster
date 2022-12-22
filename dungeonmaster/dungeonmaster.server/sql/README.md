# DB Setup Script

Dieses DB setup script setzt dir bei einer bestehenden Postgres Instanz schnell die Datenbank auf.
Usage: 

`psql -U <superuser> -d postgres -f .\setup.sql`

Eventuell bestehende Datenbank bzw. User werden zuvor gelöscht.
