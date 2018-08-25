#
# Cookbook:: hello_web
# Recipe:: default
#
# Copyright:: 2018, Joaquin Menchaca, All Rights Reserved.

# reference these locally for readibility
package = node['hello_web']["#{node['platform_family']}"]['package']
service = node['hello_web']["#{node['platform_family']}"]['service']
docroot = node['hello_web']["#{node['platform_family']}"]['docroot']

apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

package package

cookbook_file "#{docroot}/index.html" do
  source 'index.html'
  action :create
end

service service do
  supports status: true, restart: true, reload: true
  action %i(enable start)
end
