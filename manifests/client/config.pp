# Class: chef::client::config
#
# This class manages the configuration of the chef client
#
# Requires:
#
class chef::client::config (
  $server,
  $organization,
  ) inherits chef::params {

  # validate parameters
  if !is_domain_name($server) {
    fail('Supplied server parameter must be a valid hostname')
  }

  # configure chef client
  file {
    $chef::params::config_path:
    ensure => directory;

    "${chef::params::config_path}/client.rb":
    content => template('chef/chef.client.rb.erb');

    "${chef::params::config_path}/trusted_certs":
    ensure => directory,
    recurse => true,
    purge   => true,
    source => 'puppet:///modules/chef/trusted_certs';

    "${chef::params::config_path}/validation.pem":
    source => "puppet:///modules/chef/${server}-validation.pem",
    mode   => '0600';

    # copy some helper scripts
    '/usr/local/bin/chef-client-start-daemon':
    source => 'puppet:///modules/chef/chef-client-start-daemon',
    mode   => '0755';

    '/usr/local/bin/chef-client-status-daemon':
    source => 'puppet:///modules/chef/chef-client-status-daemon',
    mode   => '0755';

    '/usr/local/bin/chef-client-stop-daemon':
    source => 'puppet:///modules/chef/chef-client-stop-daemon',
    mode   => '0755';
  }

}
