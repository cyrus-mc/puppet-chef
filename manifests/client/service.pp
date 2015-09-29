# Class: chef::client::service
#
# This class manages the chef client service
#
# Requires:
#
class chef::client::service (
  $ensure = $chef::params::service_client_ensure,
  $enable = $chef::params::service_client_enable ) inherits chef::params {

  # manage the chef client service
  #service {
  #  'chef-client':
  #  ensure     => $ensure,
  #  name       => $chef::params::service_client_name,
  #  enable     => $enable,
  #  hasrestart => $chef::params::service_client_hasrestart;
  #}

}
