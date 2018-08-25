
# Dynamic Attributes based on Platform Family
case node['platform_family']
when 'rhel'
  default['hello_web']['package'] = 'httpd'
  default['hello_web']['service'] = 'httpd'
  default['hello_web']['docroot'] = '/var/www/html'
when 'debian'
  default['hello_web']['package'] = 'apache2'
  default['hello_web']['service'] = 'apache2'
  default['hello_web']['docroot'] = '/var/www/html'
when 'freebsd'
  default['hello_web']['package'] = 'apache24'
  default['hello_web']['service'] = 'apache24'
  default['hello_web']['docroot'] = '/usr/local/www/apache24/data/'
else
  default['hello_web']['package'] = nil
  default['hello_web']['docroot'] = nil
  default['hello_web']['service'] = nil
end
