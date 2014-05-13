#!/bin/sh

watch=0
machine=0
while [ $watch -ne 12 ]
do
    watch=`expr $watch + 1`
    monitor_version=""
    case $watch in
        [1-5]  ) monitor_version="Zabbix2.0";;
        6      ) monitor_version="Zabbix1.8";;
        [7-8]  ) monitor_version="Zabbix2.2";;
        ^9|10  ) monitor_version="Nagios3";;
        1[1-2] ) monitor_version="Nagios4";;
    esac

    machine=0
    while [ $machine -ne 5 ]
    do
        machine=`expr $machine + 1`
        monitor_type=""
        case $machine in
            1 ) monitor_type="Server";;
        [2-5] ) monitor_type="Client";;
        esac

        echo "[${watch}][${machine}][${monitor_version}][${monitor_type}]"
    done
done
