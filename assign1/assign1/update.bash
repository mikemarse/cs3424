#!/bin/bash

read -p "Enter apartment number: " apt_number
read -p "Full name: " first_name last_name
read -p "Lease start date: " lease_start
read -p "Lease end data: " lease_end
read -p "Balance: " balance

file_name="$apt_number.apt"
count=1

if [ -f data/$file_name ]; then
    while read line line2; do
        case "$count" in
            1)
                if [[ $first_name = "" ]]; then
                    first_name=$line
                fi
                if [[ $last_name = "" ]]; then
                    last_name=$line2
                fi
                ;;
            2)
                if [[ $lease_start = "" ]]; then
                    lease_start=$line
                fi
                if [[ $lease_end = "" ]]; then
                    lease_end=$line2
                fi
                ;;
            3)
                if [[ $balance = "" ]]; then
                    balance=$line
                fi
                ;;
            *)
                break
                ;;
        esac

    let count+=1
    done < data/$file_name

    echo "$first_name $last_name" > data/$file_name
    echo "$lease_start $lease_end" >> data/$file_name
    echo "$balance" >>data/$file_name
    echo "[`date +"%b %d, %Y"`] UPDATED: $file_name" >> data/queries.log

else
    echo "ERROR: apartment not found"
fi

