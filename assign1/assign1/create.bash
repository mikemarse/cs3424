#!/bin/bash

read -p "Apartment number: " apt
read -p "Full name: " first_name last_name
read -p "Lease start: " lease_start
read -p "Lease end: " lease_end
balance=900

file_name="$apt.apt"

if [[ -e data/$file_name ]]; then
    echo "ERROR: apartment already exists"
else
    echo "$first_name $last_name" >> data/$file_name
    echo "$lease_start $lease_end" >> data/$file_name
    echo "$balance" >>data/$file_name
    echo "[`date +"%b %d, %Y"`] CREATED: $file_name" >> data/queries.log
fi




