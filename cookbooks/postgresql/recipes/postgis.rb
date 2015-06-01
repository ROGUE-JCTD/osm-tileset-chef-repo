bash "postgis configuration" do

execute "create new postgresql database" do
   user "postgres"
   command "psql -c \"create database #{node['db_name']};\""
end
  code <<-EOF
apt-get install -y build-essential
apt-get build-dep -y postgresql
wget http://ftp.postgresql.org/pub/source/v9.3.6/postgresql-9.3.6.tar.gz
tar -zxvf postgresql-9.3.6.tar.gz
cd postgresql-9.3.6
export MAJOR_VER=9.3
./configure \
  --prefix=/opt/chef/embedded \
  --mandir=/opt/chef/embedded/share/postgresql/${MAJOR_VER}/man \
  --docdir=/opt/chef/embedded/share/doc/postgresql-doc-${MAJOR_VER} \
  --sysconfdir=/etc/postgresql-common \
  --datarootdir=/opt/chef/embedded/share/ \
  --datadir=/opt/chef/embedded/share/postgresql/${MAJOR_VER} \
  --bindir=/opt/chef/embedded/lib/postgresql/${MAJOR_VER}/bin \
  --libdir=/opt/chef/embedded/lib/ \
  --libexecdir=/opt/chef/embedded/lib/postgresql/ \
  --includedir=/opt/chef/embedded/include/postgresql/ \
  --enable-nls \
  --enable-integer-datetimes \
  --enable-thread-safety \
  --enable-debug \
  --with-gnu-ld \
  --with-pgport=5432 \
  --with-openssl \
  --with-libedit-preferred \
  --with-includes=/opt/chef/embedded/include \
  --with-libs=/opt/chef/embedded/lib
make
sudo make install
sudo /opt/chef/embedded/bin/gem install pg -- --with-pg-config=/opt/chef/embedded/lib/postgresql/9.3/bin/pg_config
EOF
  only_if { File.exists?("/opt/chef") }
  not_if "/opt/chef/embedded/bin/gem list | grep pg"
end
