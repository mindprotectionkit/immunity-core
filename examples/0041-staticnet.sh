#!/bin/ash

PATH=/bin:/sbin:/usr/bin:/usr/sbin
source /etc/rc.subr/colors 
export PATH

case $1 in
    start)
	printf "${bold}Starting network... ${normal}\n"
	ifconfig eth${n} up	
	ifconfig eth0 inet 10.76.23.123 netmask 255.255.255.0
	route add default gw 10.76.23.252
	echo 'nameserver 8.8.8.8' > /etc/resolv.conf
    ;;
    stop)
	ifconfig eth0 down
    ;;
esac

