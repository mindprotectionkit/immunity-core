#!/bin/ash

PATH=/usr/bin:/usr/sbin:/bin:/sbin 

vmdir=` dirname $0 `
vmname='Ubuntu14.04-sample01' 

case $1 in
	stop)
		echo "Stopping VM is not yet implemented. Pleas manually stop ${vmname}"'!'
	;;
	# Default is to start: 
	start)
		echo "Starting VM ${vmname}"
		tunctl -t tap1 && echo "Successfully created tap1" 
		ifconfig tap1 10.42.23.1 netmask 255.255.255.0 up && echo "Successfully configured tap1"
		route add -host 10.42.23.2 dev tap1 && echo "Successfully set route"
		sleep 1
		screen -d -m /usr/bin/lkvm run \
			--name "$vmname" \
			--params 'root=/dev/vda2 ro console=ttyS0' \
			--kernel ${vmdir}/vmlinuz-3.13.0-32-generic \
			--initrd ${vmdir}/initrd.img-3.13.0-32-generic \
			--console serial --network mode=tap,tapif=tap1 \
			--no-dhcp -d ${vmdir}/vda.img
		echo "Use \"screen -r\" to connect to the serial console of the running VM." 
	;;
esac

