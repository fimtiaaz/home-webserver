#!/bin/bash
# Set static DNS in CentOS 7 and lock resolv.conf

echo "Configuring static DNS..."
nmcli con mod enp0s3 ipv4.dns "8.8.8.8 1.1.1.1"
nmcli con mod enp0s3 ipv4.ignore-auto-dns yes
nmcli con up enp0s3

echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" > /etc/resolv.conf
chattr +i /etc/resolv.conf

echo "Static DNS set and resolv.conf locked."

