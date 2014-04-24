package 'mumble-server' do
  action :upgrade
end

template '/etc/mumble-server.ini' do
  owner 'root'
  group 'mumble-server'
  mode 0640
  source 'mumble-server.ini.erb'
  notifies :restart, 'service[mumble-server]'
end

execute "murmurd -supw #{node.mumble.supassword} -ini /etc/mumble-server.ini" do
  notifies :restart, 'service[mumble-server]'
  user 'mumble-server'
end

service 'mumble-server' do
  supports [:start, :stop, :restart]
  action [:enable, :start]
end
