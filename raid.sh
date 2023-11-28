#!/bin/bash
        echo "Creating raid 1..."
        mdadm --zero-superblock --force /dev/sd{b,c,d,e,f}
        mdadm --create --verbose /dev/md0 -l 1 -n 5 /dev/sd{b,c,d,e,f}
        cat /proc/mdstat
        echo "Creating mdadm.conf..."
        mkdir -p /etc/mdadm
        echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
        mdadm --detail --scan --verbose | awk '/ARRAY/ {print}' >> /etc/mdadm/mdadm.conf
