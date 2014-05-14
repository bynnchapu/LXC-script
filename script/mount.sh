#!/bin/sh
cd /var/lib/lxc/

watch=0
machine=0
while [ $watch -ne 12 ]
do
    watch=`expr $watch + 1`
    monitor_version=""
    case $watch in
        [1-5]  ) monitor_version="zabbix20";;
        6      ) monitor_version="zabbix18";;
        [7-8]  ) monitor_version="zabbix22";;
        9|10   ) monitor_version="nagios3";;
        1[1-2] ) monitor_version="nagios4";;
    esac

    machine=0
    while [ $machine -ne 5 ]
    do
        machine=`expr $machine + 1`
        monitor_type=""
        case $machine in
            1 ) monitor_type="server";;
        [2-5] ) monitor_type="client";;
        esac

        mount -t aufs -o "br:./machine${watch}_${machine}/data/:./${monitor_version}_${monitor_type}/:./centos/rootfs/" none "./machine${watch}_${machine}/rootfs/"
    done
done
