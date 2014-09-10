#!/bin/bash

me=` id -u `
if [ "$me" -gt 0 ] ; then
	echo 'Please run this script with root privileges!'
fi

# Specify the environment variable IMMUBUILDDIR to define a build directory
# other than /mnt/archiv/ImmuCoreBuild

if [ -z "$IMMUBUILDDIR" ] ; then
	IMMUBUILDDIR=/usr/local/ImmuCoreBuild
	echo '===> NOTE: IMMUBUILDDIR was not specified as environment variable.'
	echo '   > We are gonna create and use '"${IMMUBUILDDIR}"
	echo -n '   > Is this OK? [Y/n] '
	read answer
	case $answer in 
		[nN]*)
			exit 1
		;;
	esac
fi

if [ -d "$IMMUBUILDDIR" ] ; then
	echo '===> NOTE: '"${IMMUBUILDDIR}"' already exists. Make sure it is sane.'
	echo -n '   > Then press RETURN (or Ctrl+C to cancel).'
	read answer 
fi
mkdir -p "$IMMUBUILDDIR"

if [ -n "$TINYCROSSDIR" ] ; then
	echo '===> NOTE: TINYCROSSDIR was specified as environment variable.'
	echo '   > I hope this is recent enough!'
else
	TINYCROSSDIR="${IMMUBUILDDIR}/TinyCrossLinux"
	echo '===> NOTE: TINYCROSSDIR was not specified as environment variable.'
	echo '   > We are gonna create, populate and use '"${TINYCROSSDIR}."
	echo '   > If cloning fails, you might have to install and configure git.'
	echo -n '   > Is this OK? [Y/n] '
	read answer
	case $answer in 
		[nN]*)
			exit 1
		;;
	esac
	if [ -d "${IMMUBUILDDIR}/TinyCrossLinux" ] ; then
		( cd "${IMMUBUILDDIR}/TinyCrossLinux" ; git pull )
	else
		( cd "$IMMUBUILDDIR" ; \
		  git clone https://github.com/mschlenker/TinyCrossLinux || \
		  die "Could not clone TinyCrossLinux" )
	fi
	if [ -z "$TINYBUILDDIR" ] ; then
		export TINYBUILDDIR="${IMMUBUILDDIR}/TinyCrossBuild"
	fi
fi

source "${TINYCROSSDIR}/stage0n_variables"
workdir=`pwd `
cd "${TINYCROSSDIR}"
bash build_stage0n.sh || die 'Building TinyCrossLinux failed - please check!' 
cd "$workdir"

rm -rf "${IMMUBUILDDIR}/initramfs"
mkdir -p "${IMMUBUILDDIR}/initramfs/etc/dropbear"
mkdir -p "${IMMUBUILDDIR}/initramfs/etc/rc.d"
mkdir -p "${IMMUBUILDDIR}/initramfs/root/.ssh"

# Now create keys for dropbear, host key first:

for t in ecdsa ; do # ignore rsa dss
	"${TINYBUILDDIR}/hosttools/bin/dropbearkey" -t ${t} -f "${IMMUBUILDDIR}/initramfs/etc/dropbear/dropbear_${t}_host_key"
done
ls -lah "${IMMUBUILDDIR}"/initramfs/etc/dropbear/dropbear_*_host_key

mkdir -p "${IMMUBUILDDIR}/ssh-keys"
echo '===> NOTE: I am going to create an ECDSA key pair that can be used for login'
echo '   > via SSH. The key will be stored at '"${IMMUBUILDDIR}/ssh-keys/id_ecdsa"
echo '   > Press "n" if you have objectives due to security reasons. Do you want to'
echo -n '   > create the key? [Y/n]? '
read answer
case $answer in
	[nN]*)
		echo '===> Skipping key'
	;;
	*)
		ssh-keygen -t rsa -f "${IMMUBUILDDIR}/ssh-keys/id_ecdsa"
		install -m 0600 "${IMMUBUILDDIR}/ssh-keys/id_ecdsa.pub" "${IMMUBUILDDIR}/initramfs/root/.ssh/authorized_keys"
	;;
esac
echo '===> Note: You can add more SSH keys by specifying them here. Keep them'
echo '   > separated by spaces. Just press return if you do not want to'
echo '   > specify more keys.'
read answer

for key in $answer ; do
	echo "Adding: $key" 
	cat "$key" >> "${IMMUBUILDDIR}/initramfs/root/.ssh/authorized_keys"
done

install -m 0755 patches/etc-rc "${IMMUBUILDDIR}/initramfs/etc/rc"
# ask for inittab:
echo '===> NOTE: Which inittab do you want to use?'
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

echo '===> NOTE: In the default configuration, no password for root is set.'
echo '   > Login is only possible via SSH. For debugging and deployment you'
echo '   > might want to set a password.'
echo -n '   > Do you want to set a root password? [y/N] '
read answer

case $answer in
	[yYjJ]*)
		cat "${TINYCROSSDIR}/patches/etc-shadow" | \
			sed 's/\!/'` openssl passwd -1 `'/g' \
			> "${IMMUBUILDDIR}/initramfs/etc/shadow"
		retval=$?
		if [ "$retval" -lt 1 ] ; then
			chmod 0640 "${IMMUBUILDDIR}/initramfs/etc/shadow"
		else
			rm "${IMMUBUILDDIR}/initramfs/etc/shadow"
		fi
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
mv "${TINYBUILDDIR}/tiny-cross-uefi.iso" "${IMMUBUILDDIR}/immunity-core-uefi.iso"
mv "${TINYBUILDDIR}/tiny-cross-bios.iso" "${IMMUBUILDDIR}/immunity-core-bios.iso"
echo '===> DONE: Now check out the two ISO images:'
echo "     ${IMMUBUILDDIR}/immunity-core-uefi.iso"
echo "     ${IMMUBUILDDIR}/immunity-core-bios.iso"
cd "$workdir"
