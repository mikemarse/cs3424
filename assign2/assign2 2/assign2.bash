#!/bin/bash

path=$1
older=$2


#use an if statement (if argument $3 exists, then it must mean it is recursive! find is recursive by default
if [[ $3 == "-r" ]]; then
    find $path -mtime +$older -exec sed -i -E -f redact.sed {} \;
elif [[ -z $3 ]]; then
    find $path -maxdepth 1 -mtime +$older -exec sed -i -E -f redact.sed {} \;
fi
