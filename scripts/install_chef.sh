#!/bin/bash
# exit if anything returns failure
set -e

#apt-get upgrade accountsservice apparmor apt apt-transport-https apt-utils apt-xapian-index aptitude base-files bash bash-completion bind9-host binutils bsdutils busybox-initramfs busybox-static ca-certificates coreutils cpio cron curl dbus dmidecode dmsetup dnsutils dosfstools dpkg dpkg-dev e2fslibs e2fsprogs file gnupg gpgv ifupdown initramfs-tools initramfs-tools-bin initscripts iproute iptables isc-dhcp-client isc-dhcp-common krb5-locales language-pack-en language-pack-en-base language-pack-gnome-en language-pack-gnome-en-base language-selector-common libaccountsservice0 libapt-inst1.4 libapt-pkg4.12 libasn1-8-heimdal libbind9-80 libblkid1 libc-bin libc-dev-bin libc6 libc6-dev libcomerr2 libcurl3 libcurl3-gnutls libdbus-1-3 libdbus-glib-1-2 libdevmapper-event1.02.1 libdevmapper1.02.1 libdns81 libdpkg-perl libdrm-intel1 libdrm-nouveau1a libdrm-radeon1 libdrm2 libelf1 libevent-2.0-5 libexpat1 libfreetype6 libgcrypt11 libglib2.0-0 libgnutls26 libgssapi-krb5-2 libgssapi3-heimdal libgssglue1 libhcrypto4-heimdal libheimbase1-heimdal libheimntlm0-heimdal libhx509-5-heimdal libisc83 libisccc80 libisccfg82 libk5crypto3 libkrb5-26-heimdal libkrb5-3 libkrb5support0 libldap-2.4-2 liblockfile-bin liblockfile1 liblwres80 libmagic1 libmount1 libnih-dbus1 libnih1 libparted0debian1 libpci3 libpciaccess0 libplymouth2 libpolkit-gobject-1-0 libroken18-heimdal libsasl2-2 libsasl2-modules libsqlite3-0 libss2 libssl-dev libssl-doc libssl1.0.0 libtasn1-3 libudev0 libuuid1 libwind0-heimdal libx11-6 libx11-data libxcb1 libxext6 libxml2 linux-firmware linux-libc-dev login lsb-base lsb-release lvm2 make man-db mime-support mount mountall multiarch-support nfs-common ntfs-3g ntp ntpdate openssh-client openssh-server openssl parted passwd pciutils perl perl-base perl-modules plymouth plymouth-theme-ubuntu-text ppp procps psmisc python python-apt python-apt-common python-gi python-minimal python2.7 python2.7-minimal resolvconf rpcbind rsyslog sudo sysv-rc sysvinit-utils tcpdump tzdata ubuntu-keyring ubuntu-minimal ubuntu-standard udev update-manager-core upstart util-linux uuid-runtime vim-common vim-tiny wget xkb-data -y --fix-missing

# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L https://get.rvm.io | bash -s stable

# install ruby, my machine has this and things work
source /usr/local/rvm/scripts/rvm
rvm get stable

rvm list known
rvm install ruby-2.0.0-p353
rvm --default use 2.0.0-p353
ruby -v # will show which version is being used

apt-get install -y postgresql-client-9.3 postgresql-9.3 postgresql-contrib-9.3 postgresql-server-dev-9.3 libpq-dev

# Pull rogue-chef-repo if it doesn't already exist on the VM.
# We do this so we can execute geoshape-install from a Vagrantfile and
# without a Vagrantfile.

cd /opt
if [ -d osm-tileset-chef-repo ];
then
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
else
  git clone https://github.com/ROGUE-JCTD/osm-tileset-chef-repo
  chown -R vagrant:vagrant osm-tileset-chef-repo
  cd osm-tileset-chef-repo
fi
#
#if [ -z "$GEOSHAPE_VERSION" ];
#then
#  # discover the latest release tag
#  RELEASE_TAGS=(`git tag`)
#  echo 'release tags: '
#  echo "${RELEASE_TAGS[@]}"
#  # sort the list of branches that had '.' in them such that index 0 is the largest one
#  RELEASE_TAGS_SORTED=($(printf '%s\n' "${RELEASE_TAGS[@]}"|sort -r))
#  GEOSHAPE_VERSION=${RELEASE_TAGS_SORTED[0]}
#  echo '----[ discovered latest release version: '${GEOSHAPE_VERSION}
#fi

#git checkout ${GEOSHAPE_VERSION}

echo "Bundle install......"
gem install bundler
bundle install
echo "Bundle complete....."
#
echo "Berks install......"
#gem install berkshelf -v 3.2.3
berks install
cd ..
echo "Berks complete..."

# Setup Chef Run folder
# if dna.json is in /opt/chef-run, move it out, then run the following, then put it back
# Also remove the other dna files that ware aren't using for this setup.

#if [ -f chef-run/dna.json ];
#then
#echo "Copying existing dna.json"
#cp chef-run/dna.json ./dna-copy.json
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#cp dna-copy.json chef-run/dna.json
#rm dna-copy.json
#rm chef-run/dna_database.json
#rm chef-run/dna_application.json
#cd chef-run
#else
#echo "Using default dna.json"
#mkdir chef-run
#cp -r /opt/rogue-chef-repo/solo/* chef-run/
#rm chef-run/dna_application.json
#rm chef-run/dna_database.json
#cd chef-run
## Edit dna.json to use correct FQDN… Note: update the url to your server’s url’. If there is no fully qualified domain name, you can simply remove the line from the dna file
#sed -i 's/fqdn/fqdn-ignore/g' dna.json
## if vagrant is specified, add "vagrant":true
#if [ "$1"  = "vagrant" ];
#then
#echo "Vagrant specified..."
#sed -i '2 i\
#\  "vagrant": true,
#' dna.json
#fi
#fi

# Change username referenced in provision.sh to correct user if the user on the box is not ‘rogue’ Note: manually view provision.sh and change the user to rogue

#chmod 755 *.sh
