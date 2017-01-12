# Private params class
class sensu_wrapper::params {

  $version =  'v0.3'
  $archive_path       = '/tmp/sensu-wrapper.tar.gz'
  $extract_path       = '/opt/sensu-wrapper'
  $bin_dir            = '/usr/local/bin'
  $config_dir         = '/etc/sensu-wrapper.d'
  $download_url_base  = 'https://github.com/jaxxstorm/sensu-wrapper/releases/download/'
  $download_url       = undef

  case $::architecture {
    'x86_64', 'amd64': {
      $os_arch = 'amd64'
    }
    'x86', 'i386': {
      $os_arch = '386'
    }
    default: { fail('Unsupported Architecture') }
  }

}
