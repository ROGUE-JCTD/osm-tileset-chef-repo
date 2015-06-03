execute 'wget_country_file' do
  command "wget #{node[:countries][:name][:north_america][:url]} -O /opt/countries"
  action :run
end

#remote_file "/opt/countries/#{node[:program][:version]}-latest.osm.bz2" do
#  source "http://www.example.com/program-#{node[:program][:version]}.tar.gz"
#  checksum node[:program][:checksum]
#  notifies :run, "bash[install_program]", :immediately
#end
