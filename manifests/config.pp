class sensu_wrapper::config {

  file { $sensu_wrapper::config_dir:
    ensure => directory,
  }

}
