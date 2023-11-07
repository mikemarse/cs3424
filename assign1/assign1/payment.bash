#!/bin/bash

read -p "Enter an apartment number: " apt_number

read -p "Enter a payment amount: " pay_amt

file_name="$apt_number.apt"

count=1
if [[ -e data/$file_name ]]; then
    while read line line2; do
        case "$count" in
            1)
                first_name=$line
                last_name=$line2
                ;;
            2)
                lease_start=$line
                lease_end=$line2
                ;;
            3) 
                balance=$line
                ;;
            *)
                break
                ;;
        esac
    let count+=1
    done < data/$file_name

    new=$(($balance - $pay_amt))

    echo "$first_name $last_name" > data/$file_name
    echo "$lease_start $lease_end" >> data/$file_name
    echo "$new" >> data/$file_name
    echo "[`date +"%b %d, %Y"`] PAID: $apt_number - AMOUNT: $pay_amt - NEW BALANCE: $new" >> data/queries.log
    
else
    echo "ERROR: apartment not found"
fi
