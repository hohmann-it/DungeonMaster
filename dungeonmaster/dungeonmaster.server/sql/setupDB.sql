-- Do initialization
\cd C:/git/dungeonmaster/dungeonmaster/dungeonmaster.server/sql

\echo ''
\echo ''
\echo ''
\echo ''
\echo ''
\echo '██████╗░██╗░░░██╗███╗░░██╗░██████╗░███████╗░█████╗░███╗░░██╗███╗░░░███╗░█████╗░░██████╗████████╗███████╗██████╗░'
\echo '██╔══██╗██║░░░██║████╗░██║██╔════╝░██╔════╝██╔══██╗████╗░██║████╗░████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗'
\echo '██║░░██║██║░░░██║██╔██╗██║██║░░██╗░█████╗░░██║░░██║██╔██╗██║██╔████╔██║███████║╚█████╗░░░░██║░░░█████╗░░██████╔╝'
\echo '██║░░██║██║░░░██║██║╚████║██║░░╚██╗██╔══╝░░██║░░██║██║╚████║██║╚██╔╝██║██╔══██║░╚═══██╗░░░██║░░░██╔══╝░░██╔══██╗'
\echo '██████╔╝╚██████╔╝██║░╚███║╚██████╔╝███████╗╚█████╔╝██║░╚███║██║░╚═╝░██║██║░░██║██████╔╝░░░██║░░░███████╗██║░░██║'
\echo '╚═════╝░░╚═════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░╚═╝'
\echo ''
\echo ''
\echo ''
\echo ''
\echo 'Welcome to the Dungeon Master setup script. This script will setup/reset your DungeonMaster database.'
\echo ''
\echo ''
\echo ''
\echo ''
\echo ''
\echo ''
\echo ''
\echo ''
\echo '█▀▄ █ █▀ █▀▀ █▀█ █▄░█ █▄░█ █▀▀ █▀▀ ▀█▀   █░█ █▀ █▀▀ █▀█ █▀'
\echo '█▄▀ █ ▄█ █▄▄ █▄█ █░▀█ █░▀█ ██▄ █▄▄ ░█░   █▄█ ▄█ ██▄ █▀▄ ▄█'
\echo ''
\echo 'Running scripts/disconnect-users.sql'
\i scripts/disconnect-users.sql
\echo ''
\echo ''
\echo ''
\echo ''
\echo '█▀ █▀▀ ▀█▀ █░█ █▀█   █▀▄ ▄▀█ ▀█▀ ▄▀█ █▄▄ ▄▀█ █▀ █▀▀'
\echo '▄█ ██▄ ░█░ █▄█ █▀▀   █▄▀ █▀█ ░█░ █▀█ █▄█ █▀█ ▄█ ██▄'
\echo ''
\echo '                                    '
\echo ''
\echo 'Running CREATE/tables_proc.sql'
\i scripts/setup.sql
\echo ''
\echo ''
\echo '███████╗██╗███╗░░██╗██╗░██████╗██╗░░██╗███████╗██████╗░'
\echo '██╔════╝██║████╗░██║██║██╔════╝██║░░██║██╔════╝██╔══██╗'
\echo '█████╗░░██║██╔██╗██║██║╚█████╗░███████║█████╗░░██║░░██║'
\echo '██╔══╝░░██║██║╚████║██║░╚═══██╗██╔══██║██╔══╝░░██║░░██║'
\echo '██║░░░░░██║██║░╚███║██║██████╔╝██║░░██║███████╗██████╔╝'
\echo '╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░'