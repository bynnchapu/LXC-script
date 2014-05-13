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
        # TODO: Be a function.
        cp "/var/lib/lxc/centos/config" "machine${watch}_${machine}/base_config1"
        sed "8i\\lxc.network.ipv4 = 10.0.3.${watch}${machine}/24\\"              machine${watch}_${machine}/base_config1 > machine${watch}_${machine}/base_config2
        sed "9i\\lxc.network.ipv4.gateway = 10.0.3.1\\"                          machine${watch}_${machine}/base_config2 > machine${watch}_${machine}/base_config3
        sed "10c\\lxc.rootfs = /var/lib/lxc/machine${watch}_${machine}/rootfs"   machine${watch}_${machine}/base_config3 > machine${watch}_${machine}/base_config4
        sed "16c\\lxc.utsname = machine${watch}_${machine}"                      machine${watch}_${machine}/base_config4 > machine${watch}_${machine}/base_config5
        sed "19i\\lxc.aa_profile = unconfined\\"                                 machine${watch}_${machine}/base_config5 > machine${watch}_${machine}/base_config6
        sed "20i\\lxc.cgroup.devices.allow = b 7:* rwm\\"                        machine${watch}_${machine}/base_config6 > machine${watch}_${machine}/base_config7
        sed "21i\\lxc.cgroup.devices.allow = c 10:237 rwm\\"                     machine${watch}_${machine}/base_config7 > machine${watch}_${machine}/config
        i=0
        while [ $i -ne 7 ]
        do
            i=`expr $i + 1`
            rm machine${watch}_${machine}/base_config${i}
        done
    done
done

