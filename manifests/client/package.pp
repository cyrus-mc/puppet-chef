# Class: chef::client::package
#
# This class manages the chef client package installation
#
# Requires:
#
class chef::client::package ( $ensure = $chef::params::package_client_ensure ) inherits chef::params {

  # validate parameters
  if !is_string($chef::params::package_client) and !is_array($chef::params::package_client) {
    fail('pupet::params::package_agent must be a string or an array of packages to install')
  }

  # install necessary package
  package { $chef::params::package_client:
    ensure => $ensure,
  }

}
