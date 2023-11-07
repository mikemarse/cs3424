#!/bin/bash

read -p "Enter an apartment number: " apt

fileName="$apt.apt"
count=0


if [ -f data/$fileName ]; then
    while read line line2; do
        case "$count" in
            0)
                first_name=$line
                last_name=$line2
                ;;
            1)
                lease_start=$line
                lease_end=$line2
                ;;
            2)
                balance=$line
                ;;
            3) 
                break
                ;;
            *)
                break
                ;;
    esac

    let count+=1
    done < data/$fileName

    echo "Apartment Number: $apt"
    echo "Tenant Name: $last_name, $first_name"
    echo "Lease Start: $lease_start"
    echo "Lease End: $lease_end"
    echo "Current Balace: $balance"

else
    echo "ERROR: apartment not found"
fi

