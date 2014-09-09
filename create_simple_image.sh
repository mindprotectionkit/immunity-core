#!/bin/bash

me=` id -u `
if [ "$me" -gt 0 ] ; then
	echo 'Please run this script with root privileges!'
fi

if [ -z "$TINYCROSSDIR" ] ; then
	echo '***> ERROR: Please export the environment variable TINYCROSSDIR'
	echo '   > pointing to your TinyCrossLinux installation'
	exit 1
fi

# Specify the environment variable IMMUBUILDDIR to define a build directory
# other than /mnt/archiv/ImmuCoreBuild

if [ -z "$IMMUBUILDDIR" ] ; then
	IMMUBUILDDIR=/mnt/archiv/ImmuCoreBuild
fi
echo "$IMMUBUILDDIR"

source "${TINYCROSSDIR}/stage0n_variables"
workdir=`pwd `
cd "${TINYCROSSDIR}"
bash build_stage0n.sh
cd "$workdir"

rm -rf "${IMMUBUILDDIR}/initramfs"
mkdir -p "${IMMUBUILDDIR}/initramfs/etc/dropbear"
mkdir -p "${IMMUBUILDDIR}/initramfs/etc/rc.d"
mkdir -p "${IMMUBUILDDIR}/initramfs/root/.ssh"

# Now create keys for dropbear, host key first:

for t in ecdsa ; do # ignore rsa dss
	"${CLFS}/hosttools/bin/dropbearkey" -t ${t} -f "${IMMUBUILDDIR}/initramfs/etc/dropbear/dropbear_${t}_host_key"
done

mkdir -p "${IMMUBUILDDIR}/ssh-keys"
ssh-keygen -t rsa -f "${IMMUBUILDDIR}/ssh-keys/id_ecdsa"
install -m 0600 "${IMMUBUILDDIR}/ssh-keys/id_ecdsa.pub" "${IMMUBUILDDIR}/initramfs/root/.ssh/authorized_keys"
install -m 0755 patches/etc-rc "${IMMUBUILDDIR}/initramfs/etc/rc"
# ask for inittab:
echo 'Which inittab do you want to use?'
echo ''
echo '[1] inittab for debugging and testing - the local console is wide open!'
echo ''
cat patches/etc-inittab-debug
echo ''
echo '[2] inittab with local access - login is possible on three local and one'
echo '    serial console - recommended for most purposes'
echo ''
cat patches/etc-inittab-local
echo ''
echo '[3] inittab without local access - login is just possible over the network'
echo ''
cat patches/etc-inittab-net
echo -n 'Your choice? '
read n
case $n in
	1)
		install -m 0644 patches/etc-inittab-debug "${IMMUBUILDDIR}/initramfs/etc/inittab"
	;;
	2)
		install -m 0644 patches/etc-inittab-local "${IMMUBUILDDIR}/initramfs/etc/inittab"
	;;
	3)
		install -m 0644 patches/etc-inittab-net "${IMMUBUILDDIR}/initramfs/etc/inittab"
	;;
	*)
		echo 'No valid choice!'
		exit 1
	;;
esac

if [ -n "$IMMUNETSCRIPT" ] ; then
	echo '#!/bin/ash' > "${IMMUBUILDDIR}/initramfs/etc/rc.d/0040-udhcpc.sh"
	echo '/bin/true' >> "${IMMUBUILDDIR}/initramfs/etc/rc.d/0040-udhcpc.sh"
	install -m 0755 "$IMMUNETSCRIPT" "${IMMUBUILDDIR}/initramfs/etc/rc.d/0041-staticnet.sh"
fi

# Install the startup script for virtual machines
install -m 0755 patches/etc-rc.d-0100-immuvm.sh "${IMMUBUILDDIR}/initramfs/etc/rc.d/0100-immuvm.sh"

( cd "${IMMUBUILDDIR}/initramfs" ; find . | \
	cpio -o -H newc > ../immucore.cpio )

export TINYCPIOPAYLOAD="${IMMUBUILDDIR}/immucore.cpio"
cd "${TINYCROSSDIR}"
bash build_iso.sh
cd "$workdir"

