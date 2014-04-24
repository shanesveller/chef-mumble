package 'mumble-server' do
  action :upgrade
end

template '/etc/mumble-server.ini' do
  owner 'root'
  group 'mumble-server'
  mode 0600
  source 'mumble-server.ini.erb'
  notifies :restart, 'service[mumble-server]'
end

execute "murmurd -supw #{node.mumble.supassword} -ini /etc/mumble-server.ini" do
  notifies :restart, 'service[mumble-server]'
  user 'mumble-server'
end

service 'mumble-server' do
  action [:enable, :start]
end