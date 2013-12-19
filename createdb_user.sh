#!/bin/bash

set -f


ask_details(){

        read -p "Enter Database Name:- " dbname
        read -p "Enter Username Name:- " username
        read -sp "Enter Password for user $username :- " password

}

ask_details

sql_query=( "CREATE DATABASE IF NOT EXISTS ${dbname};"
        "GRANT USAGE ON *.* TO ${username}@localhost IDENTIFIED BY "${password}";"
        "GRANT ALL PRIVILEGES ON ${dbname}.* TO ${username}@localhost;"
        "FLUSH PRIVILEGES;" )



read -sp "Enter MySQL Root password:- " pass

for sql in "${sql_query[@]}";
do
        echo mysql -u root -p"$pass" -e \"$sql\" | sh
done
