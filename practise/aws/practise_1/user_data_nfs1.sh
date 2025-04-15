#!/bin/bash

apt update -y
apt install -y vim zip tar wget git net-tools curl nfs-kernel-server

mkdir -p /mnt/nfs_share
chown -R nobody:nogroup /mnt/nfs_share
chmod -R 777 /mnt/nfs_share
cat >> /etc/exports<<eof
/mnt/nfs_share 192.168.0.0/24(rw sync no_subtree_check no_root_squash)
eof

exportfs -a
