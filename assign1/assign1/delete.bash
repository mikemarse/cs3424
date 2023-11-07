#!/bin/bash

read -p "Enter an apartment number: " apt_number

file_name="$apt_number.apt"

if [ -f data/$file_name ]; then
    rm data/$file_name
    echo "[`date +"%b %d, %Y"`] DELETED: $file_name" >> data/queries.log
    echo "$apt_number was successfully deleted"
   
else
    echo "ERROR: apartment not found"
fi
