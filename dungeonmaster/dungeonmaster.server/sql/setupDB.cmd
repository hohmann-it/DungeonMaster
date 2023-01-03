psql -U postgres -d postgres -f C:\git\dungeonmaster\dungeonmaster\dungeonmaster.server\sql\setupDB.sql -v password=%PGPASSWORD% --echo-errors -v ON_ERROR_STOP=1

PAUSE