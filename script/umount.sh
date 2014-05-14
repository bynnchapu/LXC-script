#!/bin/sh
cd /var/lib/lxc/

watch=0
machine=0
while [ $watch -ne 12 ]
do
    watch=`expr $watch + 1`
    machine=0
    while [ $machine -ne 5 ]
    do
        machine=`expr $machine + 1`
        umount ./machine${watch}_${machine}/rootfs/
    done
done

