#!/bin/bash
        echo "Creating GPT table for md0 RAID..."
        parted -s /dev/md0 mklabel gpt
        echo "Creating partitions..."
        parted /dev/md0 mkpart primary ext4 0% 20%
        parted /dev/md0 mkpart primary ext4 20% 40%
        parted /dev/md0 mkpart primary ext4 40% 60%
        parted /dev/md0 mkpart primary ext4 60% 80%
        parted /dev/md0 mkpart primary ext4 80% 100%
        echo "Creating file system for the partitions..."
        for i in $(seq 1 5); do mkfs.ext4 /dev/md0p$i; done
