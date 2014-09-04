#!/bin/ash

PATH=/bin:/sbin:/usr/bin:/usr/sbin
source /etc/rc.subr/colors 
export PATH

case $1 in
    start)
	printf "${bold}Searching and starting VMs... ${normal}\n"
	vmparts=''
	cat /proc/cmdline | while read ctok ; do
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
				mount -o rw,relatime "$device" "/immuvm/$p"
				find "/immuvm/$p" -type f -name immuvm.sh -exec /bin/ash {} \; 
			fi
		done
	fi
    ;;
esac
