execute 'wget_country_file' do
  command "wget #{node[:countries][:name][:url]} -O /opt/countries"
  action :run
end
