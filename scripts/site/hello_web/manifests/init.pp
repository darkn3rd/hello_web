# Class: hello_web
# ===========================
#
# Copyright
# ---------
#
# Copyright 2018 Joaquin Menchaca
#
class hello_web(
  $package_name = $hello_web::params::package_name,
  $service_name = $hello_web::params::service_name,
  $doc_root     = $hello_web::params::doc_root
) inherits hello_web::params {

  package { $package_name:
    ensure => present,
  }
  service { $service_name:
    ensure => running,
    enable => true,
  }

  file { "$doc_root/index.html":
    source => "puppet:///modules/hello_web/index.html",
  }

}
