# Sets defaults
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
