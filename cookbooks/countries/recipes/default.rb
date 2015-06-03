execute 'wget_country_file' do
  command "wget #{node[:countries][:name]} -O /opt/countries"
  action :run
end
