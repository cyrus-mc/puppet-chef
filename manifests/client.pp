# Class: chef::client
#
# This class manages the chef client (package, service and config)
#
# Requires:
#
class chef::client (
  $service_enable = $chef::params::service_client_enable,
  $service_ensure = $chef::params::service_client_ensure,
  $package_ensure = $chef::params::package_client_ensure,
  $server,
  $organization,
  ) inherits chef::params {

  # call sub classes
  class { 'chef::client::package':
    ensure => $package_ensure,
  }
  class { 'chef::client::service':
    ensure => $service_ensure,
    enable => $service_enable,
  }
  class { 'chef::client::config':
    server       => $server,
    organization => $organization,
  }

}
