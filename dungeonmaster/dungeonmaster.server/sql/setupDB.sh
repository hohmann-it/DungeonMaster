#!/bin/bash

read -n1 -p "Really want to setup the database? All changes to the db will be lost! [y,n]" input 
if [[ $input == "Y" || $input == "y" ]]; then
        echo "Setting up database!"
        psql -U phohmann -d postgres -f /home/phohmann/git/Dungeonmaster/dungeonmaster/dungeonmaster.server/sql/setup.sql -v password=%PGPASSWORD%
else
        echo "Done"
fi
