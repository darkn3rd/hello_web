# Lookup Attributes based on Platform Family
default['hello_web']['rhel']['package'] = 'httpd'
default['hello_web']['rhel']['service'] = 'httpd'
default['hello_web']['rhel']['docroot'] = '/var/www/html'

default['hello_web']['debian']['package'] = 'apache2'
default['hello_web']['debian']['service'] = 'apache2'
default['hello_web']['debian']['docroot'] = '/var/www/html'

default['hello_web']['freebsd']['package'] = 'apache24'
default['hello_web']['freebsd']['service'] = 'apache24'
default['hello_web']['freebsd']['docroot'] = '/usr/local/www/apache24/data/'
