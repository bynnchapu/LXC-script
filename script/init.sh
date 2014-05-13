#!/bin/sh

# TODO: Back to move /var/lib/lxc
mkdir -p test
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
        mkdir -p "machine${watch}_${machine}/rootfs"
        mkdir -p "machine${watch}_${machine}/data"
    done
done

