#!/bin/bash

lines=`arp -an | awk '{print $2 "," $4}' | sed 's/(//;s/)//'`

for line in $( echo -n $lines ) ; do
        echo -e "\n======================================================================================\n"
        mac=`echo $line | cut -d"," -f2`
        ip=`echo $line | cut -d"," -f1`
        echo "[IP] $ip"
        echo "[MAC] $mac"
        echo "[RULE] ebtables -A FORWARD -p IPv4 --ip-src $ip -s ! $mac -j DROP"
        ebtables -A FORWARD -p IPv4 --ip-src $ip -s ! $mac -j DROP
done

echo -e "\n======================================================================================\n"

echo "List of all rules :"
ebtables --list
