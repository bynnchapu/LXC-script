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
        mkdir -p "machine${watch}_${machine}/rootfs"
        mkdir -p "machine${watch}_${machine}/data"
        cp "/var/lib/lxc/centos/config" "machine${watch}_${machine}/config"
        sed -i "8i\\lxc.network.ipv4 = 10.0.3.${watch}${machine}/24\\"              machine${watch}_${machine}/config
        sed -i "9i\\lxc.network.ipv4.gateway = 10.0.3.1\\"                          machine${watch}_${machine}/config
        sed -i "10c\\lxc.rootfs = /var/lib/lxc/machine${watch}_${machine}/rootfs"   machine${watch}_${machine}/config
        sed -i "16c\\lxc.utsname = machine${watch}_${machine}"                      machine${watch}_${machine}/config
        sed -i "19i\\lxc.aa_profile = unconfined\\"                                 machine${watch}_${machine}/config
        sed -i "20i\\lxc.cgroup.devices.allow = b 7:* rwm\\"                        machine${watch}_${machine}/config
        sed -i "21i\\lxc.cgroup.devices.allow = c 10:237 rwm\\"                     machine${watch}_${machine}/config
    done
done

