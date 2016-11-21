# Class to install sensu_wrapper
class sensu_wrapper::install {

  include ::archive

  file { "${sensu_wrapper::extract_path}-${sensu_wrapper::version}" :
    ensure => directory,
  } ->

  archive { $sensu_wrapper::archive_path :
    ensure       => present,
    extract      => true,
    extract_path => "${sensu_wrapper::extract_path}-${sensu_wrapper::version}",
    source       => $::sensu_wrapper::real_download_url,
    creates      => "${sensu_wrapper::extract_path}-${sensu_wrapper::version}/sensu-wrapper_linux_${sensu_wrapper::os_arch}"
  } ->

  file { "${sensu_wrapper::bin_dir}/sensu-wrapper" :
    ensure => 'link',
    target => "${sensu_wrapper::extract_path}-${sensu_wrapper::version}/sensu-wrapper_linux_${sensu_wrapper::os_arch}",
  }

}
