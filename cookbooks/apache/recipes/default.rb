execute 'munin update' do
   command 'sed -i "s|Allow from.*|Allow from all|" /etc/munin/apache.conf'
end

execute 'service apache2 reload' do
end
