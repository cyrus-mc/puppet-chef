# Class: chef::params
#
# This class provides default parameters for the chef module
#
# Requires:
#
class chef::params {

  # non-OS specific default parameters
  $package_client_ensure         = hiera('chef::client::package_ensure', 'present')
  $service_client_ensure         = hiera('chef::client::service_ensure', 'running')
  $service_client_enable         = hiera('chef::client::service_enable', true)
  
  case $::osfamily {

    'RedHat': {
      $package_client           = hiera('chef::client::package', 'chef')
      $service_client_name      = hiera('chef::client::service_name', 'chef-client')

      $config_path              = hiera('chef::config_path', '/etc/chef')
    }

    default: {
      fail("${module_name} : unsupported OS family ${::osfamily}")
    }

  }

}
