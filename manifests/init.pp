# == Class: sensu_wrapper
#
# Installs, configures and manages sensu wrapper
#
# === Parameters
#
# [*version*]
#   The version of the sensu-wrapper to deploy, see https://github.com/jaxxstorm/sensu-wrapper/releases
#
# [*archive_path*]
#   Full path to store the tar gzip archive of the sensu wrapper, probably in /tmp/sensu-wrapper.tar.gz
#
# [*extract_path*]
#   Where to extract the tar gzip archive
#
# [*bin_dir*]
#   The bin directory to store the executable
#
# [*config_dir*]
#   Where to setup the config for the sensu wrapper
#
# [*download_url_base*]
#   The releases web URL for the github project sensu-wrapper
#
# [*download_url*]
#   The URL to download the release past the $download_url_base
#
# [*os_arch*]
#   The archictecture of the OS, either amd64 or 386
#
# === Examples
#
# @example
#   class { '::sensu_wrapper':
#     version           => 'v0.2',
#     archive_path      => '/tmp/sensu-wrapper.tar.gz',
#     extract_path      => '/opt/sensu-wrapper',
#     bin_dir           => '/usr/local/bin',
#     config_dir        => '/etc/sensu-wrapper.d',
#     download_url_base => 'https://github.com/jaxxstorm/sensu-wrapper/releases/download/',
#   }
#
class sensu_wrapper (
  $version              = $sensu_wrapper::params::version,
  $archive_path         = $sensu_wrapper::params::archive_path,
  $extract_path         = $sensu_wrapper::params::extract_path,
  $bin_dir              = $sensu_wrapper::params::bin_dir,
  $config_dir           = $sensu_wrapper::params::config_dir,
  $download_url         = $sensu_wrapper::params::download_url,
  $download_url_base    = $sensu_wrapper::params::download_url_base,
  $os_arch              = $sensu_wrapper::params::os_arch,
) inherits sensu_wrapper::params {

  $real_download_url = pick($download_url, "${download_url_base}${version}/sensu-wrapper_linux_${os_arch}.tar.gz")

  anchor { 'sensu_wrapper_first': }
  ->
  class { 'sensu_wrapper::install': } ->
  class { 'sensu_wrapper::config': } ->
  anchor { 'sensu_wrapper_final': }

}
