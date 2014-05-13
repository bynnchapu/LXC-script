#!/bin/sh

# Become to root, and move lxc directory.
# TODO: Back to move /var/lib/lxc
#sudo su -
mkdir -p test
cd test/

# Create directories for containers.
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
    done
done

# Copy config file to directories of containers.
