#!/bin/bash


total=$(ls -1 data/*.apt | wc -l)
echo "Total apartment records: $total"
