#
# Cookbook:: hello_web
# Recipe:: default
#
# Copyright:: 2018, Joaquin Menchaca, All Rights Reserved.

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package node['hello_web']["#{node['platform_family']}"]['package']

cookbook_file "#{node['hello_web']["#{node['platform_family']}"]['docroot']}/index.html" do
  source 'index.html'
  action :create
end

service node['hello_web']["#{node['platform_family']}"]['service'] do
  supports status: true, restart: true, reload: true
  action %i(enable start)
end
