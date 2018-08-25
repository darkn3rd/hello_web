# Lookup Attributes based on Platform Family
default['hello_web'] = {
  'rhel' => {
    'package' => 'httpd',
    'service' => 'httpd',
    'docroot' => '/var/www/html'

  },
  'debian' => {
    'package' => 'apache2',
    'service' => 'apache2',
    'docroot' => '/var/www/html'
  },
  'freebsd' => {
    'package' => 'apache24',
    'service' => 'apache24',
    'docroot' => '/usr/local/www/apache24/data/'
  }
}
