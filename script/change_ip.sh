#!/bin/sh
cd test/

watch=0
machine=0
while [ $watch -ne 12 ]
do
    watch=`expr $watch + 1`
    machine=0
    while [ $machine -ne 5 ]
    do
        machine=`expr $machine + 1`
        sed -i "8,9d" machine${watch}_${machine}/config
        sed -i "8i\\lxc.network.ipv4 = 10.0.4.${watch}${machine}/24\\"  machine${watch}_${machine}/config
        sed -i "9i\\lxc.network.ipv4.gateway = 10.0.4.1\\"              machine${watch}_${machine}/config
    done
done
