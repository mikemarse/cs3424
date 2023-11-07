#!/bin/bash

num=0

if [ ! -d data ]; then
    mkdir data
fi


while [ $num ]; do
    echo "Enter one of the following actions or press CTRL-D to exit."
    echo "C - create a new apartment record"
    echo "R - read an existing apartment record"
    echo "U - update an existing apartment record"
    echo "D - delete an existing apartment record"
    echo "P - record payment for an existing tenant"
    echo "T - get total apartments"
    if ! read choice; then 
        break
    fi

    case "$choice" in 
        [cC])
            chmod +x create.bash
            ./create.bash
            ;;

        [rR])
            chmod +x read.bash
            ./read.bash
            ;;

        [uU])
            chmod +x update.bash
            ./update.bash
            ;;

        [dD])
            chmod +x delete.bash
            ./delete.bash
            ;;

        [pP]) 
            chmod +x payment.bash
            ./payment.bash
            ;;

        [tT])
            chmod +x total.bash
            ./total.bash
            ;;

        *)
            echo "ERROR: invalid option"
            ;;
    esac
done
