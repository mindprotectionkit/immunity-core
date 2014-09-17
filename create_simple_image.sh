#!/bin/bash

# (c) 2014 Mattias Schlenker
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Environment variables to automate this script (in order of appearence:
# 
# IMMUBUILDDIR	Directory where you want to build immunity core
# TINYCROSSDIR	Directory where your TinyCrossLinux resides - should point
# 		To the directory where you checked out TinyCrossLinux
#		if not given, ${IMMUBUILDDIR}/TinyCrossLinux will be used
# TINYBUILDDIR	Directory where your TinyCrossLinux is being built
#		if not given, TinyCrossLinux' default will be used, so better 
#		set to ${IMMUBUILDDIR}/TinyCrossBuild! 
# NOECDSAKEY	Set to 1 if you do not want to create a key for root login
# MORESSHKEYS	List of SSH keys to add to root's authorized_keys
#		Set to " " (a single space) to skip the question - bug...
# INITTAB	Which inittab to use?
#			1: patches/etc-inittab-debug
#			2: patches/etc-inittab-local
#			3: patches/etc-inittab-net
# ROOTLOGIN	Set to "no" or 0 if ! sould stay in /etc/shadow
# IMMUNETSCRIPT	Specify a script to install as /etc/rc.d/0041-staticnet.sh

function die {
	echo "$1"
	exit 1
}

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
if [ "$NOECDSAKEY" -gt 0 ] ; then
	echo '---> Skipping key generation'
else
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
fi
if [ -z "$MORESSHKEYS" ] ; then
	echo '===> Note: You can add more SSH keys by specifying them here. Keep them'
	echo '   > separated by spaces. Just press return if you do not want to'
	echo '   > specify more keys.'
	read MORESSHKEYS
	for key in $answer ; do
		echo "Adding: $key" 
		cat "$key" >> "${IMMUBUILDDIR}/initramfs/root/.ssh/authorized_keys"
	done
fi

install -m 0755 patches/etc-rc "${IMMUBUILDDIR}/initramfs/etc/rc"

if [ -z "$INITTAB" ] ; then
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
	read INITTAB
fi
case $INITTAB in
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

if [ -z "$ROOTLOGIN" ] ; then
	echo '===> NOTE: In the default configuration, no password for root is set.'
	echo '   > Login is only possible via SSH. For debugging and deployment you'
	echo '   > might want to set a password.'
	echo -n '   > Do you want to set a root password? [y/N] '
	read ROOTLOGIN
fi
case $ROOTLOGIN in
	[yYjJ1]*)
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
