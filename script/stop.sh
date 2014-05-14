#!/bin/sh

watch=0
machine=0
if [ $# -eq 0 ]; then
    while [ $watch -ne 12 ]
    do
        watch=`expr $watch + 1`

        machine=0
        while [ $machine -ne 5 ]
        do
            machine=`expr $machine + 1`
            lxc-stop -n machine${watch}_${machine}
        done
    done

    lxc-ls -f
elif [ $# -eq 1 ]; then
    watch=$1

    while [ $machine -ne 5 ]
    do
        machine=`expr $machine + 1`
        lxc-stop -n machine${watch}_${machine}
    done

    lxc-ls -f
else
    # FIXME: Write good message...
    echo "Error!"
fi

