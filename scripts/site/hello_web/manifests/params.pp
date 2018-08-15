class hello_web::params {
  case $::osfamily {
    'Debian': {
      $package_name = "apache2"
      $service_name = "apache2"
      $doc_root     = "/var/www/html"
    }
    'RedHat': {
      $package_name = "httpd"
      $service_name = "httpd"
      $doc_root     = "/var/www/html"
    }
  }
}
