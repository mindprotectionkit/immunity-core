#!/bin/ash

PATH=/bin:/sbin:/usr/bin:/usr/sbin
source /etc/rc.subr/colors 
export PATH

case $1 in
    start)
	printf "${bold}Searching and starting VMs... ${normal}\n"
	[ -d /dev/net ] || mkdir /dev/net
	[ -c /dev/net/tun ] || mknod /dev/net/tun c 10 200
	# Enable IP forwarding:
	echo 1 > /proc/sys/net/ipv4/ip_forward > /dev/null 2>&1 
	vmparts=''
	for ctok in ` cat /proc/cmdline ` ; do
		case $ctok in
			vmparts=*) 
				vmparts=` echo "$ctok" | awk -F '='  '{print $2}' `
			;;
		esac
	done
	if [ -n "$vmparts" ] ; then
		for p in ` echo $vmparts | sed 's%|% %g' ` ; do
			device=` blkid | grep $p | awk '{print $1}' | sed 's/\://g' `  
			if [ -n "$device" ] ; then
				mkdir -p "/immuvm/$p"
				mountpoint -q "/immuvm/$p" || mount -o rw,relatime "$device" "/immuvm/$p"
				find "/immuvm/$p" -type f -name immuvm.sh -exec /bin/ash {} start \; 
			fi
		done
	fi
    ;;
esac
