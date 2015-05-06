#!/bin/bash
# exit if anything returns failure
set -e

# update package list to latest
apt-get update
#apt-get install zlib1g-dev build-essential libssl-dev libreadline-dev libxml2-dev libpq-dev -y

#apt-get upgrade accountsservice apparmor apt apt-transport-https apt-utils apt-xapian-index aptitude base-files bash bash-completion bind9-host binutils bsdutils busybox-initramfs busybox-static ca-certificates coreutils cpio cron curl dbus dmidecode dmsetup dnsutils dosfstools dpkg dpkg-dev e2fslibs e2fsprogs file gnupg gpgv ifupdown initramfs-tools initramfs-tools-bin initscripts iproute iptables isc-dhcp-client isc-dhcp-common krb5-locales language-pack-en language-pack-en-base language-pack-gnome-en language-pack-gnome-en-base language-selector-common libaccountsservice0 libapt-inst1.4 libapt-pkg4.12 libasn1-8-heimdal libbind9-80 libblkid1 libc-bin libc-dev-bin libc6 libc6-dev libcomerr2 libcurl3 libcurl3-gnutls libdbus-1-3 libdbus-glib-1-2 libdevmapper-event1.02.1 libdevmapper1.02.1 libdns81 libdpkg-perl libdrm-intel1 libdrm-nouveau1a libdrm-radeon1 libdrm2 libelf1 libevent-2.0-5 libexpat1 libfreetype6 libgcrypt11 libglib2.0-0 libgnutls26 libgssapi-krb5-2 libgssapi3-heimdal libgssglue1 libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhx509-5-heimdal libisc83 libisccc80 libisccfg82 libk5crypto3 libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 liblockfile-bin liblockfile1 liblwres80 libmagic1 libmount1 libnih-dbus1 libnih1 libparted0debian1 libpci3 libpciaccess0 libplymouth2 libpolkit-gobject-1-0 libroken18-heimdal libsasl2-2 libsasl2-modules libsqlite3-0 libss2 libssl-dev libssl-doc libssl1.0.0 libtasn1-3 libudev0 libuuid1 libwind0-heimdal libx11-6 libx11-data libxcb1 libxext6 libxml2 linux-firmware linux-libc-dev login lsb-base lsb-release lvm2 make man-db mime-support mount mountall multiarch-support nfs-common ntfs-3g ntp ntpdate openssh-client openssh-server openssl parted passwd pciutils perl perl-base perl-modules plymouth plymouth-theme-ubuntu-text ppp procps psmisc python python-apt python-apt-common python-gi python-minimal python2.7 python2.7-minimal resolvconf rpcbind rsyslog sudo sysv-rc sysvinit-utils tcpdump tzdata ubuntu-keyring ubuntu-minimal ubuntu-standard udev update-manager-core upstart util-linux uuid-runtime vim-common vim-tiny wget xkb-data -y --fix-missing

# install dependencies
apt-get install -y curl
apt-get install -y ruby1.9.1-dev
apt-get install -y git
